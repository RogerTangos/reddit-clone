<?php
$mysqliObj = new mysqli("localhost", "root", "root", "reddit");
if (mysqli_connect_errno()){
echo "A connection error occurred. Please try again later."; exit;
};

// $title = $mysqliObj->real_escape_string(_POST["title"]);
// $url = $mysqliObj->real_escape_string(_POST["url"]);
// $subreddit = $mysqliObj->real_escape_string(_POST["subreddit"]);

$subreddit = "funny";

$query1 = "SELECT id, subreddit FROM subreddit";
$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);

echo "foo";
// echo $resultSet;

$return_arr = Array();
while ($row = $resultSet->fetch_assoc()){
	array_push($return_arr,$row);
}
echo json_encode($return_arr);
$mysqliObj->close();

// echo implode(',', $return_arr);

?>