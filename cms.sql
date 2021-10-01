-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2021 at 10:27 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'PHP'),
(3, 'Bootstrap'),
(4, 'Java'),
(10, 'OOP'),
(13, 'Procedural PHP'),
(22, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(16, 114, 'Edwin Diaz', 'edwindiaz@edwindiaz.com', 'Hello, this is a comment', 'unapproved', '2021-09-22'),
(17, 141, 'Mala', 'mala@mala.com', 'comment 1', 'unapproved  ', '2021-09-22'),
(19, 139, 'Robert', 'bob@gmail.com', 'Hello comment', 'unapproved', '2021-09-22');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(3) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(258, 4, 'Test 3', '', 'rico', '2021-09-28', 'Top-7-PHP-CMS-for-2021-Drupal.jpg', '<p>Another cool post</p>', 'CMS, PHP', 0, 'published', 35),
(259, 3, 'New post', '', 'rico', '2021-09-26', 'Top-7-PHP-CMS-for-2021-Drupal.jpg', '<p>another post</p>', 'one tag', 0, 'published', 0),
(260, 3, 'New post', '', 'rico', '2021-09-26', 'Top-7-PHP-CMS-for-2021-Drupal.jpg', '<p>another post</p>', 'one tag', 0, 'published', 0),
(261, 4, 'Test 3', '', 'rico', '2021-09-26', 'image_1.jpg', '<p>Another cool post</p>', 'CMS, PHP', 0, 'published', 0),
(262, 4, 'Test 3', '', 'rico', '2021-09-26', 'Udemy.jpg', '<p>Another cool post</p>', 'CMS, PHP', 0, 'published', 3),
(265, 2, 'Latest', '', 'rico', '2021-09-28', '83-838169_number.jpg', '<p>This is the latest post</p>', 'CMS, PHP', 0, 'published', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(1, 'rico', '$1$Cp9/Gl4Z$2aAw0wCjn4NQW3C0tZ6a.0', 'Ricos', 'Suaves', 'ricosuave@gmail.com', '', 'admin', ''),
(2, 'rick', '$1$ppZ4Fm5i$1phZIxaAIiSFLfXsxepF7.', 'Ricky', 'ricardo', 'ricky234@gmail.com', '', 'admin', ''),
(4, 'PETET', '$1$.gZBtXCm$UdGdMDQiqUBou/tBhCHTJ/', 'Quenchi', 'Peterson', 'petet@gmail.com', '', 'subscriber  ', ''),
(5, 'Robo', '$1$5paIFH2Z$z30Xjqvr8n7tZIRCVYzZ3.', 'Ro', 'Bo', 'robo@gmail.com', '', 'subscriber  ', ''),
(8, 'Demo4000', '$1$BNOlIguh$TtBbUzqrQ9dNQ0JYhl3ph.', 'De', 'Mo', 'demo4000@gmail.com', '', 'admin', '$2y$10$iusesomecrazystring22'),
(9, 'Suave', '$1$7m2KSQO6$i1LGXnqvoWdeHCaQORpsg0', 'Sua', 've', 'suave@gmail.com', '', 'subscriber  ', '$2y$10$iusesomecrazystring22'),
(11, 'Ndum', '$2y$12$5LiLnPD57bt.U9Ng6kHtvuQCOtwSwUdhA./c8yEiv5G4ytlNOWQhq', 'Jeff', 'Ndum', 'ndum@gmail.com', '', 'subscriber  ', '$2y$10$iusesomecrazystrings22'),
(12, 'Billy', '$2y$10$o/tJANldsYu4hxUkTblJquS1oD1T0OEHrVseQPFTGcyS4YlQ5zWLO', 'Billy', 'Hans', 'billy@gmail.com', '', 'subscriber  ', '$2y$10$iusesomecrazystrings22'),
(13, 'rico', '$2y$12$OaiBVEe1IlcjL7Ua8BQMBuK9kQJIq2t1cxF23wQUvQT2IVVBt60z6', 'ri', 'co', 'rico@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(14, 'rico', '$2y$12$GMAhNcx1mXsQ44SUyAjK0O3hi9E43v7K5wEon3HoM55wv3Kjp85eG', 'ri', 'co', 'rico@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(15, 'Oliv', '$2y$12$EMphp23xXJfIbHApIwUB1OxrCD4rmhEU6sq75QJcdkBko.zgp/BQW', 'Olivia', 'Makar', 'olivia@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(19, 'lupila', '$2y$12$k5wU0p2lSSRV2NOScjgFz.d1P9UcXEJtDsEx1P/7NPvvgJ5ZT1dB2', 'lupi', 'pila', 'lupila1800@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(4, 'avgm9m7cbu0sha4t8m17mdjhse', 1632164290),
(5, 'c4gjtvo3e8uo5ocisu4a2k10kg', 1632431976),
(6, 'k7rf05qg34ovkebecijueurbks', 1632171110),
(7, 'ah3henj42urak0vfveu9egp3es', 1632402709),
(8, 'q8ig09ml8meklup65ek06of88u', 1632806935),
(9, 'mcfh06pm4cg6a0s4uudjtj7n3c', 1632777901),
(10, '5c7co8k02lm5rf7mll82p935d2', 1632806893),
(11, 'glsilbhl2ajmdacj2q7h57rkdd', 1632847326),
(12, '9phgu50hvgdmo01nku4f3tsti3', 1632852027),
(13, '84f791k6t78msno3695h8vjck7', 1632892025),
(14, '7vmo8gfh505vlpkopef0fg6445', 1632893558),
(15, 'va712hke4d3lr6t39r8m3al9p8', 1632919259),
(16, '0avt95eofcku38359iioqvhgk5', 1632990450);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
