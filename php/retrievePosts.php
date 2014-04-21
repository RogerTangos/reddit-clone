<?php
// MYSQL
$mysqliObj = new mysqli("localhost", "root", "root", "reddit");
if (mysqli_connect_errno()){
echo "A connection error occurred. Please try again later."; exit;
};

// POST INFO
$sort = $_POST["sort"];
$subreddit = $_POST["subreddit"];
$start = $_POST["start"];
$resultNum = $_POST["resultNum"];

// $sort = "top";
// $subreddit = "all";

$sort = $mysqliObj->real_escape_string($sort);
$subreddit = $mysqliObj->real_escape_string($subreddit);
$start = intval($mysqliObj->real_escape_string($start));
$resultNum = intval($mysqliObj->real_escape_string($resultNum));

// echo "<br />$subreddit<br />-------<br />";

if ($subreddit == "all"){
	$subreddit = "Where 1 = 1";	
} else {
	$subreddit = "WHERE subreddit = '$subreddit'";	
}
// echo "<br />$subreddit<br />-------<br />";

$order_by = null;
if ($sort == "new"){
	$order_by = "time DESC";
} else if ($sort == "controversial"){
	$order_by = "(upvote + downvote) DESC";
} else {
	$order_by = "(upvote - downvote) DESC";
};


$query1 = "SELECT post.id as `id`, `url`, `title`, `upvote`, `downvote`, `type`, `time`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	$subreddit
	ORDER BY $order_by
	LIMIT $start, $resultNum";

$resultSet = $mysqliObj->query($query1, MYSQLI_STORE_RESULT);
$return_arr = Array();
while ($row = $resultSet->fetch_assoc()){
	array_push($return_arr,$row);
}
echo json_encode($return_arr);
$mysqliObj->close();
?>