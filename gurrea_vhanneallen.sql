-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2026 at 04:05 PM
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
-- Database: `gurrea_vhanneallen`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_name`, `appointment_date`, `status`) VALUES
(201, 101, 'Dr. Garcia', '2025-03-10', 'Completed'),
(202, 102, 'Dr. Ramos', '2025-03-11', 'Scheduled'),
(203, 101, 'Dr. Cruz', '2025-03-15', 'Scheduled'),
(204, 103, 'Dr. Garcia', '2025-03-18', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_name`, `city`, `contact_number`) VALUES
(101, 'Maria Santos', 'Cebu', '09123456781'),
(102, 'Juan Dela Cruz', 'Bohol', '09123456782'),
(103, 'Ana Reyes', 'Cebu', '09123456783'),
(104, 'Mark Lopez', 'Dumaguete', '09123456784'),
(105, 'Carla Gomez', 'Bohol', '09123456785');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



--Part A – Basic Join
--1.Display the patient name and doctor name for all appointments.
SELECT p.patient_name, a.doctor_name
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;

--Part B – Filtering with Join
--2..Display all patients from Cebu and their appointments.
SELECT p.patient_name, p.city, a.doctor_name, a.appointment_date
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
WHERE p.city = 'Cebu';

--3.Display appointments handled by Dr. Garcia with the patient names.

SELECT p.patient_name, a.doctor_name, a.appointment_date, a.status
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
WHERE a.doctor_name = 'Dr. Garcia';

--Part C – Analytical Queries
--4.Show all patients and their appointments, including patients who do not have appointments.

SELECT p.patient_name, a.doctor_name, a.appointment_date, a.status
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id;

--5.Show all appointments even if the patient information does not exist in the Patients table.

SELECT p.patient_name, a.doctor_name, a.appointment_date, a.status
FROM Patients p
RIGHT JOIN Appointments a
ON p.patient_id = a.patient_id;
