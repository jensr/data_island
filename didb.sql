-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 06:10 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `didb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblfieldlibrary`
--

CREATE TABLE `tblfieldlibrary` (
  `fldFLFieldID` int(11) NOT NULL COMMENT 'GLobally uniqie library field identity',
  `fldFLFieldName` char(16) NOT NULL COMMENT 'Short Field Name',
  `fldFLFieldDescription` text NOT NULL COMMENT 'Longer description of intended use of field',
  `fldFLFieldCreationFormat` tinytext NOT NULL COMMENT 'the SQL format of the field format',
  `fldFLFieldCat` int(11) NOT NULL COMMENT 'The Category to which the field belongs',
  `fldFLFieldLock` bit(1) NOT NULL COMMENT 'Lock if the field is beign used in any template',
  `fldFieldMin` tinytext COMMENT 'A possible minimum value of the field',
  `fldFieldMax` tinytext COMMENT 'A possible maximum allowable value',
  `fldFieldLookupID` int(1) NOT NULL COMMENT 'Link to a lookup template if this field is used as a lookup list/vocabulary instead'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblfieldlibrary`
--

INSERT INTO `tblfieldlibrary` (`fldFLFieldID`, `fldFLFieldName`, `fldFLFieldDescription`, `fldFLFieldCreationFormat`, `fldFLFieldCat`, `fldFLFieldLock`, `fldFieldMin`, `fldFieldMax`, `fldFieldLookupID`) VALUES
(1, 'DecimalLatitiude', 'A latitude field used for general GPS position information. \r\nThe field is used to express decimal degrees.\r\nAccuracy to 3 decimal places, and positive values for northern latitude, negative values for southern longitudes', 'DECIMAL(5,3)', 1, b'0', '-90.000', '90.000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblfieldlibrarycategories`
--

CREATE TABLE `tblfieldlibrarycategories` (
  `fldFLCatID` int(11) NOT NULL COMMENT 'internal Field Library Category Identifier',
  `fldFLCatName` tinytext NOT NULL COMMENT 'Short Name of field category',
  `fldFLCatDescription` text NOT NULL COMMENT 'Description for field category',
  `fldFLCatLock` bit(1) NOT NULL COMMENT 'Lock indicator. If there is content stored inside a field category then it should lcok from deletion',
  `fldFLCatParent` int(11) DEFAULT NULL COMMENT 'Parent Field categroy if this is a subcategory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblfieldlibrarycategories`
--

INSERT INTO `tblfieldlibrarycategories` (`fldFLCatID`, `fldFLCatName`, `fldFLCatDescription`, `fldFLCatLock`, `fldFLCatParent`) VALUES
(1, 'Positions', 'Positional data fields for storing latitude longitude, or other spatial references. ', b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblislanddeployments`
--

CREATE TABLE `tblislanddeployments` (
  `fldDeploymentID` int(11) NOT NULL COMMENT 'Unique internal ID',
  `fldDeploymentName` tinytext NOT NULL COMMENT 'The short use name for the database',
  `fldDeploymentDescription` text NOT NULL COMMENT 'Textual description of scope/work area using this db',
  `fldDeploymentDB` text NOT NULL COMMENT 'database name + server lcoation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltemplatedeployment`
--

CREATE TABLE `tbltemplatedeployment` (
  `fldTempalteDeplymentID` int(11) NOT NULL,
  `fldDBDeplyment` int(11) NOT NULL,
  `fldTemplateDeployed` int(11) NOT NULL,
  `fldTemaplteDeploymentName` char(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltemplatefields`
--

CREATE TABLE `tbltemplatefields` (
  `fldTFID` int(11) NOT NULL,
  `fldTFTemplate` int(11) NOT NULL,
  `fldTFField` int(11) NOT NULL,
  `fldTFUseNmae` char(24) NOT NULL COMMENT 'Usage name, since the same field could be deployed multiple times',
  `fldTFFieldOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltemplates`
--

CREATE TABLE `tbltemplates` (
  `fldTemplateID` int(11) NOT NULL,
  `fldTemplateName` char(24) NOT NULL COMMENT 'Central name for table template',
  `fldTemplateDescription` text NOT NULL COMMENT 'Longer description of template structure and use',
  `fldTemplateLock` bit(1) NOT NULL COMMENT 'Lock for template is it has been deployed '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblfieldlibrary`
--
ALTER TABLE `tblfieldlibrary`
  ADD PRIMARY KEY (`fldFLFieldID`),
  ADD KEY `fldFLFieldCat` (`fldFLFieldCat`);

--
-- Indexes for table `tblfieldlibrarycategories`
--
ALTER TABLE `tblfieldlibrarycategories`
  ADD PRIMARY KEY (`fldFLCatID`);

--
-- Indexes for table `tblislanddeployments`
--
ALTER TABLE `tblislanddeployments`
  ADD PRIMARY KEY (`fldDeploymentID`);

--
-- Indexes for table `tbltemplatedeployment`
--
ALTER TABLE `tbltemplatedeployment`
  ADD PRIMARY KEY (`fldTempalteDeplymentID`);

--
-- Indexes for table `tbltemplatefields`
--
ALTER TABLE `tbltemplatefields`
  ADD PRIMARY KEY (`fldTFID`);

--
-- Indexes for table `tbltemplates`
--
ALTER TABLE `tbltemplates`
  ADD PRIMARY KEY (`fldTemplateID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblfieldlibrary`
--
ALTER TABLE `tblfieldlibrary`
  MODIFY `fldFLFieldID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'GLobally uniqie library field identity', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tblfieldlibrarycategories`
--
ALTER TABLE `tblfieldlibrarycategories`
  MODIFY `fldFLCatID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'internal Field Library Category Identifier', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tblislanddeployments`
--
ALTER TABLE `tblislanddeployments`
  MODIFY `fldDeploymentID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique internal ID';
--
-- AUTO_INCREMENT for table `tbltemplatedeployment`
--
ALTER TABLE `tbltemplatedeployment`
  MODIFY `fldTempalteDeplymentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltemplatefields`
--
ALTER TABLE `tbltemplatefields`
  MODIFY `fldTFID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltemplates`
--
ALTER TABLE `tbltemplates`
  MODIFY `fldTemplateID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblfieldlibrary`
--
ALTER TABLE `tblfieldlibrary`
  ADD CONSTRAINT `tblfieldlibrary_ibfk_1` FOREIGN KEY (`fldFLFieldCat`) REFERENCES `tblfieldlibrarycategories` (`fldFLCatID`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
