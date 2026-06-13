-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2025 at 03:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ceylon_panaroma`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `full_name`, `email`, `phone_number`, `created_at`) VALUES
(1, 'admin1', 'password123', 'John Silva', 'john.silva@example.com', '0771234567', '2025-09-10 09:54:16'),
(2, 'admin2', 'password123', 'Amaya Perera', 'amaya.perera@example.com', '0777654321', '2025-09-10 09:54:16'),
(3, 'admin3', 'password123', 'Ravi Kumar', 'ravi.kumar@example.com', '0719876543', '2025-09-10 09:54:16'),
(4, 'chetto', '$2y$10$0Ki8D5gJ42aRt24fFQCn0uZamgoZAe4cfTQId0P5EGLtw1ZdK1yIW', 'Thisari', 'jbu@dfdf.com', '0716667068', '2025-09-14 00:30:00'),
(6, 'yohan', '$2y$10$EtvEgRsZIUKtmA8l.rGoB.eoq9BpKzSavCwRtuSEuvp1PQwXoPaZe', 'yohan methusael', 'yohanjazson25@gmail.com', '078701596', '2025-09-16 02:14:57'),
(9, 'rachel', '$2y$10$d4f6.wpheAe.SWqkhbDXC.tfy5vTvlfhW8MCarIEvJW5zqgeeMcZm', 'E.J.Rachel Jemimah', 'yohan@gmail.com', '0753922153', '2025-09-17 04:51:46');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `item_type` enum('package','product') NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_bookings`
--

CREATE TABLE `hotel_bookings` (
  `booking_hotel_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `days` int(10) UNSIGNED NOT NULL,
  `budget` enum('budget','mid','luxury') NOT NULL,
  `province` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `town` varchar(50) NOT NULL,
  `hotel` varchar(100) NOT NULL,
  `guests` int(10) UNSIGNED NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_bookings`
--

INSERT INTO `hotel_bookings` (`booking_hotel_id`, `full_name`, `email`, `phone`, `country`, `gender`, `days`, `budget`, `province`, `district`, `town`, `hotel`, `guests`, `checkin`, `checkout`, `created_at`) VALUES
(6, 'Thisari', 'jbu@dfdf.com', '+94716667068', 'Belize', 'Female', 2, 'mid', 'Central', 'Kandy', 'Kandy Town', 'Mid Hotel 1', 1, '2025-09-17', '2025-09-21', '2025-09-13 20:32:58'),
(7, 'jioj', 'vug@nsic.com', '+94789563214', 'Albania', 'Female', 1, 'budget', 'Central', 'Kandy', 'Kandy Town', 'Budget Hotel 3', 4, '2025-09-24', '2025-09-30', '2025-09-13 20:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `medicare_bookings`
--

CREATE TABLE `medicare_bookings` (
  `booking_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `service_type` varchar(50) NOT NULL,
  `insurance_provider` varchar(100) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicare_bookings`
--

INSERT INTO `medicare_bookings` (`booking_id`, `full_name`, `email`, `phone`, `gender`, `age`, `appointment_date`, `appointment_time`, `service_type`, `insurance_provider`, `additional_notes`, `created_at`) VALUES
(1, 'Thisari', 'jbu@dfdf.com', '+94777888666', 'Female', 6, '2025-09-23', '03:44:00', 'General Checkup', 'ihk', 'uih', '2025-09-13 22:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `package_description` text DEFAULT NULL,
  `package_price` decimal(10,2) NOT NULL,
  `package_category` enum('Nature','Adventure','Culture') NOT NULL,
  `category_type` varchar(50) DEFAULT NULL,
  `package_image` varchar(255) DEFAULT NULL,
  `status` enum('created','updated') DEFAULT 'created',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`package_id`, `admin_id`, `package_name`, `package_description`, `package_price`, `package_category`, `category_type`, `package_image`, `status`, `created_at`, `updated_at`, `category`) VALUES
(99, 6, 'Nature\'s Pocket Escapade', 'A short but sweet journey for the budget-conscious traveler. Experience the serenity of Sri Lanka\'s central highlands, with misty mountains, tea plantations, and a beautiful train ride.\r\n\r\nTravel & Duration: 5 Days / 4 Nights. Travel includes train and local transport.\r\n\r\nPrice: LKR 120,000', 400.00, '', 'nature', 'Uploads/360_F_414061088_zOm00Kv1Rj9sAuJvv8fm7xzEYai8Dwd3.webp', 'created', '2025-09-16 02:22:03', '2025-09-16 02:22:03', NULL),
(100, 6, 'The Rustic Wildlife Retreat', ' An affordable safari experience that brings you face-to-face with the wild. Explore a major national park and its diverse wildlife, including elephants and endemic birds, with a focus on simple, authentic stays.\r\n\r\nTravel & Duration: 6 Days / 5 Nights. Travel by minivan.\r\n\r\nPrice: LKR 150,000 ', 500.00, '', 'nature', 'Uploads/2. Best Time to Visit.jpg.webp', 'created', '2025-09-16 02:29:34', '2025-09-16 02:29:34', NULL),
(101, 6, 'Horton Plains & Waterfalls Trail', 'A hiking-focused package for those who love the great outdoors. Trek through the plains to the World\'s End viewpoint and discover stunning waterfalls in the hill country.\r\n\r\nTravel & Duration: 4 Days / 3 Nights. Travel by public transport and private car for specific routes.\r\n\r\nPrice: LKR 90,000', 300.00, '', 'nature', 'Uploads/trekking-in-sri-lanka.webp', 'created', '2025-09-16 02:30:55', '2025-09-16 02:30:55', NULL),
(102, 6, 'Coastal & Wetland Discovery', 'Explore Sri Lanka\'s beautiful coastal wetlands and mangrove ecosystems. This package includes a boat safari on a river, and a visit to a turtle hatchery, offering a unique blend of marine and coastal nature.\r\n\r\nTravel & Duration: 5 Days / 4 Nights. Travel by car/van.\r\n\r\nPrice: LKR 135,000', 450.00, '', 'nature', 'Uploads/a-guide-to-sri-lankas-south-coast-beaches-slider-1.webp', 'created', '2025-09-16 02:32:07', '2025-09-16 02:32:07', NULL),
(103, 6, 'Green Island Odyssey', 'A comprehensive tour of Sri Lanka\'s lush landscapes. From the misty mountains of Nuwara Eliya to the rainforests of Sinharaja, this package balances comfort with in-depth nature exploration.\r\n\r\nTravel & Duration: 9 Days / 8 Nights. Private air-conditioned car with a chauffeur-guide.\r\n\r\nPrice: LKR 375,000 ', 1250.00, '', 'nature', 'Uploads/Sinharaja_01.webp', 'created', '2025-09-16 02:33:12', '2025-09-16 02:33:12', NULL),
(104, 6, 'Safari Explorer & Tea Trails', 'A perfect blend of wildlife safaris and serene tea country stays. Enjoy game drives in two different national parks (Yala & Udawalawe) and unwind with a stay at a comfortable tea estate bungalow.\r\n\r\nTravel & Duration: 8 Days / 7 Nights. Private minivan with a driver.\r\n\r\nPrice: LKR 300,000', 1000.00, '', 'nature', 'Uploads/690682-summerhouse-at-norwood-bungalow-ceylon-tea-trails-hill-country-sri-lanka-indian-sub-continent-asia.webp', 'created', '2025-09-16 02:34:50', '2025-09-16 02:34:50', NULL),
(106, 6, 'Gal Oya Lakeside & Trekking', 'A unique experience in a less-traveled national park. Enjoy a rare boat safari on Sri Lanka\'s largest lake, trekking with expert naturalists, and staying in an eco-lodge that puts you right in the heart of nature.\r\n\r\nTravel & Duration: 7 Days / 6 Nights. Private car with an experienced guide.\r\n\r\nPrice: LKR 270,000', 900.00, '', 'nature', 'Uploads/img_6699.webp', 'created', '2025-09-16 02:37:03', '2025-09-16 02:37:03', NULL),
(107, 6, 'Whale Watching & Marine Life', 'The ultimate marine life tour. Travel to the south coast for seasonal whale and dolphin watching, explore coral reefs with a snorkeling trip, and enjoy relaxing days on pristine beaches.\r\n\r\nTravel & Duration: 6 Days / 5 Nights. Private van.\r\n\r\nPrice: LKR 240,000', 800.00, '', 'nature', 'Uploads/08.webp', 'created', '2025-09-16 02:37:41', '2025-09-16 02:37:41', NULL),
(108, 6, 'Luxury Wilderness & Safari', 'Experience Sri Lanka\'s wild side in ultimate comfort. Stay at exclusive safari camps and boutique eco-lodges, with private game drives and personalized nature walks.\r\n\r\nTravel & Duration: 10 Days / 9 Nights. Luxury vehicle with a senior naturalist guide.\r\n\r\nPrice: LKR 1,200,000', 4000.00, '', 'nature', 'Uploads/happy-young-woman-on-luxury-safari-looking-at-will-elephant-walking-in-the-jungle.webp', 'created', '2025-09-16 02:38:30', '2025-09-16 02:38:30', NULL),
(109, 6, 'Sinharaja Rainforest & Tea Country', 'A deep dive into Sri Lanka\'s biodiversity, staying at some of the finest properties. Explore the UNESCO-listed rainforest with a private guide and relax at a luxurious tea plantation resort.\r\n\r\nTravel & Duration: 11 Days / 10 Nights. Luxury car.\r\n\r\nPrice: LKR 1,500,000', 5000.00, '', 'nature', 'Uploads/Sinharaja_01.webp', 'created', '2025-09-16 02:43:02', '2025-09-16 02:43:02', NULL),
(110, 6, 'Ultimate Island Eco-Tour', 'An all-encompassing nature tour featuring the island\'s most stunning natural attractions, from lush forests and wildlife reserves to serene coastal areas, all while staying at top-tier, sustainable resorts.\r\n\r\nTravel & Duration: 14 Days / 13 Nights. Luxury SUV.\r\n\r\nPrice: LKR 1,800,000', 6000.00, '', 'nature', 'Uploads/Historical-Sites-and-Landmarks.webp', 'created', '2025-09-16 02:43:57', '2025-09-16 02:43:57', NULL),
(112, 6, 'The Kingfisher\'s Trail', ' A high-end bird-watching and nature photography tour. Designed for enthusiasts, this package takes you to key birding hotspots across the island with expert guides and premium accommodations.\r\n\r\nTravel & Duration: 12 Days / 11 Nights. Luxury vehicle and internal flights where available.\r\n\r\nPrice: LKR 2,100,000 ', 7000.00, '', 'nature', 'Uploads/sigiriya-jetwing-vil-uyana-exterior.webp', 'created', '2025-09-16 02:45:24', '2025-09-16 02:45:24', NULL),
(114, 6, 'Ella\'s Thrills & Peaks', ' An action-packed short trip to Sri Lanka\'s adventure hub. Hike Little Adam\'s Peak, walk the iconic Nine Arch Bridge, and explore the picturesque town of Ella.\r\n\r\nTravel & Duration: 4 Days / 3 Nights. Local train and Tuk-tuk travel.\r\n\r\nPrice: LKR 105,000', 350.00, '', 'adventure', 'Uploads/adventure-ella-sri-lanka.webp', 'created', '2025-09-16 02:47:05', '2025-09-16 02:47:05', NULL),
(115, 6, 'White Water & Knuckles Trek', 'A quick dose of adrenaline. Enjoy white-water rafting on the Kelani River in Kitulgala, followed by a challenging trek in the misty Knuckles Mountain Range.\r\n\r\nTravel & Duration: 3 Days / 2 Nights. Public bus and taxi.\r\n\r\nPrice: LKR 75,000', 250.00, '', 'adventure', 'Uploads/Tika_Tasters_AASL_Kitulgala.webp', 'created', '2025-09-16 02:47:58', '2025-09-16 02:47:58', NULL),
(117, 6, 'Cycling the Cultural Triangle', ' An active way to explore ancient sites. Pedal through the ancient cities of Anuradhapura and Polonnaruwa, combining historical sightseeing with a healthy, adventurous challenge.\r\n\r\nTravel & Duration: 5 Days / 4 Nights. Cycling, with a support van.\r\n\r\nPrice: LKR 150,000', 500.00, '', 'adventure', 'Uploads/shutterstockRF563001901.webp', 'created', '2025-09-16 02:50:05', '2025-09-16 02:50:05', NULL),
(118, 6, 'Mountain & River Explorer', 'A diverse itinerary that combines hiking, rafting, and scenic travel. Trek to Adam\'s Peak (seasonal), raft down rivers, and enjoy the stunning landscapes of the Hill Country.\r\n\r\nTravel & Duration: 8 Days / 7 Nights. Private car with an adventure guide.\r\n\r\nPrice: LKR 330,000', 1100.00, '', 'adventure', 'Uploads/sri-lanka-photos-0948.webp', 'created', '2025-09-16 02:51:26', '2025-09-16 02:51:26', NULL),
(120, 6, 'The Adrenaline Rush', 'A tour for the ultimate thrill-seeker. This package includes white-water rafting, canyoning, rock climbing, and a zip-line experience, all in one action-packed itinerary.\r\n\r\nTravel & Duration: 7 Days / 6 Nights. Private vehicle.\r\n\r\nPrice: LKR 300,000', 1000.00, '', 'adventure', 'Uploads/360_F_281087384_awwlj0UCM6TMCM6NhLUoYapsAgiGZLWz.webp', 'created', '2025-09-16 02:52:36', '2025-09-16 02:52:36', NULL),
(121, 6, 'Jungle & Beach Adventure', 'Experience the best of both worlds. A safari in a national park followed by water sports and relaxation on the beaches of the south or east coast.\r\n\r\nTravel & Duration: 9 Days / 8 Nights. Private minivan.\r\n\r\nPrice: LKR 405,000 ', 1350.00, '', 'adventure', 'Uploads/jungle-beach-sri-lanka.webp', 'created', '2025-09-16 02:53:41', '2025-09-16 02:53:41', NULL),
(122, 6, 'Off-the-Beaten-Path Expedition', 'Venture into the wilderness. This tour takes you to lesser-known trails for trekking and camping, with a focus on immersive experiences in Sri Lanka\'s raw, untouched nature.\r\n\r\nTravel & Duration: 10 Days / 9 Nights. 4x4 vehicle.\r\n\r\nPrice: LKR 450,000 ', 1500.00, '', 'adventure', 'Uploads/tropical-pigeon-island-sri-lanka.webp', 'created', '2025-09-16 02:54:52', '2025-09-16 02:54:52', NULL),
(123, 6, 'Luxury Trekking & Glamping', 'A high-end trekking experience with all the comforts. Hike through scenic trails during the day and retreat to luxurious glamping tents or boutique mountain lodges at night.\r\n\r\nTravel & Duration: 10 Days / 9 Nights. Premium SUV with a private chef and guide.\r\n\r\nPrice: LKR 1,350,000 ', 4500.00, '', 'adventure', 'Uploads/i1s23f2udbb4jmu78rcestaqw71m_austin-ban-juHayWuaaoQ-unsplash.webp', 'created', '2025-09-16 02:59:29', '2025-09-16 02:59:29', NULL),
(124, 6, 'Island Multi-Sport Challenge', 'An elite adventure package for the most active traveler. This tour includes cycling, hiking, kayaking, and a helicopter ride for a birds-eye view of the island.\r\n\r\nTravel & Duration: 14 Days / 13 Nights. Luxury transport, including internal flights.\r\n\r\nPrice: LKR 2,250,000 ', 7500.00, '', 'adventure', 'Uploads/A-foreign-boy-windsurfing-on-the-waves-enjoying-one-of-the-most-exciting-water-sports-in-Sri-Lanka.webp', 'created', '2025-09-16 03:00:17', '2025-09-16 03:00:17', NULL),
(125, 6, 'Coastal & Deep Sea Discovery', 'A premium marine adventure. Enjoy private yacht charters for whale watching, deep-sea fishing, and diving/snorkeling in Sri Lanka\'s best marine sanctuaries.\r\n\r\nTravel & Duration: 10 Days / 9 Nights. Luxury car and private yacht.\r\n\r\nPrice: LKR 1,800,000', 6000.00, '', 'adventure', 'Uploads/photo-1563142746-c1c670ea5c3a_20191011220438.webp', 'created', '2025-09-16 03:03:22', '2025-09-16 03:03:22', NULL),
(126, 6, 'The Ultimate Safari & Hike', 'A high-end combination of the island\'s best adventure spots. Private safaris in exclusive national parks, challenging hikes with a personal guide, and stays at the most prestigious lodges.\r\n\r\nTravel & Duration: 12 Days / 11 Nights. Luxury vehicle.\r\n\r\nPrice: LKR 2,100,000', 7000.00, '', 'adventure', 'Uploads/5c0fabc2300e0b4b65778efb_sri lanka safari.webp', 'created', '2025-09-16 03:06:19', '2025-09-16 03:06:19', NULL),
(127, 6, 'Surfing & Sun on the South Coast', ' Learn to ride the waves on a budget. This package focuses on surf lessons and beach stays in popular surfing towns like Weligama or Arugam Bay (seasonal).\r\n\r\nTravel & Duration: 6 Days / 5 Nights. Local bus travel.\r\n\r\nPrice: LKR 165,000', 550.00, '', 'adventure', 'Uploads/Surfs-up-in-Arugam-Bay-slider-4.webp', 'created', '2025-09-16 03:08:56', '2025-09-16 03:08:56', NULL),
(128, 6, 'The Heritage Trail', ' A trip through Sri Lanka\'s rich history. Visit the ancient cities of Anuradhapura and Polonnaruwa, explore the Dambulla Cave Temple, and climb the iconic Sigiriya Rock Fortress.\r\n\r\nTravel & Duration: 7 Days / 6 Nights. Public transport and some taxis.\r\n\r\nPrice: LKR 195,000', 650.00, '', 'culture', 'Uploads/1757944159_sigiriya fortress.webp', 'created', '2025-09-16 04:34:36', '2025-09-16 04:34:36', NULL),
(129, 6, 'Kandy & Colonial Charm', ' Focus on the last kingdom of Sri Lanka. Discover the Temple of the Sacred Tooth Relic, explore the Botanical Gardens, and wander through the charming streets of Kandy and Nuwara Eliya.\r\n\r\nTravel & Duration: 5 Days / 4 Nights. Train and local bus.\r\n\r\nPrice: LKR 120,000', 400.00, '', 'culture', 'Uploads/temple-of-the-tooth-kandy-sri-lanka.webp', 'created', '2025-09-16 04:35:54', '2025-09-16 04:35:54', NULL),
(130, 6, 'Taste of Sri Lankan Life', ' A community-focused tour. Participate in a cooking class, visit a spice garden, and experience the daily life of a local village, staying in a simple guesthouse.\r\n\r\nTravel & Duration: 4 Days / 3 Nights. Local transport.\r\n\r\nPrice: LKR 105,000', 350.00, '', 'culture', 'Uploads/traditional-sri-lankan-cooking-class-galle-slider-4.webp', 'created', '2025-09-16 04:37:21', '2025-09-16 04:37:21', NULL),
(131, 6, 'Pilgrimage to Sacred Cities', 'A spiritual journey to some of the island\'s most revered Buddhist sites, including the sacred city of Anuradhapura and the Mihintale temple, a birthplace of Buddhism in Sri Lanka.\r\n\r\nTravel & Duration: 6 Days / 5 Nights. Public transport and private car for key sites.\r\n\r\nPrice: LKR 150,000', 500.00, '', 'culture', 'Uploads/mihintale-temple-sri-lanka.webp', 'created', '2025-09-16 04:38:44', '2025-09-16 04:38:44', NULL),
(132, 6, 'Royal Kingdoms & Coast', 'A well-rounded itinerary covering the island\'s main cultural triangle and a relaxing coastal stay. Explore ancient ruins, witness a traditional cultural show, and unwind on a beach.\r\n\r\nTravel & Duration: 9 Days / 8 Nights. Private air-conditioned minivan with a chauffeur-guide.\r\n\r\nPrice: LKR 360,000', 1200.00, '', 'culture', 'Uploads/Entrance-to-Kings-Audience-Hall-Polonnaruwa-Kingdom.webp', 'created', '2025-09-16 04:40:27', '2025-09-16 04:40:27', NULL),
(133, 6, 'Cultural Heritage & Tea Plantations', ' This tour combines the highlights of the cultural triangle with a scenic journey to the heart of Sri Lanka\'s tea country, with a visit to a tea factory and plantation.\r\n\r\nTravel & Duration: 8 Days / 7 Nights. Private car with a knowledgeable guide.\r\n\r\nPrice: LKR 300,000 ', 1000.00, '', 'culture', 'Uploads/tea-plantation-in-sri-lanka.webp', 'created', '2025-09-16 04:41:49', '2025-09-16 04:41:49', NULL),
(134, 6, 'The Spice Island Trail', 'A culinary and cultural adventure. Discover the origins of Sri Lanka\'s famous spices, learn to prepare traditional dishes, and explore vibrant local markets, all while visiting historical sites.\r\n\r\nTravel & Duration: 7 Days / 6 Nights. Private minivan.\r\n\r\nPrice: LKR 270,000', 900.00, '', 'culture', 'Uploads/DSC_0133-1024x681.webp', 'created', '2025-09-16 04:43:04', '2025-09-16 04:43:04', NULL),
(135, 6, 'Galle Fort & South Coast Heritage', 'A tour focused on the island\'s colonial past. Explore the UNESCO-listed Galle Fort, walk its cobblestone streets, and discover the unique blend of Dutch, Portuguese, and Sri Lankan cultures.\r\n\r\nTravel & Duration: 6 Days / 5 Nights. Private car.\r\n\r\nPrice: LKR 240,000', 800.00, '', 'culture', 'Uploads/galle-fort-sri-lanka-211.jpg.webp', 'created', '2025-09-16 04:44:24', '2025-09-16 04:44:24', NULL),
(136, 6, 'The Grand Cultural Escape', ' An exclusive tour of Sri Lanka\'s most significant cultural sites. Stay at top-tier heritage hotels and receive private, expert-led tours of ancient cities, temples, and palaces.\r\n\r\nTravel & Duration: 10 Days / 9 Nights. Luxury SUV with a private guide.\r\n\r\nPrice: LKR 1,500,00', 5000.00, '', 'culture', 'Uploads/sncgbjc3481d2826.webp', 'created', '2025-09-16 04:46:06', '2025-09-16 04:46:06', NULL),
(137, 6, 'Ayurveda & Heritage Journey', 'A luxurious tour combining cultural sightseeing with wellness. Explore historical sites and then retreat to a high-end Ayurvedic resort for traditional treatments and rejuvenation.\r\n\r\nTravel & Duration: 11 Days / 10 Nights. Luxury transport.\r\n\r\nPrice: LKR 1,800,000', 6000.00, '', 'culture', 'Uploads/shala-kundalini-sunrise-rays-1024x683.webp', 'created', '2025-09-16 04:47:38', '2025-09-16 04:47:38', NULL),
(138, 6, 'Colonial Charm & Modern Colombo', ' A deep dive into the island\'s colonial history and its modern capital. Stay at iconic heritage hotels, enjoy gourmet dining, and explore the bustling streets and hidden gems of Colombo with a local expert.\r\n\r\nTravel & Duration: 7 Days / 6 Nights. Luxury vehicle.\r\n\r\nPrice: LKR 1,200,000', 4000.00, '', 'culture', 'Uploads/peaceful-beauty-colombo-street-sunrise-ocean-breeze-image-showcases-sri-lanka-colonial-era-buildings-352615827.webp', 'created', '2025-09-16 04:49:26', '2025-09-16 04:49:26', NULL),
(139, 6, 'The Ultimate Art & History Tour', 'A bespoke experience for the connoisseur. Visit exclusive art galleries, private workshops, and archaeological sites with a renowned historian. This package offers unparalleled access and insight into Sri Lankan art and history.\r\n\r\nTravel & Duration: 12 Days / 11 Nights. Luxury vehicle and private guided tours.\r\n\r\nPrice: LKR 2,100,000', 7000.00, '', 'culture', 'uploads/1758096087_culture-and-history-tour-of-sri-lanka-02.webp', 'updated', '2025-09-16 04:50:51', '2025-09-17 08:01:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `status` enum('created','updated') DEFAULT 'created',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `admin_id`, `product_name`, `product_description`, `product_price`, `product_category`, `product_image`, `status`, `created_at`, `updated_at`) VALUES
(13, 6, 'Universal Travel Adapter', ' A single, compact adapter that allows you to plug in your devices in different countries. It typically includes various plug types and USB ports.\r\n\r\nSpecial Features: Eliminates the need to buy multiple adapters for different regions. Many models come with multiple USB and USB-C ports, allowing you to charge your phone, tablet, and other gadgets simultaneously. Some also have surge protection.\r\n\r\nEstimated Price: LKR 6,000', 20.00, NULL, 'Uploads/105-2_dfca21db-bc32-47aa-8f41-99001a5ac608.webp', 'created', '2025-09-16 05:22:54', '2025-09-16 05:22:54'),
(14, 6, 'Portable Power Bank', 'A portable battery that can charge your phone, tablet, and other electronics on the go, ensuring you never run out of battery during a long day of sightseeing or travel.\r\n\r\nSpecial Features: Look for a high-capacity power bank (10,000mAh or more) with fast-charging capabilities. Smaller, lighter models are also available for short trips.\r\n\r\nEstimated Price: LKR 9,000', 30.00, NULL, 'Uploads/Anker-Laptop-Power-Bank-(in-hand)-Reviewer-Photo-SOURCE-Simon-Hill.webp', 'created', '2025-09-16 05:25:04', '2025-09-16 05:25:04'),
(15, 6, 'Packing Cubes', ' Fabric cubes or organizers that help you compress and compartmentalize your clothes and other items inside your luggage.\r\n\r\nSpecial Features: Keeps your suitcase organized and makes it easy to find what you need without rummaging. Compression-style cubes can save a significant amount of space, allowing you to pack more efficiently.\r\n\r\nEstimated Price: LKR 4,500', 35.00, NULL, 'Uploads/BM01040486N022_-06_f7ac63e1-8d6e-40ae-b9e1-93919c936ecb_900x.webp', 'created', '2025-09-16 05:26:10', '2025-09-16 05:26:10'),
(16, 6, 'Travel Pillow', 'A comfortable pillow designed to support your neck and head during long flights, bus rides, or train journeys.\r\n\r\nSpecial Features: Modern travel pillows are often made from memory foam for superior comfort and support. Some are inflatable for easy packing, while others have a compact design that wraps around your neck.\r\n\r\nEstimated Price: LKR 3,000', 20.00, NULL, 'Uploads/Pillow-mar25-louis delbarre (7 of 11).webp', 'created', '2025-09-16 05:37:45', '2025-09-16 05:37:45'),
(17, 6, 'Reusable Water Bottle', 'An eco-friendly alternative to single-use plastic bottles. Many airports and public places have water refilling stations.\r\n\r\nSpecial Features: Look for a durable, leak-proof bottle, preferably with an insulated design to keep your water cold. Collapsible bottles are an excellent choice for saving space when not in use.\r\n\r\nEstimated Price: LKR 3,000', 25.00, NULL, 'Uploads/51Rty1RnNEL.webp', 'created', '2025-09-16 05:38:55', '2025-09-16 05:38:55'),
(18, 6, 'Noise-Canceling Headphones or Earbuds', ' Essential for blocking out ambient noise on planes, trains, and in crowded public spaces, allowing you to listen to music, podcasts, or simply enjoy some peace and quiet.\r\n\r\nSpecial Features: High-quality noise-canceling technology, long battery life, and a comfortable fit are key features. Many models also include a built-in microphone for hands-free calls.\r\n\r\nEstimated Price: LKR 15,000', 50.00, NULL, 'Uploads/iy44eo2ruFt8SjbDB4gz55.webp', 'created', '2025-09-16 05:41:00', '2025-09-16 05:41:00'),
(19, 6, 'Digital Luggage Scale', 'A small, handheld device to weigh your luggage before you get to the airport, helping you avoid overweight baggage fees.\r\n\r\nSpecial Features: Compact and lightweight, so it\'s easy to pack. It provides accurate readings and often includes a hook or strap to easily lift your bag.\r\n\r\nEstimated Price: LKR 3,000', 15.00, NULL, 'Uploads/s-l500.webp', 'created', '2025-09-16 05:41:53', '2025-09-16 05:41:53'),
(20, 6, 'First-Aid Kit', ' A small kit with basic medical supplies for minor injuries or ailments, which is crucial for safety and peace of mind on any trip.\r\n\r\nSpecial Features: Should include essentials like bandages, antiseptic wipes, pain relievers, and any personal prescription medications you need. A small, waterproof pouch is ideal for organization.\r\n\r\nEstimated Price: LKR 2,000', 7.00, NULL, 'Uploads/360_F_1242361042_eDBydAtHcCb726Z1I7B8eQ4VZzz8hPZb.webp', 'created', '2025-09-16 05:42:34', '2025-09-16 05:42:34'),
(21, 6, ' Travel Toiletry Bag', 'A dedicated bag for organizing your toiletries, preventing spills and keeping your main luggage clean.\r\n\r\nSpecial Features: Look for a bag with multiple compartments, a waterproof lining, and a hanging hook for convenience in small hotel bathrooms. Clear, TSA-compliant bags are great for carry-on luggage.\r\n\r\nEstimated Price: LKR 3,000', 10.00, NULL, 'Uploads/il_300x300.6722346225_98g2.webp', 'created', '2025-09-16 05:44:24', '2025-09-16 05:44:24'),
(22, 6, 'Anti-Theft Daypack or Bag', 'A backpack or crossbody bag designed with security features to protect your belongings while you\'re exploring a new city.\r\n\r\nSpecial Features: Often includes slash-proof material, hidden zippers, and RFID-blocking pockets to protect your credit card information.\r\n\r\nEstimated Price: LKR 15,000 ', 50.00, NULL, 'Uploads/61HNIUqAgIL.webp', 'created', '2025-09-16 05:45:03', '2025-09-16 05:45:03'),
(23, 6, 'Microfiber Travel Towel', 'A lightweight, highly absorbent, and quick-drying towel that is perfect for backpacking, camping, or staying in hostels.\r\n\r\nSpecial Features: Dries much faster than a standard cotton towel, preventing mildew and odors. It can be compressed to a very small size, taking up minimal space in your bag.\r\n\r\nEstimated Price: LKR 2,500', 8.00, NULL, 'Uploads/1080x180_w_icons-Black_XL.webp', 'created', '2025-09-16 05:46:02', '2025-09-16 05:46:02'),
(24, 6, ' Apple AirTag', 'A small Bluetooth tracker that you can place in your luggage or daypack to track its location using your smartphone.\r\n\r\nSpecial Features: Provides peace of mind, especially when checking luggage for flights. You can use your phone to see its location on a map, and the app can alert you if your bag is moving without you.\r\n\r\nEstimated Price: LKR 7,500', 251.00, NULL, 'Uploads/100-apple-airtags-2021.webp', 'created', '2025-09-16 05:46:47', '2025-09-16 05:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `tourguide_bookings`
--

CREATE TABLE `tourguide_bookings` (
  `booking_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `language` varchar(50) NOT NULL,
  `guests` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `region` varchar(100) NOT NULL,
  `special_requests` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tourguide_bookings`
--

INSERT INTO `tourguide_bookings` (`booking_id`, `full_name`, `email`, `phone`, `language`, `guests`, `start_date`, `end_date`, `region`, `special_requests`, `created_at`) VALUES
(1, 'Yashara', 'jbu@dfdf.com', '+94777888666', '0', 1, '2025-09-19', '2025-09-22', 'Kandy', 'sdfs', '2025-09-13 23:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `transport_bookings`
--

CREATE TABLE `transport_bookings` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `vehicle` enum('Bus','Cab','Tuk-Tuk','Other') NOT NULL,
  `passengers` int(10) UNSIGNED NOT NULL,
  `pickup` varchar(150) NOT NULL,
  `drop_location` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `budget` enum('Budget','Mid-range','Luxurious') NOT NULL,
  `special_requests` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport_bookings`
--

INSERT INTO `transport_bookings` (`booking_id`, `full_name`, `email`, `vehicle`, `passengers`, `pickup`, `drop_location`, `date`, `time`, `budget`, `special_requests`, `created_at`) VALUES
(5, 'Thisari', 'jbu@dfdf.com', 'Bus', 5, '0', 'tyfy', '2025-09-17', '08:09:00', 'Budget', 'fyug', '2025-09-13 21:34:32'),
(6, 'Yashara', 'yash@asa.com', 'Bus', 3, 'hui', 'sqq', '2025-09-25', '03:09:00', 'Budget', 'saa', '2025-09-13 21:39:37'),
(7, 'ui', 'khj@fd.com', 'Bus', 63, 'yf', 'fh', '2025-09-27', '03:17:00', 'Budget', 'fyug', '2025-09-13 21:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `first_name`, `last_name`, `email`, `country`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(4, 'yash', 'Yashara', 'Gamage', 'yash@gamage', 'LK', '$2y$10$6Ge/gezZUvsepmfqaEK2.uprXYVAPJOf2J8WfrvANC/zgDE8uTFiO', NULL, '2025-09-10 06:41:44', '2025-09-10 06:41:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  ADD PRIMARY KEY (`booking_hotel_id`);

--
-- Indexes for table `medicare_bookings`
--
ALTER TABLE `medicare_bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `tourguide_bookings`
--
ALTER TABLE `tourguide_bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `transport_bookings`
--
ALTER TABLE `transport_bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  MODIFY `booking_hotel_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicare_bookings`
--
ALTER TABLE `medicare_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tourguide_bookings`
--
ALTER TABLE `tourguide_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport_bookings`
--
ALTER TABLE `transport_bookings`
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
