<?php
session_start();
include 'db.php'; // Database connection

// Fetch all active products
$productsQuery = $conn->prepare("SELECT * FROM products WHERE status IN (1,2)");
$productsQuery->execute();
$productsResult = $productsQuery->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ceylon Panorama | Products</title>
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
    <section class="hero d-flex flex-column" style="background-image: url('images/productsmain3.jpg');">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top w-100 px-5">
            <div class="container-fluid">
                <a class="navbar-brand font-weight-bold mr-5" href="#">Ceylon Panorama</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto d-flex align-items-center">
                        <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="gallery.php">Gallery</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Themes</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="nature.php">Nature</a>
                                <a class="dropdown-item" href="adventure.php">Adventure</a>
                                <a class="dropdown-item" href="culture.php">Culture</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Services</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="service.php#hotels">Hotels</a>
                                <a class="dropdown-item" href="service.php#medicare">Medicare</a>
                                <a class="dropdown-item" href="service.php#transport">Transport</a>
                                <a class="dropdown-item" href="service.php#tourguide">Tour Guide</a>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link active" href="products.php">Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.php">Contact</a></li>
                         <?php if (isset($_SESSION['admin_id'])): ?>
                            <li class="nav-item"><a class="nav-link" href="admin_dashboard.php">Admin</a></li>
                        <?php elseif (isset($_SESSION['user_id'])): ?>
                            <li class="nav-item"><a class="nav-link" href="logout.php">Sign Out</a></li>
                        <?php else: ?>
                            <li class="nav-item"><a class="nav-link" href="signin.php">Sign In</a></li>
                        <?php endif; ?>
                        <li class="nav-item ml-3">
                            <a class="nav-link" href="cart.php">
                                <img src="images/cart.jpg" alt="Cart" width="30" height="30" style="border-radius: 50%;">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container text-center text-white d-flex flex-column justify-content-center align-items-center flex-grow-1">
            <h1 class="font-weight-bold">Handcrafted Treasures</h1>
            <p class="lead">From Our Hands to Yours: Authentically Sri Lankan</p>
        </div>
    </section>

    <main>
        <div class="packages-container">
            <?php if($productsResult->num_rows > 0): ?>
                <?php while($row = $productsResult->fetch_assoc()): ?>
                <div class="package-card">
                    <img src="<?= htmlspecialchars($row['product_image']); ?>" alt="<?= htmlspecialchars($row['product_name']); ?>">
                    <h3><?= htmlspecialchars($row['product_name']); ?></h3>
                    <p><?= htmlspecialchars($row['product_description']); ?></p>
                    <p>Price: $<?= number_format($row['product_price'], 2); ?></p>
                    <?php if(isset($_SESSION['user_id'])): ?>
                        <form method="GET" action="AddProductToCart.php">
                            <input type="hidden" name="product_id" value="<?= htmlspecialchars($row['product_id']); ?>">
                            <input type="hidden" name="item_type" value="product">
                            <button type="submit" class="btn-add-cart">Buy Now</button>
                        </form>
                    <?php else: ?>
                        <a href="signin.php?redirect=products.php" class="btn-add-cart">Sign In to Buy</a>
                    <?php endif; ?>
                </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p class="no-packages">No products available at the moment.</p>
            <?php endif; ?>
        </div>
    </main>

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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
