<?php
// MYSQL
$mysqliObj = new mysqli("localhost", "root", "root", "reddit");
if (mysqli_connect_errno()){
echo "A connection error occurred. Please try again later."; exit;
};

$id = $_POST["id"];
echo $id;
$id = $mysqliObj->real_escape_string($id);


$query1 = "UPDATE `post` SET `upvote` = `upvote` + 1 where `id` = $id";
$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);

// $query2 = "SELECT `id` FROM `post` WHERE `id` = $id";
// $resultSet = $mysqliObj->query($query2, MYSQLI_STORE_RESULT);

// $return_arr = Array();
// while ($row = $resultSet->fetch_assoc()){
	// array_push($return_arr,$row);
// }
// echo json_encode($return_arr);
$mysqliObj->close();
?>