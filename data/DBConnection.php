<?php

class DBConnection {
    private $dbConfigPath = "database.ini";
    private $user;
    private $password;
    private $database;
    private $server;
    private $link;
    
    public function __construct() 
    {   
        $config = parse_ini_file("./".$this->dbConfigPath);
        
        $this->server = $config['server'];
        $this->user = $config['user'];
        $this->password = $config['password'];
        $this->database = $config['db'];
        
        $this->link =  new mysqli( $this->server, $this->user, $this->password, $this->database );

	if ($this->link->connect_error) {
  		die("Connection failed: " . $this->link->connect_error);
	} 
	$this->link->set_charset('utf8mb4');
    }
    
    public function getArray()
    {
        $gaSql = array();
        $gaSql['user']       = $this->user;
        $gaSql['password']   = $this->password;
        $gaSql['db']         = $this->database;
        $gaSql['server']     = $this->server;
        $gaSql['link']       = $this->link;
        
        return $gaSql;
    }

    public function getLink()
    {
        return $this->link;
    }
}

?>
