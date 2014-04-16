<?php

// $_POST["requestedPosts"];

$mysqliObj = new mysqli("localhost", "root", "root", "reddit");


if (mysqli_connect_errno())
{
echo "A connection error occurred. Please try again later."; exit;
};


$query1 = "SELECT * FROM post";

$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);


$return_arr = Array();

while ($row = $resultSet->fetch_assoc())
{
	array_push($return_arr,$row);
// echo "id: " . $row["id"] . "<br>"; echo "title: " . $row["title"] . "<br>"; echo "url: " . $row["url"];
}

echo json_encode($return_arr);

$mysqliObj->close();
?>