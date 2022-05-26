const express = require('express')
const router = express.Router()
const validation = require('./validation.js')
const mydb = require('../database.js')

router.post('/', async (req,res) => {
	
	 
	validation_res = 
		validation.validate_psychiatrist(
			req.body		);


	if( Object.keys(validation_res).length > 1 ){
		res.send(validation_res.error.details[0].message);
	}
	else{
			
		var sqlquery = ` INSERT INTO psychiatrist values (?);`;

		try 
		{
			await mydb.perform_query ( sqlquery, [[ 0 , req.body.firstname, req.body.lastname, req.body.hospitalname, req.body.phonenumber,
				  	 	req.body.pincode, req.body.state]] );

			res.send('1 record inserted');
		}
		catch(err)
		{
			res.send('error occured');
			console.log(err);
		}

	}

 	

});

module.exports  = router;

