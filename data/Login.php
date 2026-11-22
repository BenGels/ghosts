<?php
include_once("DBConnection.php");

class Login {
    private $link;
    const SALT = "CHANGE_ME_SALT";
    const HASH_SALT = "CHANGE_ME_HASH_SALT";

    public function __construct()
    {
        $con = new DBConnection();
        $this->link = $con->getLink();
    }

    public function checkUser($username, $password)
    {
        return ($this->getUserByNameAndPassword($username,$password) != null);
    }
    private function getUserByNameAndPassword($username, $password)
    {
        $passwordHash = $this->createPasswordHash($password);
        $sql = "SELECT id, name FROM user WHERE name = '".$username."' AND password = '".$passwordHash."'";
        $res = mysql_query($sql, $this->link);
        if(mysql_affected_rows($this->link) == 0) return null;
        $row = mysql_fetch_assoc($res);

        return $row["id"];
    }
    private function createPasswordHash($password)
    {
        return md5($password.SALT);
    }

    public function getUserFromLoginHash($hash)
    {
        $sql = "SELECT * FROM user";
        $res = mysql_query($sql, $this->link);
        while($row = mysql_fetch_assoc($res))
        {
            if($hash == $this->calculateUserAutoLoginHash($row['name'], $row['password']))
                return $row['id'];
        }
        return null;
    }

    private function calculateUserAutoLoginHash($username, $password)
    {
        return $username.HASH_SALT.$this->createPasswordHash($password);
    }
} 