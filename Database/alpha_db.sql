-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 02:20 PM
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
-- Database: `alpha_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `fname`, `lname`) VALUES
('1', 'james', '$2y$10$l0QegYQTDTXVkPpvfl.Y4.g/vTYrjWG03M5Rhhg3rMPuJ4IGAZyym', 'Lunguli', 'James');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `grade`, `section`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `grade_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `grade`, `grade_code`) VALUES
(1, 1, 'S'),
(2, 2, 'S'),
(3, 3, 'S'),
(4, 4, 'S'),
(5, 5, 'S'),
(6, 6, 'S'),
(7, 2024, 'BIS'),
(8, 2023, 'BITC'),
(9, 2023, 'MATH'),
(10, 2025, 'BCOM'),
(11, 2023, 'PHY'),
(12, 2023, 'BIS'),
(13, 2024, 'BITC'),
(14, 2025, 'MATH'),
(15, 2024, 'BCOM'),
(16, 2025, 'CH21');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_full_name` varchar(150) NOT NULL,
  `sender_email` varchar(300) NOT NULL,
  `message` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `sender_full_name`, `sender_email`, `message`, `date_time`) VALUES
(1, 'Lunguli James', 'lungulijames1@gmail.com', 'Hello ', '2023-09-14 14:00:48'),
(2, 'Faida Mikala', 'lungulijames@gmail.com', 'Good evening,\r\nI would like to inquire if i can get some of the staff members to go the ministry of Education to find out about the registration of the students.', '2023-09-14 14:32:01'),
(3, 'Bida Anthoney', 'bida@gmail.com', 'hello,\r\nI would like to know the the procedures of obtaining admission from the school.', '2023-09-14 18:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `registrar_office`
--

CREATE TABLE `registrar_office` (
  `r_user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `employee_number` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_joined` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrar_office`
--

INSERT INTO `registrar_office` (`r_user_id`, `username`, `password`, `fname`, `lname`, `address`, `employee_number`, `date_of_birth`, `phone_number`, `qualification`, `gender`, `email_address`, `date_of_joined`) VALUES
(1, 'James', '$2y$10$nG2o7xcOyx6RTh5rYzNaIuRXBmeNFLR9KkUw/7znNBLkZAzfIJ2jC', 'Chandiga', 'James', 'Kimba', 54635, '2013-09-11', '07847487383', 'Bsc', 'Male', 'james@gmail.com', '2023-09-02 22:32:48'),
(2, 'Mat', '$2y$10$1LuakkpLmTWKHAtF3qczXuOvqZFwMjRW5RpFI2K5rn1wUkwEZ2PY6', 'Patient', 'Mathar', 'kampala, Uganda', 414, '2002-08-28', '+256788469009', 'Diploma', 'Female', 'mat@gmail.com', '2023-09-03 10:50:52'),
(3, 'Mary1', '$2y$10$a8zRieIP55j.3XNnGiUSxu1Rb5Jwvmx15Ff5HHC52lHsjLqyB.Se.', 'Rose', 'Mary', 'Juba, south sudan', 201, '1998-04-28', '0947493733', 'BSc, BA', 'Female', 'maryr@gmail.com', '2023-09-03 14:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `current_year` int(11) NOT NULL,
  `current_semester` varchar(11) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `slogan` varchar(300) NOT NULL,
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `current_year`, `current_semester`, `school_name`, `slogan`, `about`) VALUES
(1, 2024, 'I', 'Alpha Academy School', 'Strive For Qaulity Education', 'Discover Our School: At Alpha Academy , we are dedicated to providing exceptional education and nurturing a passion for learning. With a team of experienced educators and a supportive community, we create a dynamic and inclusive environment where students thrive academically, socially, and emotionally');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `section` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_joined` timestamp NULL DEFAULT current_timestamp(),
  `parent_fname` varchar(120) NOT NULL,
  `parent_lname` varchar(120) NOT NULL,
  `parent_phone_number` varchar(31) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `username`, `password`, `fname`, `lname`, `grade`, `section`, `address`, `gender`, `email_address`, `date_of_birth`, `date_of_joined`, `parent_fname`, `parent_lname`, `parent_phone_number`, `photo`) VALUES
(1, 'amos', '$2y$10$gi/OdMtyNmM8.7CiUuw1iu84w62yYleOQRimdPV4Q9XLHTkj1UJW.', 'Idingi', 'Amos', '1', 1, 'Koboko', 'Male', 'amos@gmail.com', '2010-02-16', '2023-09-16 13:24:28', 'Musa', 'Jim', '0788456736', 'james.jpg'),
(2, 'mikala', '$2y$10$mRf5Y861ZLWRhb8HOCZimewy.33KrpPggtyCDjf5HYPQZQ2w1U3ja', 'Faida', 'Mikala', '1', 1, 'Juba, south sudan', 'Female', 'mikala@gmail.com', '2000-06-08', '2023-09-12 05:35:00', 'Joy', 'Mary', '0987363733736', ''),
(3, 'james', '$2y$10$0x1tbNqB.MwoRQr4JZeDo.0Z72SEhVM39QFQOAiNhtFdG1LX1FyQ6', 'Lunguli', 'James', '1', 1, 'Kimba', 'Male', 'lungulijames@gmail.com', '2013-09-11', '2023-09-12 05:32:52', 'Peter', 'John', '0788459009', ''),
(4, 'joab', '$2y$10$JO.PEJilMVy3rA7GrYf1/O8efate1RSt1FRdAocw9twDo/Mekjscy', 'Chandiga', 'James', '1', 1, 'Kampala', 'Male', 'lasktechnologies@gmail.com', '2003-06-11', '2023-09-12 05:37:15', 'Job', 'Jak', '0783636373', ''),
(5, 'Joy', '$2y$10$vt1nTzsjDTSK5OPJRLq4puzukAT/R3fRH5KWRmq3slcr4ofqe.3me', 'Joy', 'Mary', '2', 1, 'kampala', 'Female', 'joy@gmail', '2005-01-13', '2023-09-12 05:47:59', 'Rose', 'Mary', '078363836336', ''),
(6, 'edwine', '$2y$10$ZrHmEK5M5i8W.PeOrBDf9u6ZByUZ.5FcwQnL5UW7Eb3jrReYxY4VG', 'France', 'Edwine', '2', 1, 'kampala, Uganda', 'Male', 'lungz@gmail.com', '2009-12-17', '2023-09-16 13:30:05', 'Chandiga', 'James', '0987464463', ''),
(7, 'bida', '$2y$10$Z8/4u/ePTlyNYNyWtBpwtuo/LHPV1BRKtoGa9NYE3dapDaKSAhPG6', 'Bida', 'Anthoney', '2', 1, 'Kenya', 'Male', 'bidali@gmail.com', '2005-11-29', '2024-01-29 18:17:51', 'Lunguli', 'James', '+256788459009', ''),
(8, 'lungz', '$2y$10$n9cX8VCgbxEE4C6tj36m.eivJGyyWflBb/UOsNBvPgCtleXE30QVW', 'Lunguli', 'James', '1', 1, 'Kampala', 'Male', 'lungulijames@gmail.com', '1999-12-04', '2024-02-04 12:06:52', 'Bida', 'Anthoney', '+256788459009', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_score`
--

CREATE TABLE `student_score` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `results` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_score`
--

INSERT INTO `student_score` (`id`, `year`, `semester`, `student_id`, `teacher_id`, `subject_id`, `results`) VALUES
(1, 2024, 'I', 1, 1, 2, '56 100'),
(2, 2024, 'I', 2, 3, 2, '63 100'),
(3, 2024, 'I', 1, 3, 5, '78 100'),
(4, 2024, 'II', 1, 3, 3, '63 100');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject`, `subject_code`, `grade`) VALUES
(2, 'Biology', 'BIO', 1),
(3, 'Geography', 'GEO', 1),
(4, 'English', 'ENG', 1),
(5, 'Mathematics', 'MTC', 1),
(6, 'Physics', 'PHY', 1),
(7, 'Chemistry', 'CHEM', 1),
(8, 'History', 'HIS', 1),
(9, 'Agriculture', 'AGRI', 1),
(10, 'Entrepreneurship', 'ENT', 1),
(11, 'Religious Education', 'RE', 1),
(12, 'Computer Studies', 'COM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `class` varchar(40) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `subjects` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `employee_number` int(11) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_joined` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `password`, `class`, `fname`, `lname`, `subjects`, `address`, `employee_number`, `date_of_birth`, `phone_number`, `qualification`, `gender`, `email_address`, `date_of_joined`) VALUES
(1, 'joab', '$2y$10$9JT1zReRwDCG31OW5XJG0eQL3p6hX5QbSwVq76wHSqwyXIxwNwH5y', '1', 'Chandiga', 'James', '27', 'Kampala', 948, '2008-06-20', '+256788469009', 'BSc', 'Male', 'lasktechnologies@gmail.com', '2023-09-12 08:18:42'),
(2, 'james', '$2y$10$5mdDq8JgEPTLiXn3s72tIuhIxNwCHkI5c6frv8EzEBLf4OUNCMmjS', '1', 'Lunguli', 'James', '9', 'Kimba', 54635, '2013-09-11', '07847487383', 'Bachelors', 'Male', 'lungulijames@gmail.com', '2023-09-12 08:12:02'),
(3, 'mikala', '$2y$10$ICCplp0A6gaJOB5C7XyBXOLn8saNWQPte0.jylFn9gzwOLQCLZ4Ye', '1', 'Faida', 'Mikala', '234567891011', 'Juba, south sudan', 342, '1999-06-12', '0947493733', 'BSc', 'Female', 'mikala@gmail.com', '2023-09-12 08:23:42'),
(4, 'mark', '$2y$10$pCRE3.N39R.M7R9a/JsmX.1/GEfWT7mDvuqKXD23wTnSQwVf4Ih8u', '3', 'France', 'Edwine', '101112', 'kampala, Uganda', 100, '2009-06-15', '0947493733', 'BSc, BA', 'Male', 'lungz@gmail.com', '2023-09-15 20:05:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `registrar_office`
--
ALTER TABLE `registrar_office`
  ADD PRIMARY KEY (`r_user_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_score`
--
ALTER TABLE `student_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registrar_office`
--
ALTER TABLE `registrar_office`
  MODIFY `r_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student_score`
--
ALTER TABLE `student_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
