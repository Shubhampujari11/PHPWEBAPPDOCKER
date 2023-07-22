<?php

$connect = mysqli_connect(
    'db',
    'shubham',
    'shubham',
    'project'
);

$query = 'SELECT *
    FROM data';
$result = mysqli_query($connect, $query);

echo '<h1>MySQL Content:</h1>';

while($record = mysqli_fetch_assoc($result))
{
    echo '<h2>'.$record['ID'].'</h2>';
    echo '<p>'.$record['NAME'].'</p>';
    echo 'Posted: '.$record['date'];
    echo '<hr>';
}

?>
