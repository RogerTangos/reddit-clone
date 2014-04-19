<?php
// MYSQL
$mysqliObj = new mysqli("localhost", "root", "root", "reddit");
if (mysqli_connect_errno()){
echo "A connection error occurred. Please try again later."; exit;
};

$id = $_POST["id"];
$votetype = $_POST["type"];
$id = $mysqliObj->real_escape_string($id);
$votetype = $mysqliObj->real_escape_string($votetype);

echo $votetype;

$query1 = "UPDATE `post` SET $votetype = $votetype + 1 where `id` = $id";	
$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);
// echo "FOO!!";

// $query2 = "SELECT `id` FROM `post` WHERE `id` = $id";
// $resultSet = $mysqliObj->query($query2, MYSQLI_STORE_RESULT);

// $return_arr = Array();
// while ($row = $resultSet->fetch_assoc()){
// 	array_push($return_arr,$row);
// }
// echo json_encode($return_arr);
$mysqliObj->close();
?>