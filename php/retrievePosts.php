<?php

// echo _$POST;
// echo "<br />------------<br />";

if (_$POST){
	echo "post received";
} else{
	echo "post not received";
};

echo "foo"

// echo _$POST["sort"];

// echo $_POST["request"];

// MYSQL
// $mysqliObj = new mysqli("localhost", "root", "root", "reddit");
// if (mysqli_connect_errno()){
// echo "A connection error occurred. Please try again later."; exit;
// };
// $query1 = "SELECT * FROM post";
// $resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);
// $return_arr = Array();
// while ($row = $resultSet->fetch_assoc()){
// 	array_push($return_arr,$row);
// }
// echo json_encode($return_arr);
// $mysqliObj->close();
?>