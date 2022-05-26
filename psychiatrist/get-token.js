const express = require('express')
const router = express.Router()
const mydb = require('../database.js')


var rand = function() {
    return Math.random().toString(36).substr(2); // remove `0.`
};

var tokenize = function() {
    return rand() + rand(); // to make it longer
};

router.post('/',  async (req,res)=>{
	
	 

	// if token in tokens list 
	// update it and send 


	//else create new token if phonenumber matches

	var row; 

	try{
		row = await mydb.perform_query(`select * from psychiatrist as t1, token as t2 where t1.phone_number = ${req.body.phonenumber}
			and t1.id  = t2.id`);
		if(row.length == 0)
		{
			var token = tokenize() + req.body.phonenumber;

			await mydb.perform_query(`insert into token values ("${token}",(select t1.id from psychiatrist as t1 where t1.phone_number = "${req.body.phonenumber}" ) )
			`);

			res.send(token);
		}
		else 
		{ 
			res.send(row[0].token);
		}
	}
	catch(err)
	{
		res.send('error occured');
		console.log(err);
	}


});


module.exports = router;