<?php
header('Content-Type: application/json');

// --- DATABASE CONFIGURATION (Situation Based) ---

// Aapka RDS Endpoint jo screenshot mein hai
$servername = "portfolio-db.cm5002au0xsb.us-east-1.rds.amazonaws.com"; 

// Default master username
$username   = "admin"; 

// !!! YAHAN APNA PASSWORD LIKHEIN !!! (Jo aapne RDS banate waqt rakha tha)
$password   = "Mustansar123!"; 

// Aapka DB Name jo configuration tab mein nazar aaya
$dbname     = "portfolio_db"; 

// Connection create karna
$conn = new mysqli($servername, $username, $password, $dbname);

// Connection check karna
if ($conn->connect_error) {
    echo json_encode([
        "status" => "error",
        "message" => "Database Connection Failed: " . $conn->connect_error,
        "engineer" => "Mustansar Maqsood"
    ]);
    exit();
}

// Agar connection kamyab ho gaya to ye show hoga
echo json_encode([
    "status" => "success",
    "message" => "Mustansar! Backend and RDS Database are now officially CONNECTED!",
    "engineer" => "Mustansar Maqsood",
    "details" => [
        "database" => $dbname,
        "host" => "AWS RDS (MySQL)"
    ],
    "timestamp" => date("Y-m-d H:i:s")
]);

$conn->close();
?>
