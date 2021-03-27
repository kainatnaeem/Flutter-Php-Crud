# FlutterAndPhp
<p>
 Create a flutter project 
 Create database(flutterdatabase) on phpmyadmin
 Create a new account on 000webhost.com
 Create a new database, Give it a database name, Username and password
 Create a table in your database i.e posts and create 3 fields: id, post_title, post_description 
 Add php file in the php  file manager(config.php), Do write proper code in this file for connection with database i.e db_name, db_user,      db_password and db_host
 <strong>code:M/strong>

<? php
$db_name=""; 
$db_user="admin"; 
$db_password ="localhost";
$db_host="localhost"; 

$connect=mysqli_connect(db_name,db_user,db_password,$db_host);

if(!$connect)
{
	echo json_encode("Connection Failed");
}

?>

Now we need to check database is accessible or not, For that we will place URL of config.php in our browser.
We need to write insert query. Make a file insert.php and write the following code

<?php
require_once "config.php";
$post_title=$_POST["post_title"];
$post_description=$_POST["post_description"];
$query="insert into flutterdatabase (post_title,post_description) values ('$post_title','$post_description')";
$result = mysqli_query($connect,$query);
if($result){
	echo "done";
}
else{
	echo "error";
}
?>	


  </p>
  

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
