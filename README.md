# Kunwar_NodeJsTask

Important libraries used- 
1. multer - to perform image uploading 
2. cors - for cross origin access
3. mysql2 - for mysql database
4. joi - for form and json validation
5. body-parser - to parse coming data, acts as a middleware
6. express 

## API endpoints: 

1. psychiatrist/register - method accepted = "post json", registers psychiatrist. required fields : firstname, lastname, hospitalname, phonenumber

2. psychiatrist/register - patient : method accepted = "post form data", registers patients. required fields : token(of psychiatrist), (name, address, email, password, photo) (of patient)

3. psychiatrist/get-token - method accepted = "post json", required fields : phonenumber

4. psychiatrist/users - method accepted = "get", required params : token, gives all the users registered by the current psychiatrist

5. psychiatrist/users-on-each - method accepted = "get", required params : none, gives count of registered users by each psychiatrist

## Postman collection:
https://www.getpostman.com/collections/58ec7b053eaeb4e3d95c

## Database Design:

1. psychiatrist - id is primary key and AUTO INCREMENT, phonenumber is used as unique key to identify each psychiatrist.
2. patient - id is primary key, patient is uniquely identified by email too, psychiatrist_id is foreign key here.
3. token - token is primary key, id is foreign key referencing psychiatrist id. stores all current available/online tokens.

```
 create table psychiatrist ( id int not null AUTO_INCREMENT , first_name  varchar(20) not null , last_name varchar(20) not null, 
 hospital_name varchar(100) not null, phone_number varchar(12) not null unique , pincode varchar(6) , state varchar(100) , primary key (id) );
 
 create table patient( id int not null AUTO_INCREMENT, psychiatrist_id int  , name varchar(20) not null , address varchar(100) not null  , email varchar(100) not null unique,  phone_number varchar(12) , 
 password varchar(100) not null , image varchar(200) not null , primary key(id),   foreign key(psychiatrist_id) references psychiatrist(id) );
 

create table token (token varchar(100) not null , id int not null , primary key(token), foreign key(id) references psychiatrist(id) );

```
