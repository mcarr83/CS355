<?php

// This guide demonstrates the five fundamental steps
// of database interaction using PHP.

// Credentials
$dbhost = "localhost";
$dbuser = "mcarr";
$dbpass = "ca9587";
$dbname = 'mcarr';

// 1. Create a database connection
$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

//check connection
if(!$connection){
	die("Connection failed: " . mysqli_connect_error());
}

echo "Connected Successful\n";

// 2. Perform database query

$sql = "CREATE TABLE trip (tripID INT AUTO_INCREMENT,
startStationID INT (11),
endStationID INT (11),
tripDuration INT (10) NOT NULL,
startTime VARCHAR (10) NOT NULL,
stopTime VARCHAR (10) NOT NULL,
bikeID INT (6) NOT NULL,
userType VARCHAR (12) NOT NULL,
birthYear INT (5) NOT NULL,
gender INT (1) NOT NULL,
PRIMARY KEY (tripID),
FOREIGN KEY (startStationID) REFERENCES stations (stationID),
FOREIGN KEY (endStationID) REFERENCES stations (stationID))
";

// 3. Use returned data (if any)

if ($connection->query($sql) === TRUE){
echo "Success!";
}

else{
echo "Fail, go get help";
}

// 4. Release returned data

// 5. Close database connection
mysqli_close($connection);

?>
