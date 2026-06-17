<?php
include 'db.php'; // include your DB connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect POST data safely
    $full_name = $_POST['full_name'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $country = $_POST['country'] ?? '';
    $gender = $_POST['gender'] ?? '';
    $days = $_POST['days'] ?? '';
    $budget = $_POST['budget'] ?? '';
    $province = $_POST['province'] ?? '';
    $district = $_POST['district'] ?? '';
    $town = $_POST['town'] ?? '';
    $hotel = $_POST['hotel'] ?? '';
    $guests = $_POST['guests'] ?? '';
    $checkin = $_POST['checkin'] ?? '';
    $checkout = $_POST['checkout'] ?? '';

    // Prepare statement to prevent SQL injection
    $stmt = $conn->prepare("INSERT INTO hotel_bookings 
        (full_name, email, phone, country, gender, days, budget, province, district, town, hotel, guests, checkin, checkout)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $stmt->bind_param(
        "sssssisssssiss",
        $full_name,
        $email,
        $phone,
        $country,
        $gender,
        $days,
        $budget,
        $province,
        $district,
        $town,
        $hotel,
        $guests,
        $checkin,
        $checkout
    );

    if ($stmt->execute()) {
        // Redirect to fake payment page after successful insertion
        header("Location:fakepaymentservices.php");
        exit();
    } else {
        // Handle error
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Booking - Ceylon Panorama</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="hotel.css">
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
                    <li class="nav-item"><a class="nav-link active" href="#">Hotels</a></li>
                    <li class="nav-item"><a class="nav-link" href="service.php">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.php">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero d-flex align-items-center">
        <div class="container text-center text-white">
            <h1 class="hero-title">Book Your Hotels</h1>
            <p class="hero-sub">Find the perfect hotel for your stay in Sri Lanka</p>
        </div>
    </section>

    <!-- Booking Form -->
    <section class="container py-5">
        <div class="card shadow booking-card mx-auto">
            <div class="card-body">
                <h3 class="card-title mb-4 text-center">Book Your Hotel</h3>
                <form id="hotelForm" action="hotel.php" method="POST">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="full_name" placeholder="John Doe"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="example@mail.com" required>
                        </div>
                        <div class="col-md-6">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="+94 77 123 4567"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label for="country" class="form-label">Your Country</label>
                            <select class="form-select" id="country" name="country" required>
                                <option selected disabled>Select Country</option>
                                <!-- Add countries dynamically via JavaScript -->
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-select" id="gender" name="gender" required>
                                <option selected disabled>Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="days" class="form-label">Days to Stay</label>
                            <input type="number" class="form-control" id="days" name="days" min="1" placeholder="3"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label for="budget" class="form-label">Budget Range</label>
                            <select class="form-select" id="budget" name="budget" required>
                                <option selected disabled>Select Budget</option>
                                <option value="budget">Budget</option>
                                <option value="mid">Mid-range</option>
                                <option value="luxury">Luxurious</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="province" class="form-label">Province</label>
                            <select class="form-select" id="province" name="province" required>
                                <option selected disabled>Select Province</option>
                                <option>Central</option>
                                <option>Southern</option>
                                <option>Western</option>
                                <option>Eastern</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="district" class="form-label">District</label>
                            <select class="form-select" id="district" name="district" required>
                                <option selected disabled>Select District</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="town" class="form-label">Town</label>
                            <select class="form-select" id="town" name="town" required>
                                <option selected disabled>Select Town</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="hotel" class="form-label">Select Hotel</label>
                            <select class="form-select" id="hotel" name="hotel" required>
                                <option selected disabled>Select Hotel</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="guests" class="form-label">Number of Guests</label>
                            <select class="form-select" id="guests" name="guests" required>
                                <option selected disabled>Select Guests</option>
                                <option value="1">1 Guest</option>
                                <option value="2">2 Guests</option>
                                <option value="3">3 Guests</option>
                                <option value="4">4 Guests</option>
                                <option value="5">5 Guests</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="checkin" class="form-label">Check-in Date</label>
                            <input type="date" class="form-control" id="checkin" name="checkin" required>
                        </div>
                        <div class="col-md-3">
                            <label for="checkout" class="form-label">Check-out Date</label>
                            <input type="date" class="form-control" id="checkout" name="checkout" required>
                        </div>
                        <div class="col-12 text-center mt-3">
                            <button type="submit" class="btn btn-primary btn-lg">Book Now</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
  <footer class="footer bg-dark text-light pt-5">
    <div class="container">
      <div class="row">
        <!-- About -->
        <div class="col-md-3">
          <h2 class="logo">Ceylon Panorama</h2>
          <p>
            Explore Sri Lanka's beauty with our curated travel themes and packages.
            We are dedicated to making your journey unforgettable.
          </p>
          <div class="footer-social">
            <a href="#"><i class="fab fa-facebook-f mr-2"></i></a>
            <a href="#"><i class="fab fa-twitter mr-2"></i></a>
            <a href="#"><i class="fab fa-instagram mr-2"></i></a>
            <a href="#"><i class="fab fa-linkedin-in mr-2"></i></a>
          </div>
        </div>

        <!-- Quick Links -->
        <div class="col-md-3">
          <h3>Quick Links</h3>
          <ul class="list-unstyled">
            <li><a href="home.php" class="text-light">Home</a></li>
            <li><a href="gallery.php" class="text-light">Gallery</a></li>
            <li><a href="nature.php" class="text-light">Themes</a></li>
            <li><a href="service.php" class="text-light">Services</a></li>
            <li><a href="contact.php" class="text-light">Contact</a></li>
          </ul>
        </div>

        <!-- Services -->
        <div class="col-md-3">
          <h3>Our Services</h3>
          <ul class="list-unstyled">
            <li><a href="adventure.php" class="text-light">Adventure Packages</a></li>
            <li><a href="culture.php" class="text-light">Cultural Tours</a></li>
            <li><a href="nature.php" class="text-light">Nature Escapes</a></li>
          </ul>
        </div>

        <!-- Info -->
        <div class="col-md-3">
          <h3>Contact Info</h3>
          <p><strong>📞 Phone:</strong> +94 71 234 5678</p>
          <p><strong>📧 Email:</strong> info@ceylonpanorama.com</p>
          <p><strong>📍 Address:</strong> Colombo, Sri Lanka</p>
          <p><strong>🕑 Service Hours:</strong><br> We are available <b>24/7</b></p>
        </div>
      </div>

      <div class="footer-bottom text-center py-3 mt-4 border-top">
        <p>© 2025 Ceylon Panorama. All Rights Reserved.</p>
      </div>
    </div>
  </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="hotel.js"></script>
</body>

</html>
