const express = require('express')
const Joi = require('joi');



let validate_psychiatrist =  data =>{
	const RegistrationSchema = Joi.object({
		firstname: Joi.string().min(3).required(),
		lastname: Joi.string().min(3).required(),
		state: Joi.string().min(3),
		pincode: Joi.string().min(6).max(6),
		hospitalname: Joi.string().min(3).max(100).required(),
		phonenumber: Joi.string().length(12).pattern(/^[0-9]+$/).required()

	})


	return RegistrationSchema.validate(data);


}



let validate_patient =  data =>{
	const RegistrationSchema = Joi.object({
		token: Joi.string(),
		name: Joi.string().min(3).required(),
		address: Joi.string().min(3).required(),
		email: Joi.string().min(3).required(),
		pincode: Joi.string().min(6).max(6),
		password: Joi.string().pattern(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/).min(8).max(15).required(),
		phonenumber: Joi.string().length(12).pattern(/^[0-9]+$/) 
	})


	return RegistrationSchema.validate(data);


}


module.exports.validate_psychiatrist = validate_psychiatrist ; 
module.exports.validate_patient = validate_patient; 