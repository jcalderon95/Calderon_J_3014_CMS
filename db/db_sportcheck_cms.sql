-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 05, 2020 at 08:11 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sportcheck_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Kids'),
(4, 'Footwear'),
(5, 'Gear'),
(6, 'Accessories'),
(7, 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_price` varchar(250) NOT NULL,
  `product_review` varchar(250) NOT NULL,
  `product_brand` varchar(250) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`product_id`, `product_name`, `product_price`, `product_review`, `product_brand`, `product_description`, `product_image`) VALUES
(1, 'Nike Men\'s Revolution 5 Running Shoes', '$65.99', '5.0', 'Nike', 'The Nike Men’s Revolution 5 Running Shoe cushions your stride with soft foam to keep you running in comfort. Lightweight knit material wraps your foot in breathable support, while a minimalist design fits in just about anywhere your day takes you.', 'Nike_5_Running_Shoes.png'),
(2, 'Jordan Boys’ Air Future Pullover Hoodie', '$45.00', '5.0', 'Nike', 'The Jordan Air Future Boy’s Pullover Hoodie features fleece fabric for a warm comfortable all day wear', 'Jordan_Boys_Air_Future_Pullover_Hoodie.png'),
(3, 'Everlast 12Oz Pro Style Training Gloves 2.0 ', '$49.99', '4.0', 'Everlast', 'Engineered For: Sparring, Heavy Bag Workout, Mitt Workout', 'Everlast_Training_Gloves.png'),
(4, 'Nike Men\'s Benassi \"Just Do It\" Sandals', '$22.49', '4.3', 'Nike', 'Men\'s Nike Benassi \"Just Do It.\" Sandal is a lightweight sports slide with the Nike corporate logo embellished on the strap. Its soft midsole foam and jersey lining provide comfort so you can enjoy a relaxed, premium experience.', 'Nike_Benassi_Sandals.png'),
(5, 'adidas Women\'s Sportswear Melange Versatility Sweatshirt', '$79.99', '4.3', 'Adidas', 'The day has to start somewhere. It might as well be with comfort. With a full schedule ahead, the adidas Must Haves sweatshirt helps you handle the day in stride. The loose shape makes for an ideal layer, easy to throw on with anything.', 'adidas-Womens-Versatility-Sweatshirt.png'),
(6, 'Nike Lean Arm Band - Medium Pink', '$18.75', '4.3', 'Nike', 'Out for a run or at the gym, the Nike Lean Arm Band will keep your phone safe and protected no matter what the activity', 'Nike-Lean-Arm-Band-Medium-Pink.png'),
(7, 'Fitbit Inspire HR Fitness Tracker - Black', '$129.95', '4.6', 'Fitbit', 'Fitbit Inspire HR™ is a friendly heart rate & fitness tracker for every day that helps you build healthy habits.', 'Fitbit-Inspire-HR-Black.png'),
(8, 'Garmin Forerunner 45 GPS Running Watch', '$279.99', '4.3', 'Garmin', 'Run Your Heart Out This easy-to-use running watch is perfect for daily runs, training sessions and even that upcoming 10K you got talked into. Built-in GPS tracks where you run and gives you accurate stats, including distance, pace and intervals.', 'Garmin-Forerunner-Running-Watch.png'),
(9, 'Vans Men\'s Primary II 17 Inch Volley Boardshorts', '$54.99', '4.8', 'Vans', 'The Primary Volley is a 60% cotton, 40% nylon volley short featuring mesh lining, side entry hand pockets, and a back welt pocket zip closure.', 'Vans-Mens-Boardshorts.png'),
(10, 'Nike Men\'s Pacer Flash 1/2 Zip Long Sleeve Shirt', '$51.00', '4.1', 'Nike', 'Layer up in the Nike Running Top. Soft, stretchy material brings comfort to the most challenging of routes, while sweat-wicking technology and breathable construction help keep you cool as you press on.', 'Nike-Mens-Pacer-Flash.png'),
(11, 'Nike HO19 Strike Size 5 Soccer Ball - White/Mango', '$26.25', '1.0', 'Nike', 'The Nike Strike Soccer Ball is ready for everyday play with its 12-panel design and high visibility details for easy tracking.', 'Nike-Strike-Size-5-Soccer-Bal.png'),
(12, 'Bauer NSX Junior Hockey Skates', '$84.99', '5.0', 'Bauer', 'Get your young hockey star started on the right track with the Bauer NSX Junior Hockey Skates featuring a 2-piece 30oz felt tongue with metatarsal guard for great protection. The microfiber liner and anaform ankle pads keep you dry and comfortable throughout the game.', 'Bauer-NSX-Junior-Hockey-Skates.png'),
(13, 'McKINLEY Women\'s Laga 2L Shell Jacket', '$119.99', '4.9', 'McKINLEY', 'Fitting your body without constricting, and stretching naturally when you move, the McKINLEY women’s Laga softshell jacket is an ideal outer layer for when you’re on the move. Since getting wet from the inside is no better than getting wet from the outside, the highly water-repellent AQUAMAX outdoor jacket uses two functional material layers to combine breathability and temperature control with weather protection', 'McKINLEY-Womens-Laga.jpg'),
(14, 'Diadora Luxe Women\'s Second Chance Jumpsuit - Tawny Port', '$94.99', '4.0', 'Diadora', 'Let this soft, jersey jumpsuit take you from studio to street. Featuring a cross-over front and adjustable waistband drawcord, this ankle-biter length jumpsuit is the sporty, retro piece you’ve been looking add to your wardrobe.', 'Diadora-Second-Chance-Jumpsuit.png'),
(15, 'Nike Boys\' NSW Melted Crayon Short Sleeve Tee', '$18.00', '3.5', 'Nike', 'The Nike Sportswear T-Shirt is made of soft cotton for all-day comfort.', 'Crayon-Short-Sleeve-Tee.png'),
(16, 'Jordan Essential Ball Pump - Red/Black', '$12.00', '2.5', 'Jordan', 'Instead of letting a deflated ball end your pickup game, keep the Jordan® Essential Ball Pump handy for quick inflation at a moment’s notice. The compact design is ideal for storage in gym bags or backpacks, ensuring that you’re always prepared to keep the game going.', 'Jordan-Essential-Ball-Pump.png'),
(17, 'Under Armour Men\'s Sportstyle Terry Full Zip Hoodie', '$52.49', '3.8', 'Under Armour', 'Don’t stress if you leave this ultra comfortable hoodie on when warming up, but you can trust the UA Sportstyle Terry Full Zip will get you to and from with all-day comfort.', 'Under-Armour-Sportstyle-Hoodie.png'),
(18, 'Nike Women\'s Tiempo Legend V FG WC Outdoor Soccer Cleats - Blue/Yellow', '$99.88', '4.5', 'Nike', 'The Nike Tiempo Legend V Women’s Firm-Ground Soccer Cleat is engineered to provide the perfect first touch while delivering long-lasting comfort in all conditions with a waterproof upper.', 'Nike-Womens-Tiempo-Legend.jpg'),
(19, 'Nike Boys’ Dry Ice Cold Short Sleeve Tee', '$18.00', '2.1', 'Nike', 'The Nike Dri-FIT T-Shirt has sweat-wicking technology to help you stay dry and comfortable.', 'Ice-Cold-Short-Sleeve-Tee.png'),
(20, 'JBL Tune 500 Wireless Bluetooth Headphones - Black', '$79.99', '4.6', 'JBL', 'The JBL TUNE500BT headphones let you stream powerful sound with no strings attached for up to 16 hours of pure pleasure. Easy to use and equipped with 32mm JBL drivers and JBL Pure Bass sound, these headphones provide easy access to great sound every time. And if a call comes in while you are watching a video on another device, the JBL TUNE500BT seamlessly switches to your mobile. Bluetooth enabled and designed to be comfortable, the JBL TUNE500BT headphones also allow you to connect to Siri or Google Now without using your mobile device. Available in 4 fresh colors and foldable for easy portability, the JBL TUNE500BT headphones are a grab ‘n go solution that help you to inject music into every aspect of your busy life', 'JBL-Tune-500-Wireless-Bluetooth-Headphones.png'),
(21, 'Diadora HI Visibility Discs', '$11.99', '4.4', 'Diadora', 'The Diadora Hi-Visibility Discs are perfect for any warm-up or training session.', 'Visibility-Discs.png'),
(22, 'Wilson Evolution - Size 7 Basketball', '$74.99', '4.8', 'Wilson', 'There is a reason that the Evolution is the #1 Selling High School basketball in the country.  Wilson combines Laid in Channels patented technology and our exclusive Cushion Core Technology along with its exclusive premium Microfiber Composite Cover delivering maximum grip and player control.', 'Wilson-Evolution-Basketball.png'),
(23, 'Nike Women\'s HyperVenom Phelon III FG Outdoor Soccer Cleats', '$62.88', '5.0', 'Nike', 'The Women’s Nike Hypervenom Phelon III (FG) Firm-Ground Soccer Cleat is coiled and ready to strike. An aggressive allover texture improves touch while chevron and hexagonal studs provide targeted traction for agility on the pitch.', 'Nike-Womens-HyperVenom.png'),
(24, 'Fox 40 Classic Safety Pealess Whistle', '$7.99', '5.0', 'Fox', 'The standard choice for personal safety and rescue professionals worldwide. It will be heard above ambient noise, engine roars and breaking waves. Chambers are designed to self-clear when submerged in water. No moving parts to freeze, jam or deteriorate. Wet or dry, you can depend on the Fox 40 Classic in any weather condition. 3-chamber pealess design with 115 dB sound power.', 'Safety-Pealess-Whistle.jpg'),
(25, 'PUMA Women\'s Summer Skirt', '$17.97', '4.0', 'PUMA', 'Give your sporty style a feminine touch with the PUMA Summer Skirt. This comfortable cotton skirt has two side seam pockets for storage and a curved hem for a flattering fit that is perfect for pairing with a tucked in tee and your go-to sneakers.', 'PUMA-Womens-Summer-Skirt.png'),
(26, 'Adidas Boys’ Tiro 19 Traning Pant', '$32.97', '4.4', 'Adidas', 'Train hard. Stay cool. These football pants battle the heat with breathable, quick-drying fabric. Cut for movement, they have a slim fit and stretchy ribbed details on the lower legs to promote clean footwork. Ankle zips allow you to pull them on or off over boots.', 'Adidas-Boys-Tiro-19-Traning-Pant.png'),
(27, 'Fox 40 Pro Coaching Board with Clip', '$24.99', '3.4', 'Fox', 'The Fox 40 Pro Coaching Board with Clip helps make coaching easier. This full-colour, double-sided, write-on/wipe-off board includes a clip for holding paperwork and displays a full field/court on one side and a close-up view of half a field or court on the other.', 'Fox-40-Pro-Coaching-Board.jpg'),
(28, 'Bushnell NEO Phantom Golf GPS - Black', '$139.99', '5.0', 'Bushnell', 'Bushnell has taken the Easy-to-use, convenient Phantom  Golf GPS to the next level with Bite Magnetic Mount: Built-in magnet technology allows you to easily mount your Phantom right on your golf cart or any metal surface. Preloaded with 36,000+ courses in more than 30 countries.  Easy-to-read front/center/back distances and up to 4 hazard distances per hole. Includes a clip holder to attach to your bag or belt.', 'Phantom-Golf-GPS.png'),
(29, 'Timberland Men\'s Ashwood Park Sprint Hiker Boots - Black', '$96.95', '2.0', 'Timberland', 'A mix of style and comfort makes the Ashwood Park Sprint Hiker a classic choice.', 'Timberland-Sprint-Hiker-Boots.png'),
(30, 'PUMA Women\'s Modern Sports Dress', '$17.97', '4.3', 'PUMA', 'Take your favourite features of your go-to sportswear and put it into a feminine piece that is perfect for warmer weather. The PUMA Modern Sport Dress features sport-inspired graphics and mesh panels for breathability.', 'PUMA-Womens-Modern-Sports-Dress.png'),
(31, 'Helly Hansen Men\'s Sirdal Hooded Insulator Jacket', '$179.99', '4.8', 'Helly Hansen', 'A staple piece for any age. A warm, versatile insulator that works great as a stand alone layer or under your favorite shell', 'Helly-Hansen-Hooded-Insulator-Jacket.png'),
(32, 'Vans Men\'s Woodridge Jacket', '$149.99', '4.7', 'Vans', 'The Woodridge Jacket is a 100% nylon water-resistant hooded puffer jacket with 6 oz. poly fill, left chest logo embroidery, and slit pockets at the hips.', 'Vans-Mens-Woodridge-Jacket.png'),
(33, 'Nike Boys\' Dry Trophy Shorts', '$18.00', '4.9', 'Nike', 'Designed to keep you cool during practice and play, the Nike Boys’ 8\" Training Shorts are made with sweat-wicking technology for lightweight ventilation.', 'Nike-Boys-Dry-Short-Trophy.png'),
(34, 'Fitbit Aria Air Smart Scale', '$69.95', '5.0', 'Fitbit', 'Get a more complete picture of your health with the Fitbit Aria Air smart scale. This easy to use smart scale displays your weight and syncs it to the Fitbit app where you can view your BMI, track your trends over time and see how things like activity and nutrition impact your goals.', 'Fitbit-Aria-Air-White.png'),
(35, 'Arena Python Mirror Goggles', '$39.99', '4.3', 'Arena', 'These racing goggles with mirrored lenses provide extra protection against UV rays while swimming outdoors and cut down on glare from the sun and in well-lit pools. Arena has developed the snake-eye shape for wide vision and hydrodynamic performance. This watertight design has durable hard lenses for a clear view and soft silicone seals and strap for comfort. Get the best fit by adjusting the dual strap.', 'Arena-Python-Mirror-Goggles.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `product_category_id` int(11) NOT NULL,
  `product_id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`product_category_id`, `product_id`, `category_id`) VALUES
(1, 1, 4),
(2, 2, 3),
(3, 3, 5),
(4, 4, 4),
(5, 5, 2),
(6, 6, 6),
(7, 7, 7),
(8, 8, 7),
(9, 9, 1),
(10, 10, 1),
(11, 11, 5),
(12, 12, 5),
(13, 13, 2),
(14, 14, 2),
(15, 15, 3),
(16, 16, 6),
(17, 17, 1),
(18, 18, 4),
(19, 19, 3),
(20, 20, 7),
(21, 21, 6),
(22, 22, 5),
(23, 23, 4),
(24, 24, 6),
(25, 25, 2),
(26, 26, 3),
(27, 27, 6),
(28, 28, 7),
(29, 29, 4),
(30, 30, 2),
(31, 31, 1),
(32, 32, 1),
(33, 33, 3),
(34, 34, 7),
(35, 35, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_ip` varchar(250) NOT NULL,
  `first_login` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fname`, `user_name`, `user_pass`, `user_email`, `user_date`, `user_ip`, `first_login`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin@admin.ca', '2020-04-05 07:09:40', '::1', 1),
(2, 'User', 'user', 'user', 'user@user.ca', '2020-04-05 06:28:27', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
