<?php
$mysqliObj = new mysqli("localhost", "root", "root", "reddit");
if (mysqli_connect_errno()){
echo "A connection error occurred. Please try again later."; exit;
};

$title = $_POST["title"];
$url = $_POST["url"];
$subreddit = $_POST["subreddit"];
$type = $_POST["type"];

$subreddit = $mysqliObj->real_escape_string($subreddit);
$title = $mysqliObj->real_escape_string($title);
$url = $mysqliObj->real_escape_string($url);
$type = intval($mysqliObj->real_escape_string($_POST["type"]));
// $title = "foo";
// $url = "bar";
// $subreddit = 2;
// $type = 1;


// $subreddit = "funny";

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