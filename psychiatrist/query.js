const express = require('express')
const router = express.Router()
const mydb = require('../database.js')


router.get('/users', async (req,res) => {

	try{

	var row =  await mydb.perform_query(`select t3.name, t3.phone_number, t3.address from patient as t3 where t3.psychiatrist_id = (select t1.id from psychiatrist as t1 , token as t2 where t2.token = "${req.query.token}"
		and  t2.id  = t1.id )`);

	res.send(row);

	}
	catch(err)
	{
		res.send('error occured');
		console.log(err);
	}

})

router.get('/users-on-each', async (req,res) => {

	try{

	res.send ( ( await mydb.perform_query(`
		select t1.first_name as doctor, count(t2.id) as patient_count from psychiatrist as t1, patient as t2 
		where t1.id = t2.psychiatrist_id group by t1.id; 
		`)   ));

	}
	catch(err)
	{
		res.send('error occured');
		console.log(err);
	}
	

})


module.exports = router;