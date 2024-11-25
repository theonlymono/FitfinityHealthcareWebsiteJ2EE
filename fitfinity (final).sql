-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 04:22 AM
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
-- Database: `fitfinity`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(3) NOT NULL,
  `adminName` varchar(40) NOT NULL,
  `adminEmail` varchar(40) NOT NULL,
  `adminPwd` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `adminName`, `adminEmail`, `adminPwd`) VALUES
(1, 'Htet Myet Zaw', 'htetmyetzaw114@gmail.com', 'admin1@2024'),
(2, 'Htet Paing Linn', 'paing2822004@gmail.com', 'admin2@2024'),
(3, 'Aung Kaung Myat', 'akm@gmail.com', 'admin3@2024'),
(4, 'Pyae Linn', 'pyaelinn@gmail.com', 'admin4@2024');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointmentID` int(255) NOT NULL,
  `patientID` int(10) NOT NULL,
  `doctorID` varchar(10) NOT NULL,
  `appointmentToken` int(10) NOT NULL,
  `shift` varchar(50) NOT NULL,
  `day` varchar(20) NOT NULL,
  `appointmentData` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointmentID`, `patientID`, `doctorID`, `appointmentToken`, `shift`, `day`, `appointmentData`) VALUES
(1, 1, 'Dr-002', 1, '2:00PM - 4:00PM', 'Friday', '2024-03-01'),
(2, 1, 'Dr-003', 1, '6:00PM - 8:00PM', 'Friday', '2024-03-01'),
(3, 2, 'Dr-002', 2, '2:00PM - 4:00PM', 'Friday', '2024-03-01'),
(4, 2, 'Dr-003', 2, '6:00PM - 8:00PM', 'Friday', '2024-03-01'),
(5, 3, 'Dr-002', 3, '2:00PM - 4:00PM', 'Friday', '2024-03-01'),
(6, 3, 'Dr-003', 3, '6:00PM - 8:00PM', 'Friday', '2024-03-01'),
(7, 4, 'Dr-002', 4, '2:00PM - 4:00PM', 'Friday', '2024-03-01'),
(8, 4, 'Dr-003', 4, '6:00PM - 8:00PM', 'Friday', '2024-03-01'),
(9, 6, 'Dr-009', 1, '6:00PM - 8:00PM', 'Friday', '2024-03-01'),
(10, 6, 'Dr-007', 1, '2:00PM - 4:00PM', 'Friday', '2024-03-01'),
(11, 5, 'Dr-002', 5, '2:00PM - 4:00PM', 'Friday', '2024-03-01'),
(12, 6, 'Dr-001', 2, '10:00AM - 12:00PM', 'Thursday', '2024-02-15'),
(13, 1, 'Dr-001', 3, '10:00AM - 12:00PM', 'Thursday', '2024-02-15'),
(14, 2, 'Dr-002', 1, '2:00PM - 4:00PM', 'Thursday', '2024-02-15'),
(15, 21, 'Dr-006', 1, '6:00PM - 8:00PM', 'Friday', '2024-03-01'),
(16, 2, 'Dr-003', 1, '6:00PM - 8:00PM', 'Sunday', '2024-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `deptID` varchar(4) NOT NULL,
  `deptName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`deptID`, `deptName`) VALUES
('D-1', 'Cardiology'),
('D-2', 'Dermatology'),
('D-3', 'Otolaryngology'),
('D-4', 'Emergency'),
('D-5', 'Orthopaedic'),
('D-6', 'Neurology'),
('D-7', 'Obstetrics & Gynaecology');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctorID` varchar(10) NOT NULL,
  `doctorName` varchar(50) NOT NULL,
  `doctorEmail` varchar(50) NOT NULL,
  `doctorTel` varchar(13) NOT NULL,
  `doctorPassword` varchar(20) NOT NULL,
  `deptID` varchar(4) NOT NULL,
  `roleID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctorID`, `doctorName`, `doctorEmail`, `doctorTel`, `doctorPassword`, `deptID`, `roleID`) VALUES
('Dr-001', 'U Win Myint', 'winmyint@gmail.com', '09250700588', 'winmyint@2024', 'D-1', 'R-1'),
('Dr-002', 'Daw Hla Tin', 'hlatin@gmail.com', '09450975499', 'hlatin@2024', 'D-1', 'R-2'),
('Dr-003', 'Daw Thidar', 'thidar@gmail.com', '09692898627', 'thidar@2024', 'D-1', 'R-3'),
('Dr-004', 'Daw Sandar', 'sandar@gmail.com', '09253376686', 'dandar@2024', 'D-2', 'R-1'),
('Dr-005', 'Daw Swe Zin Win', 'swezinwin@gmail.com', '09450086544', 'Swezinwin@2024', 'D-2', 'R-2'),
('Dr-006', 'U Than Maung Han', 'thanmaunghan@gmail.com', '09693909738', 'Thanmaunghan@2024', 'D-2', 'R-3'),
('Dr-007', 'U Maung Khaing', 'maungkhaing@gmail.com', '09250899699', 'Mgmgkhaing@2024', 'D-3', 'R-1'),
('Dr-008', 'Daw San May Thein', 'sanmaythein@gmail.com', '09450197611', 'Sanmaythein@2024', 'D-3', 'R-2'),
('Dr-009', 'U Thet Tin', 'thettin@gmail.com', '09694010849', 'Thettin@2024', 'D-3', 'R-3'),
('Dr-010', 'U Kyaw Zaw', 'kyawzaw@gmail.com', '09971100594', 'Kyawzaw@2024', 'D-4', 'R-1'),
('Dr-011', 'U Sein Win', 'seinwin@gmail.com', '0925448779', 'Seinwin@2024', 'D-4', 'R-2'),
('Dr-012', 'U Hla Aung', 'hlaaung@gmail.com', '09985056890', 'Test1234$', 'D-4', 'R-3'),
('Dr-013', 'Daw Mya Thidar', 'myathidar@gmail.com', '09450975499', 'Test1234$', 'D-5', 'R-1'),
('Dr-014', 'Daw Tin Tin', 'tintin@gmail.com', '09692898627', 'Test11234$', 'D-5', 'R-2'),
('Dr-015', 'U Myo Lwin', 'myolwin@gmail.com', '09692898627', 'Test1234$', 'D-5', 'R-3'),
('Dr-016', 'U Aung Linn', 'aunglinn@gmail.com', '09450975499', 'Test1234$', 'D-6', 'R-1'),
('Dr-017', 'U Kyaw San Linn', 'kyawsan@gmail.com', '09692898627', 'Test1234$', 'D-6', 'R-2'),
('Dr-018', 'U Win Naing', 'winnaing@gmail.com', '09985056890', 'Test1234$', 'D-6', 'R-3'),
('Dr-019', 'Daw Nwe Nwe Win', 'nwewin@gmail.com', '09985056890', 'Test1234$', 'D-7', 'R-1'),
('Dr-020', 'Daw Ohmmar', 'ohmma@gmail.com', '09985056890', 'Test1234$', 'D-7', 'R-2'),
('Dr-021', 'U Yan Linn Aung', 'yanlinn@gmail.com', '09985056890', 'Test1234$', 'D-7', 'R-3');

-- --------------------------------------------------------

--
-- Table structure for table `doctorschedules`
--

CREATE TABLE `doctorschedules` (
  `id` int(11) NOT NULL,
  `doctorID` varchar(50) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctorschedules`
--

INSERT INTO `doctorschedules` (`id`, `doctorID`, `day`, `shift`) VALUES
(5, 'Dr-002', 'Thursday', '2:00PM - 4:00PM'),
(6, 'Dr-002', 'Friday', '2:00PM - 4:00PM'),
(7, 'Dr-002', 'Saturday', '2:00PM - 4:00PM'),
(8, 'Dr-002', 'Sunday', '2:00PM - 4:00PM'),
(9, 'Dr-003', 'Monday', '6:00PM - 8:00PM'),
(10, 'Dr-003', 'Tuesday', '6:00PM - 8:00PM'),
(11, 'Dr-003', 'Wednesday', '6:00PM - 8:00PM'),
(12, 'Dr-003', 'Thursday', '6:00PM - 8:00PM'),
(13, 'Dr-003', 'Friday', '6:00PM - 8:00PM'),
(14, 'Dr-003', 'Saturday', '6:00PM - 8:00PM'),
(15, 'Dr-003', 'Sunday', '6:00PM - 8:00PM'),
(19, 'Dr-004', 'Thursday', '10:00AM - 12:00PM'),
(20, 'Dr-004', 'Friday', '10:00AM - 12:00PM'),
(21, 'Dr-004', 'Saturday', '10:00AM - 12:00PM'),
(22, 'Dr-004', 'Sunday', '10:00AM - 12:00PM'),
(23, 'Dr-005', 'Tuesday', '2:00PM - 4:00PM'),
(24, 'Dr-005', 'Wednesday', '2:00PM - 4:00PM'),
(25, 'Dr-005', 'Thursday', '2:00PM - 4:00PM'),
(26, 'Dr-005', 'Friday', '2:00PM - 4:00PM'),
(27, 'Dr-006', 'Tuesday', '6:00PM - 8:00PM'),
(28, 'Dr-006', 'Wednesday', '6:00PM - 8:00PM'),
(29, 'Dr-006', 'Thursday', '6:00PM - 8:00PM'),
(30, 'Dr-006', 'Friday', '6:00PM - 8:00PM'),
(31, 'Dr-006', 'Saturday', '6:00PM - 8:00PM'),
(32, 'Dr-006', 'Sunday', '6:00PM - 8:00PM'),
(33, 'Dr-007', 'Wednesday', '2:00PM - 4:00PM'),
(34, 'Dr-007', 'Thursday', '2:00PM - 4:00PM'),
(35, 'Dr-007', 'Friday', '2:00PM - 4:00PM'),
(36, 'Dr-007', 'Saturday', '2:00PM - 4:00PM'),
(37, 'Dr-008', 'Monday', '10:00AM - 12:00PM'),
(38, 'Dr-008', 'Tuesday', '10:00AM - 12:00PM'),
(39, 'Dr-008', 'Saturday', '10:00AM - 12:00PM'),
(40, 'Dr-008', 'Sunday', '10:00AM - 12:00PM'),
(41, 'Dr-009', 'Monday', '6:00PM - 8:00PM'),
(42, 'Dr-009', 'Wednesday', '6:00PM - 8:00PM'),
(43, 'Dr-009', 'Friday', '6:00PM - 8:00PM'),
(44, 'Dr-009', 'Sunday', '6:00PM - 8:00PM'),
(45, 'Dr-010', 'Monday', '6:00PM - 8:00PM'),
(46, 'Dr-010', 'Tuesday', '2:00PM - 4:00PM'),
(47, 'Dr-010', 'Wednesday', '10:00AM - 12:00PM'),
(48, 'Dr-010', 'Thursday', '2:00PM - 4:00PM'),
(49, 'Dr-010', 'Friday', '6:00PM - 8:00PM'),
(50, 'Dr-010', 'Saturday', '2:00PM - 4:00PM'),
(51, 'Dr-010', 'Sunday', '10:00AM - 12:00PM'),
(52, 'Dr-011', 'Tuesday', '2:00PM - 4:00PM'),
(53, 'Dr-011', 'Wednesday', '6:00PM - 8:00PM'),
(54, 'Dr-011', 'Thursday', '2:00PM - 4:00PM'),
(55, 'Dr-011', 'Friday', '10:00AM - 12:00PM'),
(56, 'Dr-011', 'Saturday', '2:00PM - 4:00PM'),
(57, 'Dr-012', 'Monday', '6:00PM - 8:00PM'),
(58, 'Dr-012', 'Tuesday', '10:00AM - 12:00PM'),
(59, 'Dr-012', 'Wednesday', '6:00PM - 8:00PM'),
(60, 'Dr-012', 'Thursday', '2:00PM - 4:00PM'),
(61, 'Dr-012', 'Friday', '6:00PM - 8:00PM'),
(62, 'Dr-012', 'Saturday', '10:00AM - 12:00PM'),
(63, 'Dr-012', 'Sunday', '6:00PM - 8:00PM'),
(64, 'Dr-013', 'Wednesday', '6:00PM - 8:00PM'),
(65, 'Dr-013', 'Thursday', '6:00PM - 8:00PM'),
(66, 'Dr-013', 'Friday', '6:00PM - 8:00PM'),
(67, 'Dr-013', 'Saturday', '6:00PM - 8:00PM'),
(68, 'Dr-013', 'Sunday', '6:00PM - 8:00PM'),
(69, 'Dr-014', 'Thursday', '10:00AM - 12:00PM'),
(70, 'Dr-014', 'Friday', '10:00AM - 12:00PM'),
(71, 'Dr-014', 'Saturday', '10:00AM - 12:00PM'),
(72, 'Dr-014', 'Sunday', '10:00AM - 12:00PM'),
(73, 'Dr-015', 'Thursday', '10:00AM - 12:00PM'),
(74, 'Dr-015', 'Friday', '2:00PM - 4:00PM'),
(75, 'Dr-015', 'Saturday', '6:00PM - 8:00PM'),
(76, 'Dr-016', 'Thursday', '2:00PM - 4:00PM'),
(77, 'Dr-016', 'Friday', '2:00PM - 4:00PM'),
(78, 'Dr-016', 'Saturday', '2:00PM - 4:00PM'),
(79, 'Dr-016', 'Sunday', '6:00PM - 8:00PM'),
(80, 'Dr-017', 'Wednesday', '10:00AM - 12:00PM'),
(81, 'Dr-017', 'Thursday', '10:00AM - 12:00PM'),
(82, 'Dr-017', 'Friday', '10:00AM - 12:00PM'),
(83, 'Dr-017', 'Saturday', '10:00AM - 12:00PM'),
(84, 'Dr-018', 'Wednesday', '10:00AM - 12:00PM'),
(85, 'Dr-018', 'Thursday', '6:00PM - 8:00PM'),
(86, 'Dr-018', 'Friday', '2:00PM - 4:00PM'),
(87, 'Dr-018', 'Saturday', '6:00PM - 8:00PM'),
(88, 'Dr-018', 'Sunday', '2:00PM - 4:00PM'),
(89, 'Dr-019', 'Monday', '2:00PM - 4:00PM'),
(90, 'Dr-019', 'Tuesday', '10:00AM - 12:00PM'),
(91, 'Dr-019', 'Wednesday', '2:00PM - 4:00PM'),
(92, 'Dr-019', 'Thursday', '6:00PM - 8:00PM'),
(93, 'Dr-020', 'Monday', '6:00PM - 8:00PM'),
(94, 'Dr-020', 'Tuesday', '6:00PM - 8:00PM'),
(95, 'Dr-020', 'Wednesday', '6:00PM - 8:00PM'),
(96, 'Dr-020', 'Thursday', '6:00PM - 8:00PM'),
(97, 'Dr-020', 'Friday', '6:00PM - 8:00PM'),
(98, 'Dr-021', 'Monday', '2:00PM - 4:00PM'),
(99, 'Dr-021', 'Tuesday', '10:00AM - 12:00PM'),
(100, 'Dr-021', 'Thursday', '6:00PM - 8:00PM'),
(101, 'Dr-021', 'Friday', '2:00PM - 4:00PM'),
(102, 'Dr-021', 'Saturday', '10:00AM - 12:00PM');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackID` int(10) NOT NULL,
  `patientEmail` varchar(40) NOT NULL,
  `feedbackDate` date NOT NULL,
  `feedbackText` varchar(200) NOT NULL,
  `rating` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackID`, `patientEmail`, `feedbackDate`, `feedbackText`, `rating`) VALUES
(1, 'htetmyetzaw114@gmail.com', '2024-02-17', 'Satisfied', 4),
(2, 'htetmyetzaw114@gmail.com', '2024-02-17', 'Wow', 5),
(3, 'htetmyetzaw114@gmail.com', '2024-02-17', 'I like it!', 5),
(4, 'htetpainglinn2822004@gmail.com', '2024-02-27', 'Just Average!!!', 2),
(5, 'htetpainglinn2822004@gmail.com', '2024-02-27', 'Normal', 4),
(6, 'htet@gmail.com', '2024-02-29', 'Good service', 4);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `historyID` int(10) NOT NULL,
  `patientID` int(10) NOT NULL,
  `doctorID` varchar(10) NOT NULL,
  `dateOfVisit` date NOT NULL,
  `allergies` varchar(100) NOT NULL,
  `surgicalProcedures` varchar(100) NOT NULL,
  `pastMedHistory` varchar(200) NOT NULL,
  `currentMedHistory` varchar(300) NOT NULL,
  `familyHistory` varchar(300) NOT NULL,
  `medication` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`historyID`, `patientID`, `doctorID`, `dateOfVisit`, `allergies`, `surgicalProcedures`, `pastMedHistory`, `currentMedHistory`, `familyHistory`, `medication`) VALUES
(1, 2, 'Dr-004', '2024-03-01', 'No', 'No', 'No', 'Healthy', 'Healthy', 'Becozinc zinc sulphate monohydrate 54.93 mg'),
(2, 1, 'Dr-001', '2024-02-15', 'Aspirin', 'None', 'Fever', 'N/A', 'No known allergies', 'Ibuprofen 400mg'),
(3, 2, 'Dr-002', '2024-02-15', 'Amoxicillin', 'None', 'Cough', 'Sore throat', 'No known allergies', 'Cough syrup, Throat lozenges'),
(12, 21, 'Dr-006', '2024-03-01', 'No', 'No', 'No', 'Headache', 'Mother has diabetes', 'Becozinc 100mg, Paracetamol 500mg'),
(13, 2, 'Dr-003', '2024-03-03', 'a', 'a', 'a', 'a', 'a', 'a a');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patientID` int(10) NOT NULL,
  `patientName` varchar(30) NOT NULL,
  `patientEmail` varchar(30) NOT NULL,
  `patientNRC` varchar(23) NOT NULL,
  `patientDOB` varchar(10) NOT NULL,
  `patientPhone` varchar(11) NOT NULL,
  `patientPassword` varchar(30) NOT NULL,
  `bloodType` varchar(3) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientID`, `patientName`, `patientEmail`, `patientNRC`, `patientDOB`, `patientPhone`, `patientPassword`, `bloodType`, `gender`) VALUES
(1, 'Htet Myet Zaw', 'htetmyetzaw114@gmail.com', '12/OuKaTa(C)201941', '18/12/2004', '09975396594', 'Hmz114@@@', 'AB', 'Male'),
(2, 'Htet Paing Linn', 'htetpainglinn@gmail.com', '12/OuKaMa(C)312053', '2004-02-28', '09985056891', 'Test1234$', 'B', 'Male'),
(3, 'Aung Kaung Myat', 'aungkaungmyat@gmail.com', '12/KaTaTa(C)423163', '2004-04-07', '09795836507', 'Akm07@@@', 'O', 'Male'),
(4, 'May Pearl Khin', 'maypearlkhin@gmail.com', '12/DaGaNa(C)534274', '2003-11-11', '0942105724', 'Mpk03@@@', 'A', 'Female'),
(5, 'Chu Khin Khin', 'chukhinkhin@gmail.com', '12/ThaGaKa(C)645385', '2004-01-05', '09785144640', 'Ckk05@@@', 'A', 'Female'),
(6, 'Shun Lae Thu', 'shunlaethu@gmail.com', '12/LaMaTa(C)756496', '2003-10-29', '09972711322', 'Slt29@@@', 'A', 'Female'),
(21, 'Htet Myet', 'htetmyet@gmail.com', '1/AhGaYa(C)123456', '2008-12-17', '09985056890', 'Test123@@@', 'B', 'Male');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient view`
-- (See below for the actual view)
--
CREATE TABLE `patient view` (
`patientID` int(10)
,`patientName` varchar(30)
,`patientEmail` varchar(30)
,`patientNRC` varchar(23)
,`patientDOB` varchar(10)
,`patientPhone` varchar(11)
,`patientPassword` varchar(30)
,`bloodType` varchar(3)
,`gender` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` varchar(4) NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `fixedsalary` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `roleName`, `fixedsalary`) VALUES
('R-1', 'Professor', '35000'),
('R-2', 'Assistant Professor', '25000'),
('R-3', 'Fellow', '15000');

-- --------------------------------------------------------

--
-- Structure for view `patient view`
--
DROP TABLE IF EXISTS `patient view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient view`  AS SELECT `patients`.`patientID` AS `patientID`, `patients`.`patientName` AS `patientName`, `patients`.`patientEmail` AS `patientEmail`, `patients`.`patientNRC` AS `patientNRC`, `patients`.`patientDOB` AS `patientDOB`, `patients`.`patientPhone` AS `patientPhone`, `patients`.`patientPassword` AS `patientPassword`, `patients`.`bloodType` AS `bloodType`, `patients`.`gender` AS `gender` FROM `patients` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointmentID`),
  ADD KEY `appointmentPatient` (`patientID`),
  ADD KEY `appointmentDoctor` (`doctorID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`deptID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctorID`),
  ADD KEY `doctorDept` (`deptID`),
  ADD KEY `doctorRole` (`roleID`);

--
-- Indexes for table `doctorschedules`
--
ALTER TABLE `doctorschedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ScheduleDoctor` (`doctorID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackID`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`historyID`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `doctorID` (`doctorID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctorschedules`
--
ALTER TABLE `doctorschedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `historyID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patientID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointmentDoctor` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`doctorID`),
  ADD CONSTRAINT `appointmentPatient` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctorDept` FOREIGN KEY (`deptID`) REFERENCES `departments` (`deptID`),
  ADD CONSTRAINT `doctorRole` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);

--
-- Constraints for table `doctorschedules`
--
ALTER TABLE `doctorschedules`
  ADD CONSTRAINT `ScheduleDoctor` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`doctorID`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`doctorID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
