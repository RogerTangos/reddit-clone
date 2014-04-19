<?php
$mysqliObj = new mysqli("localhost", "root", "root", "reddit");
if (mysqli_connect_errno()){
echo "A connection error occurred. Please try again later."; exit;
};

// $title = $mysqliObj->real_escape_string(_POST["title"]);
// $url = $mysqliObj->real_escape_string(_POST["url"]);
// $subreddit = $mysqliObj->real_escape_string(_POST["subreddit"]);
$title = "foo";
$url = "bar";
$subreddit = 2;
$type = 1;


$subreddit = "funny";

$query1 = "SELECT id FROM subreddit WHERE subreddit='$subreddit'";
$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);
$return_arr = Array();
while ($row = $resultSet->fetch_assoc()){
	array_push($return_arr,$row);
}
$subreddit_id = intval($return_arr[0]["id"]);

$query1 = "SELECT MAX(id) FROM post";
$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);
$return_arr = Array();
while ($row = $resultSet->fetch_assoc()){
	array_push($return_arr,$row);
}
$maxId = intval($return_arr[0]["MAX(id)"]) +1 ;

// echo $subreddit_id;
// echo $maxId;
// echo "<br />";

$query1 = "INSERT INTO `post`(`id`, `url`, `title`, `user_id`, `subreddit_id`, `type`) VALUES ($maxId, '$url', '$title', 10, $subreddit_id, $type)";

// echo $query1;
$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);


$mysqliObj->close();


?>