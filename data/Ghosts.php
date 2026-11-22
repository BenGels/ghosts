<?php

include_once("DBConnection.php");

class Ghosts {

    private $link;
    const GOO_SUBQUERY_SKILLS = "SELECT GROUP_CONCAT(CONCAT(s2.name,\" (\",a2.name,\")\")) FROM ghost g2 JOIN type t2 ON g2.type = t2.id JOIN type_skill ts2 ON t2.id = ts2.type JOIN skill s2 ON ts2.skill = s2.id JOIN attribute a2 ON s2.attribute = a2.id WHERE g2.id = g.id";
    private $queries = array(
        "SKILLS_OF_TYPE" => "SELECT s.name as skillname, a.name as attributename, s.id as skillid, a.id as attributeid FROM type_skill fs JOIN skill s ON fs.skill = s.id JOIN attribute a ON s.attribute = a.id WHERE fs.type = {id}",
        "ATTRIBUTES_OF_TYPE" => "SELECT a.name as attributename, ta.mod FROM type_attribute ta JOIN attribute a ON ta.attribute = a.id WHERE ta.type =  {id}",
        "FORCES_OF_TYPE" => "SELECT f.name as forcename, f.description FROM type_force tf JOIN `force` f ON tf.force = f.id WHERE tf.type =  {id} AND tf.optional = 0",
        "OPTIONALFORCES_OF_TYPE" => "SELECT f.id, f.name as forcename, f.description FROM type_force tf JOIN `force` f ON tf.force = f.id WHERE tf.type = {id} AND tf.optional = 1",

        "TYPES_OF_GHOST" => "SELECT * FROM type",
        "TYPES_OF_ATTRIBUTES" => "SELECT * FROM attribute",

        "BASE_OF_GHOST" => "SELECT * FROM ghost g JOIN type t ON g.type = t.id WHERE g.id = {id}",
        "GHOSTS_OF_OWNER" => "SELECT g.id as id, t.name as typename, t.icon as icon,  power, services, IF(bound=1,\"Ja\",\"Nein\") as bound,
         (SELECT GROUP_CONCAT(CONCAT(s2.name,\" (\",a2.name,\")\")  SEPARATOR \"<br>\") FROM ghost g2 JOIN type t2 ON g2.type = t2.id JOIN type_skill ts2 ON t2.id = ts2.type JOIN skill s2 ON ts2.skill = s2.id JOIN attribute a2 ON s2.attribute = a2.id WHERE g2.id = g.id) as skills
        ,(SELECT GROUP_CONCAT(f2.name SEPARATOR \"<br>\") FROM ghost g2 LEFT JOIN type t2 ON g2.type = t2.id JOIN type_force tf2 ON tf2.type = t2.id JOIN `force` f2 ON f2.id = tf2.`force` WHERE tf2.optional = 0 AND g2.id = g.id) as `force`
        ,(SELECT GROUP_CONCAT(name SEPARATOR \"<br>\") as forcename FROM ghost_forces gf2 JOIN ghost g2 on gf2.ghost = g2.id JOIN `force` f2 ON f2.id = gf2.`force` WHERE gf2.ghost = g.id) as optionalforces
         FROM ghost g JOIN type t on g.type = t.id WHERE owner = {id}",

        "OPTIONALFORCES_OF_GHOST" => "SELECT f.id, name as forcename, description, 1 as optional FROM ghost_forces gf JOIN ghost g on gf.ghost = g.id JOIN `force` f ON f.id = gf.`force` WHERE gf.ghost = {id}",
        "FORCES_OF_GHOST" => "SELECT f.id, f.name as forcename, f.description, 0 as optional FROM ghost g LEFT JOIN type t ON g.type = t.id JOIN type_force tf ON tf.type = t.id JOIN `force` f ON f.id = tf.`force` WHERE tf.optional = 0 AND g.id = {id}",
        "SKILLS_OF_GHOST" => "SELECT s.name as skillname, a.name  as attributename, a.id FROM ghost g JOIN type t ON g.type = t.id JOIN type_skill ts ON t.id = ts.type JOIN skill s ON ts.skill = s.id JOIN attribute a ON s.attribute = a.id WHERE g.id = {id}",
        "ATTRIBUTE_OF_GHOST" => "SELECT a.id, a.name, ta.mod FROM ghost g JOIN type t ON g.type = t.id JOIN type_attribute ta ON ta.type = t.id JOIN attribute a ON a.id = ta.attribute WHERE g.id = {id}"
    );

    public function __construct()
    {
        $con = new DBConnection();
        $this->link = $con->getLink();
    }

    public function getUsers()
    {
        $sql = "SELECT id, name FROM user";
        $res = mysql_query($sql, $this->link);
        $out = array();

        while($row = mysql_fetch_assoc($res))
        {
            $out[] = $row;
        }
        return $out;
    }
    public function delete($id)
    {
        $sql = "DELETE FROM ghost WHERE id = $id";
        mysql_query($sql, $this->link);
    }

    public function addGhost($type, $power, $services, $forcesList, $owner)
    {
        $sqlType = "INSERT INTO ghost (type, power, services, bound, owner) VALUES ($type, $power, $services, 0, $owner)";
        mysql_query($sqlType, $this->link);
        $ghostId = mysql_insert_id($this->link);

        $sqlForces = "INSERT INTO ghost_forces (`ghost`, `force`) VALUES ";
        $forceArray = array();
        foreach($forcesList as $force)
        {
            $forceArray[] = " ($ghostId, $force) ";
        }
        $sqlForces .= implode(",",$forceArray);
        echo $sqlForces;
        mysql_query($sqlForces, $this->link);
    }


    public function updateService($id, $value)
    {
        $sql = "UPDATE ghost SET services = services + ".$value. " WHERE id = $id";
        mysql_query($sql, $this->link);

        $selSql = "SELECT services FROM ghost WHERE id = ".$id;
        $res = mysql_query($selSql, $this->link);
        $row = mysql_fetch_assoc($res);

        return $row["services"];
    }
    public function toggleBound($id)
    {
        $sql = "UPDATE ghost SET bound = IF(bound, 0 , 1) WHERE id = ".$id;
        mysql_query($sql, $this->link);
    }
    public function getDamage($id)
    {
        $sql = "SELECT (SELECT amount FROM damage WHERE ghost = ".$id." AND damagetype = \"astral\") as astral, (SELECT amount FROM damage WHERE ghost = ".$id." AND damagetype = \"mundan\") as mundan";
        $res = mysql_query($sql, $this->link);
        return mysql_fetch_assoc($res);
    }

    public function changeDamage($id, $type, $value)
    {
        $selSql = "SELECT amount FROM damage WHERE damagetype = '".$type."' AND ghost = $id";
        mysql_query($selSql, $this->link);
        if(mysql_affected_rows($this->link) > 0) {
            $sql = "UPDATE damage SET amount = amount + ".$value. " WHERE damagetype = '".$type."' AND ghost = $id";
            mysql_query($sql, $this->link);

            $selSql = "SELECT amount FROM damage WHERE damagetype = '".$type."' AND ghost = $id";
            $res = mysql_query($selSql, $this->link);
            $row = mysql_fetch_assoc($res);

            return $row["amount"];
        } else {
            $sql = "INSERT INTO damage (damagetype, ghost, amount) VALUES ('".$type."' , '.$id.', 1)";
            mysql_query($sql, $this->link);
            return 1;
        }



    }
    public function query($target, $of, $id = null)
    {
        $key = strtoupper($target."_OF_".$of);
        if(!isset($this->queries[$key])) die();
        $sql = str_replace("{id}", $id, $this->queries[$key]);
        $res = mysql_query($sql, $this->link);
        $out = array();

        while($row = mysql_fetch_assoc($res))
        {
            $out[] = $row;
        }

        return $out;
   }
    public function getAllGhostsOfOwner($ownerId)
    {
        $sql = "SELECT t.name, power, services, bound, movement_slow,movement_fast,weaknesses FROM ghost g JOIN type t on g.type = t.id WHERE owner = $ownerId";
        $res = mysql_query($sql, $this->link);

        $allghosts = array();

        while($row = mysql_fetch_assoc($res))
        {
            $allghosts[] = $row;
        }

        return $allghosts;

    }
}




?>