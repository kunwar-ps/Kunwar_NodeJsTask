var mysql = require('mysql2');


var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: 'health'
});


async function perform_query( sqlquery , args ) {
    return new Promise( ( resolve, reject ) => {
        con.query( sqlquery, args, ( err, rows ) => {
            if ( err )
                return reject( err );
            resolve( rows );
        } );
    } );
}


module.exports.perform_query = perform_query; 
