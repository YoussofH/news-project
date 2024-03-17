-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 17, 2024 at 04:19 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image_url`, `date_added`) VALUES
(1, 'AI Makes Huge Breakthrough in Protein Folding', 'This describes a recent advancement in AI for protein folding.', 'https://eu-images.contentstack.com/v3/assets/blt6b0f74e5591baa03/blt33ac8b9628e61e84/6319706cca793c314dd91836/2236.jpg', '2024-03-17 15:27:33'),
(2, 'James Webb Telescope Captures Stunning Images of Jupiter\'s Auroras', 'This details the James Webb telescope\'s observations of Jupiter\'s auroras.', 'https://helios-i.mashable.com/imagery/articles/06oglHtuOsdF3x65ok5b4UM/hero-image.fill.size_1248x702.v1661270887.jpg', '2024-03-17 15:27:33'),
(3, 'Tiny Robot Surgeons Could Revolutionize Medicine', 'This explores the potential of microrobots for medical procedures.', 'https://undark.org/wp-content/uploads/2019/08/da-vinci_feature2.jpg', '2024-03-17 15:27:33'),
(4, 'Climate Change Causing More Extreme Weather Events', 'This discusses the link between climate change and extreme weather events.', 'https://earthjustice.org/wp-content/uploads/wildfire-hill_noah-berger-ap-1200.jpg', '2024-03-17 15:30:11'),
(5, 'Self-Driving Cars Face Challenges in Complex Urban Environments', 'This explores the challenges of self-driving cars in urban settings.', 'https://static.scientificamerican.com/sciam/cache/file/315BB2AC-9758-418B-A7808363D6F29820_source.jpg?w=1200', '2024-03-17 15:30:11'),
(6, 'Sustainable Food Production Gains Momentum', 'This explores the growing focus on sustainable food production practices.', 'https://www.healthpopuli.com/wp-content/uploads/2024/02/FMI-programs-by-percent-in-food-industry.png', '2024-03-17 15:37:13'),
(7, 'Artificial Intelligence Powers Advancements in Drug Discovery', 'This highlights the role of AI in accelerating drug discovery processes.', 'https://www.infosysbpm.com/content/dam/infosys-bpm/en/blogs/images/exploring-the-power-of-generative-ai-in-drug-discovery-medium.jpg', '2024-03-17 15:37:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
