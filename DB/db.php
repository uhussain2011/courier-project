<?php

class Dcon
{


    public function __construct()
    {


        $this->host = 'localhost';
        $this->port = '3310';
        $this->db_name = 'phpmyadmin';
        $this->user = "root";
        $this->passwd = "";
        $this->dsn = "mysql:host=" . $this->host . ";port=" . $this->port . ";dbname=" . $this->db_name;
    }

    public function connect()
    {
        return new PDO($this->dsn, $this->user, $this->passwd);
    }
}


/*

define("DSN", "mysql:host=localhost;dbname=testdb");
define("USERNAME", "root");
define("PASSWORD", "");


$options = array(PDO::ATTR_PERSISTENT => true);

try {
$conn = new PDO(DSN, USERNAME, PASSWORD, $options);

$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $ex) {
    echo "A database error has occured" ;
    echo $ex->getMessage();
}
*/