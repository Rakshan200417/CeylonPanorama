<?php  
include 'db.php'; // your database connection  

if ($_SERVER['REQUEST_METHOD'] === 'POST') {  
    $full_name = $_POST['full_name'] ?? '';  
    $email = $_POST['email'] ?? '';  
    $phone = $_POST['phone'] ?? '';  
    $language = $_POST['language'] ?? '';  
    $guests = $_POST['guests'] ?? '';  
    $start_date = $_POST['start_date'] ?? '';  
    $end_date = $_POST['end_date'] ?? '';  
    $region = $_POST['region'] ?? '';  
    $special = $_POST['special_requests'] ?? '';  

    $stmt = $conn->prepare("INSERT INTO tourguide_bookings 
        (full_name, email, phone, language, guests, start_date, end_date, region, special_requests) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $stmt->bind_param(
        "sssiissss",
        $full_name, $email, $phone, $language, $guests, $start_date, $end_date, $region, $special
    );  

    if ($stmt->execute()) {  
        header("Location: fakepaymentservices.php");  
        exit();  
    } else {  
        echo "Error: " . $stmt->error;  
    }  

    $stmt->close();  
    $conn->close();  
}  
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Guide Booking - Ceylon Panorama</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="tourguide.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="home.php">Ceylon Panorama</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="gallery.php">Gallery</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">Tour Guide</a></li>
                    <li class="nav-item"><a class="nav-link" href="service.php">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.php">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero d-flex align-items-center">
        <div class="container text-center text-white">
            <h1 class="hero-title">Book Your Favourite Guide</h1>
            <p class="hero-sub">Travel across Sri Lanka with comfort</p>
        </div>
    </section>

<!-- Booking Form Section -->
<section class="form-section">
    <div class="container">
        <div class="booking-card mx-auto shadow-lg">
            <h3 class="text-center mb-4">Tour Guide Booking Form</h3>
            <form id="tourGuideForm" action="tourguide.php" method="POST">
    <div class="row g-3">
        <div class="col-md-6">
            <label for="full_name" class="form-label">Full Name</label>
            <input type="text" id="full_name" class="form-control" name="full_name" placeholder="John Doe" required>
        </div>
        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" class="form-control" name="email" placeholder="example@mail.com" required>
        </div>
        <div class="col-md-6">
            <label for="phone" class="form-label">Phone Number</label>
            <input type="tel" id="phone" class="form-control" name="phone" placeholder="+94 77 123 4567" required>
        </div>
        <div class="col-md-6">
            <label for="language" class="form-label">Preferred Language</label>
            <select id="language" class="form-select" name="language" required>
                <option selected disabled>Select Language</option>
                <option>English</option>
                <option>Sinhalese</option>
                <option>Tamil</option>
                <option>Other</option>
            </select>
        </div>
        <div class="col-md-6">
            <label for="guests" class="form-label">Number of Guests</label>
            <input type="number" id="guests" class="form-control" name="guests" min="1" placeholder="1" required>
        </div>
        <div class="col-md-6">
            <label for="region" class="form-label">Region</label>
            <input type="text" id="region" class="form-control" name="region" placeholder="Colombo" required>
        </div>
        <div class="col-md-6">
            <label for="start_date" class="form-label">Start Date</label>
            <input type="date" id="start_date" class="form-control" name="start_date" required>
        </div>
        <div class="col-md-6">
            <label for="end_date" class="form-label">End Date</label>
            <input type="date" id="end_date" class="form-control" name="end_date" required>
        </div>
        <div class="col-md-12">
            <label for="special_requests" class="form-label">Special Requests</label>
            <input type="text" id="special_requests" class="form-control" name="special_requests" placeholder="Any special requirements">
        </div>
    </div>
    <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary btn-lg">Book Now</button>
    </div>
</form>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="text-center py-3 bg-light mt-5">
    © 2025 Ceylon Panorama. All Rights Reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="tourguide.js"></script>
</body>
</html>
