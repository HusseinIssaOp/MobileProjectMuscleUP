<?php
include("connection.php");

$jsonData = file_get_contents("php://input");
$data = json_decode($jsonData, true);

if ($data !== null) {
    $stars = isset($data['rating']) ? $data['rating'] : '';
    $lastName = isset($data['name']) ? $data['name'] : '';
    $email = isset($data['age']) ? $data['age'] : '';
    $comment = isset($data['comment']) ? $data['comment'] : '';


    $stmt = $con->prepare("INSERT INTO ratings (stars_count, name, age, comment) 
                            VALUES (?, ?, ?, ?)");
    $stmt->bind_param("dsss", $stars, $lastName, $email, $comment);

    if ($stmt->execute()) {
        echo "Record added successfully";
    } else {
        die("Error: " . $stmt->error);
    }

    $stmt->close();
    mysqli_close($con);
} else {
    http_response_code(400);
    echo "Invalid json data";
}
?>
