const express = require('express')
const router = express.Router()
const validation = require('./validation.js')
const mydb = require('../database.js')
const multer = require('multer')
const path = require('path');
const fs = require('fs')

var rand = function() {
    return Math.random().toString(36).substr(2); // remove `0.`
};

var tokenize = function() {
    return rand() + rand(); // to make it longer
};

// handle storage using multer
var storage = multer.diskStorage({
   destination: function (req, file, cb) {
      cb(null, 'public');
   },
   filename: function (req, file, cb) {
      cb(null, `${file.fieldname}-${Date.now()}${path.extname(file.originalname)}`);
   }
 
});

var upload = multer({ storage: storage });


 

// handle single file upload
router.post('/', upload.single('profile_pic') , async(req,res)=>{
/*
	var row = await mydb.perform_query(`select * from token where token.token = "${req.body.token}"`);

	if(row.length == 0)
	{
		res.send('unauthorized');
	}
	else
	{
		res.send('authorized');
	}

	*/
 

	try{
		var validation_res = validation.validate_patient ( req.body  );
		const file = req.file;
		if (!file) {
		  return res.status(400).send({ message: 'Please upload a file.' });
		}


		if( Object.keys(validation_res).length > 1 ){
			throw validation_res.error.details[0].message ;
		}
		else{

			var row = await mydb.perform_query(`select t1.id from psychiatrist as t1 ,  token as t2 where t2.token = "${req.body.token}" 
			and t2.id = t1.id
			`);

			if(row.length == 0)
			{
				throw 'no entry found with token';
			}
			else
			{
				
					var file_name =  req.file.filename;
					await mydb.perform_query(`insert into patient values (?);`,  
						[[0, row[0].id, req.body.name, req.body.address, req.body.email, req.body.phonenumber,
						req.body.password, file_name]]
						);
					
					res.send('uploaded');
					
			}
		}

	}
	catch(err){
		console.log(req.file.path);
		fs.unlink(req.file.path, (err) => console.log(err + ' fs') );
		res.send('error occured');
		console.log(err);
	}

});


	/*

	try{
		var validation_res = validation.validate_patient ( req.body  );
		const file = req.file;
		if (!file) {
		  return res.status(400).send({ message: 'Please upload a file.' });
		}


		if( Object.keys(validation_res).length > 1 ){
			res.send(validation_res.error.details[0].message);
		}
		else{

			var row = await mydb.perform_query(`select t1.id from psychiatrist as t1 ,  token as t2 where t2.token = "${req.body.token}" 
			and t2.id = t1.id
			`);

			if(row.length == 0)
			{
				throw 'no entry found with token';
			}
			else
			{
				
					var file_name =  tokenize() + row[0].id; 
					await mydb.perform_query(`insert into patient values (?);`,  
						[[0, row[0].id, req.body.name, req.body.address, req.body.email, req.body.phonenumber,
						req.body.password, file_name]]
						);
					req.file_name = file_name + path.extname(req.file.originalname);
					res.redirect('/upload-pic');
			}
		}

	}
	catch(err){
		res.send('error occured');
		console.log(err);
	}
	*/



module.exports  = router;