<?php
include("connection.php");

$jsonData = file_get_contents("php://input");
$data = json_decode($jsonData, true);

if ($data !== null) {
    $fname = isset($data['fname']) ? $data['fname'] : '';
    $lname = isset($data['lname']) ? $data['lname'] : '';
    $city = isset($data['city']) ? $data['city'] : '';
    $street = isset($data['street']) ? $data['street'] : '';
    $building = isset($data['building']) ? $data['building'] : '';
    $phonenumber = isset($data['phonenumber']) ? $data['phonenumber'] : '';
    $selectedProducts = isset($data['selected_products']) ? $data['selected_products'] : '';
    $totalPrice = isset($data['totalprice']) ? $data['totalprice'] : '';

    // Prepare and execute the SQL query
    $sql = "INSERT INTO checkout (fname, lname, city, street, building, phonenumber, selected_products, totalprice) 
            VALUES ('$fname', '$lname', '$city', '$street', '$building', '$phonenumber', '$selectedProducts', '$totalPrice')";

    if (mysqli_query($con, $sql)) {
        echo "Record added successfully";
    } else {
        die("Error: " . mysqli_error($con));
    }

    mysqli_close($con);
} else {
    http_response_code(400);
    echo "Invalid json data";
}
?>
