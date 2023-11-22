-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Nov 22, 2023 at 12:59 AM
-- Server version: 10.7.8-MariaDB-1:10.7.8+maria~ubu2004
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glpidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `glpi_agents`
--

CREATE TABLE `glpi_agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `deviceid` varchar(255) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `agenttypes_id` int(10) UNSIGNED NOT NULL,
  `last_contact` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `port` varchar(6) DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `threads_networkdiscovery` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of threads for Network discovery',
  `threads_networkinventory` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of threads for Network inventory',
  `timeout_networkdiscovery` int(11) NOT NULL DEFAULT 0 COMMENT 'Network Discovery task timeout (disabled by default)',
  `timeout_networkinventory` int(11) NOT NULL DEFAULT 0 COMMENT 'Network Inventory task timeout (disabled by default)',
  `use_module_wake_on_lan` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_computer_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_esx_remote_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_remote_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_network_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_network_discovery` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_package_deployment` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_collect_data` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_agenttypes`
--

CREATE TABLE `glpi_agenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_agenttypes`
--

INSERT INTO `glpi_agenttypes` (`id`, `name`) VALUES
(1, 'Core');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_alerts`
--

CREATE TABLE `glpi_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php ALERT_* constant',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_apiclients`
--

CREATE TABLE `glpi_apiclients` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `ipv4_range_start` bigint(20) DEFAULT NULL,
  `ipv4_range_end` bigint(20) DEFAULT NULL,
  `ipv6` varchar(255) DEFAULT NULL,
  `app_token` varchar(255) DEFAULT NULL,
  `app_token_date` timestamp NULL DEFAULT NULL,
  `dolog_method` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_apiclients`
--

INSERT INTO `glpi_apiclients` (`id`, `entities_id`, `is_recursive`, `name`, `date_mod`, `date_creation`, `is_active`, `ipv4_range_start`, `ipv4_range_end`, `ipv6`, `app_token`, `app_token_date`, `dolog_method`, `comment`) VALUES
(1, 0, 1, 'full access from localhost', NULL, NULL, 1, 2130706433, 2130706433, '::1', NULL, NULL, 0, NULL),
(2, 0, 0, 'SIEM', '2023-11-18 08:22:05', '2023-11-18 08:22:05', 1, NULL, NULL, NULL, 'gymXH2Ha4yFqx4lUG86776u1Ex65TnQvAcijbIu3', '2023-11-18 08:22:05', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_applianceenvironments`
--

CREATE TABLE `glpi_applianceenvironments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_appliances`
--

CREATE TABLE `glpi_appliances` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `appliancetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `applianceenvironments_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `externalidentifier` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_appliances_items`
--

CREATE TABLE `glpi_appliances_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `appliances_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_appliances_items_relations`
--

CREATE TABLE `glpi_appliances_items_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `appliances_items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_appliancetypes`
--

CREATE TABLE `glpi_appliancetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `externalidentifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_authldapreplicates`
--

CREATE TABLE `glpi_authldapreplicates` (
  `id` int(10) UNSIGNED NOT NULL,
  `authldaps_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT 389,
  `name` varchar(255) DEFAULT NULL,
  `timeout` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_authldaps`
--

CREATE TABLE `glpi_authldaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `basedn` varchar(255) DEFAULT NULL,
  `rootdn` varchar(255) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT 389,
  `condition` text DEFAULT NULL,
  `login_field` varchar(255) DEFAULT 'uid',
  `sync_field` varchar(255) DEFAULT NULL,
  `use_tls` tinyint(4) NOT NULL DEFAULT 0,
  `group_field` varchar(255) DEFAULT NULL,
  `group_condition` text DEFAULT NULL,
  `group_search_type` int(11) NOT NULL DEFAULT 0,
  `group_member_field` varchar(255) DEFAULT NULL,
  `email1_field` varchar(255) DEFAULT NULL,
  `realname_field` varchar(255) DEFAULT NULL,
  `firstname_field` varchar(255) DEFAULT NULL,
  `phone_field` varchar(255) DEFAULT NULL,
  `phone2_field` varchar(255) DEFAULT NULL,
  `mobile_field` varchar(255) DEFAULT NULL,
  `comment_field` varchar(255) DEFAULT NULL,
  `use_dn` tinyint(4) NOT NULL DEFAULT 1,
  `time_offset` int(11) NOT NULL DEFAULT 0 COMMENT 'in seconds',
  `deref_option` int(11) NOT NULL DEFAULT 0,
  `title_field` varchar(255) DEFAULT NULL,
  `category_field` varchar(255) DEFAULT NULL,
  `language_field` varchar(255) DEFAULT NULL,
  `entity_field` varchar(255) DEFAULT NULL,
  `entity_condition` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `rootdn_passwd` varchar(255) DEFAULT NULL,
  `registration_number_field` varchar(255) DEFAULT NULL,
  `email2_field` varchar(255) DEFAULT NULL,
  `email3_field` varchar(255) DEFAULT NULL,
  `email4_field` varchar(255) DEFAULT NULL,
  `location_field` varchar(255) DEFAULT NULL,
  `responsible_field` varchar(255) DEFAULT NULL,
  `pagesize` int(11) NOT NULL DEFAULT 0,
  `ldap_maxlimit` int(11) NOT NULL DEFAULT 0,
  `can_support_pagesize` tinyint(4) NOT NULL DEFAULT 0,
  `picture_field` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `inventory_domain` varchar(255) DEFAULT NULL,
  `tls_certfile` text DEFAULT NULL,
  `tls_keyfile` text DEFAULT NULL,
  `use_bind` tinyint(4) NOT NULL DEFAULT 1,
  `timeout` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_authmails`
--

CREATE TABLE `glpi_authmails` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `connect_string` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_autoupdatesystems`
--

CREATE TABLE `glpi_autoupdatesystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_blacklistedmailcontents`
--

CREATE TABLE `glpi_blacklistedmailcontents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_blacklists`
--

CREATE TABLE `glpi_blacklists` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_blacklists`
--

INSERT INTO `glpi_blacklists` (`id`, `type`, `name`, `value`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 3, 'invalid serial', 'N/A', NULL, NULL, NULL),
(2, 3, 'invalid serial', '(null string)', NULL, NULL, NULL),
(3, 3, 'invalid serial', 'INVALID', NULL, NULL, NULL),
(4, 3, 'invalid serial', 'SYS-1234567890', NULL, NULL, NULL),
(5, 3, 'invalid serial', 'SYS-9876543210', NULL, NULL, NULL),
(6, 3, 'invalid serial', 'SN-12345', NULL, NULL, NULL),
(7, 3, 'invalid serial', 'SN-1234567890', NULL, NULL, NULL),
(8, 3, 'invalid serial', '/^0+$/', NULL, NULL, NULL),
(9, 3, 'invalid serial', '/^1+$/', NULL, NULL, NULL),
(10, 3, 'invalid serial', '/\\d\\.\\d(\\.\\d)?/', NULL, NULL, NULL),
(11, 3, 'invalid serial', '/^(0|1)+$/', NULL, NULL, NULL),
(12, 3, 'invalid serial', '0123456789', NULL, NULL, NULL),
(13, 3, 'invalid serial', '12345', NULL, NULL, NULL),
(14, 3, 'invalid serial', '123456', NULL, NULL, NULL),
(15, 3, 'invalid serial', '1234567', NULL, NULL, NULL),
(16, 3, 'invalid serial', '12345678', NULL, NULL, NULL),
(17, 3, 'invalid serial', '123456789', NULL, NULL, NULL),
(18, 3, 'invalid serial', '1234567890', NULL, NULL, NULL),
(19, 3, 'invalid serial', '123456789000', NULL, NULL, NULL),
(20, 3, 'invalid serial', '12345678901234567', NULL, NULL, NULL),
(21, 3, 'invalid serial', 'NNNNNNN', NULL, NULL, NULL),
(22, 3, 'invalid serial', 'xxxxxxxxxxx', NULL, NULL, NULL),
(23, 3, 'invalid serial', 'EVAL', NULL, NULL, NULL),
(24, 3, 'invalid serial', 'IATPASS', NULL, NULL, NULL),
(25, 3, 'invalid serial', 'none', NULL, NULL, NULL),
(26, 3, 'invalid serial', 'To Be Filled By O.E.M.', NULL, NULL, NULL),
(27, 3, 'invalid serial', 'Tulip Computers', NULL, NULL, NULL),
(28, 3, 'invalid serial', 'Serial Number xxxxxx', NULL, NULL, NULL),
(29, 3, 'invalid serial', 'SN-123456fvgv3i0b8o5n6n7k', NULL, NULL, NULL),
(30, 3, 'invalid serial', 'Unknow', NULL, NULL, NULL),
(31, 3, 'invalid serial', 'System Serial Number', NULL, NULL, NULL),
(32, 3, 'invalid serial', 'MB-1234567890', NULL, NULL, NULL),
(33, 3, 'invalid serial', 'empty', NULL, NULL, NULL),
(34, 3, 'invalid serial', 'Not Specified', NULL, NULL, NULL),
(35, 3, 'invalid serial', 'OEM_Serial', NULL, NULL, NULL),
(36, 3, 'invalid serial', 'SystemSerialNumb', NULL, NULL, NULL),
(37, 4, 'invalid UUID', 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF', NULL, NULL, NULL),
(38, 4, 'invalid UUID', '03000200-0400-0500-0006-000700080009', NULL, NULL, NULL),
(39, 4, 'invalid UUID', '6AB5B300-538D-1014-9FB5-B0684D007B53', NULL, NULL, NULL),
(40, 4, 'invalid UUID', '01010101-0101-0101-0101-010101010101', NULL, NULL, NULL),
(41, 4, 'invalid UUID', '2', NULL, NULL, NULL),
(42, 2, 'empty MAC', '', NULL, NULL, NULL),
(43, 2, 'invalid MAC', '20:41:53:59:4e:ff', NULL, NULL, NULL),
(44, 2, 'invalid MAC', '02:00:4e:43:50:49', NULL, NULL, NULL),
(45, 2, 'invalid MAC', 'e2:e6:16:20:0a:35', NULL, NULL, NULL),
(46, 2, 'invalid MAC', 'd2:0a:2d:a0:04:be', NULL, NULL, NULL),
(47, 2, 'invalid MAC', '00:a0:c6:00:00:00', NULL, NULL, NULL),
(48, 2, 'invalid MAC', 'd2:6b:25:2f:2c:e7', NULL, NULL, NULL),
(49, 2, 'invalid MAC', '33:50:6f:45:30:30', NULL, NULL, NULL),
(50, 2, 'invalid MAC', '0a:00:27:00:00:00', NULL, NULL, NULL),
(51, 2, 'invalid MAC', '00:50:56:C0:00:01', NULL, NULL, NULL),
(52, 2, 'invalid MAC', '00:50:56:C0:00:08', NULL, NULL, NULL),
(53, 2, 'invalid MAC', '02:80:37:EC:02:00', NULL, NULL, NULL),
(54, 2, 'invalid MAC', '50:50:54:50:30:30', NULL, NULL, NULL),
(55, 2, 'invalid MAC', '24:b6:20:52:41:53', NULL, NULL, NULL),
(56, 2, 'invalid MAC', '00:50:56:C0:00:02', NULL, NULL, NULL),
(57, 2, 'invalid MAC', '/00:50:56:C0:[0-9a-f]+:[0-9a-f]+/i', NULL, NULL, NULL),
(58, 2, 'invalid MAC', 'FE:FF:FF:FF:FF:FF', NULL, NULL, NULL),
(59, 2, 'invalid MAC', '00:00:00:00:00:00', NULL, NULL, NULL),
(60, 2, 'invalid MAC', '00:0b:ca:fe:00:00', NULL, NULL, NULL),
(61, 6, 'Unknow', 'Unknow', NULL, NULL, NULL),
(62, 6, 'To Be Filled By O.E.M.', 'To Be Filled By O.E.M.', NULL, NULL, NULL),
(63, 6, '*', '*', NULL, NULL, NULL),
(64, 6, 'System Product Name', 'System Product Name', NULL, NULL, NULL),
(65, 6, 'Product Name', 'Product Name', NULL, NULL, NULL),
(66, 6, 'System Name', 'System Name', NULL, NULL, NULL),
(67, 6, 'All Series', 'All Series', NULL, NULL, NULL),
(68, 8, 'System manufacturer', 'System manufacturer', NULL, NULL, NULL),
(69, 1, 'empty IP', '', NULL, NULL, NULL),
(70, 1, 'zero IP', '0.0.0.0', NULL, NULL, NULL),
(71, 1, 'localhost', '127.0.0.1', NULL, NULL, NULL),
(72, 1, 'IPV6 localhost', '::1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_budgets`
--

CREATE TABLE `glpi_budgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `budgettypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_budgettypes`
--

CREATE TABLE `glpi_budgettypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_businesscriticities`
--

CREATE TABLE `glpi_businesscriticities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cables`
--

CREATE TABLE `glpi_cables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype_endpoint_a` varchar(255) DEFAULT NULL,
  `itemtype_endpoint_b` varchar(255) DEFAULT NULL,
  `items_id_endpoint_a` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id_endpoint_b` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `socketmodels_id_endpoint_a` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `socketmodels_id_endpoint_b` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sockets_id_endpoint_a` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sockets_id_endpoint_b` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cablestrands_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cabletypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cablestrands`
--

CREATE TABLE `glpi_cablestrands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cabletypes`
--

CREATE TABLE `glpi_cabletypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_calendars`
--

CREATE TABLE `glpi_calendars` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `cache_duration` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_calendars`
--

INSERT INTO `glpi_calendars` (`id`, `name`, `entities_id`, `is_recursive`, `comment`, `date_mod`, `cache_duration`, `date_creation`) VALUES
(3, '24/7', 0, 0, '', '2023-11-21 10:05:00', '[0,0,0,0,0,0,0]', '2023-11-21 09:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_calendarsegments`
--

CREATE TABLE `glpi_calendarsegments` (
  `id` int(10) UNSIGNED NOT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `day` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_calendars_holidays`
--

CREATE TABLE `glpi_calendars_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `holidays_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cartridgeitems`
--

CREATE TABLE `glpi_cartridgeitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cartridgeitemtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `alarm_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_target` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cartridgeitems_printermodels`
--

CREATE TABLE `glpi_cartridgeitems_printermodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `cartridgeitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printermodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cartridgeitemtypes`
--

CREATE TABLE `glpi_cartridgeitemtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_cartridges`
--

CREATE TABLE `glpi_cartridges` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cartridgeitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_certificates`
--

CREATE TABLE `glpi_certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `certificatetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_certificatetypes (id)',
  `dns_name` varchar(255) DEFAULT NULL,
  `dns_suffix` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_users (id)',
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_groups (id)',
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_locations (id)',
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_manufacturers (id)',
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_autosign` tinyint(4) NOT NULL DEFAULT 0,
  `date_expiration` date DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `command` text DEFAULT NULL,
  `certificate_request` text DEFAULT NULL,
  `certificate_item` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_certificates_items`
--

CREATE TABLE `glpi_certificates_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `certificates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to various tables, according to itemtype (id)',
  `itemtype` varchar(100) NOT NULL COMMENT 'see .class.php file',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_certificatetypes`
--

CREATE TABLE `glpi_certificatetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changecosts`
--

CREATE TABLE `glpi_changecosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes`
--

CREATE TABLE `glpi_changes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impactcontent` longtext DEFAULT NULL,
  `controlistcontent` longtext DEFAULT NULL,
  `rolloutplancontent` longtext DEFAULT NULL,
  `backoutplancontent` longtext DEFAULT NULL,
  `checklistcontent` longtext DEFAULT NULL,
  `global_validation` int(11) NOT NULL DEFAULT 1,
  `validation_percent` int(11) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes_groups`
--

CREATE TABLE `glpi_changes_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes_items`
--

CREATE TABLE `glpi_changes_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes_problems`
--

CREATE TABLE `glpi_changes_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes_suppliers`
--

CREATE TABLE `glpi_changes_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes_tickets`
--

CREATE TABLE `glpi_changes_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changes_users`
--

CREATE TABLE `glpi_changes_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changetasks`
--

CREATE TABLE `glpi_changetasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changetemplatehiddenfields`
--

CREATE TABLE `glpi_changetemplatehiddenfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changetemplatemandatoryfields`
--

CREATE TABLE `glpi_changetemplatemandatoryfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_changetemplatemandatoryfields`
--

INSERT INTO `glpi_changetemplatemandatoryfields` (`id`, `changetemplates_id`, `num`) VALUES
(1, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changetemplatepredefinedfields`
--

CREATE TABLE `glpi_changetemplatepredefinedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changetemplates`
--

CREATE TABLE `glpi_changetemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_changetemplates`
--

INSERT INTO `glpi_changetemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_changevalidations`
--

CREATE TABLE `glpi_changevalidations` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_validate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_submission` text DEFAULT NULL,
  `comment_validation` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_clusters`
--

CREATE TABLE `glpi_clusters` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `clustertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_clustertypes`
--

CREATE TABLE `glpi_clustertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_computerantiviruses`
--

CREATE TABLE `glpi_computerantiviruses` (
  `id` int(10) UNSIGNED NOT NULL,
  `computers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `antivirus_version` varchar(255) DEFAULT NULL,
  `signature_version` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_uptodate` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_computermodels`
--

CREATE TABLE `glpi_computermodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_computers`
--

CREATE TABLE `glpi_computers` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `computermodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `computertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `last_boot` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_computers_items`
--

CREATE TABLE `glpi_computers_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_computertypes`
--

CREATE TABLE `glpi_computertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_computervirtualmachines`
--

CREATE TABLE `glpi_computervirtualmachines` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `computers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `virtualmachinestates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `virtualmachinesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `virtualmachinetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `vcpu` int(11) NOT NULL DEFAULT 0,
  `ram` int(10) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_configs`
--

CREATE TABLE `glpi_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `context` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_configs`
--

INSERT INTO `glpi_configs` (`id`, `context`, `name`, `value`) VALUES
(1, 'core', 'version', '10.0.10'),
(2, 'core', 'show_jobs_at_login', '0'),
(3, 'core', 'cut', '250'),
(4, 'core', 'list_limit', '15'),
(5, 'core', 'list_limit_max', '50'),
(6, 'core', 'url_maxlength', '30'),
(7, 'core', 'event_loglevel', '5'),
(8, 'core', 'notifications_mailing', '1'),
(9, 'core', 'admin_email', 'mailalerteam@gmail.com'),
(10, 'core', 'admin_email_name', 'SIEM Alert'),
(11, 'core', 'from_email', 'mailalerteam@gmail.com'),
(12, 'core', 'from_email_name', 'SIEM Alert'),
(13, 'core', 'noreply_email', 'mailalerteam@gmail.com'),
(14, 'core', 'noreply_email_name', 'SIEM Alert'),
(15, 'core', 'replyto_email', 'mailalerteam@gmail.com'),
(16, 'core', 'replyto_email_name', 'SIEM Alert'),
(17, 'core', 'mailing_signature', 'Regards,\r\nSecurity Team'),
(18, 'core', 'use_anonymous_helpdesk', '0'),
(19, 'core', 'use_anonymous_followups', '0'),
(20, 'core', 'language', 'en_US'),
(21, 'core', 'priority_1', '#fff2f2'),
(22, 'core', 'priority_2', '#ffe0e0'),
(23, 'core', 'priority_3', '#ffcece'),
(24, 'core', 'priority_4', '#ffbfbf'),
(25, 'core', 'priority_5', '#ffadad'),
(26, 'core', 'priority_6', '#ff5555'),
(27, 'core', 'date_tax', '2005-12-31'),
(28, 'core', 'cas_host', ''),
(29, 'core', 'cas_port', '443'),
(30, 'core', 'cas_uri', ''),
(31, 'core', 'cas_logout', ''),
(32, 'core', 'cas_version', 'CAS_VERSION_2_0'),
(33, 'core', 'existing_auth_server_field_clean_domain', '0'),
(34, 'core', 'planning_begin', '08:00'),
(35, 'core', 'planning_end', '20:00'),
(36, 'core', 'utf8_conv', '1'),
(37, 'core', 'use_public_faq', '0'),
(38, 'core', 'url_base', 'https://20.235.99.228'),
(39, 'core', 'show_link_in_mail', '0'),
(40, 'core', 'text_login', ''),
(41, 'core', 'founded_new_version', ''),
(42, 'core', 'dropdown_max', '100'),
(43, 'core', 'ajax_wildcard', '*'),
(44, 'core', 'ajax_limit_count', '10'),
(45, 'core', 'is_users_auto_add', '1'),
(46, 'core', 'date_format', '0'),
(47, 'core', 'number_format', '0'),
(48, 'core', 'csv_delimiter', ';'),
(49, 'core', 'is_ids_visible', '0'),
(50, 'core', 'smtp_mode', '2'),
(51, 'core', 'smtp_host', 'smtp.gmail.com'),
(52, 'core', 'smtp_port', '465'),
(53, 'core', 'smtp_username', 'mailalerteam@gmail.com'),
(54, 'core', 'smtp_oauth_provider', ''),
(55, 'core', 'smtp_oauth_client_id', ''),
(56, 'core', 'smtp_oauth_client_secret', ''),
(57, 'core', 'smtp_oauth_options', '{}'),
(58, 'core', 'smtp_oauth_refresh_token', ''),
(59, 'core', 'proxy_name', ''),
(60, 'core', 'proxy_port', '8080'),
(61, 'core', 'proxy_user', ''),
(62, 'core', 'add_followup_on_update_ticket', '1'),
(63, 'core', 'keep_tickets_on_delete', '0'),
(64, 'core', 'time_step', '5'),
(65, 'core', 'decimal_number', '2'),
(66, 'core', 'helpdesk_doc_url', ''),
(67, 'core', 'central_doc_url', ''),
(68, 'core', 'documentcategories_id_forticket', '0'),
(69, 'core', 'monitors_management_restrict', '2'),
(70, 'core', 'phones_management_restrict', '2'),
(71, 'core', 'peripherals_management_restrict', '2'),
(72, 'core', 'printers_management_restrict', '2'),
(73, 'core', 'use_log_in_files', '1'),
(74, 'core', 'time_offset', '0'),
(75, 'core', 'is_contact_autoupdate', '1'),
(76, 'core', 'is_user_autoupdate', '1'),
(77, 'core', 'is_group_autoupdate', '1'),
(78, 'core', 'is_location_autoupdate', '1'),
(79, 'core', 'state_autoupdate_mode', '0'),
(80, 'core', 'is_contact_autoclean', '0'),
(81, 'core', 'is_user_autoclean', '0'),
(82, 'core', 'is_group_autoclean', '0'),
(83, 'core', 'is_location_autoclean', '0'),
(84, 'core', 'state_autoclean_mode', '0'),
(85, 'core', 'use_flat_dropdowntree', '0'),
(86, 'core', 'use_flat_dropdowntree_on_search_result', '1'),
(87, 'core', 'use_autoname_by_entity', '1'),
(88, 'core', 'softwarecategories_id_ondelete', '1'),
(89, 'core', 'x509_email_field', ''),
(90, 'core', 'x509_cn_restrict', ''),
(91, 'core', 'x509_o_restrict', ''),
(92, 'core', 'x509_ou_restrict', ''),
(93, 'core', 'default_mailcollector_filesize_max', '2097152'),
(94, 'core', 'followup_private', '0'),
(95, 'core', 'task_private', '0'),
(96, 'core', 'default_software_helpdesk_visible', '1'),
(97, 'core', 'names_format', '0'),
(98, 'core', 'default_requesttypes_id', '1'),
(99, 'core', 'use_noright_users_add', '1'),
(100, 'core', 'cron_limit', '5'),
(101, 'core', 'priority_matrix', '{\"1\":{\"1\":\"1\",\"2\":\"1\",\"3\":\"2\",\"4\":\"2\",\"5\":\"2\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"2\",\"4\":\"3\",\"5\":\"3\"},\"3\":{\"1\":\"2\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"4\"},\"4\":{\"1\":\"2\",\"2\":\"3\",\"3\":\"4\",\"4\":\"4\",\"5\":\"5\"},\"5\":{\"1\":\"2\",\"2\":\"3\",\"3\":\"4\",\"4\":\"5\",\"5\":\"5\"}}'),
(102, 'core', 'urgency_mask', '28'),
(103, 'core', 'impact_mask', '28'),
(104, 'core', 'user_deleted_ldap', '0'),
(105, 'core', 'user_restored_ldap', '0'),
(106, 'core', 'auto_create_infocoms', '0'),
(107, 'core', 'use_slave_for_search', '0'),
(108, 'core', 'proxy_passwd', ''),
(109, 'core', 'smtp_passwd', 'ak9W8dei51dmlolQ9EOpDuJpCmLrYM+BJYGKOYvpN/RF7YMXyCR42hdgoeLgHfY4/gnzjhhURcs='),
(110, 'core', 'show_count_on_tabs', '1'),
(111, 'core', 'refresh_views', '0'),
(112, 'core', 'set_default_tech', '1'),
(113, 'core', 'allow_search_view', '2'),
(114, 'core', 'allow_search_all', '0'),
(115, 'core', 'allow_search_global', '1'),
(116, 'core', 'display_count_on_home', '5'),
(117, 'core', 'use_password_security', '0'),
(118, 'core', 'password_min_length', '8'),
(119, 'core', 'password_need_number', '1'),
(120, 'core', 'password_need_letter', '1'),
(121, 'core', 'password_need_caps', '1'),
(122, 'core', 'password_need_symbol', '1'),
(123, 'core', 'use_check_pref', '0'),
(124, 'core', 'notification_to_myself', '1'),
(125, 'core', 'duedateok_color', '#06ff00'),
(126, 'core', 'duedatewarning_color', '#ffb800'),
(127, 'core', 'duedatecritical_color', '#ff0000'),
(128, 'core', 'duedatewarning_less', '20'),
(129, 'core', 'duedatecritical_less', '5'),
(130, 'core', 'duedatewarning_unit', '%'),
(131, 'core', 'duedatecritical_unit', '%'),
(132, 'core', 'realname_ssofield', ''),
(133, 'core', 'firstname_ssofield', ''),
(134, 'core', 'email1_ssofield', ''),
(135, 'core', 'email2_ssofield', ''),
(136, 'core', 'email3_ssofield', ''),
(137, 'core', 'email4_ssofield', ''),
(138, 'core', 'phone_ssofield', ''),
(139, 'core', 'phone2_ssofield', ''),
(140, 'core', 'mobile_ssofield', ''),
(141, 'core', 'comment_ssofield', ''),
(142, 'core', 'title_ssofield', ''),
(143, 'core', 'category_ssofield', ''),
(144, 'core', 'language_ssofield', ''),
(145, 'core', 'entity_ssofield', ''),
(146, 'core', 'registration_number_ssofield', ''),
(147, 'core', 'ssovariables_id', '0'),
(148, 'core', 'ssologout_url', ''),
(149, 'core', 'translate_kb', '0'),
(150, 'core', 'translate_dropdowns', '0'),
(151, 'core', 'translate_reminders', '0'),
(152, 'core', 'pdffont', 'dejavusans'),
(153, 'core', 'keep_devices_when_purging_item', '0'),
(154, 'core', 'maintenance_mode', '0'),
(155, 'core', 'maintenance_text', ''),
(156, 'core', 'attach_ticket_documents_to_mail', '0'),
(157, 'core', 'backcreated', '0'),
(158, 'core', 'task_state', '1'),
(159, 'core', 'palette', 'auror'),
(160, 'core', 'page_layout', 'vertical'),
(161, 'core', 'fold_menu', '0'),
(162, 'core', 'fold_search', '0'),
(163, 'core', 'savedsearches_pinned', '0'),
(164, 'core', 'timeline_order', 'natural'),
(165, 'core', 'itil_layout', ''),
(166, 'core', 'richtext_layout', 'classic'),
(167, 'core', 'lock_use_lock_item', '0'),
(168, 'core', 'lock_autolock_mode', '1'),
(169, 'core', 'lock_directunlock_notification', '0'),
(170, 'core', 'lock_item_list', '[]'),
(171, 'core', 'lock_lockprofile_id', '8'),
(172, 'core', 'set_default_requester', '1'),
(173, 'core', 'highcontrast_css', '0'),
(174, 'core', 'default_central_tab', '0'),
(175, 'core', 'smtp_check_certificate', '1'),
(176, 'core', 'enable_api', '1'),
(177, 'core', 'enable_api_login_credentials', '1'),
(178, 'core', 'enable_api_login_external_token', '1'),
(179, 'core', 'url_base_api', 'https://20.235.99.228/apirest.php/'),
(180, 'core', 'login_remember_time', '604800'),
(181, 'core', 'login_remember_default', '1'),
(182, 'core', 'use_notifications', '1'),
(183, 'core', 'notifications_ajax', '1'),
(184, 'core', 'notifications_ajax_check_interval', '5'),
(185, 'core', 'notifications_ajax_sound', 'sound_a'),
(186, 'core', 'notifications_ajax_icon_url', '/pics/glpi.png'),
(187, 'core', 'dbversion', '10.0.10@05de68add675fb55abaeec10f3a2552085594a16'),
(188, 'core', 'smtp_max_retries', '5'),
(189, 'core', 'smtp_sender', 'mailalerteam@gmail.com'),
(190, 'core', 'instance_uuid', NULL),
(191, 'core', 'registration_uuid', 'xgMnzol0mMe3WXrdjw8dxhdJLJMeSMBnqRNi67rk'),
(192, 'core', 'smtp_retry_time', '5'),
(193, 'core', 'purge_addrelation', '-1'),
(194, 'core', 'purge_deleterelation', '-1'),
(195, 'core', 'purge_createitem', '-1'),
(196, 'core', 'purge_deleteitem', '-1'),
(197, 'core', 'purge_restoreitem', '-1'),
(198, 'core', 'purge_updateitem', '-1'),
(199, 'core', 'purge_item_software_install', '-1'),
(200, 'core', 'purge_software_item_install', '-1'),
(201, 'core', 'purge_software_version_install', '-1'),
(202, 'core', 'purge_infocom_creation', '-1'),
(203, 'core', 'purge_profile_user', '-1'),
(204, 'core', 'purge_group_user', '-1'),
(205, 'core', 'purge_adddevice', '-1'),
(206, 'core', 'purge_updatedevice', '-1'),
(207, 'core', 'purge_deletedevice', '-1'),
(208, 'core', 'purge_connectdevice', '-1'),
(209, 'core', 'purge_disconnectdevice', '-1'),
(210, 'core', 'purge_userdeletedfromldap', '-1'),
(211, 'core', 'purge_comments', '-1'),
(212, 'core', 'purge_datemod', '-1'),
(213, 'core', 'purge_all', '-1'),
(214, 'core', 'purge_user_auth_changes', '-1'),
(215, 'core', 'purge_plugins', '-1'),
(216, 'core', 'purge_refusedequipment', '-1'),
(217, 'core', 'display_login_source', '1'),
(218, 'core', 'devices_in_menu', '[\"Item_DeviceSimcard\"]'),
(219, 'core', 'password_expiration_delay', '-1'),
(220, 'core', 'password_expiration_notice', '-1'),
(221, 'core', 'password_expiration_lock_delay', '-1'),
(222, 'core', 'default_dashboard_central', 'central'),
(223, 'core', 'default_dashboard_assets', 'assets'),
(224, 'core', 'default_dashboard_helpdesk', 'assistance'),
(225, 'core', 'default_dashboard_mini_ticket', 'mini_tickets'),
(226, 'core', 'impact_enabled_itemtypes', '[\"Appliance\",\"Cluster\",\"Computer\",\"Datacenter\",\"DCRoom\",\"Domain\",\"Enclosure\",\"Monitor\",\"NetworkEquipment\",\"PDU\",\"Peripheral\",\"Phone\",\"Printer\",\"Rack\",\"Software\",\"DatabaseInstance\"]'),
(227, 'core', 'document_max_size', '2'),
(228, 'core', 'planning_work_days', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"0\"]'),
(229, 'core', 'system_user', '6'),
(230, 'core', 'support_legacy_data', '0'),
(231, 'core', 'initialized_rules_collections', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOperatingSystemCollection\",\"RuleDictionnaryOperatingSystemVersionCollection\",\"RuleDictionnaryOperatingSystemEditionCollection\"]'),
(232, 'core', 'timeline_action_btn_layout', '0'),
(233, 'core', 'timeline_date_format', '0'),
(234, 'inventory', 'enabled_inventory', '0'),
(235, 'inventory', 'import_software', '1'),
(236, 'inventory', 'import_volume', '1'),
(237, 'inventory', 'import_antivirus', '1'),
(238, 'inventory', 'import_registry', '1'),
(239, 'inventory', 'import_process', '1'),
(240, 'inventory', 'import_vm', '1'),
(241, 'inventory', 'import_monitor_on_partial_sn', '0'),
(242, 'inventory', 'import_unmanaged', '1'),
(243, 'inventory', 'component_processor', '1'),
(244, 'inventory', 'component_memory', '1'),
(245, 'inventory', 'component_harddrive', '1'),
(246, 'inventory', 'component_networkcard', '1'),
(247, 'inventory', 'component_graphiccard', '1'),
(248, 'inventory', 'component_soundcard', '1'),
(249, 'inventory', 'component_drive', '1'),
(250, 'inventory', 'component_networkdrive', '1'),
(251, 'inventory', 'component_networkcardvirtual', '1'),
(252, 'inventory', 'component_control', '1'),
(253, 'inventory', 'component_battery', '1'),
(254, 'inventory', 'component_simcard', '1'),
(255, 'inventory', 'states_id_default', '0'),
(256, 'inventory', 'entities_id_default', '0'),
(257, 'inventory', 'location', '0'),
(258, 'inventory', 'group', '0'),
(259, 'inventory', 'vm_type', '0'),
(260, 'inventory', 'vm_components', '0'),
(261, 'inventory', 'vm_as_computer', '0'),
(262, 'inventory', 'component_removablemedia', '1'),
(263, 'inventory', 'component_powersupply', '1'),
(264, 'inventory', 'inventory_frequency', '24'),
(265, 'inventory', 'import_monitor', '1'),
(266, 'inventory', 'import_printer', '1'),
(267, 'inventory', 'import_peripheral', '1'),
(268, 'inventory', 'stale_agents_delay', '0'),
(269, 'inventory', 'stale_agents_action', '[0]'),
(270, 'inventory', 'stale_agents_status', '0'),
(271, 'core', 'notification_uuid', '5RP4tKaGnRouOUg7YBUEhN7MpbbGqRa1tcsZbh9G'),
(272, 'core', '_matrix', '1'),
(273, 'core', '_impact_5', '0'),
(274, 'core', '_impact_4', '1'),
(275, 'core', '_impact_3', '1'),
(276, 'core', '_impact_2', '1'),
(277, 'core', '_impact_1', '0'),
(278, 'core', '_urgency_5', '0'),
(279, 'core', '_matrix_5_5', '5'),
(280, 'core', '_matrix_5_4', '5'),
(281, 'core', '_matrix_5_3', '4'),
(282, 'core', '_matrix_5_2', '3'),
(283, 'core', '_matrix_5_1', '2'),
(284, 'core', '_urgency_4', '1'),
(285, 'core', '_matrix_4_5', '5'),
(286, 'core', '_matrix_4_4', '4'),
(287, 'core', '_matrix_4_3', '4'),
(288, 'core', '_matrix_4_2', '3'),
(289, 'core', '_matrix_4_1', '2'),
(290, 'core', '_urgency_3', '1'),
(291, 'core', '_matrix_3_5', '4'),
(292, 'core', '_matrix_3_4', '4'),
(293, 'core', '_matrix_3_3', '3'),
(294, 'core', '_matrix_3_2', '2'),
(295, 'core', '_matrix_3_1', '2'),
(296, 'core', '_urgency_2', '1'),
(297, 'core', '_matrix_2_5', '3'),
(298, 'core', '_matrix_2_4', '3'),
(299, 'core', '_matrix_2_3', '2'),
(300, 'core', '_matrix_2_2', '2'),
(301, 'core', '_matrix_2_1', '1'),
(302, 'core', '_urgency_1', '0'),
(303, 'core', '_matrix_1_5', '2'),
(304, 'core', '_matrix_1_4', '2'),
(305, 'core', '_matrix_1_3', '2'),
(306, 'core', '_matrix_1_2', '1'),
(307, 'core', '_matrix_1_1', '1'),
(308, 'core', 'init_all', '-1');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_consumableitems`
--

CREATE TABLE `glpi_consumableitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `consumableitemtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `alarm_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_target` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_consumableitemtypes`
--

CREATE TABLE `glpi_consumableitemtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_consumables`
--

CREATE TABLE `glpi_consumables` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `consumableitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contacts`
--

CREATE TABLE `glpi_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contacttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `usertitles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contacts_suppliers`
--

CREATE TABLE `glpi_contacts_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contacts_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contacttypes`
--

CREATE TABLE `glpi_contacttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contractcosts`
--

CREATE TABLE `glpi_contractcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contracts`
--

CREATE TABLE `glpi_contracts` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `contracttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `notice` int(11) NOT NULL DEFAULT 0,
  `periodicity` int(11) NOT NULL DEFAULT 0,
  `billing` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `accounting_number` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint(4) NOT NULL DEFAULT 0,
  `sunday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `sunday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_sunday` tinyint(4) NOT NULL DEFAULT 0,
  `max_links_allowed` int(11) NOT NULL DEFAULT 0,
  `alert` int(11) NOT NULL DEFAULT 0,
  `renewal` int(11) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contracts_items`
--

CREATE TABLE `glpi_contracts_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contracts_suppliers`
--

CREATE TABLE `glpi_contracts_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_contracttypes`
--

CREATE TABLE `glpi_contracttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_crontasklogs`
--

CREATE TABLE `glpi_crontasklogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `crontasks_id` int(10) UNSIGNED NOT NULL,
  `crontasklogs_id` int(10) UNSIGNED NOT NULL COMMENT 'id of ''start'' event',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `state` int(11) NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int(11) NOT NULL COMMENT 'for statistics',
  `content` varchar(255) DEFAULT NULL COMMENT 'message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_crontasks`
--

CREATE TABLE `glpi_crontasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL COMMENT 'task name',
  `frequency` int(11) NOT NULL COMMENT 'second between launch',
  `param` int(11) DEFAULT NULL COMMENT 'task specify parameter',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int(11) NOT NULL DEFAULT 1 COMMENT '1:internal, 2:external',
  `allowmode` int(11) NOT NULL DEFAULT 3 COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int(11) NOT NULL DEFAULT 0,
  `hourmax` int(11) NOT NULL DEFAULT 24,
  `logs_lifetime` int(11) NOT NULL DEFAULT 30 COMMENT 'number of days',
  `lastrun` timestamp NULL DEFAULT NULL COMMENT 'last run date',
  `lastcode` int(11) DEFAULT NULL COMMENT 'last run return code',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Task run by internal / external cron.' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_crontasks`
--

INSERT INTO `glpi_crontasks` (`id`, `itemtype`, `name`, `frequency`, `param`, `state`, `mode`, `allowmode`, `hourmin`, `hourmax`, `logs_lifetime`, `lastrun`, `lastcode`, `comment`, `date_mod`, `date_creation`) VALUES
(2, 'CartridgeItem', 'cartridge', 86400, 10, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(3, 'ConsumableItem', 'consumable', 86400, 10, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(4, 'SoftwareLicense', 'software', 86400, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(5, 'Contract', 'contract', 86400, NULL, 0, 1, 3, 0, 24, 30, '2023-11-18 08:20:00', NULL, NULL, '2023-11-18 14:52:45', NULL),
(6, 'Infocom', 'infocom', 86400, NULL, 0, 1, 3, 0, 24, 30, '2023-11-18 08:26:00', NULL, NULL, '2023-11-18 14:52:45', NULL),
(7, 'CronTask', 'logs', 86400, 30, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(9, 'MailCollector', 'mailgate', 600, 10, 1, 1, 3, 0, 24, 30, '2023-11-21 12:43:00', NULL, NULL, NULL, NULL),
(10, 'DBconnection', 'checkdbreplicate', 300, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(11, 'CronTask', 'checkupdate', 604800, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(12, 'CronTask', 'session', 2592000, NULL, 0, 1, 3, 0, 24, 30, '2023-11-18 08:45:00', NULL, NULL, '2023-11-21 05:42:24', NULL),
(13, 'CronTask', 'graph', 3600, NULL, 1, 1, 3, 0, 24, 30, '2023-11-22 00:53:00', NULL, NULL, NULL, NULL),
(14, 'ReservationItem', 'reservation', 3600, NULL, 0, 1, 3, 0, 24, 30, '2023-11-18 09:46:00', NULL, NULL, '2023-11-18 14:54:46', NULL),
(15, 'Ticket', 'closeticket', 43200, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 07:23:00', NULL, NULL, NULL, NULL),
(16, 'Ticket', 'alertnotclosed', 43200, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 07:33:00', NULL, NULL, NULL, NULL),
(17, 'SlaLevel_Ticket', 'slaticket', 600, NULL, 1, 2, 3, 0, 24, 10, '2023-11-22 00:50:00', NULL, NULL, '2023-11-21 13:00:16', NULL),
(18, 'Ticket', 'createinquest', 86400, NULL, 0, 1, 3, 0, 24, 30, '2023-11-18 13:30:00', NULL, NULL, '2023-11-18 14:52:45', NULL),
(19, 'CronTask', 'watcher', 86400, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 07:38:00', NULL, NULL, NULL, NULL),
(20, 'CommonITILRecurrentCron', 'RecurrentItems', 3600, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 11:02:00', NULL, NULL, NULL, NULL),
(21, 'PlanningRecall', 'planningrecall', 300, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 12:59:00', NULL, NULL, NULL, NULL),
(22, 'QueuedNotification', 'queuednotification', 60, 5, 1, 2, 3, 0, 24, 30, '2023-11-22 00:58:00', NULL, NULL, '2023-11-18 08:32:44', NULL),
(23, 'QueuedNotification', 'queuednotificationclean', 86400, 30, 1, 1, 3, 0, 24, 30, '2023-11-20 12:56:00', NULL, NULL, NULL, NULL),
(24, 'CronTask', 'temp', 3600, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 10:45:00', NULL, NULL, NULL, NULL),
(25, 'MailCollector', 'mailgateerror', 86400, NULL, 1, 1, 3, 0, 24, 30, '2023-11-21 07:45:00', NULL, NULL, NULL, NULL),
(26, 'CronTask', 'circularlogs', 86400, 4, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(27, 'ObjectLock', 'unlockobject', 86400, 4, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(28, 'SavedSearch', 'countAll', 604800, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(29, 'SavedSearch_Alert', 'savedsearchesalerts', 86400, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(30, 'Telemetry', 'telemetry', 2592000, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(31, 'Certificate', 'certificate', 86400, NULL, 0, 1, 3, 0, 24, 30, '2023-11-18 14:14:00', NULL, NULL, '2023-11-18 14:49:58', NULL),
(32, 'OlaLevel_Ticket', 'olaticket', 60, NULL, 1, 2, 3, 0, 24, 30, '2023-11-22 00:58:00', NULL, NULL, '2023-11-18 15:59:43', NULL),
(33, 'PurgeLogs', 'PurgeLogs', 604800, 24, 1, 2, 3, 0, 24, 30, '2023-11-18 08:22:00', NULL, NULL, NULL, NULL),
(34, 'Ticket', 'purgeticket', 604800, NULL, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(35, 'Document', 'cleanorphans', 604800, NULL, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(36, 'User', 'passwordexpiration', 86400, 100, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(37, 'Glpi\\Marketplace\\Controller', 'checkAllUpdates', 2592000, NULL, 1, 2, 3, 0, 24, 30, '2023-11-18 08:22:00', NULL, NULL, '2023-11-18 14:50:15', NULL),
(38, 'CleanSoftwareCron', 'cleansoftware', 2592000, 1000, 0, 2, 3, 0, 24, 300, NULL, NULL, NULL, NULL, NULL),
(39, 'Domain', 'DomainsAlert', 86400, NULL, 0, 2, 3, 0, 24, 30, '2023-11-18 08:22:00', NULL, NULL, '2023-11-18 14:52:45', NULL),
(40, 'Glpi\\Inventory\\Inventory', 'cleantemp', 86400, NULL, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(41, 'Glpi\\Inventory\\Inventory', 'cleanorphans', 604800, NULL, 1, 2, 3, 0, 24, 30, '2023-11-18 08:22:00', NULL, NULL, NULL, NULL),
(42, 'PendingReasonCron', 'pendingreason_autobump_autosolve', 60, NULL, 1, 2, 3, 0, 24, 60, '2023-11-22 00:58:00', NULL, NULL, '2023-11-18 16:18:38', NULL),
(43, 'Agent', 'Cleanoldagents', 86400, NULL, 0, 2, 3, 0, 24, 30, '2023-11-18 08:24:00', NULL, NULL, '2023-11-18 14:52:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_dashboards_dashboards`
--

CREATE TABLE `glpi_dashboards_dashboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `context` varchar(100) NOT NULL DEFAULT 'core',
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_dashboards_dashboards`
--

INSERT INTO `glpi_dashboards_dashboards` (`id`, `key`, `name`, `context`, `users_id`) VALUES
(1, 'central', 'Central', 'core', 0),
(2, 'assets', 'Assets', 'core', 0),
(3, 'assistance', 'Assistance', 'core', 0),
(4, 'mini_tickets', 'Mini ticket Dashboard', 'mini_core', 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_dashboards_filters`
--

CREATE TABLE `glpi_dashboards_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `dashboards_dashboards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filter` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_dashboards_items`
--

CREATE TABLE `glpi_dashboards_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `dashboards_dashboards_id` int(10) UNSIGNED NOT NULL,
  `gridstack_id` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `card_options` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_dashboards_items`
--

INSERT INTO `glpi_dashboards_items` (`id`, `dashboards_dashboards_id`, `gridstack_id`, `card_id`, `x`, `y`, `width`, `height`, `card_options`) VALUES
(1, 1, 'bn_count_Computer_4a315743-151c-40cb-a20b-762250668dac', 'bn_count_Computer', 3, 0, 3, 2, '{\"color\":\"#e69393\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(2, 1, 'bn_count_Software_0690f524-e826-47a9-b50a-906451196b83', 'bn_count_Software', 0, 0, 3, 2, '{\"color\":\"#aaddac\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(3, 1, 'bn_count_Rack_c6502e0a-5991-46b4-a771-7f355137306b', 'bn_count_Rack', 6, 2, 3, 2, '{\"color\":\"#0e87a0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(4, 1, 'bn_count_SoftwareLicense_e755fd06-283e-4479-ba35-2d548f8f8a90', 'bn_count_SoftwareLicense', 0, 2, 3, 2, '{\"color\":\"#27ab3c\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(5, 1, 'bn_count_Monitor_7059b94c-583c-4ba7-b100-d40461165318', 'bn_count_Monitor', 3, 2, 3, 2, '{\"color\":\"#b52d30\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(6, 1, 'bn_count_Ticket_a74c0903-3387-4a07-9111-b0938af8f1e7', 'bn_count_Ticket', 14, 7, 3, 2, '{\"color\":\"#ffdc64\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(7, 1, 'bn_count_Problem_c1cf5cfb-f626-472e-82a1-49c3e200e746', 'bn_count_Problem', 20, 7, 3, 2, '{\"color\":\"#f08d7b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(8, 1, 'count_Computer_Manufacturer_6129c451-42b5-489d-b693-c362adf32d49', 'count_Computer_Manufacturer', 0, 4, 5, 4, '{\"color\":\"#f8faf9\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(9, 1, 'top_ticket_user_requester_c74f52a8-046a-4077-b1a6-c9f840d34b82', 'top_ticket_user_requester', 14, 9, 6, 5, '{\"color\":\"#f9fafb\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(10, 1, 'bn_count_tickets_late_04c47208-d7e5-4aca-9566-d46e68c45c67', 'bn_count_tickets_late', 17, 7, 3, 2, '{\"color\":\"#f8911f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(11, 1, 'ticket_status_2e4e968b-d4e6-4e33-9ce9-a1aaff53dfde', 'ticket_status', 14, 0, 12, 7, '{\"color\":\"#fafafa\",\"widgettype\":\"stackedbars\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(12, 1, 'top_ticket_ITILCategory_37736ba9-d429-4cb3-9058-ef4d111d9269', 'top_ticket_ITILCategory', 20, 9, 6, 5, '{\"color\":\"#fbf9f9\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(13, 1, 'bn_count_Printer_517684b0-b064-49dd-943e-fcb6f915e453', 'bn_count_Printer', 9, 2, 3, 2, '{\"color\":\"#365a8f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(14, 1, 'bn_count_Phone_f70c489f-02c1-46e5-978b-94a95b5038ee', 'bn_count_Phone', 9, 0, 3, 2, '{\"color\":\"#d5e1ec\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(15, 1, 'bn_count_Change_ab950dbd-cd25-466d-8dff-7dcaca386564', 'bn_count_Change', 23, 7, 3, 2, '{\"color\":\"#cae3c4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(16, 1, 'bn_count_Group_b84a93f2-a26c-49d7-82a4-5446697cc5b0', 'bn_count_Group', 4, 8, 4, 2, '{\"color\":\"#e0e0e0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(17, 1, 'bn_count_Profile_770b35e8-68e9-4b4f-9e09-5a11058f069f', 'bn_count_Profile', 4, 10, 4, 2, '{\"color\":\"#e0e0e0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(18, 1, 'bn_count_Supplier_36ff9011-e4cf-4d89-b9ab-346b9857d734', 'bn_count_Supplier', 8, 8, 3, 2, '{\"color\":\"#c9c9c9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(19, 1, 'bn_count_KnowbaseItem_a3785a56-bed4-4a30-8387-f251f5365b3b', 'bn_count_KnowbaseItem', 8, 10, 3, 2, '{\"color\":\"#c9c9c9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(20, 1, 'bn_count_Entity_9b82951a-ba52-45cc-a2d3-1d238ec37adf', 'bn_count_Entity', 0, 10, 4, 2, '{\"color\":\"#f9f9f9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(21, 1, 'bn_count_Document_7dc7f4b8-61ff-4147-b994-5541bddd7b66', 'bn_count_Document', 11, 8, 3, 2, '{\"color\":\"#b4b4b4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(22, 1, 'bn_count_Project_4d412ee2-8b79-469b-995f-4c0a05ab849d', 'bn_count_Project', 11, 10, 3, 2, '{\"color\":\"#b3b3b3\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(23, 1, 'bn_count_NetworkEquipment_c537e334-d584-43bc-b6de-b4a939143e89', 'bn_count_NetworkEquipment', 6, 0, 3, 2, '{\"color\":\"#bfe7ea\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(24, 1, 'bn_count_User_ac0cbe52-3593-43c1-8ecc-0eb115de494d', 'bn_count_User', 0, 8, 4, 2, '{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(25, 1, 'count_Monitor_MonitorModel_5a476ff9-116e-4270-858b-c003c20841a9', 'count_Monitor_MonitorModel', 5, 4, 5, 4, '{\"color\":\"#f5fafa\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(26, 1, 'count_NetworkEquipment_State_81f2ae35-b366-4065-ac26-02ea4e3704a6', 'count_NetworkEquipment_State', 10, 4, 4, 4, '{\"color\":\"#f5f3ef\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(27, 2, 'bn_count_Computer_34cfbaf9-a471-4852-b48c-0dadea7644de', 'bn_count_Computer', 0, 0, 4, 3, '{\"color\":\"#f3d0d0\",\"widgettype\":\"bigNumber\"}'),
(28, 2, 'bn_count_Software_60091467-2137-49f4-8834-f6602a482079', 'bn_count_Software', 4, 0, 4, 3, '{\"color\":\"#d1f1a8\",\"widgettype\":\"bigNumber\"}'),
(29, 2, 'bn_count_Printer_c9a385d4-76a3-4971-ad0e-1470efeafacc', 'bn_count_Printer', 8, 3, 4, 3, '{\"color\":\"#5da8d6\",\"widgettype\":\"bigNumber\"}'),
(30, 2, 'bn_count_PDU_60053eb6-8dda-4416-9a4b-afd51889bd09', 'bn_count_PDU', 12, 3, 4, 3, '{\"color\":\"#ffb62f\",\"widgettype\":\"bigNumber\"}'),
(31, 2, 'bn_count_Rack_0fdc196f-20d2-4f63-9ddb-b75c165cc664', 'bn_count_Rack', 12, 0, 4, 3, '{\"color\":\"#f7d79a\",\"widgettype\":\"bigNumber\"}'),
(32, 2, 'bn_count_Phone_c31fde2d-510a-4482-b17d-2f65b61eae08', 'bn_count_Phone', 16, 3, 4, 3, '{\"color\":\"#a0cec2\",\"widgettype\":\"bigNumber\"}'),
(33, 2, 'bn_count_Enclosure_c21ce30a-58c3-456a-81ec-3c5f01527a8f', 'bn_count_Enclosure', 16, 0, 4, 3, '{\"color\":\"#d7e8e4\",\"widgettype\":\"bigNumber\"}'),
(34, 2, 'bn_count_NetworkEquipment_76f1e239-777b-4552-b053-ae5c64190347', 'bn_count_NetworkEquipment', 8, 0, 4, 3, '{\"color\":\"#c8dae4\",\"widgettype\":\"bigNumber\"}'),
(35, 2, 'bn_count_SoftwareLicense_576e58fe-a386-480f-b405-1c2315b8ab47', 'bn_count_SoftwareLicense', 4, 3, 4, 3, '{\"color\":\"#9bc06b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(36, 2, 'bn_count_Monitor_890e16d3-b121-48c6-9713-d9c239d9a970', 'bn_count_Monitor', 0, 3, 4, 3, '{\"color\":\"#dc6f6f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(37, 2, 'count_Computer_Manufacturer_986e92e8-32e8-4a6f-806f-6f5383acbb3f', 'count_Computer_Manufacturer', 4, 6, 4, 4, '{\"color\":\"#f3f5f1\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(38, 2, 'count_Computer_State_290c5920-9eab-4db8-8753-46108e60f1d8', 'count_Computer_State', 0, 6, 4, 4, '{\"color\":\"#fbf7f7\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(39, 2, 'count_Computer_ComputerType_c58f9c7e-22d5-478b-8226-d2a752bcbb09', 'count_Computer_ComputerType', 8, 6, 4, 4, '{\"color\":\"#f5f9fa\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(40, 2, 'count_NetworkEquipment_Manufacturer_8132b21c-6f7f-4dc1-af54-bea794cb96e9', 'count_NetworkEquipment_Manufacturer', 12, 6, 4, 4, '{\"color\":\"#fcf8ed\",\"widgettype\":\"hbar\",\"use_gradient\":\"0\",\"limit\":\"5\"}'),
(41, 2, 'count_Monitor_Manufacturer_43b0c16b-af82-418e-aac1-f32b39705c0d', 'count_Monitor_Manufacturer', 16, 6, 4, 4, '{\"color\":\"#f9fbfb\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(42, 3, 'bn_count_Ticket_344e761b-f7e8-4617-8c90-154b266b4d67', 'bn_count_Ticket', 0, 0, 3, 2, '{\"color\":\"#ffdc64\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(43, 3, 'bn_count_Problem_bdb4002b-a674-4493-820f-af85bed44d2a', 'bn_count_Problem', 0, 4, 3, 2, '{\"color\":\"#f0967b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(44, 3, 'bn_count_Change_b9b87513-4f40-41e6-8621-f51f9a30fb19', 'bn_count_Change', 0, 6, 3, 2, '{\"color\":\"#cae3c4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(45, 3, 'bn_count_tickets_late_1e9ae481-21b4-4463-a830-dec1b68ec5e7', 'bn_count_tickets_late', 0, 2, 3, 2, '{\"color\":\"#f8911f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(46, 3, 'bn_count_tickets_incoming_336a36d9-67fe-4475-880e-447bd766b8fe', 'bn_count_tickets_incoming', 3, 6, 3, 2, '{\"color\":\"#a0e19d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(47, 3, 'bn_count_tickets_closed_e004bab5-f2b6-4060-a401-a2a8b9885245', 'bn_count_tickets_closed', 9, 8, 3, 2, '{\"color\":\"#515151\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(48, 3, 'bn_count_tickets_assigned_7455c855-6df8-4514-a3d9-8b0fce52bd63', 'bn_count_tickets_assigned', 6, 6, 3, 2, '{\"color\":\"#eaf5f7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(49, 3, 'bn_count_tickets_solved_5e9759b3-ee7e-4a14-b68f-1ac024ef55ee', 'bn_count_tickets_solved', 9, 6, 3, 2, '{\"color\":\"#d8d8d8\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(50, 3, 'bn_count_tickets_waiting_102b2c2a-6ac6-4d73-ba47-8b09382fe00e', 'bn_count_tickets_waiting', 3, 8, 3, 2, '{\"color\":\"#ffcb7d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(51, 3, 'bn_count_TicketRecurrent_13f79539-61f6-45f7-8dde-045706e652f2', 'bn_count_TicketRecurrent', 0, 8, 3, 2, '{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(52, 3, 'bn_count_tickets_planned_267bf627-9d5e-4b6c-b53d-b8623d793ccf', 'bn_count_tickets_planned', 6, 8, 3, 2, '{\"color\":\"#6298d5\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(53, 3, 'top_ticket_ITILCategory_0cba0c84-6c62-4cd8-8564-18614498d8e4', 'top_ticket_ITILCategory', 12, 6, 4, 4, '{\"color\":\"#f1f5ef\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"7\"}'),
(54, 3, 'top_ticket_RequestType_b9e43f34-8e94-4a6e-9023-c5d1e2ce7859', 'top_ticket_RequestType', 16, 6, 4, 4, '{\"color\":\"#f9fafb\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"4\"}'),
(55, 3, 'top_ticket_Entity_a8e65812-519c-488e-9892-9adbe22fbd5c', 'top_ticket_Entity', 20, 6, 4, 4, '{\"color\":\"#f7f1f0\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"7\"}'),
(56, 3, 'ticket_evolution_76fd4926-ee5e-48db-b6d6-e2947c190c5e', 'ticket_evolution', 3, 0, 12, 6, '{\"color\":\"#f3f7f8\",\"widgettype\":\"areas\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(57, 3, 'ticket_status_5b256a35-b36b-4db5-ba11-ea7c125f126e', 'ticket_status', 15, 0, 11, 6, '{\"color\":\"#f7f3f2\",\"widgettype\":\"stackedbars\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(58, 4, 'bn_count_tickets_closed_ccf7246b-645a-40d2-8206-fa33c769e3f5', 'bn_count_tickets_closed', 24, 0, 4, 2, '{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(59, 4, 'bn_count_Ticket_d5bf3576-5033-40fb-bbdb-292294a7698e', 'bn_count_Ticket', 0, 0, 4, 2, '{\"color\":\"#ffd957\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(60, 4, 'bn_count_tickets_incoming_055e813c-b0ce-4687-91ef-559249e8ddd8', 'bn_count_tickets_incoming', 4, 0, 4, 2, '{\"color\":\"#6fd169\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(61, 4, 'bn_count_tickets_waiting_793c665b-b620-4b3a-a5a8-cf502defc008', 'bn_count_tickets_waiting', 8, 0, 4, 2, '{\"color\":\"#ffcb7d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(62, 4, 'bn_count_tickets_assigned_d3d2f697-52b4-435e-9030-a760dd649085', 'bn_count_tickets_assigned', 12, 0, 4, 2, '{\"color\":\"#eaf4f7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(63, 4, 'bn_count_tickets_planned_0c7f3569-c23b-4ee3-8e85-279229b23e70', 'bn_count_tickets_planned', 16, 0, 4, 2, '{\"color\":\"#6298d5\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(64, 4, 'bn_count_tickets_solved_ae2406cf-e8e8-410b-b355-46e3f5705ee8', 'bn_count_tickets_solved', 20, 0, 4, 2, '{\"color\":\"#d7d7d7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_dashboards_rights`
--

CREATE TABLE `glpi_dashboards_rights` (
  `id` int(10) UNSIGNED NOT NULL,
  `dashboards_dashboards_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_databaseinstancecategories`
--

CREATE TABLE `glpi_databaseinstancecategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_databaseinstances`
--

CREATE TABLE `glpi_databaseinstances` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(10) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `databaseinstancetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `databaseinstancecategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_onbackup` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_lastboot` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_databaseinstancetypes`
--

CREATE TABLE `glpi_databaseinstancetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_databases`
--

CREATE TABLE `glpi_databases` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `databaseinstances_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_onbackup` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_datacenters`
--

CREATE TABLE `glpi_datacenters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_dcrooms`
--

CREATE TABLE `glpi_dcrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vis_cols` int(11) DEFAULT NULL,
  `vis_rows` int(11) DEFAULT NULL,
  `blueprint` text DEFAULT NULL,
  `datacenters_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicebatteries`
--

CREATE TABLE `glpi_devicebatteries` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `voltage` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `devicebatterytypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicebatterymodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicebatterymodels`
--

CREATE TABLE `glpi_devicebatterymodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicebatterytypes`
--

CREATE TABLE `glpi_devicebatterytypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecameramodels`
--

CREATE TABLE `glpi_devicecameramodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecameras`
--

CREATE TABLE `glpi_devicecameras` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `flashunit` tinyint(4) NOT NULL DEFAULT 0,
  `lensfacing` varchar(255) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `focallength` varchar(255) DEFAULT NULL,
  `sensorsize` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecameramodels_id` int(10) UNSIGNED DEFAULT NULL,
  `support` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecasemodels`
--

CREATE TABLE `glpi_devicecasemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecases`
--

CREATE TABLE `glpi_devicecases` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `devicecasetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecasemodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecasetypes`
--

CREATE TABLE `glpi_devicecasetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecontrolmodels`
--

CREATE TABLE `glpi_devicecontrolmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicecontrols`
--

CREATE TABLE `glpi_devicecontrols` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `is_raid` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecontrolmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicedrivemodels`
--

CREATE TABLE `glpi_devicedrivemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicedrives`
--

CREATE TABLE `glpi_devicedrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `is_writer` tinyint(4) NOT NULL DEFAULT 1,
  `speed` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicedrivemodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicefirmwaremodels`
--

CREATE TABLE `glpi_devicefirmwaremodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicefirmwares`
--

CREATE TABLE `glpi_devicefirmwares` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `devicefirmwaretypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicefirmwaremodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicefirmwaretypes`
--

CREATE TABLE `glpi_devicefirmwaretypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_devicefirmwaretypes`
--

INSERT INTO `glpi_devicefirmwaretypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'BIOS', NULL, NULL, NULL),
(2, 'UEFI', NULL, NULL, NULL),
(3, 'Firmware', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicegenericmodels`
--

CREATE TABLE `glpi_devicegenericmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicegenerics`
--

CREATE TABLE `glpi_devicegenerics` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `devicegenerictypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `devicegenericmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicegenerictypes`
--

CREATE TABLE `glpi_devicegenerictypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicegraphiccardmodels`
--

CREATE TABLE `glpi_devicegraphiccardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicegraphiccards`
--

CREATE TABLE `glpi_devicegraphiccards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `memory_default` int(11) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicegraphiccardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_deviceharddrivemodels`
--

CREATE TABLE `glpi_deviceharddrivemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_deviceharddrives`
--

CREATE TABLE `glpi_deviceharddrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `rpm` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cache` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `capacity_default` int(11) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `deviceharddrivemodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicememories`
--

CREATE TABLE `glpi_devicememories` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size_default` int(11) NOT NULL DEFAULT 0,
  `devicememorytypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicememorymodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicememorymodels`
--

CREATE TABLE `glpi_devicememorymodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicememorytypes`
--

CREATE TABLE `glpi_devicememorytypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_devicememorytypes`
--

INSERT INTO `glpi_devicememorytypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'EDO', NULL, NULL, NULL),
(2, 'DDR', NULL, NULL, NULL),
(3, 'SDRAM', NULL, NULL, NULL),
(4, 'SDRAM-2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicemotherboardmodels`
--

CREATE TABLE `glpi_devicemotherboardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicemotherboards`
--

CREATE TABLE `glpi_devicemotherboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicemotherboardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicenetworkcardmodels`
--

CREATE TABLE `glpi_devicenetworkcardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicenetworkcards`
--

CREATE TABLE `glpi_devicenetworkcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `bandwidth` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mac_default` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicenetworkcardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicepcimodels`
--

CREATE TABLE `glpi_devicepcimodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicepcis`
--

CREATE TABLE `glpi_devicepcis` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `devicenetworkcardmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicepcimodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicepowersupplies`
--

CREATE TABLE `glpi_devicepowersupplies` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `is_atx` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicepowersupplymodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicepowersupplymodels`
--

CREATE TABLE `glpi_devicepowersupplymodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_deviceprocessormodels`
--

CREATE TABLE `glpi_deviceprocessormodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_deviceprocessors`
--

CREATE TABLE `glpi_deviceprocessors` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `frequency_default` int(11) NOT NULL DEFAULT 0,
  `nbcores_default` int(11) DEFAULT NULL,
  `nbthreads_default` int(11) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `deviceprocessormodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesensormodels`
--

CREATE TABLE `glpi_devicesensormodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesensors`
--

CREATE TABLE `glpi_devicesensors` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `devicesensortypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `devicesensormodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesensortypes`
--

CREATE TABLE `glpi_devicesensortypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesimcards`
--

CREATE TABLE `glpi_devicesimcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `voltage` int(11) DEFAULT NULL,
  `devicesimcardtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_voip` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesimcardtypes`
--

CREATE TABLE `glpi_devicesimcardtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_devicesimcardtypes`
--

INSERT INTO `glpi_devicesimcardtypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'Full SIM', NULL, NULL, NULL),
(2, 'Mini SIM', NULL, NULL, NULL),
(3, 'Micro SIM', NULL, NULL, NULL),
(4, 'Nano SIM', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesoundcardmodels`
--

CREATE TABLE `glpi_devicesoundcardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_devicesoundcards`
--

CREATE TABLE `glpi_devicesoundcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicesoundcardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_displaypreferences`
--

CREATE TABLE `glpi_displaypreferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_displaypreferences`
--

INSERT INTO `glpi_displaypreferences` (`id`, `itemtype`, `num`, `rank`, `users_id`) VALUES
(1, 'Computer', 4, 4, 0),
(2, 'Computer', 45, 6, 0),
(3, 'Computer', 40, 5, 0),
(4, 'Computer', 5, 3, 0),
(5, 'Computer', 23, 2, 0),
(6, 'DocumentType', 3, 1, 0),
(7, 'Monitor', 31, 1, 0),
(8, 'Monitor', 23, 2, 0),
(9, 'Monitor', 3, 3, 0),
(10, 'Monitor', 4, 4, 0),
(11, 'Printer', 31, 1, 0),
(12, 'NetworkEquipment', 31, 1, 0),
(13, 'NetworkEquipment', 23, 2, 0),
(14, 'Printer', 23, 2, 0),
(15, 'Printer', 3, 3, 0),
(16, 'Software', 4, 3, 0),
(17, 'Software', 5, 2, 0),
(18, 'Software', 23, 1, 0),
(19, 'CartridgeItem', 4, 2, 0),
(20, 'CartridgeItem', 34, 1, 0),
(21, 'Peripheral', 3, 3, 0),
(22, 'Peripheral', 23, 2, 0),
(23, 'Peripheral', 31, 1, 0),
(24, 'Computer', 31, 1, 0),
(25, 'Computer', 3, 7, 0),
(26, 'Computer', 19, 8, 0),
(27, 'Computer', 17, 9, 0),
(28, 'NetworkEquipment', 3, 3, 0),
(29, 'NetworkEquipment', 4, 4, 0),
(30, 'NetworkEquipment', 11, 6, 0),
(31, 'NetworkEquipment', 19, 7, 0),
(32, 'Printer', 4, 4, 0),
(33, 'Printer', 19, 6, 0),
(34, 'Monitor', 19, 6, 0),
(35, 'Monitor', 7, 7, 0),
(36, 'Peripheral', 4, 4, 0),
(37, 'Peripheral', 19, 6, 0),
(38, 'Peripheral', 7, 7, 0),
(39, 'Contact', 3, 1, 0),
(40, 'Contact', 4, 2, 0),
(41, 'Contact', 5, 3, 0),
(42, 'Contact', 6, 4, 0),
(43, 'Contact', 9, 5, 0),
(44, 'Supplier', 9, 1, 0),
(45, 'Supplier', 3, 2, 0),
(46, 'Supplier', 4, 3, 0),
(47, 'Supplier', 5, 4, 0),
(48, 'Supplier', 10, 5, 0),
(49, 'Supplier', 6, 6, 0),
(50, 'Contract', 4, 1, 0),
(51, 'Contract', 3, 2, 0),
(52, 'Contract', 5, 3, 0),
(53, 'Contract', 6, 4, 0),
(54, 'Contract', 7, 5, 0),
(55, 'Contract', 11, 6, 0),
(56, 'CartridgeItem', 23, 3, 0),
(57, 'CartridgeItem', 3, 4, 0),
(58, 'DocumentType', 6, 2, 0),
(59, 'DocumentType', 4, 3, 0),
(60, 'DocumentType', 5, 4, 0),
(61, 'Document', 3, 1, 0),
(62, 'Document', 4, 2, 0),
(63, 'Document', 7, 3, 0),
(64, 'Document', 5, 4, 0),
(65, 'Document', 16, 5, 0),
(66, 'User', 34, 1, 0),
(67, 'User', 5, 3, 0),
(68, 'User', 6, 4, 0),
(69, 'User', 3, 5, 0),
(70, 'ConsumableItem', 34, 1, 0),
(71, 'ConsumableItem', 4, 2, 0),
(72, 'ConsumableItem', 23, 3, 0),
(73, 'ConsumableItem', 3, 4, 0),
(74, 'NetworkEquipment', 40, 5, 0),
(75, 'Printer', 40, 5, 0),
(76, 'Monitor', 40, 5, 0),
(77, 'Peripheral', 40, 5, 0),
(78, 'User', 8, 6, 0),
(79, 'Phone', 31, 1, 0),
(80, 'Phone', 23, 2, 0),
(81, 'Phone', 3, 3, 0),
(82, 'Phone', 4, 4, 0),
(83, 'Phone', 40, 5, 0),
(84, 'Phone', 19, 6, 0),
(85, 'Phone', 7, 7, 0),
(86, 'Group', 16, 1, 0),
(87, 'AllAssets', 31, 1, 0),
(88, 'ReservationItem', 4, 1, 0),
(89, 'ReservationItem', 3, 2, 0),
(90, 'Budget', 3, 2, 0),
(91, 'Software', 72, 4, 0),
(92, 'Software', 163, 5, 0),
(93, 'Budget', 5, 1, 0),
(94, 'Budget', 4, 3, 0),
(95, 'Budget', 19, 4, 0),
(96, 'CronTask', 8, 1, 0),
(97, 'CronTask', 3, 2, 0),
(98, 'CronTask', 4, 3, 0),
(99, 'CronTask', 7, 4, 0),
(100, 'RequestType', 14, 1, 0),
(101, 'RequestType', 15, 2, 0),
(102, 'NotificationTemplate', 4, 1, 0),
(103, 'NotificationTemplate', 16, 2, 0),
(104, 'Notification', 5, 1, 0),
(105, 'Notification', 6, 2, 0),
(106, 'Notification', 2, 3, 0),
(107, 'Notification', 4, 4, 0),
(108, 'Notification', 80, 5, 0),
(109, 'Notification', 86, 6, 0),
(110, 'MailCollector', 2, 1, 0),
(111, 'MailCollector', 19, 2, 0),
(112, 'AuthLDAP', 3, 1, 0),
(113, 'AuthLDAP', 19, 2, 0),
(114, 'AuthMail', 3, 1, 0),
(115, 'AuthMail', 19, 2, 0),
(116, 'IPNetwork', 18, 1, 0),
(117, 'WifiNetwork', 10, 1, 0),
(118, 'Profile', 2, 1, 0),
(119, 'Profile', 3, 2, 0),
(120, 'Profile', 19, 3, 0),
(121, 'Transfer', 19, 1, 0),
(122, 'TicketValidation', 3, 1, 0),
(123, 'TicketValidation', 2, 2, 0),
(124, 'TicketValidation', 8, 3, 0),
(125, 'TicketValidation', 4, 4, 0),
(126, 'TicketValidation', 9, 5, 0),
(127, 'TicketValidation', 7, 6, 0),
(128, 'NotImportedEmail', 2, 1, 0),
(129, 'NotImportedEmail', 5, 2, 0),
(130, 'NotImportedEmail', 4, 3, 0),
(131, 'NotImportedEmail', 6, 4, 0),
(132, 'NotImportedEmail', 16, 5, 0),
(133, 'NotImportedEmail', 19, 6, 0),
(134, 'RuleRightParameter', 11, 1, 0),
(135, 'Ticket', 12, 1, 0),
(136, 'Ticket', 19, 2, 0),
(137, 'Ticket', 15, 3, 0),
(138, 'Ticket', 3, 4, 0),
(139, 'Ticket', 4, 5, 0),
(140, 'Ticket', 5, 6, 0),
(141, 'Ticket', 7, 7, 0),
(142, 'Calendar', 19, 1, 0),
(143, 'Holiday', 11, 1, 0),
(144, 'Holiday', 12, 2, 0),
(145, 'Holiday', 13, 3, 0),
(146, 'SLA', 4, 1, 0),
(147, 'Ticket', 18, 8, 0),
(148, 'AuthLDAP', 30, 3, 0),
(149, 'AuthMail', 6, 3, 0),
(150, 'FQDN', 11, 1, 0),
(151, 'FieldUnicity', 1, 1, 0),
(152, 'FieldUnicity', 80, 2, 0),
(153, 'FieldUnicity', 4, 3, 0),
(154, 'FieldUnicity', 3, 4, 0),
(155, 'FieldUnicity', 86, 5, 0),
(156, 'FieldUnicity', 30, 6, 0),
(157, 'Problem', 21, 1, 0),
(158, 'Problem', 12, 2, 0),
(159, 'Problem', 19, 3, 0),
(160, 'Problem', 15, 4, 0),
(161, 'Problem', 3, 5, 0),
(162, 'Problem', 7, 6, 0),
(163, 'Problem', 18, 7, 0),
(164, 'Vlan', 11, 1, 0),
(165, 'TicketRecurrent', 11, 1, 0),
(166, 'TicketRecurrent', 12, 2, 0),
(167, 'TicketRecurrent', 13, 3, 0),
(168, 'TicketRecurrent', 15, 4, 0),
(169, 'TicketRecurrent', 14, 5, 0),
(170, 'Reminder', 2, 1, 0),
(171, 'Reminder', 3, 2, 0),
(172, 'Reminder', 4, 3, 0),
(173, 'Reminder', 5, 4, 0),
(174, 'Reminder', 6, 5, 0),
(175, 'Reminder', 7, 6, 0),
(176, 'IPNetwork', 10, 2, 0),
(177, 'IPNetwork', 11, 3, 0),
(178, 'IPNetwork', 12, 4, 0),
(179, 'IPNetwork', 17, 5, 0),
(180, 'NetworkName', 12, 1, 0),
(181, 'NetworkName', 13, 2, 0),
(182, 'RSSFeed', 2, 1, 0),
(183, 'RSSFeed', 4, 2, 0),
(184, 'RSSFeed', 5, 3, 0),
(185, 'RSSFeed', 19, 4, 0),
(186, 'RSSFeed', 6, 5, 0),
(187, 'RSSFeed', 7, 6, 0),
(188, 'Blacklist', 12, 1, 0),
(189, 'Blacklist', 11, 2, 0),
(190, 'ReservationItem', 5, 3, 0),
(191, 'QueuedNotification', 16, 1, 0),
(192, 'QueuedNotification', 7, 2, 0),
(193, 'QueuedNotification', 20, 3, 0),
(194, 'QueuedNotification', 21, 4, 0),
(195, 'QueuedNotification', 22, 5, 0),
(196, 'QueuedNotification', 15, 6, 0),
(197, 'Change', 12, 1, 0),
(198, 'Change', 19, 2, 0),
(199, 'Change', 15, 3, 0),
(200, 'Change', 7, 4, 0),
(201, 'Change', 18, 5, 0),
(202, 'Project', 3, 1, 0),
(203, 'Project', 4, 2, 0),
(204, 'Project', 12, 3, 0),
(205, 'Project', 5, 4, 0),
(206, 'Project', 15, 5, 0),
(207, 'Project', 21, 6, 0),
(208, 'ProjectState', 12, 1, 0),
(209, 'ProjectState', 11, 2, 0),
(210, 'ProjectTask', 2, 1, 0),
(211, 'ProjectTask', 12, 2, 0),
(212, 'ProjectTask', 14, 3, 0),
(213, 'ProjectTask', 5, 4, 0),
(214, 'ProjectTask', 7, 5, 0),
(215, 'ProjectTask', 8, 6, 0),
(216, 'ProjectTask', 13, 7, 0),
(217, 'CartridgeItem', 9, 5, 0),
(218, 'ConsumableItem', 9, 5, 0),
(219, 'ReservationItem', 9, 4, 0),
(220, 'SoftwareLicense', 1, 1, 0),
(221, 'SoftwareLicense', 3, 2, 0),
(222, 'SoftwareLicense', 10, 3, 0),
(223, 'SoftwareLicense', 162, 4, 0),
(224, 'SoftwareLicense', 5, 5, 0),
(225, 'SavedSearch', 8, 1, 0),
(226, 'SavedSearch', 9, 1, 0),
(227, 'SavedSearch', 3, 1, 0),
(228, 'SavedSearch', 10, 1, 0),
(229, 'SavedSearch', 11, 1, 0),
(230, 'Plugin', 2, 1, 0),
(231, 'Plugin', 3, 2, 0),
(232, 'Plugin', 4, 3, 0),
(233, 'Plugin', 5, 4, 0),
(234, 'Plugin', 6, 5, 0),
(235, 'Plugin', 7, 6, 0),
(236, 'Plugin', 8, 7, 0),
(237, 'Cluster', 31, 1, 0),
(238, 'Cluster', 19, 2, 0),
(239, 'Domain', 3, 1, 0),
(240, 'Domain', 4, 2, 0),
(241, 'Domain', 2, 3, 0),
(242, 'Domain', 6, 4, 0),
(243, 'Domain', 7, 5, 0),
(244, 'DomainRecord', 2, 1, 0),
(245, 'DomainRecord', 3, 2, 0),
(246, 'Appliance', 2, 1, 0),
(247, 'Appliance', 3, 2, 0),
(248, 'Appliance', 4, 3, 0),
(249, 'Appliance', 5, 4, 0),
(250, 'Lockedfield', 3, 1, 0),
(251, 'Lockedfield', 13, 2, 0),
(252, 'Lockedfield', 5, 3, 0),
(253, 'Unmanaged', 2, 1, 0),
(254, 'Unmanaged', 4, 2, 0),
(255, 'Unmanaged', 3, 3, 0),
(256, 'Unmanaged', 5, 4, 0),
(257, 'Unmanaged', 7, 5, 0),
(258, 'Unmanaged', 10, 6, 0),
(259, 'Unmanaged', 18, 7, 0),
(260, 'Unmanaged', 14, 8, 0),
(261, 'Unmanaged', 15, 9, 0),
(262, 'Unmanaged', 9, 10, 0),
(263, 'NetworkPortType', 10, 1, 0),
(264, 'NetworkPortType', 11, 2, 0),
(265, 'NetworkPortType', 12, 3, 0),
(266, 'NetworkPort', 3, 1, 0),
(267, 'NetworkPort', 30, 2, 0),
(268, 'NetworkPort', 31, 3, 0),
(269, 'NetworkPort', 32, 4, 0),
(270, 'NetworkPort', 33, 5, 0),
(271, 'NetworkPort', 34, 6, 0),
(272, 'NetworkPort', 35, 7, 0),
(273, 'NetworkPort', 36, 8, 0),
(274, 'NetworkPort', 38, 9, 0),
(275, 'NetworkPort', 39, 10, 0),
(276, 'NetworkPort', 40, 11, 0),
(277, 'NetworkPort', 6, 12, 0),
(278, 'USBVendor', 10, 1, 0),
(279, 'USBVendor', 11, 2, 0),
(280, 'PCIVendor', 10, 1, 0),
(281, 'PCIVendor', 11, 2, 0),
(282, 'Agent', 2, 1, 0),
(283, 'Agent', 4, 2, 0),
(284, 'Agent', 10, 3, 0),
(285, 'Agent', 8, 4, 0),
(286, 'Agent', 11, 5, 0),
(287, 'Agent', 6, 6, 0),
(288, 'Agent', 15, 7, 0),
(289, 'Database', 2, 1, 0),
(290, 'Database', 3, 2, 0),
(291, 'Database', 6, 3, 0),
(292, 'Database', 9, 4, 0),
(293, 'Database', 10, 5, 0),
(294, 'Glpi\\Socket', 5, 1, 0),
(295, 'Glpi\\Socket', 6, 2, 0),
(296, 'Glpi\\Socket', 9, 3, 0),
(297, 'Glpi\\Socket', 8, 4, 0),
(298, 'Glpi\\Socket', 7, 5, 0),
(299, 'Cable', 4, 1, 0),
(300, 'Cable', 31, 2, 0),
(301, 'Cable', 6, 3, 0),
(302, 'Cable', 15, 4, 0),
(303, 'Cable', 24, 5, 0),
(304, 'Cable', 8, 6, 0),
(305, 'Cable', 10, 7, 0),
(306, 'Cable', 13, 8, 0),
(307, 'Cable', 14, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_documentcategories`
--

CREATE TABLE `glpi_documentcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `documentcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_documents`
--

CREATE TABLE `glpi_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sha1sum` char(40) DEFAULT NULL,
  `is_blacklisted` tinyint(4) NOT NULL DEFAULT 0,
  `tag` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_documents_items`
--

CREATE TABLE `glpi_documents_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `documents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_documenttypes`
--

CREATE TABLE `glpi_documenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `is_uploadable` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_documenttypes`
--

INSERT INTO `glpi_documenttypes` (`id`, `name`, `ext`, `icon`, `mime`, `is_uploadable`, `date_mod`, `comment`, `date_creation`) VALUES
(1, 'JPEG', 'jpg', 'jpg-dist.png', NULL, 1, NULL, NULL, NULL),
(2, 'PNG', 'png', 'png-dist.png', NULL, 1, NULL, NULL, NULL),
(3, 'GIF', 'gif', 'gif-dist.png', NULL, 1, NULL, NULL, NULL),
(4, 'BMP', 'bmp', 'bmp-dist.png', NULL, 1, NULL, NULL, NULL),
(5, 'Photoshop', 'psd', 'psd-dist.png', NULL, 1, NULL, NULL, NULL),
(6, 'TIFF', 'tif', 'tif-dist.png', NULL, 1, NULL, NULL, NULL),
(7, 'AIFF', 'aiff', 'aiff-dist.png', NULL, 1, NULL, NULL, NULL),
(8, 'Windows Media', 'asf', 'asf-dist.png', NULL, 1, NULL, NULL, NULL),
(9, 'Windows Media', 'avi', 'avi-dist.png', NULL, 1, NULL, NULL, NULL),
(10, 'BZip', 'bz2', 'bz2-dist.png', NULL, 1, NULL, NULL, NULL),
(11, 'Word', 'doc', 'doc-dist.png', NULL, 1, NULL, NULL, NULL),
(12, 'DjVu', 'djvu', '', NULL, 1, NULL, NULL, NULL),
(13, 'PostScript', 'eps', 'ps-dist.png', NULL, 1, NULL, NULL, NULL),
(14, 'GZ', 'gz', 'gz-dist.png', NULL, 1, NULL, NULL, NULL),
(15, 'HTML', 'html', 'html-dist.png', NULL, 1, NULL, NULL, NULL),
(16, 'Midi', 'mid', 'mid-dist.png', NULL, 1, NULL, NULL, NULL),
(17, 'QuickTime', 'mov', 'mov-dist.png', NULL, 1, NULL, NULL, NULL),
(18, 'MP3', 'mp3', 'mp3-dist.png', NULL, 1, NULL, NULL, NULL),
(19, 'MPEG', 'mpg', 'mpg-dist.png', NULL, 1, NULL, NULL, NULL),
(20, 'Ogg Vorbis', 'ogg', 'ogg-dist.png', NULL, 1, NULL, NULL, NULL),
(21, 'PDF', 'pdf', 'pdf-dist.png', NULL, 1, NULL, NULL, NULL),
(22, 'PowerPoint', 'ppt', 'ppt-dist.png', NULL, 1, NULL, NULL, NULL),
(23, 'PostScript', 'ps', 'ps-dist.png', NULL, 1, NULL, NULL, NULL),
(24, 'QuickTime', 'qt', 'qt-dist.png', NULL, 1, NULL, NULL, NULL),
(25, 'RealAudio', 'ra', 'ra-dist.png', NULL, 1, NULL, NULL, NULL),
(26, 'RealAudio', 'ram', 'ram-dist.png', NULL, 1, NULL, NULL, NULL),
(27, 'RealAudio', 'rm', 'rm-dist.png', NULL, 1, NULL, NULL, NULL),
(28, 'RTF', 'rtf', 'rtf-dist.png', NULL, 1, NULL, NULL, NULL),
(29, 'StarOffice', 'sdd', 'sdd-dist.png', NULL, 1, NULL, NULL, NULL),
(30, 'StarOffice', 'sdw', 'sdw-dist.png', NULL, 1, NULL, NULL, NULL),
(31, 'Stuffit', 'sit', 'sit-dist.png', NULL, 1, NULL, NULL, NULL),
(32, 'OpenOffice Impress', 'sxi', 'sxi-dist.png', NULL, 1, NULL, NULL, NULL),
(33, 'OpenOffice', 'sxw', 'sxw-dist.png', NULL, 1, NULL, NULL, NULL),
(34, 'Flash', 'swf', 'swf-dist.png', NULL, 1, NULL, NULL, NULL),
(35, 'TGZ', 'tgz', 'tgz-dist.png', NULL, 1, NULL, NULL, NULL),
(36, 'texte', 'txt', 'txt-dist.png', NULL, 1, NULL, NULL, NULL),
(37, 'WAV', 'wav', 'wav-dist.png', NULL, 1, NULL, NULL, NULL),
(38, 'Excel', 'xls', 'xls-dist.png', NULL, 1, NULL, NULL, NULL),
(39, 'XML', 'xml', 'xml-dist.png', NULL, 1, NULL, NULL, NULL),
(40, 'Windows Media', 'wmv', 'wmv-dist.png', NULL, 1, NULL, NULL, NULL),
(41, 'Zip', 'zip', 'zip-dist.png', NULL, 1, NULL, NULL, NULL),
(42, 'MNG', 'mng', '', NULL, 1, NULL, NULL, NULL),
(43, 'Adobe Illustrator', 'ai', 'ai-dist.png', NULL, 1, NULL, NULL, NULL),
(44, 'C source', 'c', 'c-dist.png', NULL, 1, NULL, NULL, NULL),
(45, 'Debian', 'deb', 'deb-dist.png', NULL, 1, NULL, NULL, NULL),
(46, 'DVI', 'dvi', 'dvi-dist.png', NULL, 1, NULL, NULL, NULL),
(47, 'C header', 'h', 'h-dist.png', NULL, 1, NULL, NULL, NULL),
(48, 'Pascal', 'pas', 'pas-dist.png', NULL, 1, NULL, NULL, NULL),
(49, 'RedHat/Mandrake/SuSE', 'rpm', 'rpm-dist.png', NULL, 1, NULL, NULL, NULL),
(50, 'OpenOffice Calc', 'sxc', 'sxc-dist.png', NULL, 1, NULL, NULL, NULL),
(51, 'LaTeX', 'tex', 'tex-dist.png', NULL, 1, NULL, NULL, NULL),
(52, 'GIMP multi-layer', 'xcf', 'xcf-dist.png', NULL, 1, NULL, NULL, NULL),
(53, 'JPEG', 'jpeg', 'jpg-dist.png', NULL, 1, NULL, NULL, NULL),
(54, 'Oasis Open Office Writer', 'odt', 'odt-dist.png', NULL, 1, NULL, NULL, NULL),
(55, 'Oasis Open Office Calc', 'ods', 'ods-dist.png', NULL, 1, NULL, NULL, NULL),
(56, 'Oasis Open Office Impress', 'odp', 'odp-dist.png', NULL, 1, NULL, NULL, NULL),
(57, 'Oasis Open Office Impress Template', 'otp', 'odp-dist.png', NULL, 1, NULL, NULL, NULL),
(58, 'Oasis Open Office Writer Template', 'ott', 'odt-dist.png', NULL, 1, NULL, NULL, NULL),
(59, 'Oasis Open Office Calc Template', 'ots', 'ods-dist.png', NULL, 1, NULL, NULL, NULL),
(60, 'Oasis Open Office Math', 'odf', 'odf-dist.png', NULL, 1, NULL, NULL, NULL),
(61, 'Oasis Open Office Draw', 'odg', 'odg-dist.png', NULL, 1, NULL, NULL, NULL),
(62, 'Oasis Open Office Draw Template', 'otg', 'odg-dist.png', NULL, 1, NULL, NULL, NULL),
(63, 'Oasis Open Office Base', 'odb', 'odb-dist.png', NULL, 1, NULL, NULL, NULL),
(64, 'Oasis Open Office HTML', 'oth', 'oth-dist.png', NULL, 1, NULL, NULL, NULL),
(65, 'Oasis Open Office Writer Master', 'odm', 'odm-dist.png', NULL, 1, NULL, NULL, NULL),
(66, 'Oasis Open Office Chart', 'odc', '', NULL, 1, NULL, NULL, NULL),
(67, 'Oasis Open Office Image', 'odi', '', NULL, 1, NULL, NULL, NULL),
(68, 'Word XML', 'docx', 'doc-dist.png', NULL, 1, NULL, NULL, NULL),
(69, 'Excel XML', 'xlsx', 'xls-dist.png', NULL, 1, NULL, NULL, NULL),
(70, 'PowerPoint XML', 'pptx', 'ppt-dist.png', NULL, 1, NULL, NULL, NULL),
(71, 'Comma-Separated Values', 'csv', 'csv-dist.png', NULL, 1, NULL, NULL, NULL),
(72, 'Scalable Vector Graphics', 'svg', 'svg-dist.png', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_domainrecords`
--

CREATE TABLE `glpi_domainrecords` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `data_obj` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `domains_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `domainrecordtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ttl` int(11) NOT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_domainrecordtypes`
--

CREATE TABLE `glpi_domainrecordtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_domainrecordtypes`
--

INSERT INTO `glpi_domainrecordtypes` (`id`, `name`, `fields`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'A', '[]', 0, 1, 'Host address'),
(2, 'AAAA', '[]', 0, 1, 'IPv6 host address'),
(3, 'ALIAS', '[]', 0, 1, 'Auto resolved alias'),
(4, 'CNAME', '[{\"key\":\"target\",\"label\":\"Target\",\"placeholder\":\"sip.example.com.\",\"is_fqdn\":true}]', 0, 1, 'Canonical name for an alias'),
(5, 'MX', '[{\"key\":\"priority\",\"label\":\"Priority\",\"placeholder\":\"10\"},{\"key\":\"server\",\"label\":\"Server\",\"placeholder\":\"mail.example.com.\",\"is_fqdn\":true}]', 0, 1, 'Mail eXchange'),
(6, 'NS', '[]', 0, 1, 'Name Server'),
(7, 'PTR', '[]', 0, 1, 'Pointer'),
(8, 'SOA', '[{\"key\":\"primary_name_server\",\"label\":\"Primary name server\",\"placeholder\":\"ns1.example.com.\",\"is_fqdn\":true},{\"key\":\"primary_contact\",\"label\":\"Primary contact\",\"placeholder\":\"admin.example.com.\",\"is_fqdn\":true},{\"key\":\"serial\",\"label\":\"Serial\",\"placeholder\":\"2020010101\"},{\"key\":\"zone_refresh_timer\",\"label\":\"Zone refresh timer\",\"placeholder\":\"86400\"},{\"key\":\"failed_refresh_retry_timer\",\"label\":\"Failed refresh retry timer\",\"placeholder\":\"7200\"},{\"key\":\"zone_expiry_timer\",\"label\":\"Zone expiry timer\",\"placeholder\":\"1209600\"},{\"key\":\"minimum_ttl\",\"label\":\"Minimum TTL\",\"placeholder\":\"300\"}]', 0, 1, 'Start Of Authority'),
(9, 'SRV', '[{\"key\":\"priority\",\"label\":\"Priority\",\"placeholder\":\"0\"},{\"key\":\"weight\",\"label\":\"Weight\",\"placeholder\":\"10\"},{\"key\":\"port\",\"label\":\"Port\",\"placeholder\":\"5060\"},{\"key\":\"target\",\"label\":\"Target\",\"placeholder\":\"sip.example.com.\",\"is_fqdn\":true}]', 0, 1, 'Location of service'),
(10, 'TXT', '[{\"key\":\"data\",\"label\":\"TXT record data\",\"placeholder\":\"Your TXT record data\",\"quote_value\":true}]', 0, 1, 'Descriptive text'),
(11, 'CAA', '[{\"key\":\"flag\",\"label\":\"Flag\",\"placeholder\":\"0\"},{\"key\":\"tag\",\"label\":\"Tag\",\"placeholder\":\"issue\"},{\"key\":\"value\",\"label\":\"Value\",\"placeholder\":\"letsencrypt.org\",\"quote_value\":true}]', 0, 1, 'Certification Authority Authorization');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_domainrelations`
--

CREATE TABLE `glpi_domainrelations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_domainrelations`
--

INSERT INTO `glpi_domainrelations` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Belongs', 0, 1, 'Item belongs to domain'),
(2, 'Manage', 0, 1, 'Item manages domain');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_domains`
--

CREATE TABLE `glpi_domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `domaintypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_domaincreation` timestamp NULL DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_domains_items`
--

CREATE TABLE `glpi_domains_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `domains_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `domainrelations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_domaintypes`
--

CREATE TABLE `glpi_domaintypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_dropdowntranslations`
--

CREATE TABLE `glpi_dropdowntranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_enclosuremodels`
--

CREATE TABLE `glpi_enclosuremodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_enclosures`
--

CREATE TABLE `glpi_enclosures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `enclosuremodels_id` int(10) UNSIGNED DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `orientation` tinyint(4) DEFAULT NULL,
  `power_supplies` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_entities`
--

CREATE TABLE `glpi_entities` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED DEFAULT 0,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `sons_cache` longtext DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_email_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_email_name` varchar(255) DEFAULT NULL,
  `noreply_email` varchar(255) DEFAULT NULL,
  `noreply_email_name` varchar(255) DEFAULT NULL,
  `replyto_email` varchar(255) DEFAULT NULL,
  `replyto_email_name` varchar(255) DEFAULT NULL,
  `notification_subject_tag` varchar(255) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `authldaps_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mail_domain` varchar(255) DEFAULT NULL,
  `entity_ldapfilter` text DEFAULT NULL,
  `mailing_signature` text DEFAULT NULL,
  `cartridges_alert_repeat` int(11) NOT NULL DEFAULT -2,
  `consumables_alert_repeat` int(11) NOT NULL DEFAULT -2,
  `use_licenses_alert` int(11) NOT NULL DEFAULT -2,
  `send_licenses_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_certificates_alert` int(11) NOT NULL DEFAULT -2,
  `send_certificates_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `certificates_alert_repeat_interval` int(11) NOT NULL DEFAULT -2,
  `use_contracts_alert` int(11) NOT NULL DEFAULT -2,
  `send_contracts_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_infocoms_alert` int(11) NOT NULL DEFAULT -2,
  `send_infocoms_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_reservations_alert` int(11) NOT NULL DEFAULT -2,
  `use_domains_alert` int(11) NOT NULL DEFAULT -2,
  `send_domains_alert_close_expiries_delay` int(11) NOT NULL DEFAULT -2,
  `send_domains_alert_expired_delay` int(11) NOT NULL DEFAULT -2,
  `autoclose_delay` int(11) NOT NULL DEFAULT -2,
  `autopurge_delay` int(11) NOT NULL DEFAULT -10,
  `notclosed_delay` int(11) NOT NULL DEFAULT -2,
  `calendars_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `auto_assign_mode` int(11) NOT NULL DEFAULT -2,
  `tickettype` int(11) NOT NULL DEFAULT -2,
  `max_closedate` timestamp NULL DEFAULT NULL,
  `inquest_config` int(11) NOT NULL DEFAULT -2,
  `inquest_rate` int(11) NOT NULL DEFAULT 0,
  `inquest_delay` int(11) NOT NULL DEFAULT -10,
  `inquest_URL` varchar(255) DEFAULT NULL,
  `autofill_warranty_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) NOT NULL DEFAULT '-2',
  `tickettemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changetemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problemtemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_strategy_software` tinyint(4) NOT NULL DEFAULT -2,
  `entities_id_software` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default_contract_alert` int(11) NOT NULL DEFAULT -2,
  `default_infocom_alert` int(11) NOT NULL DEFAULT -2,
  `default_cartridges_alarm_threshold` int(11) NOT NULL DEFAULT -2,
  `default_consumables_alarm_threshold` int(11) NOT NULL DEFAULT -2,
  `delay_send_emails` int(11) NOT NULL DEFAULT -2,
  `is_notif_enable_default` int(11) NOT NULL DEFAULT -2,
  `inquest_duration` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autofill_decommission_date` varchar(255) NOT NULL DEFAULT '-2',
  `suppliers_as_private` int(11) NOT NULL DEFAULT -2,
  `anonymize_support_agents` int(11) NOT NULL DEFAULT -2,
  `display_users_initials` int(11) NOT NULL DEFAULT -2,
  `contracts_strategy_default` tinyint(4) NOT NULL DEFAULT -2,
  `contracts_id_default` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enable_custom_css` int(11) NOT NULL DEFAULT -2,
  `custom_css_code` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `transfers_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `transfers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_base_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_entities`
--

INSERT INTO `glpi_entities` (`id`, `name`, `entities_id`, `completename`, `comment`, `level`, `sons_cache`, `ancestors_cache`, `registration_number`, `address`, `postcode`, `town`, `state`, `country`, `website`, `phonenumber`, `fax`, `email`, `admin_email`, `admin_email_name`, `from_email`, `from_email_name`, `noreply_email`, `noreply_email_name`, `replyto_email`, `replyto_email_name`, `notification_subject_tag`, `ldap_dn`, `tag`, `authldaps_id`, `mail_domain`, `entity_ldapfilter`, `mailing_signature`, `cartridges_alert_repeat`, `consumables_alert_repeat`, `use_licenses_alert`, `send_licenses_alert_before_delay`, `use_certificates_alert`, `send_certificates_alert_before_delay`, `certificates_alert_repeat_interval`, `use_contracts_alert`, `send_contracts_alert_before_delay`, `use_infocoms_alert`, `send_infocoms_alert_before_delay`, `use_reservations_alert`, `use_domains_alert`, `send_domains_alert_close_expiries_delay`, `send_domains_alert_expired_delay`, `autoclose_delay`, `autopurge_delay`, `notclosed_delay`, `calendars_strategy`, `calendars_id`, `auto_assign_mode`, `tickettype`, `max_closedate`, `inquest_config`, `inquest_rate`, `inquest_delay`, `inquest_URL`, `autofill_warranty_date`, `autofill_use_date`, `autofill_buy_date`, `autofill_delivery_date`, `autofill_order_date`, `tickettemplates_strategy`, `tickettemplates_id`, `changetemplates_strategy`, `changetemplates_id`, `problemtemplates_strategy`, `problemtemplates_id`, `entities_strategy_software`, `entities_id_software`, `default_contract_alert`, `default_infocom_alert`, `default_cartridges_alarm_threshold`, `default_consumables_alarm_threshold`, `delay_send_emails`, `is_notif_enable_default`, `inquest_duration`, `date_mod`, `date_creation`, `autofill_decommission_date`, `suppliers_as_private`, `anonymize_support_agents`, `display_users_initials`, `contracts_strategy_default`, `contracts_id_default`, `enable_custom_css`, `custom_css_code`, `latitude`, `longitude`, `altitude`, `transfers_strategy`, `transfers_id`, `agent_base_url`) VALUES
(0, 'Root Entity', NULL, 'Root Entity', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, -2, -2, -10, -10, 0, 0, 0, -10, 1, NULL, 1, 0, 0, NULL, '0', '0', '0', '0', '0', 0, 1, 0, 1, 0, 1, -10, 0, 0, 0, 10, 10, 0, 1, 0, NULL, NULL, '0', 0, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_entities_knowbaseitems`
--

CREATE TABLE `glpi_entities_knowbaseitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_entities_reminders`
--

CREATE TABLE `glpi_entities_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_entities_rssfeeds`
--

CREATE TABLE `glpi_entities_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_events`
--

CREATE TABLE `glpi_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_events`
--

INSERT INTO `glpi_events` (`id`, `items_id`, `type`, `date`, `service`, `level`, `message`) VALUES
(1, 0, 'system', '2023-11-18 08:20:50', 'login', 3, 'Failed login for  from IP 192.168.100.88'),
(2, 0, 'system', '2023-11-18 08:21:00', 'login', 3, 'glpi login from IP 192.168.100.88'),
(3, 2, 'users', '2023-11-18 08:21:11', 'setup', 5, 'glpi Updates an Item'),
(4, 2, 'APIClient', '2023-11-18 08:22:05', 'setup', 4, 'glpi adds the item SIEM'),
(5, 0, 'system', '2023-11-18 08:22:53', 'login', 3, 'glpi login from IP 172.20.0.1'),
(6, 1, 'ticket', '2023-11-18 08:24:47', 'tracking', 4, 'glpi adds the item 1'),
(7, 0, 'system', '2023-11-18 08:26:07', 'setup', 3, 'glpi edited the emails notifications configuration'),
(8, 2, 'users', '2023-11-18 08:26:45', 'setup', 5, 'glpi Updates an Item'),
(9, 2, 'ticket', '2023-11-18 08:28:44', 'tracking', 4, 'glpi adds the item 2'),
(10, 3, 'ticket', '2023-11-18 08:28:46', 'tracking', 4, 'glpi adds the item 3'),
(11, 4, 'ticket', '2023-11-18 08:28:49', 'tracking', 4, 'glpi adds the item 4'),
(12, 5, 'ticket', '2023-11-18 08:34:15', 'tracking', 4, 'glpi adds the item 5'),
(13, 6, 'ticket', '2023-11-18 08:34:16', 'tracking', 4, 'glpi adds the item 6'),
(14, 7, 'ticket', '2023-11-18 08:34:18', 'tracking', 4, 'glpi adds the item 7'),
(15, 8, 'ticket', '2023-11-18 08:45:01', 'tracking', 4, 'glpi adds the item 8'),
(16, 9, 'ticket', '2023-11-18 08:45:04', 'tracking', 4, 'glpi adds the item 9'),
(17, 10, 'ticket', '2023-11-18 08:45:06', 'tracking', 4, 'glpi adds the item 10'),
(18, 1, 'RequestType', '2023-11-18 08:53:50', 'setup', 4, 'glpi Updates an Item'),
(19, 1, 'ITILCategory', '2023-11-18 08:54:19', 'setup', 4, 'glpi adds the item Incident'),
(20, 11, 'ticket', '2023-11-18 09:47:13', 'tracking', 4, 'glpi adds the item 11'),
(21, 12, 'ticket', '2023-11-18 09:47:15', 'tracking', 4, 'glpi adds the item 12'),
(22, 13, 'ticket', '2023-11-18 09:47:16', 'tracking', 4, 'glpi adds the item 13'),
(23, 1, 'groups', '2023-11-18 09:48:36', 'setup', 4, 'glpi adds the item Security Team'),
(24, 1, 'groups', '2023-11-18 09:49:36', 'setup', 4, 'glpi adds a user to a group'),
(25, 14, 'ticket', '2023-11-18 13:11:29', 'tracking', 4, 'glpi adds the item 14'),
(26, 15, 'ticket', '2023-11-18 13:11:30', 'tracking', 4, 'glpi adds the item 15'),
(27, 0, 'system', '2023-11-18 13:15:49', 'login', 3, 'Failed login for  from IP 192.168.1.3'),
(28, 0, 'system', '2023-11-18 13:15:53', 'login', 3, 'Failed login for glpi from IP 192.168.1.3'),
(29, 0, 'system', '2023-11-18 13:15:59', 'login', 3, 'glpi login from IP 192.168.1.3'),
(30, 0, 'system', '2023-11-18 13:30:14', 'login', 3, 'glpi login from IP 192.168.1.3'),
(31, 0, 'system', '2023-11-18 13:31:08', 'setup', 3, 'glpi edited the browsers notifications configuration'),
(32, 0, 'system', '2023-11-18 13:31:16', 'setup', 3, 'glpi edited the browsers notifications configuration'),
(33, 16, 'ticket', '2023-11-18 13:33:34', 'tracking', 4, 'glpi adds the item 16'),
(34, 17, 'ticket', '2023-11-18 13:33:35', 'tracking', 4, 'glpi adds the item 17'),
(35, 18, 'ticket', '2023-11-18 13:33:36', 'tracking', 4, 'glpi adds the item 18'),
(36, 19, 'ticket', '2023-11-18 13:33:36', 'tracking', 4, 'glpi adds the item 19'),
(37, 20, 'ticket', '2023-11-18 13:33:37', 'tracking', 4, 'glpi adds the item 20'),
(38, 21, 'ticket', '2023-11-18 13:33:37', 'tracking', 4, 'glpi adds the item 21'),
(39, 0, 'system', '2023-11-18 13:34:49', 'setup', 3, 'glpi edited the browsers notifications configuration'),
(40, 0, 'system', '2023-11-18 13:35:02', 'setup', 3, 'glpi edited the browsers notifications configuration'),
(41, 22, 'ticket', '2023-11-18 13:37:07', 'tracking', 4, 'glpi adds the item 22'),
(42, 23, 'ticket', '2023-11-18 13:39:09', 'tracking', 4, 'glpi adds the item 23'),
(43, 29, 'notificationtemplates', '2023-11-18 13:49:01', 'notification', 4, 'glpi adds the item Browser Notification'),
(44, 29, 'notificationtemplatetranslations', '2023-11-18 13:56:08', 'notification', 4, 'glpi adds the item '),
(45, 73, 'notifications', '2023-11-18 13:59:37', 'notification', 4, 'glpi adds the item Browser Notification'),
(46, 24, 'ticket', '2023-11-18 14:01:11', 'tracking', 4, 'glpi adds the item 24'),
(47, 25, 'ticket', '2023-11-18 14:01:35', 'tracking', 4, 'glpi adds the item 25'),
(48, 26, 'ticket', '2023-11-18 14:14:05', 'tracking', 4, 'glpi adds the item 26'),
(49, 27, 'ticket', '2023-11-18 14:14:07', 'tracking', 4, 'glpi adds the item 27'),
(50, 28, 'ticket', '2023-11-18 14:14:10', 'tracking', 4, 'glpi adds the item 28'),
(51, 29, 'ticket', '2023-11-18 14:44:01', 'tracking', 4, 'glpi adds the item 29'),
(52, 30, 'ticket', '2023-11-18 14:44:01', 'tracking', 4, 'glpi adds the item 30'),
(53, 31, 'ticket', '2023-11-18 14:44:09', 'tracking', 4, 'glpi adds the item 31'),
(54, 32, 'ticket', '2023-11-18 14:45:45', 'tracking', 4, 'glpi adds the item 32'),
(55, 33, 'ticket', '2023-11-18 14:45:46', 'tracking', 4, 'glpi adds the item 33'),
(56, 34, 'ticket', '2023-11-18 14:45:49', 'tracking', 4, 'glpi adds the item 34'),
(57, 35, 'ticket', '2023-11-18 14:49:11', 'tracking', 4, 'glpi adds the item 35'),
(58, 36, 'ticket', '2023-11-18 15:17:25', 'tracking', 4, 'glpi adds the item 36'),
(59, 37, 'ticket', '2023-11-18 15:17:25', 'tracking', 4, 'glpi adds the item 37'),
(60, 38, 'ticket', '2023-11-18 15:17:30', 'tracking', 4, 'glpi adds the item 38'),
(61, 39, 'ticket', '2023-11-18 15:27:59', 'tracking', 4, 'glpi adds the item 39'),
(62, 1, 'slms', '2023-11-18 15:28:51', 'setup', 4, 'glpi adds the item Incident'),
(63, 1, 'slas', '2023-11-18 15:32:19', 'setup', 4, 'glpi adds the item L1'),
(64, 2, 'slas', '2023-11-18 15:33:17', 'setup', 4, 'glpi adds the item L2'),
(65, 40, 'ticket', '2023-11-18 15:38:53', 'tracking', 4, 'glpi adds the item 40'),
(66, 41, 'ticket', '2023-11-18 15:38:54', 'tracking', 4, 'glpi adds the item 41'),
(67, 42, 'ticket', '2023-11-18 15:38:57', 'tracking', 4, 'glpi adds the item 42'),
(68, 41, 'ticket', '2023-11-18 15:39:46', 'tracking', 4, 'glpi Updates an Item'),
(69, 41, 'ticket', '2023-11-18 15:41:09', 'tracking', 4, 'glpi Updates an Item'),
(70, 1, 'olas', '2023-11-18 15:42:45', 'setup', 4, 'glpi adds the item L1'),
(71, 2, 'olas', '2023-11-18 15:43:00', 'setup', 4, 'glpi adds the item L2'),
(72, 1, 'slms', '2023-11-18 15:43:16', 'setup', 4, 'glpi Updates an Item'),
(73, 43, 'ticket', '2023-11-18 15:46:01', 'tracking', 4, 'glpi adds the item 43'),
(74, 44, 'ticket', '2023-11-18 15:46:01', 'tracking', 4, 'glpi adds the item 44'),
(75, 45, 'ticket', '2023-11-18 15:46:03', 'tracking', 4, 'glpi adds the item 45'),
(76, 82, 'rules', '2023-11-18 16:11:19', 'setup', 4, 'glpi adds the item 82'),
(77, 83, 'rules', '2023-11-18 16:12:46', 'setup', 4, 'glpi adds the item 83'),
(78, 83, 'rules', '2023-11-18 16:14:36', 'setup', 4, 'glpi Updates an Item'),
(79, 83, 'rules', '2023-11-18 16:28:34', 'setup', 4, 'glpi Updates an Item'),
(80, 46, 'ticket', '2023-11-18 16:29:23', 'tracking', 4, 'glpi adds the item 46'),
(81, 47, 'ticket', '2023-11-18 16:29:25', 'tracking', 4, 'glpi adds the item 47'),
(82, 48, 'ticket', '2023-11-18 16:29:28', 'tracking', 4, 'glpi adds the item 48'),
(83, 1, 'slas', '2023-11-18 16:39:34', 'setup', 4, 'glpi Adds a Link with an Item'),
(84, 1, 'slas', '2023-11-18 16:42:37', 'setup', 4, 'glpi updates the SLA level'),
(85, 49, 'ticket', '2023-11-18 16:43:05', 'tracking', 4, 'glpi adds the item 49'),
(86, 50, 'ticket', '2023-11-18 16:43:06', 'tracking', 4, 'glpi adds the item 50'),
(87, 51, 'ticket', '2023-11-18 16:43:09', 'tracking', 4, 'glpi adds the item 51'),
(88, 52, 'ticket', '2023-11-18 16:43:10', 'tracking', 4, 'glpi adds the item 52'),
(89, 2, 'slas', '2023-11-18 16:51:29', 'setup', 4, 'glpi Adds a Link with an Item'),
(90, 83, 'rules', '2023-11-18 16:52:27', 'setup', 4, 'glpi Updates an Item'),
(91, 2, 'slas', '2023-11-18 16:54:40', 'setup', 4, 'glpi Adds a Link with an Item'),
(92, 2, 'slas', '2023-11-18 16:55:03', 'setup', 4, 'glpi Adds a Link with an Item'),
(93, 53, 'ticket', '2023-11-18 16:59:00', 'tracking', 4, 'glpi adds the item 53'),
(94, 54, 'ticket', '2023-11-18 16:59:02', 'tracking', 4, 'glpi adds the item 54'),
(95, 55, 'ticket', '2023-11-18 16:59:04', 'tracking', 4, 'glpi adds the item 55'),
(96, 84, 'rules', '2023-11-18 17:05:55', 'setup', 4, 'glpi adds the item 84'),
(97, 85, 'rules', '2023-11-18 17:10:01', 'setup', 4, 'glpi adds the item 85'),
(98, 56, 'ticket', '2023-11-18 17:11:46', 'tracking', 4, 'glpi adds the item 56'),
(99, 57, 'ticket', '2023-11-18 17:11:48', 'tracking', 4, 'glpi adds the item 57'),
(100, 58, 'ticket', '2023-11-18 17:11:49', 'tracking', 4, 'glpi adds the item 58'),
(101, 59, 'ticket', '2023-11-18 17:42:40', 'tracking', 4, 'glpi adds the item 59'),
(102, 60, 'ticket', '2023-11-18 17:42:40', 'tracking', 4, 'glpi adds the item 60'),
(103, 61, 'ticket', '2023-11-18 17:43:52', 'tracking', 4, 'glpi adds the item 61'),
(104, 62, 'ticket', '2023-11-18 17:43:53', 'tracking', 4, 'glpi adds the item 62'),
(105, 63, 'ticket', '2023-11-18 17:43:53', 'tracking', 4, 'glpi adds the item 63'),
(106, 64, 'ticket', '2023-11-18 17:43:54', 'tracking', 4, 'glpi adds the item 64'),
(107, 65, 'ticket', '2023-11-18 17:43:54', 'tracking', 4, 'glpi adds the item 65'),
(108, 66, 'ticket', '2023-11-18 17:43:55', 'tracking', 4, 'glpi adds the item 66'),
(109, 67, 'ticket', '2023-11-18 17:43:56', 'tracking', 4, 'glpi adds the item 67'),
(110, 68, 'ticket', '2023-11-18 17:43:56', 'tracking', 4, 'glpi adds the item 68'),
(111, 69, 'ticket', '2023-11-18 17:43:57', 'tracking', 4, 'glpi adds the item 69'),
(112, 70, 'ticket', '2023-11-18 17:43:57', 'tracking', 4, 'glpi adds the item 70'),
(113, 71, 'ticket', '2023-11-18 17:43:58', 'tracking', 4, 'glpi adds the item 71'),
(114, 72, 'ticket', '2023-11-18 17:43:59', 'tracking', 4, 'glpi adds the item 72'),
(115, 73, 'ticket', '2023-11-18 17:43:59', 'tracking', 4, 'glpi adds the item 73'),
(116, 74, 'ticket', '2023-11-18 17:44:00', 'tracking', 4, 'glpi adds the item 74'),
(117, 75, 'ticket', '2023-11-18 17:44:01', 'tracking', 4, 'glpi adds the item 75'),
(118, 76, 'ticket', '2023-11-18 18:55:27', 'tracking', 4, 'glpi adds the item 76'),
(119, 77, 'ticket', '2023-11-18 19:01:28', 'tracking', 4, 'glpi adds the item 77'),
(120, 78, 'ticket', '2023-11-18 21:01:36', 'tracking', 4, 'glpi adds the item 78'),
(121, 79, 'ticket', '2023-11-18 21:07:35', 'tracking', 4, 'glpi adds the item 79'),
(122, 80, 'ticket', '2023-11-18 21:13:36', 'tracking', 4, 'glpi adds the item 80'),
(123, 81, 'ticket', '2023-11-19 00:49:50', 'tracking', 4, 'glpi adds the item 81'),
(124, 82, 'ticket', '2023-11-19 00:55:51', 'tracking', 4, 'glpi adds the item 82'),
(125, 83, 'ticket', '2023-11-19 01:31:53', 'tracking', 4, 'glpi adds the item 83'),
(126, 84, 'ticket', '2023-11-19 01:55:54', 'tracking', 4, 'glpi adds the item 84'),
(127, 85, 'ticket', '2023-11-19 02:01:55', 'tracking', 4, 'glpi adds the item 85'),
(128, 86, 'ticket', '2023-11-19 03:01:58', 'tracking', 4, 'glpi adds the item 86'),
(129, 87, 'ticket', '2023-11-19 03:07:58', 'tracking', 4, 'glpi adds the item 87'),
(130, 88, 'ticket', '2023-11-19 04:08:03', 'tracking', 4, 'glpi adds the item 88'),
(131, 89, 'ticket', '2023-11-19 04:14:04', 'tracking', 4, 'glpi adds the item 89'),
(132, 90, 'ticket', '2023-11-19 05:14:07', 'tracking', 4, 'glpi adds the item 90'),
(133, 91, 'ticket', '2023-11-19 05:20:07', 'tracking', 4, 'glpi adds the item 91'),
(134, 92, 'ticket', '2023-11-19 05:42:45', 'tracking', 4, 'glpi adds the item 92'),
(135, 93, 'ticket', '2023-11-19 05:42:45', 'tracking', 4, 'glpi adds the item 93'),
(136, 94, 'ticket', '2023-11-19 05:45:23', 'tracking', 4, 'glpi adds the item 94'),
(137, 95, 'ticket', '2023-11-19 05:45:24', 'tracking', 4, 'glpi adds the item 95'),
(138, 96, 'ticket', '2023-11-19 05:45:24', 'tracking', 4, 'glpi adds the item 96'),
(139, 97, 'ticket', '2023-11-19 05:45:26', 'tracking', 4, 'glpi adds the item 97'),
(140, 98, 'ticket', '2023-11-19 05:45:26', 'tracking', 4, 'glpi adds the item 98'),
(141, 99, 'ticket', '2023-11-19 05:45:27', 'tracking', 4, 'glpi adds the item 99'),
(142, 100, 'ticket', '2023-11-19 05:45:28', 'tracking', 4, 'glpi adds the item 100'),
(143, 101, 'ticket', '2023-11-19 05:45:28', 'tracking', 4, 'glpi adds the item 101'),
(144, 102, 'ticket', '2023-11-19 05:45:29', 'tracking', 4, 'glpi adds the item 102'),
(145, 103, 'ticket', '2023-11-19 05:45:29', 'tracking', 4, 'glpi adds the item 103'),
(146, 104, 'ticket', '2023-11-19 05:45:30', 'tracking', 4, 'glpi adds the item 104'),
(147, 105, 'ticket', '2023-11-19 05:45:31', 'tracking', 4, 'glpi adds the item 105'),
(148, 106, 'ticket', '2023-11-19 05:45:31', 'tracking', 4, 'glpi adds the item 106'),
(149, 107, 'ticket', '2023-11-19 05:45:32', 'tracking', 4, 'glpi adds the item 107'),
(150, 108, 'ticket', '2023-11-19 05:45:33', 'tracking', 4, 'glpi adds the item 108'),
(151, 109, 'ticket', '2023-11-19 06:20:11', 'tracking', 4, 'glpi adds the item 109'),
(152, 110, 'ticket', '2023-11-19 06:26:13', 'tracking', 4, 'glpi adds the item 110'),
(153, 111, 'ticket', '2023-11-19 11:03:02', 'tracking', 4, 'glpi adds the item 111'),
(154, 112, 'ticket', '2023-11-19 11:03:03', 'tracking', 4, 'glpi adds the item 112'),
(155, 113, 'ticket', '2023-11-19 11:03:04', 'tracking', 4, 'glpi adds the item 113'),
(156, 114, 'ticket', '2023-11-19 11:03:04', 'tracking', 4, 'glpi adds the item 114'),
(157, 115, 'ticket', '2023-11-19 11:03:05', 'tracking', 4, 'glpi adds the item 115'),
(158, 116, 'ticket', '2023-11-19 11:03:06', 'tracking', 4, 'glpi adds the item 116'),
(159, 117, 'ticket', '2023-11-19 11:03:06', 'tracking', 4, 'glpi adds the item 117'),
(160, 118, 'ticket', '2023-11-19 11:03:07', 'tracking', 4, 'glpi adds the item 118'),
(161, 119, 'ticket', '2023-11-19 11:03:08', 'tracking', 4, 'glpi adds the item 119'),
(162, 120, 'ticket', '2023-11-19 11:03:08', 'tracking', 4, 'glpi adds the item 120'),
(163, 121, 'ticket', '2023-11-19 11:03:09', 'tracking', 4, 'glpi adds the item 121'),
(164, 122, 'ticket', '2023-11-19 11:03:09', 'tracking', 4, 'glpi adds the item 122'),
(165, 123, 'ticket', '2023-11-19 11:03:10', 'tracking', 4, 'glpi adds the item 123'),
(166, 124, 'ticket', '2023-11-19 11:03:11', 'tracking', 4, 'glpi adds the item 124'),
(167, 125, 'ticket', '2023-11-19 11:03:11', 'tracking', 4, 'glpi adds the item 125'),
(168, 126, 'ticket', '2023-11-19 11:08:06', 'tracking', 4, 'glpi adds the item 126'),
(169, 127, 'ticket', '2023-11-19 11:08:07', 'tracking', 4, 'glpi adds the item 127'),
(170, 128, 'ticket', '2023-11-19 11:08:07', 'tracking', 4, 'glpi adds the item 128'),
(171, 129, 'ticket', '2023-11-19 11:08:08', 'tracking', 4, 'glpi adds the item 129'),
(172, 130, 'ticket', '2023-11-19 11:08:08', 'tracking', 4, 'glpi adds the item 130'),
(173, 131, 'ticket', '2023-11-19 11:08:09', 'tracking', 4, 'glpi adds the item 131'),
(174, 132, 'ticket', '2023-11-19 11:08:10', 'tracking', 4, 'glpi adds the item 132'),
(175, 133, 'ticket', '2023-11-19 11:08:10', 'tracking', 4, 'glpi adds the item 133'),
(176, 134, 'ticket', '2023-11-19 11:08:11', 'tracking', 4, 'glpi adds the item 134'),
(177, 135, 'ticket', '2023-11-19 11:08:12', 'tracking', 4, 'glpi adds the item 135'),
(178, 136, 'ticket', '2023-11-19 11:08:12', 'tracking', 4, 'glpi adds the item 136'),
(179, 137, 'ticket', '2023-11-19 11:08:13', 'tracking', 4, 'glpi adds the item 137'),
(180, 138, 'ticket', '2023-11-19 11:08:13', 'tracking', 4, 'glpi adds the item 138'),
(181, 139, 'ticket', '2023-11-19 11:08:14', 'tracking', 4, 'glpi adds the item 139'),
(182, 140, 'ticket', '2023-11-19 11:08:15', 'tracking', 4, 'glpi adds the item 140'),
(183, 0, 'system', '2023-11-19 11:19:28', 'login', 3, 'Failed login for admin from IP 192.168.100.88'),
(184, 0, 'system', '2023-11-19 11:19:37', 'login', 3, 'glpi login from IP 192.168.100.88'),
(185, 141, 'ticket', '2023-11-19 11:20:10', 'tracking', 4, 'glpi adds the item 141'),
(186, 142, 'ticket', '2023-11-19 11:26:10', 'tracking', 4, 'glpi adds the item 142'),
(187, 143, 'ticket', '2023-11-19 12:10:33', 'tracking', 4, 'glpi adds the item 143'),
(188, 144, 'ticket', '2023-11-19 12:10:34', 'tracking', 4, 'glpi adds the item 144'),
(189, 145, 'ticket', '2023-11-19 12:10:34', 'tracking', 4, 'glpi adds the item 145'),
(190, 146, 'ticket', '2023-11-19 12:10:36', 'tracking', 4, 'glpi adds the item 146'),
(191, 147, 'ticket', '2023-11-19 12:10:36', 'tracking', 4, 'glpi adds the item 147'),
(192, 148, 'ticket', '2023-11-19 12:10:37', 'tracking', 4, 'glpi adds the item 148'),
(193, 149, 'ticket', '2023-11-19 12:10:38', 'tracking', 4, 'glpi adds the item 149'),
(194, 150, 'ticket', '2023-11-19 12:10:39', 'tracking', 4, 'glpi adds the item 150'),
(195, 151, 'ticket', '2023-11-19 12:10:40', 'tracking', 4, 'glpi adds the item 151'),
(196, 152, 'ticket', '2023-11-19 12:10:40', 'tracking', 4, 'glpi adds the item 152'),
(197, 153, 'ticket', '2023-11-19 12:10:41', 'tracking', 4, 'glpi adds the item 153'),
(198, 154, 'ticket', '2023-11-19 12:10:42', 'tracking', 4, 'glpi adds the item 154'),
(199, 155, 'ticket', '2023-11-19 12:10:43', 'tracking', 4, 'glpi adds the item 155'),
(200, 156, 'ticket', '2023-11-19 12:10:43', 'tracking', 4, 'glpi adds the item 156'),
(201, 157, 'ticket', '2023-11-19 12:10:44', 'tracking', 4, 'glpi adds the item 157'),
(202, 158, 'ticket', '2023-11-19 12:10:45', 'tracking', 4, 'glpi adds the item 158'),
(203, 159, 'ticket', '2023-11-19 12:10:46', 'tracking', 4, 'glpi adds the item 159'),
(204, 160, 'ticket', '2023-11-19 12:10:46', 'tracking', 4, 'glpi adds the item 160'),
(205, 161, 'ticket', '2023-11-19 12:10:47', 'tracking', 4, 'glpi adds the item 161'),
(206, 162, 'ticket', '2023-11-19 12:10:48', 'tracking', 4, 'glpi adds the item 162'),
(207, 163, 'ticket', '2023-11-19 12:10:49', 'tracking', 4, 'glpi adds the item 163'),
(208, 164, 'ticket', '2023-11-19 12:10:49', 'tracking', 4, 'glpi adds the item 164'),
(209, 165, 'ticket', '2023-11-19 12:10:50', 'tracking', 4, 'glpi adds the item 165'),
(210, 166, 'ticket', '2023-11-19 12:10:51', 'tracking', 4, 'glpi adds the item 166'),
(211, 167, 'ticket', '2023-11-19 12:10:52', 'tracking', 4, 'glpi adds the item 167'),
(212, 168, 'ticket', '2023-11-19 12:10:52', 'tracking', 4, 'glpi adds the item 168'),
(213, 169, 'ticket', '2023-11-19 12:10:53', 'tracking', 4, 'glpi adds the item 169'),
(214, 170, 'ticket', '2023-11-19 12:10:53', 'tracking', 4, 'glpi adds the item 170'),
(215, 171, 'ticket', '2023-11-19 12:10:54', 'tracking', 4, 'glpi adds the item 171'),
(216, 172, 'ticket', '2023-11-19 12:10:55', 'tracking', 4, 'glpi adds the item 172'),
(217, 173, 'ticket', '2023-11-19 12:10:55', 'tracking', 4, 'glpi adds the item 173'),
(218, 174, 'ticket', '2023-11-19 12:10:56', 'tracking', 4, 'glpi adds the item 174'),
(219, 175, 'ticket', '2023-11-19 12:10:57', 'tracking', 4, 'glpi adds the item 175'),
(220, 176, 'ticket', '2023-11-19 12:10:57', 'tracking', 4, 'glpi adds the item 176'),
(221, 177, 'ticket', '2023-11-19 12:10:58', 'tracking', 4, 'glpi adds the item 177'),
(222, 178, 'ticket', '2023-11-19 12:10:58', 'tracking', 4, 'glpi adds the item 178'),
(223, 179, 'ticket', '2023-11-19 12:10:59', 'tracking', 4, 'glpi adds the item 179'),
(224, 180, 'ticket', '2023-11-19 12:11:00', 'tracking', 4, 'glpi adds the item 180'),
(225, 181, 'ticket', '2023-11-19 12:11:00', 'tracking', 4, 'glpi adds the item 181'),
(226, 182, 'ticket', '2023-11-19 12:11:01', 'tracking', 4, 'glpi adds the item 182'),
(227, 183, 'ticket', '2023-11-19 12:11:02', 'tracking', 4, 'glpi adds the item 183'),
(228, 184, 'ticket', '2023-11-19 12:11:02', 'tracking', 4, 'glpi adds the item 184'),
(229, 185, 'ticket', '2023-11-19 12:11:03', 'tracking', 4, 'glpi adds the item 185'),
(230, 186, 'ticket', '2023-11-19 12:11:04', 'tracking', 4, 'glpi adds the item 186'),
(231, 187, 'ticket', '2023-11-19 12:11:04', 'tracking', 4, 'glpi adds the item 187'),
(232, 188, 'ticket', '2023-11-19 12:11:05', 'tracking', 4, 'glpi adds the item 188'),
(233, 189, 'ticket', '2023-11-19 12:11:06', 'tracking', 4, 'glpi adds the item 189'),
(234, 190, 'ticket', '2023-11-19 12:11:06', 'tracking', 4, 'glpi adds the item 190'),
(235, 191, 'ticket', '2023-11-19 12:11:07', 'tracking', 4, 'glpi adds the item 191'),
(236, 192, 'ticket', '2023-11-19 12:11:07', 'tracking', 4, 'glpi adds the item 192'),
(237, 193, 'ticket', '2023-11-19 12:11:08', 'tracking', 4, 'glpi adds the item 193'),
(238, 194, 'ticket', '2023-11-19 12:11:09', 'tracking', 4, 'glpi adds the item 194'),
(239, 195, 'ticket', '2023-11-19 12:11:09', 'tracking', 4, 'glpi adds the item 195'),
(240, 196, 'ticket', '2023-11-19 12:11:10', 'tracking', 4, 'glpi adds the item 196'),
(241, 197, 'ticket', '2023-11-19 12:11:10', 'tracking', 4, 'glpi adds the item 197'),
(242, 198, 'ticket', '2023-11-19 12:11:11', 'tracking', 4, 'glpi adds the item 198'),
(243, 199, 'ticket', '2023-11-19 12:11:12', 'tracking', 4, 'glpi adds the item 199'),
(244, 200, 'ticket', '2023-11-19 12:11:12', 'tracking', 4, 'glpi adds the item 200'),
(245, 201, 'ticket', '2023-11-19 12:11:13', 'tracking', 4, 'glpi adds the item 201'),
(246, 202, 'ticket', '2023-11-19 12:11:14', 'tracking', 4, 'glpi adds the item 202'),
(247, 203, 'ticket', '2023-11-19 12:11:14', 'tracking', 4, 'glpi adds the item 203'),
(248, 204, 'ticket', '2023-11-19 12:11:15', 'tracking', 4, 'glpi adds the item 204'),
(249, 205, 'ticket', '2023-11-19 12:11:16', 'tracking', 4, 'glpi adds the item 205'),
(250, 206, 'ticket', '2023-11-19 12:11:17', 'tracking', 4, 'glpi adds the item 206'),
(251, 207, 'ticket', '2023-11-19 12:11:17', 'tracking', 4, 'glpi adds the item 207'),
(252, 208, 'ticket', '2023-11-19 12:11:18', 'tracking', 4, 'glpi adds the item 208'),
(253, 209, 'ticket', '2023-11-19 12:11:19', 'tracking', 4, 'glpi adds the item 209'),
(254, 210, 'ticket', '2023-11-19 12:11:19', 'tracking', 4, 'glpi adds the item 210'),
(255, 211, 'ticket', '2023-11-19 12:11:20', 'tracking', 4, 'glpi adds the item 211'),
(256, 212, 'ticket', '2023-11-19 12:11:21', 'tracking', 4, 'glpi adds the item 212'),
(257, 213, 'ticket', '2023-11-19 12:11:21', 'tracking', 4, 'glpi adds the item 213'),
(258, 214, 'ticket', '2023-11-19 12:11:22', 'tracking', 4, 'glpi adds the item 214'),
(259, 215, 'ticket', '2023-11-19 12:11:23', 'tracking', 4, 'glpi adds the item 215'),
(260, 216, 'ticket', '2023-11-19 12:11:23', 'tracking', 4, 'glpi adds the item 216'),
(261, 217, 'ticket', '2023-11-19 12:11:24', 'tracking', 4, 'glpi adds the item 217'),
(262, 218, 'ticket', '2023-11-19 12:11:25', 'tracking', 4, 'glpi adds the item 218'),
(263, 219, 'ticket', '2023-11-19 12:11:25', 'tracking', 4, 'glpi adds the item 219'),
(264, 220, 'ticket', '2023-11-19 12:11:26', 'tracking', 4, 'glpi adds the item 220'),
(265, 221, 'ticket', '2023-11-19 12:11:27', 'tracking', 4, 'glpi adds the item 221'),
(266, 222, 'ticket', '2023-11-19 12:11:28', 'tracking', 4, 'glpi adds the item 222'),
(267, 223, 'ticket', '2023-11-19 12:11:28', 'tracking', 4, 'glpi adds the item 223'),
(268, 224, 'ticket', '2023-11-19 12:11:29', 'tracking', 4, 'glpi adds the item 224'),
(269, 225, 'ticket', '2023-11-19 12:11:30', 'tracking', 4, 'glpi adds the item 225'),
(270, 226, 'ticket', '2023-11-19 12:11:31', 'tracking', 4, 'glpi adds the item 226'),
(271, 227, 'ticket', '2023-11-19 12:11:31', 'tracking', 4, 'glpi adds the item 227'),
(272, 228, 'ticket', '2023-11-19 12:11:32', 'tracking', 4, 'glpi adds the item 228'),
(273, 229, 'ticket', '2023-11-19 12:11:33', 'tracking', 4, 'glpi adds the item 229'),
(274, 230, 'ticket', '2023-11-19 12:11:33', 'tracking', 4, 'glpi adds the item 230'),
(275, 231, 'ticket', '2023-11-19 12:11:34', 'tracking', 4, 'glpi adds the item 231'),
(276, 232, 'ticket', '2023-11-19 12:11:35', 'tracking', 4, 'glpi adds the item 232'),
(277, 233, 'ticket', '2023-11-19 12:11:36', 'tracking', 4, 'glpi adds the item 233'),
(278, 234, 'ticket', '2023-11-19 12:11:37', 'tracking', 4, 'glpi adds the item 234'),
(279, 235, 'ticket', '2023-11-19 12:11:37', 'tracking', 4, 'glpi adds the item 235'),
(280, 236, 'ticket', '2023-11-19 12:11:38', 'tracking', 4, 'glpi adds the item 236'),
(281, 237, 'ticket', '2023-11-19 12:11:39', 'tracking', 4, 'glpi adds the item 237'),
(282, 238, 'ticket', '2023-11-19 12:11:39', 'tracking', 4, 'glpi adds the item 238'),
(283, 239, 'ticket', '2023-11-19 12:11:40', 'tracking', 4, 'glpi adds the item 239'),
(284, 240, 'ticket', '2023-11-19 12:11:41', 'tracking', 4, 'glpi adds the item 240'),
(285, 241, 'ticket', '2023-11-19 12:27:08', 'tracking', 4, 'glpi adds the item 241'),
(286, 242, 'ticket', '2023-11-19 12:27:10', 'tracking', 4, 'glpi adds the item 242'),
(287, 243, 'ticket', '2023-11-19 12:27:11', 'tracking', 4, 'glpi adds the item 243'),
(288, 244, 'ticket', '2023-11-19 12:27:12', 'tracking', 4, 'glpi adds the item 244'),
(289, 245, 'ticket', '2023-11-19 12:27:13', 'tracking', 4, 'glpi adds the item 245'),
(290, 246, 'ticket', '2023-11-19 12:27:14', 'tracking', 4, 'glpi adds the item 246'),
(291, 247, 'ticket', '2023-11-19 12:27:15', 'tracking', 4, 'glpi adds the item 247'),
(292, 248, 'ticket', '2023-11-19 12:27:16', 'tracking', 4, 'glpi adds the item 248'),
(293, 249, 'ticket', '2023-11-19 12:27:17', 'tracking', 4, 'glpi adds the item 249'),
(294, 250, 'ticket', '2023-11-19 12:27:18', 'tracking', 4, 'glpi adds the item 250'),
(295, 251, 'ticket', '2023-11-19 12:27:18', 'tracking', 4, 'glpi adds the item 251'),
(296, 252, 'ticket', '2023-11-19 12:27:19', 'tracking', 4, 'glpi adds the item 252'),
(297, 253, 'ticket', '2023-11-19 12:27:20', 'tracking', 4, 'glpi adds the item 253'),
(298, 254, 'ticket', '2023-11-19 12:27:20', 'tracking', 4, 'glpi adds the item 254'),
(299, 255, 'ticket', '2023-11-19 12:27:21', 'tracking', 4, 'glpi adds the item 255'),
(300, 256, 'ticket', '2023-11-19 12:27:22', 'tracking', 4, 'glpi adds the item 256'),
(301, 257, 'ticket', '2023-11-19 12:27:22', 'tracking', 4, 'glpi adds the item 257'),
(302, 258, 'ticket', '2023-11-19 12:27:23', 'tracking', 4, 'glpi adds the item 258'),
(303, 259, 'ticket', '2023-11-19 12:27:24', 'tracking', 4, 'glpi adds the item 259'),
(304, 260, 'ticket', '2023-11-19 12:27:24', 'tracking', 4, 'glpi adds the item 260'),
(305, 261, 'ticket', '2023-11-19 12:27:25', 'tracking', 4, 'glpi adds the item 261'),
(306, 262, 'ticket', '2023-11-19 12:27:26', 'tracking', 4, 'glpi adds the item 262'),
(307, 263, 'ticket', '2023-11-19 12:27:26', 'tracking', 4, 'glpi adds the item 263'),
(308, 264, 'ticket', '2023-11-19 12:27:27', 'tracking', 4, 'glpi adds the item 264'),
(309, 265, 'ticket', '2023-11-19 12:27:28', 'tracking', 4, 'glpi adds the item 265'),
(310, 266, 'ticket', '2023-11-19 12:27:28', 'tracking', 4, 'glpi adds the item 266'),
(311, 267, 'ticket', '2023-11-19 12:27:29', 'tracking', 4, 'glpi adds the item 267'),
(312, 268, 'ticket', '2023-11-19 12:27:30', 'tracking', 4, 'glpi adds the item 268'),
(313, 269, 'ticket', '2023-11-19 12:27:31', 'tracking', 4, 'glpi adds the item 269'),
(314, 270, 'ticket', '2023-11-19 12:27:31', 'tracking', 4, 'glpi adds the item 270'),
(315, 271, 'ticket', '2023-11-19 12:27:32', 'tracking', 4, 'glpi adds the item 271'),
(316, 272, 'ticket', '2023-11-19 12:32:49', 'tracking', 4, 'glpi adds the item 272'),
(317, 273, 'ticket', '2023-11-19 12:33:44', 'tracking', 4, 'glpi adds the item 273'),
(318, 274, 'ticket', '2023-11-19 12:38:49', 'tracking', 4, 'glpi adds the item 274'),
(319, 275, 'ticket', '2023-11-19 12:43:13', 'tracking', 4, 'glpi adds the item 275'),
(320, 276, 'ticket', '2023-11-19 12:43:14', 'tracking', 4, 'glpi adds the item 276'),
(321, 277, 'ticket', '2023-11-19 12:44:23', 'tracking', 4, 'glpi adds the item 277'),
(322, 278, 'ticket', '2023-11-19 12:44:24', 'tracking', 4, 'glpi adds the item 278'),
(323, 279, 'ticket', '2023-11-19 12:44:24', 'tracking', 4, 'glpi adds the item 279'),
(324, 280, 'ticket', '2023-11-19 12:44:25', 'tracking', 4, 'glpi adds the item 280'),
(325, 281, 'ticket', '2023-11-19 12:44:26', 'tracking', 4, 'glpi adds the item 281'),
(326, 282, 'ticket', '2023-11-19 12:45:49', 'tracking', 4, 'glpi adds the item 282'),
(327, 283, 'ticket', '2023-11-19 12:51:10', 'tracking', 4, 'glpi adds the item 283'),
(328, 284, 'ticket', '2023-11-19 12:51:12', 'tracking', 4, 'glpi adds the item 284'),
(329, 285, 'ticket', '2023-11-19 12:51:13', 'tracking', 4, 'glpi adds the item 285'),
(330, 286, 'ticket', '2023-11-19 12:51:14', 'tracking', 4, 'glpi adds the item 286'),
(331, 287, 'ticket', '2023-11-19 12:51:15', 'tracking', 4, 'glpi adds the item 287'),
(332, 288, 'ticket', '2023-11-19 12:51:16', 'tracking', 4, 'glpi adds the item 288'),
(333, 289, 'ticket', '2023-11-19 12:51:17', 'tracking', 4, 'glpi adds the item 289'),
(334, 290, 'ticket', '2023-11-19 12:51:18', 'tracking', 4, 'glpi adds the item 290'),
(335, 291, 'ticket', '2023-11-19 12:51:19', 'tracking', 4, 'glpi adds the item 291'),
(336, 292, 'ticket', '2023-11-19 12:51:20', 'tracking', 4, 'glpi adds the item 292'),
(337, 293, 'ticket', '2023-11-19 12:51:20', 'tracking', 4, 'glpi adds the item 293'),
(338, 294, 'ticket', '2023-11-19 12:51:21', 'tracking', 4, 'glpi adds the item 294'),
(339, 295, 'ticket', '2023-11-19 12:51:22', 'tracking', 4, 'glpi adds the item 295'),
(340, 296, 'ticket', '2023-11-19 12:51:22', 'tracking', 4, 'glpi adds the item 296'),
(341, 297, 'ticket', '2023-11-19 12:51:23', 'tracking', 4, 'glpi adds the item 297'),
(342, 298, 'ticket', '2023-11-19 12:51:24', 'tracking', 4, 'glpi adds the item 298'),
(343, 299, 'ticket', '2023-11-19 12:51:25', 'tracking', 4, 'glpi adds the item 299'),
(344, 300, 'ticket', '2023-11-19 12:51:25', 'tracking', 4, 'glpi adds the item 300'),
(345, 301, 'ticket', '2023-11-19 12:51:26', 'tracking', 4, 'glpi adds the item 301'),
(346, 302, 'ticket', '2023-11-19 12:51:27', 'tracking', 4, 'glpi adds the item 302'),
(347, 303, 'ticket', '2023-11-19 12:51:27', 'tracking', 4, 'glpi adds the item 303'),
(348, 304, 'ticket', '2023-11-19 12:51:28', 'tracking', 4, 'glpi adds the item 304'),
(349, 305, 'ticket', '2023-11-19 12:51:29', 'tracking', 4, 'glpi adds the item 305'),
(350, 306, 'ticket', '2023-11-19 12:51:29', 'tracking', 4, 'glpi adds the item 306'),
(351, 307, 'ticket', '2023-11-19 12:51:30', 'tracking', 4, 'glpi adds the item 307'),
(352, 308, 'ticket', '2023-11-19 12:51:31', 'tracking', 4, 'glpi adds the item 308'),
(353, 309, 'ticket', '2023-11-19 12:51:31', 'tracking', 4, 'glpi adds the item 309'),
(354, 310, 'ticket', '2023-11-19 12:51:32', 'tracking', 4, 'glpi adds the item 310'),
(355, 311, 'ticket', '2023-11-19 12:51:33', 'tracking', 4, 'glpi adds the item 311'),
(356, 312, 'ticket', '2023-11-19 12:51:34', 'tracking', 4, 'glpi adds the item 312'),
(357, 313, 'ticket', '2023-11-19 12:51:34', 'tracking', 4, 'glpi adds the item 313'),
(358, 314, 'ticket', '2023-11-19 12:56:50', 'tracking', 4, 'glpi adds the item 314'),
(359, 315, 'ticket', '2023-11-19 13:29:12', 'tracking', 4, 'glpi adds the item 315'),
(360, 316, 'ticket', '2023-11-19 13:29:13', 'tracking', 4, 'glpi adds the item 316'),
(361, 317, 'ticket', '2023-11-19 13:29:13', 'tracking', 4, 'glpi adds the item 317'),
(362, 318, 'ticket', '2023-11-19 13:29:14', 'tracking', 4, 'glpi adds the item 318'),
(363, 319, 'ticket', '2023-11-19 13:29:15', 'tracking', 4, 'glpi adds the item 319'),
(364, 320, 'ticket', '2023-11-19 13:29:15', 'tracking', 4, 'glpi adds the item 320'),
(365, 321, 'ticket', '2023-11-19 13:29:16', 'tracking', 4, 'glpi adds the item 321'),
(366, 322, 'ticket', '2023-11-19 13:29:17', 'tracking', 4, 'glpi adds the item 322'),
(367, 323, 'ticket', '2023-11-19 13:29:17', 'tracking', 4, 'glpi adds the item 323'),
(368, 324, 'ticket', '2023-11-19 13:29:18', 'tracking', 4, 'glpi adds the item 324'),
(369, 325, 'ticket', '2023-11-19 13:29:19', 'tracking', 4, 'glpi adds the item 325'),
(370, 326, 'ticket', '2023-11-19 13:29:19', 'tracking', 4, 'glpi adds the item 326'),
(371, 327, 'ticket', '2023-11-19 13:29:20', 'tracking', 4, 'glpi adds the item 327'),
(372, 328, 'ticket', '2023-11-19 13:29:21', 'tracking', 4, 'glpi adds the item 328'),
(373, 329, 'ticket', '2023-11-19 13:29:21', 'tracking', 4, 'glpi adds the item 329'),
(374, 330, 'ticket', '2023-11-19 13:29:22', 'tracking', 4, 'glpi adds the item 330'),
(375, 331, 'ticket', '2023-11-19 13:29:23', 'tracking', 4, 'glpi adds the item 331'),
(376, 332, 'ticket', '2023-11-19 13:29:23', 'tracking', 4, 'glpi adds the item 332'),
(377, 333, 'ticket', '2023-11-19 13:29:24', 'tracking', 4, 'glpi adds the item 333'),
(378, 334, 'ticket', '2023-11-19 13:29:24', 'tracking', 4, 'glpi adds the item 334'),
(379, 335, 'ticket', '2023-11-19 13:29:25', 'tracking', 4, 'glpi adds the item 335'),
(380, 336, 'ticket', '2023-11-19 13:29:26', 'tracking', 4, 'glpi adds the item 336'),
(381, 337, 'ticket', '2023-11-19 13:37:27', 'tracking', 4, 'glpi adds the item 337'),
(382, 338, 'ticket', '2023-11-19 13:37:27', 'tracking', 4, 'glpi adds the item 338'),
(383, 339, 'ticket', '2023-11-19 13:37:28', 'tracking', 4, 'glpi adds the item 339'),
(384, 340, 'ticket', '2023-11-19 13:37:28', 'tracking', 4, 'glpi adds the item 340'),
(385, 341, 'ticket', '2023-11-19 13:37:29', 'tracking', 4, 'glpi adds the item 341'),
(386, 342, 'ticket', '2023-11-19 13:38:53', 'tracking', 4, 'glpi adds the item 342'),
(387, 343, 'ticket', '2023-11-19 13:43:01', 'tracking', 4, 'glpi adds the item 343'),
(388, 344, 'ticket', '2023-11-19 13:43:02', 'tracking', 4, 'glpi adds the item 344'),
(389, 345, 'ticket', '2023-11-19 13:44:54', 'tracking', 4, 'glpi adds the item 345'),
(390, 346, 'ticket', '2023-11-19 13:45:32', 'tracking', 4, 'glpi adds the item 346'),
(391, 347, 'ticket', '2023-11-19 13:45:33', 'tracking', 4, 'glpi adds the item 347'),
(392, 348, 'ticket', '2023-11-19 13:45:40', 'tracking', 4, 'glpi adds the item 348'),
(393, 349, 'ticket', '2023-11-19 13:45:42', 'tracking', 4, 'glpi adds the item 349'),
(394, 350, 'ticket', '2023-11-19 13:45:43', 'tracking', 4, 'glpi adds the item 350'),
(395, 351, 'ticket', '2023-11-19 13:45:44', 'tracking', 4, 'glpi adds the item 351'),
(396, 352, 'ticket', '2023-11-19 13:46:38', 'tracking', 4, 'glpi adds the item 352'),
(397, 353, 'ticket', '2023-11-19 13:46:39', 'tracking', 4, 'glpi adds the item 353'),
(398, 354, 'ticket', '2023-11-19 13:47:02', 'tracking', 4, 'glpi adds the item 354'),
(399, 355, 'ticket', '2023-11-19 13:47:03', 'tracking', 4, 'glpi adds the item 355'),
(400, 356, 'ticket', '2023-11-19 13:50:54', 'tracking', 4, 'glpi adds the item 356'),
(401, 357, 'ticket', '2023-11-19 13:51:58', 'tracking', 4, 'glpi adds the item 357'),
(402, 358, 'ticket', '2023-11-19 13:51:59', 'tracking', 4, 'glpi adds the item 358'),
(403, 359, 'ticket', '2023-11-19 13:56:54', 'tracking', 4, 'glpi adds the item 359'),
(404, 1, 'ticket', '2023-11-19 13:59:43', 'tracking', 4, 'glpi adds the item 1'),
(405, 2, 'ticket', '2023-11-19 13:59:43', 'tracking', 4, 'glpi adds the item 2'),
(406, 3, 'ticket', '2023-11-19 13:59:44', 'tracking', 4, 'glpi adds the item 3'),
(407, 4, 'ticket', '2023-11-19 14:00:26', 'tracking', 4, 'glpi adds the item 4'),
(408, 5, 'ticket', '2023-11-19 14:00:27', 'tracking', 4, 'glpi adds the item 5'),
(409, 6, 'ticket', '2023-11-19 14:00:28', 'tracking', 4, 'glpi adds the item 6'),
(410, 7, 'ticket', '2023-11-19 14:00:28', 'tracking', 4, 'glpi adds the item 7'),
(411, 8, 'ticket', '2023-11-19 14:00:35', 'tracking', 4, 'glpi adds the item 8'),
(412, 0, 'system', '2023-11-19 14:02:02', 'login', 3, 'Failed login for  from IP 192.168.1.3'),
(413, 0, 'system', '2023-11-19 14:02:10', 'login', 3, 'glpi login from IP 192.168.1.3'),
(414, 9, 'ticket', '2023-11-19 14:02:56', 'tracking', 4, 'glpi adds the item 9'),
(415, 10, 'ticket', '2023-11-19 14:19:38', 'tracking', 4, 'glpi adds the item 10'),
(416, 11, 'ticket', '2023-11-19 14:19:38', 'tracking', 4, 'glpi adds the item 11'),
(417, 12, 'ticket', '2023-11-19 14:19:39', 'tracking', 4, 'glpi adds the item 12'),
(418, 13, 'ticket', '2023-11-19 14:19:40', 'tracking', 4, 'glpi adds the item 13'),
(419, 14, 'ticket', '2023-11-19 14:19:40', 'tracking', 4, 'glpi adds the item 14'),
(420, 15, 'ticket', '2023-11-19 14:19:41', 'tracking', 4, 'glpi adds the item 15'),
(421, 16, 'ticket', '2023-11-19 14:19:42', 'tracking', 4, 'glpi adds the item 16'),
(422, 17, 'ticket', '2023-11-19 14:19:42', 'tracking', 4, 'glpi adds the item 17'),
(423, 18, 'ticket', '2023-11-19 14:19:43', 'tracking', 4, 'glpi adds the item 18'),
(424, 19, 'ticket', '2023-11-19 14:19:43', 'tracking', 4, 'glpi adds the item 19'),
(425, 20, 'ticket', '2023-11-19 14:19:44', 'tracking', 4, 'glpi adds the item 20'),
(426, 21, 'ticket', '2023-11-19 14:19:45', 'tracking', 4, 'glpi adds the item 21'),
(427, 22, 'ticket', '2023-11-19 14:20:53', 'tracking', 4, 'glpi adds the item 22'),
(428, 23, 'ticket', '2023-11-19 14:20:56', 'tracking', 4, 'glpi adds the item 23'),
(429, 24, 'ticket', '2023-11-19 14:22:08', 'tracking', 4, 'glpi adds the item 24'),
(430, 25, 'ticket', '2023-11-19 14:22:10', 'tracking', 4, 'glpi adds the item 25'),
(431, 26, 'ticket', '2023-11-19 14:22:11', 'tracking', 4, 'glpi adds the item 26'),
(432, 27, 'ticket', '2023-11-19 14:22:13', 'tracking', 4, 'glpi adds the item 27'),
(433, 28, 'ticket', '2023-11-19 14:22:14', 'tracking', 4, 'glpi adds the item 28'),
(434, 29, 'ticket', '2023-11-19 14:22:15', 'tracking', 4, 'glpi adds the item 29'),
(435, 30, 'ticket', '2023-11-19 14:22:16', 'tracking', 4, 'glpi adds the item 30'),
(436, 31, 'ticket', '2023-11-19 14:22:17', 'tracking', 4, 'glpi adds the item 31'),
(437, 32, 'ticket', '2023-11-19 14:22:18', 'tracking', 4, 'glpi adds the item 32'),
(438, 33, 'ticket', '2023-11-19 14:22:19', 'tracking', 4, 'glpi adds the item 33'),
(439, 34, 'ticket', '2023-11-19 14:22:20', 'tracking', 4, 'glpi adds the item 34'),
(440, 35, 'ticket', '2023-11-19 14:22:21', 'tracking', 4, 'glpi adds the item 35'),
(441, 36, 'ticket', '2023-11-19 14:22:21', 'tracking', 4, 'glpi adds the item 36'),
(442, 37, 'ticket', '2023-11-19 14:22:22', 'tracking', 4, 'glpi adds the item 37'),
(443, 38, 'ticket', '2023-11-19 14:22:23', 'tracking', 4, 'glpi adds the item 38'),
(444, 39, 'ticket', '2023-11-19 14:22:23', 'tracking', 4, 'glpi adds the item 39'),
(445, 40, 'ticket', '2023-11-19 14:22:24', 'tracking', 4, 'glpi adds the item 40'),
(446, 41, 'ticket', '2023-11-19 14:22:25', 'tracking', 4, 'glpi adds the item 41'),
(447, 42, 'ticket', '2023-11-19 14:22:25', 'tracking', 4, 'glpi adds the item 42'),
(448, 43, 'ticket', '2023-11-19 14:22:26', 'tracking', 4, 'glpi adds the item 43'),
(449, 44, 'ticket', '2023-11-19 14:22:27', 'tracking', 4, 'glpi adds the item 44'),
(450, 45, 'ticket', '2023-11-19 14:22:27', 'tracking', 4, 'glpi adds the item 45'),
(451, 46, 'ticket', '2023-11-19 14:22:28', 'tracking', 4, 'glpi adds the item 46'),
(452, 47, 'ticket', '2023-11-19 14:22:29', 'tracking', 4, 'glpi adds the item 47'),
(453, 48, 'ticket', '2023-11-19 14:22:29', 'tracking', 4, 'glpi adds the item 48'),
(454, 49, 'ticket', '2023-11-19 14:22:30', 'tracking', 4, 'glpi adds the item 49'),
(455, 50, 'ticket', '2023-11-19 14:22:31', 'tracking', 4, 'glpi adds the item 50'),
(456, 51, 'ticket', '2023-11-19 14:22:31', 'tracking', 4, 'glpi adds the item 51'),
(457, 52, 'ticket', '2023-11-19 14:22:32', 'tracking', 4, 'glpi adds the item 52'),
(458, 53, 'ticket', '2023-11-19 14:22:33', 'tracking', 4, 'glpi adds the item 53'),
(459, 54, 'ticket', '2023-11-19 14:22:33', 'tracking', 4, 'glpi adds the item 54'),
(460, 55, 'ticket', '2023-11-19 14:22:34', 'tracking', 4, 'glpi adds the item 55'),
(461, 56, 'ticket', '2023-11-19 14:22:35', 'tracking', 4, 'glpi adds the item 56'),
(462, 57, 'ticket', '2023-11-19 14:22:35', 'tracking', 4, 'glpi adds the item 57'),
(463, 58, 'ticket', '2023-11-19 14:22:36', 'tracking', 4, 'glpi adds the item 58'),
(464, 59, 'ticket', '2023-11-19 14:22:37', 'tracking', 4, 'glpi adds the item 59'),
(465, 60, 'ticket', '2023-11-19 14:22:37', 'tracking', 4, 'glpi adds the item 60'),
(466, 61, 'ticket', '2023-11-19 14:22:38', 'tracking', 4, 'glpi adds the item 61'),
(467, 62, 'ticket', '2023-11-19 14:22:39', 'tracking', 4, 'glpi adds the item 62'),
(468, 63, 'ticket', '2023-11-19 14:23:48', 'tracking', 4, 'glpi adds the item 63'),
(469, 64, 'ticket', '2023-11-19 14:23:48', 'tracking', 4, 'glpi adds the item 64'),
(470, 65, 'ticket', '2023-11-19 14:24:34', 'tracking', 4, 'glpi adds the item 65'),
(471, 66, 'ticket', '2023-11-19 14:25:02', 'tracking', 4, 'glpi adds the item 66'),
(472, 67, 'ticket', '2023-11-19 14:25:02', 'tracking', 4, 'glpi adds the item 67'),
(473, 68, 'ticket', '2023-11-19 14:25:10', 'tracking', 4, 'glpi adds the item 68'),
(474, 69, 'ticket', '2023-11-19 14:25:14', 'tracking', 4, 'glpi adds the item 69'),
(475, 70, 'ticket', '2023-11-19 14:25:14', 'tracking', 4, 'glpi adds the item 70'),
(476, 71, 'ticket', '2023-11-19 14:25:15', 'tracking', 4, 'glpi adds the item 71'),
(477, 72, 'ticket', '2023-11-19 14:27:50', 'tracking', 4, 'glpi adds the item 72'),
(478, 73, 'ticket', '2023-11-19 14:42:32', 'tracking', 4, 'glpi adds the item 73'),
(479, 74, 'ticket', '2023-11-19 14:42:34', 'tracking', 4, 'glpi adds the item 74'),
(480, 75, 'ticket', '2023-11-19 14:42:36', 'tracking', 4, 'glpi adds the item 75'),
(481, 76, 'ticket', '2023-11-19 14:42:38', 'tracking', 4, 'glpi adds the item 76'),
(482, 77, 'ticket', '2023-11-19 14:42:39', 'tracking', 4, 'glpi adds the item 77'),
(483, 78, 'ticket', '2023-11-19 14:42:41', 'tracking', 4, 'glpi adds the item 78'),
(484, 79, 'ticket', '2023-11-19 14:42:41', 'tracking', 4, 'glpi adds the item 79'),
(485, 80, 'ticket', '2023-11-19 14:42:42', 'tracking', 4, 'glpi adds the item 80'),
(486, 81, 'ticket', '2023-11-19 14:42:43', 'tracking', 4, 'glpi adds the item 81'),
(487, 82, 'ticket', '2023-11-19 14:42:44', 'tracking', 4, 'glpi adds the item 82'),
(488, 83, 'ticket', '2023-11-19 14:42:45', 'tracking', 4, 'glpi adds the item 83'),
(489, 84, 'ticket', '2023-11-19 14:42:45', 'tracking', 4, 'glpi adds the item 84'),
(490, 85, 'ticket', '2023-11-19 14:42:46', 'tracking', 4, 'glpi adds the item 85'),
(491, 86, 'ticket', '2023-11-19 14:42:47', 'tracking', 4, 'glpi adds the item 86'),
(492, 87, 'ticket', '2023-11-19 14:42:48', 'tracking', 4, 'glpi adds the item 87'),
(493, 88, 'ticket', '2023-11-19 14:42:49', 'tracking', 4, 'glpi adds the item 88'),
(494, 89, 'ticket', '2023-11-19 14:42:49', 'tracking', 4, 'glpi adds the item 89'),
(495, 90, 'ticket', '2023-11-19 14:42:50', 'tracking', 4, 'glpi adds the item 90'),
(496, 91, 'ticket', '2023-11-19 14:42:51', 'tracking', 4, 'glpi adds the item 91'),
(497, 92, 'ticket', '2023-11-19 14:42:51', 'tracking', 4, 'glpi adds the item 92'),
(498, 93, 'ticket', '2023-11-19 14:42:52', 'tracking', 4, 'glpi adds the item 93'),
(499, 94, 'ticket', '2023-11-19 14:42:53', 'tracking', 4, 'glpi adds the item 94'),
(500, 95, 'ticket', '2023-11-19 14:42:53', 'tracking', 4, 'glpi adds the item 95'),
(501, 96, 'ticket', '2023-11-19 14:42:54', 'tracking', 4, 'glpi adds the item 96'),
(502, 97, 'ticket', '2023-11-19 14:42:55', 'tracking', 4, 'glpi adds the item 97'),
(503, 98, 'ticket', '2023-11-19 14:42:56', 'tracking', 4, 'glpi adds the item 98'),
(504, 99, 'ticket', '2023-11-19 14:42:57', 'tracking', 4, 'glpi adds the item 99'),
(505, 100, 'ticket', '2023-11-19 14:42:57', 'tracking', 4, 'glpi adds the item 100'),
(506, 101, 'ticket', '2023-11-19 14:42:58', 'tracking', 4, 'glpi adds the item 101'),
(507, 102, 'ticket', '2023-11-19 14:42:59', 'tracking', 4, 'glpi adds the item 102'),
(508, 103, 'ticket', '2023-11-19 14:42:59', 'tracking', 4, 'glpi adds the item 103'),
(509, 104, 'ticket', '2023-11-19 14:43:00', 'tracking', 4, 'glpi adds the item 104'),
(510, 105, 'ticket', '2023-11-19 14:45:06', 'tracking', 4, 'glpi adds the item 105'),
(511, 106, 'ticket', '2023-11-19 14:45:08', 'tracking', 4, 'glpi adds the item 106'),
(512, 107, 'ticket', '2023-11-19 14:45:09', 'tracking', 4, 'glpi adds the item 107'),
(513, 108, 'ticket', '2023-11-19 14:45:10', 'tracking', 4, 'glpi adds the item 108'),
(514, 109, 'ticket', '2023-11-19 14:45:11', 'tracking', 4, 'glpi adds the item 109'),
(515, 110, 'ticket', '2023-11-19 14:45:12', 'tracking', 4, 'glpi adds the item 110'),
(516, 111, 'ticket', '2023-11-19 14:45:13', 'tracking', 4, 'glpi adds the item 111'),
(517, 112, 'ticket', '2023-11-19 14:45:14', 'tracking', 4, 'glpi adds the item 112'),
(518, 113, 'ticket', '2023-11-19 14:45:15', 'tracking', 4, 'glpi adds the item 113'),
(519, 114, 'ticket', '2023-11-19 14:45:16', 'tracking', 4, 'glpi adds the item 114'),
(520, 115, 'ticket', '2023-11-19 14:45:17', 'tracking', 4, 'glpi adds the item 115'),
(521, 116, 'ticket', '2023-11-19 14:45:17', 'tracking', 4, 'glpi adds the item 116'),
(522, 117, 'ticket', '2023-11-19 14:45:18', 'tracking', 4, 'glpi adds the item 117'),
(523, 118, 'ticket', '2023-11-19 14:45:19', 'tracking', 4, 'glpi adds the item 118'),
(524, 119, 'ticket', '2023-11-19 14:45:20', 'tracking', 4, 'glpi adds the item 119'),
(525, 120, 'ticket', '2023-11-19 14:45:20', 'tracking', 4, 'glpi adds the item 120'),
(526, 121, 'ticket', '2023-11-19 14:45:21', 'tracking', 4, 'glpi adds the item 121'),
(527, 122, 'ticket', '2023-11-19 14:45:22', 'tracking', 4, 'glpi adds the item 122'),
(528, 123, 'ticket', '2023-11-19 14:45:23', 'tracking', 4, 'glpi adds the item 123'),
(529, 124, 'ticket', '2023-11-19 14:45:23', 'tracking', 4, 'glpi adds the item 124'),
(530, 125, 'ticket', '2023-11-19 14:45:24', 'tracking', 4, 'glpi adds the item 125'),
(531, 126, 'ticket', '2023-11-19 14:45:25', 'tracking', 4, 'glpi adds the item 126'),
(532, 127, 'ticket', '2023-11-19 14:45:25', 'tracking', 4, 'glpi adds the item 127'),
(533, 128, 'ticket', '2023-11-19 14:45:26', 'tracking', 4, 'glpi adds the item 128'),
(534, 129, 'ticket', '2023-11-19 14:45:27', 'tracking', 4, 'glpi adds the item 129'),
(535, 130, 'ticket', '2023-11-19 14:45:27', 'tracking', 4, 'glpi adds the item 130'),
(536, 131, 'ticket', '2023-11-19 14:45:28', 'tracking', 4, 'glpi adds the item 131'),
(537, 132, 'ticket', '2023-11-19 14:45:29', 'tracking', 4, 'glpi adds the item 132'),
(538, 133, 'ticket', '2023-11-19 14:45:30', 'tracking', 4, 'glpi adds the item 133'),
(539, 134, 'ticket', '2023-11-19 14:45:30', 'tracking', 4, 'glpi adds the item 134'),
(540, 135, 'ticket', '2023-11-19 14:45:31', 'tracking', 4, 'glpi adds the item 135'),
(541, 136, 'ticket', '2023-11-19 14:50:48', 'tracking', 4, 'glpi adds the item 136'),
(542, 137, 'ticket', '2023-11-19 15:08:49', 'tracking', 4, 'glpi adds the item 137'),
(543, 1, 'slas', '2023-11-19 15:27:51', 'setup', 4, 'glpi updates the SLA level'),
(544, 138, 'ticket', '2023-11-19 15:30:34', 'tracking', 4, 'glpi adds the item 138'),
(545, 139, 'ticket', '2023-11-19 15:30:34', 'tracking', 4, 'glpi adds the item 139'),
(546, 140, 'ticket', '2023-11-19 15:30:38', 'tracking', 4, 'glpi adds the item 140'),
(547, 0, 'system', '2023-11-19 15:32:32', 'login', 3, 'glpi login from IP 192.168.1.3'),
(548, 141, 'ticket', '2023-11-19 15:36:31', 'tracking', 4, 'glpi adds the item 141'),
(549, 1, 'slas', '2023-11-19 15:39:52', 'setup', 4, 'glpi updates the SLA level'),
(550, 1, 'slas', '2023-11-19 15:42:35', 'setup', 4, 'glpi Updates an Item'),
(551, 1, 'slas', '2023-11-19 15:43:31', 'setup', 4, 'glpi updates the SLA level'),
(552, 1, 'slms', '2023-11-19 15:46:23', 'setup', 4, 'glpi Updates an Item'),
(553, 142, 'ticket', '2023-11-19 15:47:21', 'tracking', 4, 'glpi adds the item 142'),
(554, 143, 'ticket', '2023-11-19 15:50:50', 'tracking', 4, 'glpi adds the item 143'),
(555, 144, 'ticket', '2023-11-19 15:56:52', 'tracking', 4, 'glpi adds the item 144'),
(556, 145, 'ticket', '2023-11-19 16:56:56', 'tracking', 4, 'glpi adds the item 145'),
(557, 146, 'ticket', '2023-11-19 17:02:56', 'tracking', 4, 'glpi adds the item 146'),
(558, 147, 'ticket', '2023-11-19 17:08:56', 'tracking', 4, 'glpi adds the item 147'),
(559, 148, 'ticket', '2023-11-19 18:03:00', 'tracking', 4, 'glpi adds the item 148'),
(560, 149, 'ticket', '2023-11-19 18:08:59', 'tracking', 4, 'glpi adds the item 149'),
(561, 150, 'ticket', '2023-11-19 18:33:01', 'tracking', 4, 'glpi adds the item 150'),
(562, 151, 'ticket', '2023-11-19 19:09:04', 'tracking', 4, 'glpi adds the item 151'),
(563, 152, 'ticket', '2023-11-19 19:12:55', 'tracking', 4, 'glpi adds the item 152'),
(564, 153, 'ticket', '2023-11-19 19:15:05', 'tracking', 4, 'glpi adds the item 153'),
(565, 154, 'ticket', '2023-11-19 20:15:09', 'tracking', 4, 'glpi adds the item 154'),
(566, 155, 'ticket', '2023-11-19 20:21:08', 'tracking', 4, 'glpi adds the item 155'),
(567, 156, 'ticket', '2023-11-20 00:35:39', 'tracking', 4, 'glpi adds the item 156'),
(568, 157, 'ticket', '2023-11-20 00:35:40', 'tracking', 4, 'glpi adds the item 157'),
(569, 158, 'ticket', '2023-11-20 00:35:40', 'tracking', 4, 'glpi adds the item 158'),
(570, 159, 'ticket', '2023-11-20 00:53:54', 'tracking', 4, 'glpi adds the item 159'),
(571, 160, 'ticket', '2023-11-20 00:53:55', 'tracking', 4, 'glpi adds the item 160'),
(572, 161, 'ticket', '2023-11-20 00:54:28', 'tracking', 4, 'glpi adds the item 161'),
(573, 162, 'ticket', '2023-11-20 00:54:29', 'tracking', 4, 'glpi adds the item 162'),
(574, 0, 'system', '2023-11-20 00:54:58', 'login', 3, 'glpi login from IP 172.20.0.8'),
(575, 163, 'ticket', '2023-11-20 00:56:31', 'tracking', 4, 'glpi adds the item 163'),
(576, 164, 'ticket', '2023-11-20 00:56:31', 'tracking', 4, 'glpi adds the item 164'),
(577, 165, 'ticket', '2023-11-20 00:56:32', 'tracking', 4, 'glpi adds the item 165'),
(578, 166, 'ticket', '2023-11-20 00:56:33', 'tracking', 4, 'glpi adds the item 166'),
(579, 167, 'ticket', '2023-11-20 00:56:33', 'tracking', 4, 'glpi adds the item 167'),
(580, 168, 'ticket', '2023-11-20 00:56:57', 'tracking', 4, 'glpi adds the item 168'),
(581, 169, 'ticket', '2023-11-20 00:56:58', 'tracking', 4, 'glpi adds the item 169'),
(582, 170, 'ticket', '2023-11-20 00:57:26', 'tracking', 4, 'glpi adds the item 170'),
(583, 171, 'ticket', '2023-11-20 01:05:29', 'tracking', 4, 'glpi adds the item 171'),
(584, 172, 'ticket', '2023-11-20 01:05:31', 'tracking', 4, 'glpi adds the item 172'),
(585, 173, 'ticket', '2023-11-20 01:05:31', 'tracking', 4, 'glpi adds the item 173'),
(586, 2, 'users', '2023-11-20 01:23:36', 'setup', 5, 'glpi Updates an Item'),
(587, 4, 'users', '2023-11-20 01:24:56', 'setup', 5, 'glpi Updates an Item'),
(588, 4, 'users', '2023-11-20 01:25:07', 'setup', 5, 'glpi Updates an Item'),
(589, 5, 'users', '2023-11-20 01:27:09', 'setup', 5, 'glpi Updates an Item'),
(590, 3, 'users', '2023-11-20 01:27:22', 'setup', 5, 'glpi Updates an Item'),
(591, 174, 'ticket', '2023-11-20 01:28:56', 'tracking', 4, 'glpi adds the item 174'),
(592, 175, 'ticket', '2023-11-20 01:28:58', 'tracking', 4, 'glpi adds the item 175'),
(593, 176, 'ticket', '2023-11-20 01:28:59', 'tracking', 4, 'glpi adds the item 176'),
(594, 177, 'ticket', '2023-11-20 01:29:36', 'tracking', 4, 'glpi adds the item 177'),
(595, 178, 'ticket', '2023-11-20 01:29:37', 'tracking', 4, 'glpi adds the item 178'),
(596, 179, 'ticket', '2023-11-20 01:29:48', 'tracking', 4, 'glpi adds the item 179'),
(597, 180, 'ticket', '2023-11-20 01:29:49', 'tracking', 4, 'glpi adds the item 180'),
(598, 181, 'ticket', '2023-11-20 01:29:50', 'tracking', 4, 'glpi adds the item 181');
INSERT INTO `glpi_events` (`id`, `items_id`, `type`, `date`, `service`, `level`, `message`) VALUES
(599, 182, 'ticket', '2023-11-20 01:29:50', 'tracking', 4, 'glpi adds the item 182'),
(600, 183, 'ticket', '2023-11-20 01:29:51', 'tracking', 4, 'glpi adds the item 183'),
(601, 184, 'ticket', '2023-11-20 01:29:51', 'tracking', 4, 'glpi adds the item 184'),
(602, 185, 'ticket', '2023-11-20 01:29:52', 'tracking', 4, 'glpi adds the item 185'),
(603, 186, 'ticket', '2023-11-20 01:29:53', 'tracking', 4, 'glpi adds the item 186'),
(604, 187, 'ticket', '2023-11-20 01:29:53', 'tracking', 4, 'glpi adds the item 187'),
(605, 188, 'ticket', '2023-11-20 01:29:54', 'tracking', 4, 'glpi adds the item 188'),
(606, 189, 'ticket', '2023-11-20 01:29:54', 'tracking', 4, 'glpi adds the item 189'),
(607, 190, 'ticket', '2023-11-20 01:29:55', 'tracking', 4, 'glpi adds the item 190'),
(608, 191, 'ticket', '2023-11-20 01:29:56', 'tracking', 4, 'glpi adds the item 191'),
(609, 192, 'ticket', '2023-11-20 01:29:56', 'tracking', 4, 'glpi adds the item 192'),
(610, 193, 'ticket', '2023-11-20 01:29:57', 'tracking', 4, 'glpi adds the item 193'),
(611, 194, 'ticket', '2023-11-20 01:29:58', 'tracking', 4, 'glpi adds the item 194'),
(612, 195, 'ticket', '2023-11-20 01:29:58', 'tracking', 4, 'glpi adds the item 195'),
(613, 196, 'ticket', '2023-11-20 01:29:59', 'tracking', 4, 'glpi adds the item 196'),
(614, 197, 'ticket', '2023-11-20 01:29:59', 'tracking', 4, 'glpi adds the item 197'),
(615, 198, 'ticket', '2023-11-20 01:30:00', 'tracking', 4, 'glpi adds the item 198'),
(616, 199, 'ticket', '2023-11-20 01:30:01', 'tracking', 4, 'glpi adds the item 199'),
(617, 200, 'ticket', '2023-11-20 01:30:01', 'tracking', 4, 'glpi adds the item 200'),
(618, 201, 'ticket', '2023-11-20 01:30:02', 'tracking', 4, 'glpi adds the item 201'),
(619, 202, 'ticket', '2023-11-20 01:30:02', 'tracking', 4, 'glpi adds the item 202'),
(620, 203, 'ticket', '2023-11-20 01:30:03', 'tracking', 4, 'glpi adds the item 203'),
(621, 204, 'ticket', '2023-11-20 01:30:04', 'tracking', 4, 'glpi adds the item 204'),
(622, 205, 'ticket', '2023-11-20 01:30:04', 'tracking', 4, 'glpi adds the item 205'),
(623, 206, 'ticket', '2023-11-20 01:30:05', 'tracking', 4, 'glpi adds the item 206'),
(624, 207, 'ticket', '2023-11-20 01:30:05', 'tracking', 4, 'glpi adds the item 207'),
(625, 208, 'ticket', '2023-11-20 01:30:06', 'tracking', 4, 'glpi adds the item 208'),
(626, 209, 'ticket', '2023-11-20 01:30:07', 'tracking', 4, 'glpi adds the item 209'),
(627, 210, 'ticket', '2023-11-20 01:30:07', 'tracking', 4, 'glpi adds the item 210'),
(628, 211, 'ticket', '2023-11-20 01:30:08', 'tracking', 4, 'glpi adds the item 211'),
(629, 212, 'ticket', '2023-11-20 01:30:09', 'tracking', 4, 'glpi adds the item 212'),
(630, 213, 'ticket', '2023-11-20 01:30:09', 'tracking', 4, 'glpi adds the item 213'),
(631, 214, 'ticket', '2023-11-20 01:30:10', 'tracking', 4, 'glpi adds the item 214'),
(632, 215, 'ticket', '2023-11-20 01:30:10', 'tracking', 4, 'glpi adds the item 215'),
(633, 216, 'ticket', '2023-11-20 01:30:11', 'tracking', 4, 'glpi adds the item 216'),
(634, 217, 'ticket', '2023-11-20 01:30:12', 'tracking', 4, 'glpi adds the item 217'),
(635, 218, 'ticket', '2023-11-20 01:30:12', 'tracking', 4, 'glpi adds the item 218'),
(636, 219, 'ticket', '2023-11-20 01:30:13', 'tracking', 4, 'glpi adds the item 219'),
(637, 220, 'ticket', '2023-11-20 01:30:13', 'tracking', 4, 'glpi adds the item 220'),
(638, 221, 'ticket', '2023-11-20 01:30:14', 'tracking', 4, 'glpi adds the item 221'),
(639, 222, 'ticket', '2023-11-20 01:30:15', 'tracking', 4, 'glpi adds the item 222'),
(640, 223, 'ticket', '2023-11-20 01:30:15', 'tracking', 4, 'glpi adds the item 223'),
(641, 224, 'ticket', '2023-11-20 01:30:16', 'tracking', 4, 'glpi adds the item 224'),
(642, 225, 'ticket', '2023-11-20 01:30:17', 'tracking', 4, 'glpi adds the item 225'),
(643, 226, 'ticket', '2023-11-20 01:30:17', 'tracking', 4, 'glpi adds the item 226'),
(644, 227, 'ticket', '2023-11-20 01:30:18', 'tracking', 4, 'glpi adds the item 227'),
(645, 228, 'ticket', '2023-11-20 01:30:18', 'tracking', 4, 'glpi adds the item 228'),
(646, 229, 'ticket', '2023-11-20 01:30:19', 'tracking', 4, 'glpi adds the item 229'),
(647, 230, 'ticket', '2023-11-20 01:30:20', 'tracking', 4, 'glpi adds the item 230'),
(648, 231, 'ticket', '2023-11-20 01:30:20', 'tracking', 4, 'glpi adds the item 231'),
(649, 232, 'ticket', '2023-11-20 01:30:21', 'tracking', 4, 'glpi adds the item 232'),
(650, 233, 'ticket', '2023-11-20 01:30:21', 'tracking', 4, 'glpi adds the item 233'),
(651, 234, 'ticket', '2023-11-20 01:30:22', 'tracking', 4, 'glpi adds the item 234'),
(652, 235, 'ticket', '2023-11-20 01:30:23', 'tracking', 4, 'glpi adds the item 235'),
(653, 236, 'ticket', '2023-11-20 01:30:23', 'tracking', 4, 'glpi adds the item 236'),
(654, 237, 'ticket', '2023-11-20 01:30:24', 'tracking', 4, 'glpi adds the item 237'),
(655, 238, 'ticket', '2023-11-20 01:30:24', 'tracking', 4, 'glpi adds the item 238'),
(656, 239, 'ticket', '2023-11-20 01:30:25', 'tracking', 4, 'glpi adds the item 239'),
(657, 240, 'ticket', '2023-11-20 01:30:26', 'tracking', 4, 'glpi adds the item 240'),
(658, 241, 'ticket', '2023-11-20 01:30:26', 'tracking', 4, 'glpi adds the item 241'),
(659, 242, 'ticket', '2023-11-20 01:30:27', 'tracking', 4, 'glpi adds the item 242'),
(660, 243, 'ticket', '2023-11-20 01:30:27', 'tracking', 4, 'glpi adds the item 243'),
(661, 244, 'ticket', '2023-11-20 01:30:28', 'tracking', 4, 'glpi adds the item 244'),
(662, 245, 'ticket', '2023-11-20 01:30:29', 'tracking', 4, 'glpi adds the item 245'),
(663, 246, 'ticket', '2023-11-20 01:30:29', 'tracking', 4, 'glpi adds the item 246'),
(664, 247, 'ticket', '2023-11-20 01:30:30', 'tracking', 4, 'glpi adds the item 247'),
(665, 248, 'ticket', '2023-11-20 01:30:31', 'tracking', 4, 'glpi adds the item 248'),
(666, 249, 'ticket', '2023-11-20 01:30:31', 'tracking', 4, 'glpi adds the item 249'),
(667, 250, 'ticket', '2023-11-20 01:30:32', 'tracking', 4, 'glpi adds the item 250'),
(668, 251, 'ticket', '2023-11-20 01:30:33', 'tracking', 4, 'glpi adds the item 251'),
(669, 252, 'ticket', '2023-11-20 01:30:33', 'tracking', 4, 'glpi adds the item 252'),
(670, 253, 'ticket', '2023-11-20 01:30:34', 'tracking', 4, 'glpi adds the item 253'),
(671, 254, 'ticket', '2023-11-20 01:30:35', 'tracking', 4, 'glpi adds the item 254'),
(672, 255, 'ticket', '2023-11-20 01:30:35', 'tracking', 4, 'glpi adds the item 255'),
(673, 256, 'ticket', '2023-11-20 01:30:36', 'tracking', 4, 'glpi adds the item 256'),
(674, 257, 'ticket', '2023-11-20 01:30:37', 'tracking', 4, 'glpi adds the item 257'),
(675, 258, 'ticket', '2023-11-20 01:30:37', 'tracking', 4, 'glpi adds the item 258'),
(676, 259, 'ticket', '2023-11-20 01:30:38', 'tracking', 4, 'glpi adds the item 259'),
(677, 260, 'ticket', '2023-11-20 01:30:38', 'tracking', 4, 'glpi adds the item 260'),
(678, 261, 'ticket', '2023-11-20 01:30:39', 'tracking', 4, 'glpi adds the item 261'),
(679, 262, 'ticket', '2023-11-20 01:30:40', 'tracking', 4, 'glpi adds the item 262'),
(680, 263, 'ticket', '2023-11-20 01:30:40', 'tracking', 4, 'glpi adds the item 263'),
(681, 264, 'ticket', '2023-11-20 01:30:41', 'tracking', 4, 'glpi adds the item 264'),
(682, 265, 'ticket', '2023-11-20 01:30:42', 'tracking', 4, 'glpi adds the item 265'),
(683, 1, 'Calendar', '2023-11-20 01:51:16', 'setup', 4, 'glpi Updates an Item'),
(684, 1, 'Calendar', '2023-11-20 01:51:26', 'setup', 4, 'glpi Updates an Item'),
(685, 1, 'calendars', '2023-11-20 01:52:07', 'setup', 4, 'glpi Adds a Link with an Item'),
(686, 1, 'calendars', '2023-11-20 01:52:23', 'setup', 4, 'glpi Adds a Link with an Item'),
(687, 1, 'calendars', '2023-11-20 01:52:41', 'setup', 4, 'glpi Adds a Link with an Item'),
(688, 1, 'calendars', '2023-11-20 01:53:15', 'setup', 4, 'glpi Adds a Link with an Item'),
(689, 1, 'calendars', '2023-11-20 01:53:33', 'setup', 4, 'glpi Adds a Link with an Item'),
(690, 1, 'calendars', '2023-11-20 01:53:48', 'setup', 4, 'glpi Adds a Link with an Item'),
(691, 1, 'calendars', '2023-11-20 01:54:02', 'setup', 4, 'glpi Adds a Link with an Item'),
(692, 1, 'calendars', '2023-11-20 01:54:13', 'setup', 4, 'glpi Adds a Link with an Item'),
(693, 1, 'calendars', '2023-11-20 01:54:25', 'setup', 4, 'glpi Adds a Link with an Item'),
(694, 1, 'calendars', '2023-11-20 01:54:40', 'setup', 4, 'glpi Adds a Link with an Item'),
(695, 1, 'slms', '2023-11-20 01:54:58', 'setup', 4, 'glpi Updates an Item'),
(696, 266, 'ticket', '2023-11-20 01:57:01', 'tracking', 4, 'glpi adds the item 266'),
(697, 0, 'system', '2023-11-20 03:38:10', 'login', 3, 'glpi login from IP 172.20.0.8'),
(698, 267, 'ticket', '2023-11-20 04:03:42', 'tracking', 4, 'glpi adds the item 267'),
(699, 268, 'ticket', '2023-11-20 04:03:43', 'tracking', 4, 'glpi adds the item 268'),
(700, 269, 'ticket', '2023-11-20 04:03:44', 'tracking', 4, 'glpi adds the item 269'),
(701, 270, 'ticket', '2023-11-20 04:03:44', 'tracking', 4, 'glpi adds the item 270'),
(702, 271, 'ticket', '2023-11-20 04:03:45', 'tracking', 4, 'glpi adds the item 271'),
(703, 272, 'ticket', '2023-11-20 04:03:45', 'tracking', 4, 'glpi adds the item 272'),
(704, 273, 'ticket', '2023-11-20 04:03:46', 'tracking', 4, 'glpi adds the item 273'),
(705, 274, 'ticket', '2023-11-20 04:04:14', 'tracking', 4, 'glpi adds the item 274'),
(706, 275, 'ticket', '2023-11-20 04:04:16', 'tracking', 4, 'glpi adds the item 275'),
(707, 276, 'ticket', '2023-11-20 04:04:18', 'tracking', 4, 'glpi adds the item 276'),
(708, 0, 'system', '2023-11-20 04:04:38', 'login', 3, 'glpi login from IP 172.20.0.8'),
(709, 276, 'ticket', '2023-11-20 04:06:20', 'tracking', 4, 'glpi Updates an Item'),
(710, 277, 'ticket', '2023-11-20 10:10:02', 'tracking', 4, 'glpi adds the item 277'),
(711, 278, 'ticket', '2023-11-20 11:03:34', 'tracking', 4, 'glpi adds the item 278'),
(712, 279, 'ticket', '2023-11-20 11:03:36', 'tracking', 4, 'glpi adds the item 279'),
(713, 280, 'ticket', '2023-11-20 11:10:19', 'tracking', 4, 'glpi adds the item 280'),
(714, 281, 'ticket', '2023-11-20 11:10:20', 'tracking', 4, 'glpi adds the item 281'),
(715, 282, 'ticket', '2023-11-20 11:10:21', 'tracking', 4, 'glpi adds the item 282'),
(716, 283, 'ticket', '2023-11-20 11:10:21', 'tracking', 4, 'glpi adds the item 283'),
(717, 284, 'ticket', '2023-11-20 11:10:22', 'tracking', 4, 'glpi adds the item 284'),
(718, 285, 'ticket', '2023-11-20 11:10:23', 'tracking', 4, 'glpi adds the item 285'),
(719, 286, 'ticket', '2023-11-20 11:10:23', 'tracking', 4, 'glpi adds the item 286'),
(720, 287, 'ticket', '2023-11-20 11:10:24', 'tracking', 4, 'glpi adds the item 287'),
(721, 288, 'ticket', '2023-11-20 11:10:25', 'tracking', 4, 'glpi adds the item 288'),
(722, 289, 'ticket', '2023-11-20 11:10:25', 'tracking', 4, 'glpi adds the item 289'),
(723, 290, 'ticket', '2023-11-20 11:10:26', 'tracking', 4, 'glpi adds the item 290'),
(724, 291, 'ticket', '2023-11-20 11:10:27', 'tracking', 4, 'glpi adds the item 291'),
(725, 292, 'ticket', '2023-11-20 11:10:27', 'tracking', 4, 'glpi adds the item 292'),
(726, 293, 'ticket', '2023-11-20 11:10:28', 'tracking', 4, 'glpi adds the item 293'),
(727, 294, 'ticket', '2023-11-20 11:10:28', 'tracking', 4, 'glpi adds the item 294'),
(728, 295, 'ticket', '2023-11-20 11:10:29', 'tracking', 4, 'glpi adds the item 295'),
(729, 296, 'ticket', '2023-11-20 11:10:30', 'tracking', 4, 'glpi adds the item 296'),
(730, 297, 'ticket', '2023-11-20 11:10:30', 'tracking', 4, 'glpi adds the item 297'),
(731, 298, 'ticket', '2023-11-20 11:10:31', 'tracking', 4, 'glpi adds the item 298'),
(732, 299, 'ticket', '2023-11-20 11:10:31', 'tracking', 4, 'glpi adds the item 299'),
(733, 300, 'ticket', '2023-11-20 11:10:32', 'tracking', 4, 'glpi adds the item 300'),
(734, 301, 'ticket', '2023-11-20 11:10:33', 'tracking', 4, 'glpi adds the item 301'),
(735, 302, 'ticket', '2023-11-20 11:10:33', 'tracking', 4, 'glpi adds the item 302'),
(736, 303, 'ticket', '2023-11-20 11:10:34', 'tracking', 4, 'glpi adds the item 303'),
(737, 304, 'ticket', '2023-11-20 11:10:35', 'tracking', 4, 'glpi adds the item 304'),
(738, 305, 'ticket', '2023-11-20 11:10:35', 'tracking', 4, 'glpi adds the item 305'),
(739, 306, 'ticket', '2023-11-20 11:10:36', 'tracking', 4, 'glpi adds the item 306'),
(740, 307, 'ticket', '2023-11-20 11:10:37', 'tracking', 4, 'glpi adds the item 307'),
(741, 308, 'ticket', '2023-11-20 11:10:37', 'tracking', 4, 'glpi adds the item 308'),
(742, 309, 'ticket', '2023-11-20 11:10:38', 'tracking', 4, 'glpi adds the item 309'),
(743, 0, 'system', '2023-11-20 11:11:54', 'login', 3, 'Failed login for  from IP 172.20.0.8'),
(744, 0, 'system', '2023-11-20 11:21:54', 'login', 3, 'glpi login from IP 172.20.0.8'),
(745, 0, 'system', '2023-11-20 11:52:24', 'login', 3, 'glpi login from IP 172.20.0.8'),
(746, 0, 'system', '2023-11-20 12:03:35', 'login', 3, 'Failed login for glpi from IP 172.20.0.8'),
(747, 0, 'system', '2023-11-20 12:03:51', 'login', 3, 'Failed login for glpi from IP 172.20.0.8'),
(748, 0, 'system', '2023-11-20 12:04:03', 'login', 3, 'glpi login from IP 172.20.0.8'),
(749, 1, 'ticket', '2023-11-20 12:51:52', 'tracking', 4, 'glpi adds the item 1'),
(750, 2, 'ticket', '2023-11-20 12:51:54', 'tracking', 4, 'glpi adds the item 2'),
(751, 3, 'ticket', '2023-11-20 12:51:55', 'tracking', 4, 'glpi adds the item 3'),
(752, 4, 'ticket', '2023-11-20 12:51:56', 'tracking', 4, 'glpi adds the item 4'),
(753, 5, 'ticket', '2023-11-20 12:51:57', 'tracking', 4, 'glpi adds the item 5'),
(754, 6, 'ticket', '2023-11-20 12:51:58', 'tracking', 4, 'glpi adds the item 6'),
(755, 1, 'ticket', '2023-11-20 12:57:06', 'tracking', 4, 'glpi adds the item 1'),
(756, 0, 'system', '2023-11-21 05:33:30', 'login', 3, 'glpi login from IP 172.20.0.5'),
(757, 0, 'system', '2023-11-21 05:35:44', 'login', 3, 'glpi login from IP 172.20.0.1'),
(758, 2, 'ticket', '2023-11-21 05:46:11', 'tracking', 4, 'glpi adds the item 2'),
(759, 3, 'ticket', '2023-11-21 05:46:12', 'tracking', 4, 'glpi adds the item 3'),
(760, 4, 'ticket', '2023-11-21 05:46:14', 'tracking', 4, 'glpi adds the item 4'),
(761, 5, 'ticket', '2023-11-21 05:46:15', 'tracking', 4, 'glpi adds the item 5'),
(762, 6, 'ticket', '2023-11-21 05:46:16', 'tracking', 4, 'glpi adds the item 6'),
(763, 7, 'ticket', '2023-11-21 05:46:17', 'tracking', 4, 'glpi adds the item 7'),
(764, 8, 'ticket', '2023-11-21 05:46:19', 'tracking', 4, 'glpi adds the item 8'),
(765, 9, 'ticket', '2023-11-21 05:46:20', 'tracking', 4, 'glpi adds the item 9'),
(766, 10, 'ticket', '2023-11-21 05:46:21', 'tracking', 4, 'glpi adds the item 10'),
(767, 11, 'ticket', '2023-11-21 05:46:22', 'tracking', 4, 'glpi adds the item 11'),
(768, 12, 'ticket', '2023-11-21 05:46:23', 'tracking', 4, 'glpi adds the item 12'),
(769, 13, 'ticket', '2023-11-21 05:46:24', 'tracking', 4, 'glpi adds the item 13'),
(770, 14, 'ticket', '2023-11-21 05:46:24', 'tracking', 4, 'glpi adds the item 14'),
(771, 15, 'ticket', '2023-11-21 05:46:25', 'tracking', 4, 'glpi adds the item 15'),
(772, 16, 'ticket', '2023-11-21 05:46:26', 'tracking', 4, 'glpi adds the item 16'),
(773, 17, 'ticket', '2023-11-21 05:46:27', 'tracking', 4, 'glpi adds the item 17'),
(774, 18, 'ticket', '2023-11-21 05:46:27', 'tracking', 4, 'glpi adds the item 18'),
(775, 19, 'ticket', '2023-11-21 05:46:28', 'tracking', 4, 'glpi adds the item 19'),
(776, 20, 'ticket', '2023-11-21 05:46:29', 'tracking', 4, 'glpi adds the item 20'),
(777, 21, 'ticket', '2023-11-21 05:46:30', 'tracking', 4, 'glpi adds the item 21'),
(778, 22, 'ticket', '2023-11-21 05:46:30', 'tracking', 4, 'glpi adds the item 22'),
(779, 23, 'ticket', '2023-11-21 05:46:31', 'tracking', 4, 'glpi adds the item 23'),
(780, 24, 'ticket', '2023-11-21 05:46:32', 'tracking', 4, 'glpi adds the item 24'),
(781, 25, 'ticket', '2023-11-21 05:46:33', 'tracking', 4, 'glpi adds the item 25'),
(782, 26, 'ticket', '2023-11-21 05:46:33', 'tracking', 4, 'glpi adds the item 26'),
(783, 27, 'ticket', '2023-11-21 05:46:34', 'tracking', 4, 'glpi adds the item 27'),
(784, 28, 'ticket', '2023-11-21 05:46:35', 'tracking', 4, 'glpi adds the item 28'),
(785, 29, 'ticket', '2023-11-21 05:46:36', 'tracking', 4, 'glpi adds the item 29'),
(786, 30, 'ticket', '2023-11-21 05:46:36', 'tracking', 4, 'glpi adds the item 30'),
(787, 31, 'ticket', '2023-11-21 05:46:37', 'tracking', 4, 'glpi adds the item 31'),
(788, 32, 'ticket', '2023-11-21 05:46:38', 'tracking', 4, 'glpi adds the item 32'),
(789, 33, 'ticket', '2023-11-21 05:46:39', 'tracking', 4, 'glpi adds the item 33'),
(790, 34, 'ticket', '2023-11-21 05:46:39', 'tracking', 4, 'glpi adds the item 34'),
(791, 35, 'ticket', '2023-11-21 05:46:40', 'tracking', 4, 'glpi adds the item 35'),
(792, 0, 'system', '2023-11-21 05:49:02', 'setup', 3, 'glpi edited the emails notifications configuration'),
(793, 36, 'ticket', '2023-11-21 06:23:55', 'tracking', 4, 'glpi adds the item 36'),
(794, 37, 'ticket', '2023-11-21 06:23:58', 'tracking', 4, 'glpi adds the item 37'),
(795, 38, 'ticket', '2023-11-21 06:24:03', 'tracking', 4, 'glpi adds the item 38'),
(796, 39, 'ticket', '2023-11-21 06:24:39', 'tracking', 4, 'glpi adds the item 39'),
(797, 40, 'ticket', '2023-11-21 06:25:09', 'tracking', 4, 'glpi adds the item 40'),
(798, 41, 'ticket', '2023-11-21 06:25:15', 'tracking', 4, 'glpi adds the item 41'),
(799, 42, 'ticket', '2023-11-21 06:25:19', 'tracking', 4, 'glpi adds the item 42'),
(800, 43, 'ticket', '2023-11-21 06:25:20', 'tracking', 4, 'glpi adds the item 43'),
(801, 44, 'ticket', '2023-11-21 06:26:42', 'tracking', 4, 'glpi adds the item 44'),
(802, 45, 'ticket', '2023-11-21 06:27:25', 'tracking', 4, 'glpi adds the item 45'),
(803, 46, 'ticket', '2023-11-21 06:27:31', 'tracking', 4, 'glpi adds the item 46'),
(804, 47, 'ticket', '2023-11-21 06:28:03', 'tracking', 4, 'glpi adds the item 47'),
(805, 48, 'ticket', '2023-11-21 06:28:36', 'tracking', 4, 'glpi adds the item 48'),
(806, 49, 'ticket', '2023-11-21 06:28:36', 'tracking', 4, 'glpi adds the item 49'),
(807, 50, 'ticket', '2023-11-21 06:28:55', 'tracking', 4, 'glpi adds the item 50'),
(808, 51, 'ticket', '2023-11-21 06:29:04', 'tracking', 4, 'glpi adds the item 51'),
(809, 52, 'ticket', '2023-11-21 06:29:07', 'tracking', 4, 'glpi adds the item 52'),
(810, 53, 'ticket', '2023-11-21 06:29:23', 'tracking', 4, 'glpi adds the item 53'),
(811, 54, 'ticket', '2023-11-21 06:29:24', 'tracking', 4, 'glpi adds the item 54'),
(812, 55, 'ticket', '2023-11-21 06:29:25', 'tracking', 4, 'glpi adds the item 55'),
(813, 56, 'ticket', '2023-11-21 06:29:45', 'tracking', 4, 'glpi adds the item 56'),
(814, 57, 'ticket', '2023-11-21 06:29:46', 'tracking', 4, 'glpi adds the item 57'),
(815, 58, 'ticket', '2023-11-21 06:29:56', 'tracking', 4, 'glpi adds the item 58'),
(816, 59, 'ticket', '2023-11-21 06:29:57', 'tracking', 4, 'glpi adds the item 59'),
(817, 60, 'ticket', '2023-11-21 06:29:59', 'tracking', 4, 'glpi adds the item 60'),
(818, 61, 'ticket', '2023-11-21 06:30:00', 'tracking', 4, 'glpi adds the item 61'),
(819, 62, 'ticket', '2023-11-21 06:30:26', 'tracking', 4, 'glpi adds the item 62'),
(820, 63, 'ticket', '2023-11-21 06:30:51', 'tracking', 4, 'glpi adds the item 63'),
(821, 64, 'ticket', '2023-11-21 06:30:52', 'tracking', 4, 'glpi adds the item 64'),
(822, 65, 'ticket', '2023-11-21 06:30:56', 'tracking', 4, 'glpi adds the item 65'),
(823, 66, 'ticket', '2023-11-21 06:31:02', 'tracking', 4, 'glpi adds the item 66'),
(824, 67, 'ticket', '2023-11-21 06:31:25', 'tracking', 4, 'glpi adds the item 67'),
(825, 68, 'ticket', '2023-11-21 06:31:30', 'tracking', 4, 'glpi adds the item 68'),
(826, 69, 'ticket', '2023-11-21 06:31:36', 'tracking', 4, 'glpi adds the item 69'),
(827, 70, 'ticket', '2023-11-21 06:32:17', 'tracking', 4, 'glpi adds the item 70'),
(828, 71, 'ticket', '2023-11-21 06:32:25', 'tracking', 4, 'glpi adds the item 71'),
(829, 72, 'ticket', '2023-11-21 06:32:30', 'tracking', 4, 'glpi adds the item 72'),
(830, 73, 'ticket', '2023-11-21 06:32:38', 'tracking', 4, 'glpi adds the item 73'),
(831, 74, 'ticket', '2023-11-21 06:33:00', 'tracking', 4, 'glpi adds the item 74'),
(832, 75, 'ticket', '2023-11-21 06:33:31', 'tracking', 4, 'glpi adds the item 75'),
(833, 76, 'ticket', '2023-11-21 06:33:35', 'tracking', 4, 'glpi adds the item 76'),
(834, 77, 'ticket', '2023-11-21 06:33:54', 'tracking', 4, 'glpi adds the item 77'),
(835, 78, 'ticket', '2023-11-21 06:34:04', 'tracking', 4, 'glpi adds the item 78'),
(836, 79, 'ticket', '2023-11-21 06:34:11', 'tracking', 4, 'glpi adds the item 79'),
(837, 80, 'ticket', '2023-11-21 06:34:12', 'tracking', 4, 'glpi adds the item 80'),
(838, 81, 'ticket', '2023-11-21 06:34:26', 'tracking', 4, 'glpi adds the item 81'),
(839, 82, 'ticket', '2023-11-21 06:34:40', 'tracking', 4, 'glpi adds the item 82'),
(840, 83, 'ticket', '2023-11-21 06:34:42', 'tracking', 4, 'glpi adds the item 83'),
(841, 84, 'ticket', '2023-11-21 06:34:55', 'tracking', 4, 'glpi adds the item 84'),
(842, 85, 'ticket', '2023-11-21 06:35:07', 'tracking', 4, 'glpi adds the item 85'),
(843, 86, 'ticket', '2023-11-21 06:35:09', 'tracking', 4, 'glpi adds the item 86'),
(844, 87, 'ticket', '2023-11-21 06:35:17', 'tracking', 4, 'glpi adds the item 87'),
(845, 88, 'ticket', '2023-11-21 06:35:22', 'tracking', 4, 'glpi adds the item 88'),
(846, 89, 'ticket', '2023-11-21 06:35:26', 'tracking', 4, 'glpi adds the item 89'),
(847, 90, 'ticket', '2023-11-21 06:35:27', 'tracking', 4, 'glpi adds the item 90'),
(848, 91, 'ticket', '2023-11-21 06:35:27', 'tracking', 4, 'glpi adds the item 91'),
(849, 92, 'ticket', '2023-11-21 06:35:52', 'tracking', 4, 'glpi adds the item 92'),
(850, 93, 'ticket', '2023-11-21 06:36:56', 'tracking', 4, 'glpi adds the item 93'),
(851, 94, 'ticket', '2023-11-21 06:36:57', 'tracking', 4, 'glpi adds the item 94'),
(852, 95, 'ticket', '2023-11-21 06:37:01', 'tracking', 4, 'glpi adds the item 95'),
(853, 96, 'ticket', '2023-11-21 06:37:02', 'tracking', 4, 'glpi adds the item 96'),
(854, 97, 'ticket', '2023-11-21 06:37:04', 'tracking', 4, 'glpi adds the item 97'),
(855, 98, 'ticket', '2023-11-21 06:37:07', 'tracking', 4, 'glpi adds the item 98'),
(856, 99, 'ticket', '2023-11-21 06:37:38', 'tracking', 4, 'glpi adds the item 99'),
(857, 100, 'ticket', '2023-11-21 06:37:44', 'tracking', 4, 'glpi adds the item 100'),
(858, 101, 'ticket', '2023-11-21 06:37:46', 'tracking', 4, 'glpi adds the item 101'),
(859, 102, 'ticket', '2023-11-21 06:37:48', 'tracking', 4, 'glpi adds the item 102'),
(860, 103, 'ticket', '2023-11-21 06:37:56', 'tracking', 4, 'glpi adds the item 103'),
(861, 104, 'ticket', '2023-11-21 06:37:57', 'tracking', 4, 'glpi adds the item 104'),
(862, 105, 'ticket', '2023-11-21 06:38:21', 'tracking', 4, 'glpi adds the item 105'),
(863, 106, 'ticket', '2023-11-21 06:38:36', 'tracking', 4, 'glpi adds the item 106'),
(864, 107, 'ticket', '2023-11-21 06:38:56', 'tracking', 4, 'glpi adds the item 107'),
(865, 108, 'ticket', '2023-11-21 06:39:16', 'tracking', 4, 'glpi adds the item 108'),
(866, 109, 'ticket', '2023-11-21 06:39:29', 'tracking', 4, 'glpi adds the item 109'),
(867, 110, 'ticket', '2023-11-21 06:39:46', 'tracking', 4, 'glpi adds the item 110'),
(868, 111, 'ticket', '2023-11-21 06:39:57', 'tracking', 4, 'glpi adds the item 111'),
(869, 112, 'ticket', '2023-11-21 06:40:03', 'tracking', 4, 'glpi adds the item 112'),
(870, 113, 'ticket', '2023-11-21 06:40:20', 'tracking', 4, 'glpi adds the item 113'),
(871, 114, 'ticket', '2023-11-21 06:40:21', 'tracking', 4, 'glpi adds the item 114'),
(872, 115, 'ticket', '2023-11-21 06:40:44', 'tracking', 4, 'glpi adds the item 115'),
(873, 116, 'ticket', '2023-11-21 06:41:15', 'tracking', 4, 'glpi adds the item 116'),
(874, 117, 'ticket', '2023-11-21 06:41:32', 'tracking', 4, 'glpi adds the item 117'),
(875, 118, 'ticket', '2023-11-21 06:41:55', 'tracking', 4, 'glpi adds the item 118'),
(876, 119, 'ticket', '2023-11-21 06:42:15', 'tracking', 4, 'glpi adds the item 119'),
(877, 120, 'ticket', '2023-11-21 06:42:30', 'tracking', 4, 'glpi adds the item 120'),
(878, 121, 'ticket', '2023-11-21 06:42:40', 'tracking', 4, 'glpi adds the item 121'),
(879, 122, 'ticket', '2023-11-21 06:43:07', 'tracking', 4, 'glpi adds the item 122'),
(880, 123, 'ticket', '2023-11-21 06:43:11', 'tracking', 4, 'glpi adds the item 123'),
(881, 124, 'ticket', '2023-11-21 06:44:20', 'tracking', 4, 'glpi adds the item 124'),
(882, 125, 'ticket', '2023-11-21 06:44:26', 'tracking', 4, 'glpi adds the item 125'),
(883, 126, 'ticket', '2023-11-21 06:44:31', 'tracking', 4, 'glpi adds the item 126'),
(884, 127, 'ticket', '2023-11-21 06:44:31', 'tracking', 4, 'glpi adds the item 127'),
(885, 128, 'ticket', '2023-11-21 06:44:47', 'tracking', 4, 'glpi adds the item 128'),
(886, 129, 'ticket', '2023-11-21 06:44:56', 'tracking', 4, 'glpi adds the item 129'),
(887, 130, 'ticket', '2023-11-21 06:45:05', 'tracking', 4, 'glpi adds the item 130'),
(888, 131, 'ticket', '2023-11-21 06:45:05', 'tracking', 4, 'glpi adds the item 131'),
(889, 132, 'ticket', '2023-11-21 06:45:34', 'tracking', 4, 'glpi adds the item 132'),
(890, 133, 'ticket', '2023-11-21 06:45:51', 'tracking', 4, 'glpi adds the item 133'),
(891, 134, 'ticket', '2023-11-21 06:45:54', 'tracking', 4, 'glpi adds the item 134'),
(892, 135, 'ticket', '2023-11-21 06:45:58', 'tracking', 4, 'glpi adds the item 135'),
(893, 136, 'ticket', '2023-11-21 06:46:10', 'tracking', 4, 'glpi adds the item 136'),
(894, 137, 'ticket', '2023-11-21 06:46:17', 'tracking', 4, 'glpi adds the item 137'),
(895, 138, 'ticket', '2023-11-21 06:47:10', 'tracking', 4, 'glpi adds the item 138'),
(896, 139, 'ticket', '2023-11-21 06:47:30', 'tracking', 4, 'glpi adds the item 139'),
(897, 140, 'ticket', '2023-11-21 06:47:43', 'tracking', 4, 'glpi adds the item 140'),
(898, 141, 'ticket', '2023-11-21 06:48:10', 'tracking', 4, 'glpi adds the item 141'),
(899, 142, 'ticket', '2023-11-21 06:48:32', 'tracking', 4, 'glpi adds the item 142'),
(900, 143, 'ticket', '2023-11-21 06:48:40', 'tracking', 4, 'glpi adds the item 143'),
(901, 144, 'ticket', '2023-11-21 06:49:05', 'tracking', 4, 'glpi adds the item 144'),
(902, 145, 'ticket', '2023-11-21 06:49:18', 'tracking', 4, 'glpi adds the item 145'),
(903, 146, 'ticket', '2023-11-21 06:49:48', 'tracking', 4, 'glpi adds the item 146'),
(904, 147, 'ticket', '2023-11-21 06:50:28', 'tracking', 4, 'glpi adds the item 147'),
(905, 148, 'ticket', '2023-11-21 06:50:31', 'tracking', 4, 'glpi adds the item 148'),
(906, 149, 'ticket', '2023-11-21 06:50:55', 'tracking', 4, 'glpi adds the item 149'),
(907, 150, 'ticket', '2023-11-21 06:51:28', 'tracking', 4, 'glpi adds the item 150'),
(908, 151, 'ticket', '2023-11-21 06:51:34', 'tracking', 4, 'glpi adds the item 151'),
(909, 152, 'ticket', '2023-11-21 06:51:45', 'tracking', 4, 'glpi adds the item 152'),
(910, 153, 'ticket', '2023-11-21 06:51:51', 'tracking', 4, 'glpi adds the item 153'),
(911, 154, 'ticket', '2023-11-21 06:51:51', 'tracking', 4, 'glpi adds the item 154'),
(912, 155, 'ticket', '2023-11-21 06:52:28', 'tracking', 4, 'glpi adds the item 155'),
(913, 156, 'ticket', '2023-11-21 06:52:41', 'tracking', 4, 'glpi adds the item 156'),
(914, 157, 'ticket', '2023-11-21 06:53:20', 'tracking', 4, 'glpi adds the item 157'),
(915, 158, 'ticket', '2023-11-21 06:53:28', 'tracking', 4, 'glpi adds the item 158'),
(916, 159, 'ticket', '2023-11-21 06:54:25', 'tracking', 4, 'glpi adds the item 159'),
(917, 160, 'ticket', '2023-11-21 06:54:26', 'tracking', 4, 'glpi adds the item 160'),
(918, 161, 'ticket', '2023-11-21 06:54:28', 'tracking', 4, 'glpi adds the item 161'),
(919, 162, 'ticket', '2023-11-21 06:54:41', 'tracking', 4, 'glpi adds the item 162'),
(920, 163, 'ticket', '2023-11-21 06:54:43', 'tracking', 4, 'glpi adds the item 163'),
(921, 164, 'ticket', '2023-11-21 06:54:48', 'tracking', 4, 'glpi adds the item 164'),
(922, 165, 'ticket', '2023-11-21 06:55:16', 'tracking', 4, 'glpi adds the item 165'),
(923, 166, 'ticket', '2023-11-21 06:55:19', 'tracking', 4, 'glpi adds the item 166'),
(924, 167, 'ticket', '2023-11-21 06:55:23', 'tracking', 4, 'glpi adds the item 167'),
(925, 168, 'ticket', '2023-11-21 06:55:52', 'tracking', 4, 'glpi adds the item 168'),
(926, 169, 'ticket', '2023-11-21 06:56:13', 'tracking', 4, 'glpi adds the item 169'),
(927, 170, 'ticket', '2023-11-21 06:56:27', 'tracking', 4, 'glpi adds the item 170'),
(928, 171, 'ticket', '2023-11-21 06:56:52', 'tracking', 4, 'glpi adds the item 171'),
(929, 172, 'ticket', '2023-11-21 06:56:57', 'tracking', 4, 'glpi adds the item 172'),
(930, 173, 'ticket', '2023-11-21 06:56:58', 'tracking', 4, 'glpi adds the item 173'),
(931, 174, 'ticket', '2023-11-21 06:57:05', 'tracking', 4, 'glpi adds the item 174'),
(932, 175, 'ticket', '2023-11-21 06:57:36', 'tracking', 4, 'glpi adds the item 175'),
(933, 176, 'ticket', '2023-11-21 06:57:39', 'tracking', 4, 'glpi adds the item 176'),
(934, 177, 'ticket', '2023-11-21 06:57:43', 'tracking', 4, 'glpi adds the item 177'),
(935, 178, 'ticket', '2023-11-21 06:57:57', 'tracking', 4, 'glpi adds the item 178'),
(936, 179, 'ticket', '2023-11-21 06:58:00', 'tracking', 4, 'glpi adds the item 179'),
(937, 180, 'ticket', '2023-11-21 06:58:05', 'tracking', 4, 'glpi adds the item 180'),
(938, 181, 'ticket', '2023-11-21 06:58:11', 'tracking', 4, 'glpi adds the item 181'),
(939, 182, 'ticket', '2023-11-21 06:59:02', 'tracking', 4, 'glpi adds the item 182'),
(940, 183, 'ticket', '2023-11-21 06:59:09', 'tracking', 4, 'glpi adds the item 183'),
(941, 184, 'ticket', '2023-11-21 06:59:33', 'tracking', 4, 'glpi adds the item 184'),
(942, 185, 'ticket', '2023-11-21 07:00:38', 'tracking', 4, 'glpi adds the item 185'),
(943, 186, 'ticket', '2023-11-21 07:00:41', 'tracking', 4, 'glpi adds the item 186'),
(944, 187, 'ticket', '2023-11-21 07:00:42', 'tracking', 4, 'glpi adds the item 187'),
(945, 188, 'ticket', '2023-11-21 07:00:43', 'tracking', 4, 'glpi adds the item 188'),
(946, 189, 'ticket', '2023-11-21 07:01:09', 'tracking', 4, 'glpi adds the item 189'),
(947, 190, 'ticket', '2023-11-21 07:02:11', 'tracking', 4, 'glpi adds the item 190'),
(948, 191, 'ticket', '2023-11-21 07:02:12', 'tracking', 4, 'glpi adds the item 191'),
(949, 192, 'ticket', '2023-11-21 07:03:00', 'tracking', 4, 'glpi adds the item 192'),
(950, 193, 'ticket', '2023-11-21 07:03:09', 'tracking', 4, 'glpi adds the item 193'),
(951, 194, 'ticket', '2023-11-21 07:03:23', 'tracking', 4, 'glpi adds the item 194'),
(952, 195, 'ticket', '2023-11-21 07:03:41', 'tracking', 4, 'glpi adds the item 195'),
(953, 196, 'ticket', '2023-11-21 07:03:53', 'tracking', 4, 'glpi adds the item 196'),
(954, 197, 'ticket', '2023-11-21 07:03:54', 'tracking', 4, 'glpi adds the item 197'),
(955, 198, 'ticket', '2023-11-21 07:04:17', 'tracking', 4, 'glpi adds the item 198'),
(956, 199, 'ticket', '2023-11-21 07:04:40', 'tracking', 4, 'glpi adds the item 199'),
(957, 200, 'ticket', '2023-11-21 07:05:09', 'tracking', 4, 'glpi adds the item 200'),
(958, 201, 'ticket', '2023-11-21 07:05:11', 'tracking', 4, 'glpi adds the item 201'),
(959, 202, 'ticket', '2023-11-21 07:05:37', 'tracking', 4, 'glpi adds the item 202'),
(960, 203, 'ticket', '2023-11-21 07:05:47', 'tracking', 4, 'glpi adds the item 203'),
(961, 204, 'ticket', '2023-11-21 07:06:55', 'tracking', 4, 'glpi adds the item 204'),
(962, 205, 'ticket', '2023-11-21 07:06:56', 'tracking', 4, 'glpi adds the item 205'),
(963, 206, 'ticket', '2023-11-21 07:06:57', 'tracking', 4, 'glpi adds the item 206'),
(964, 207, 'ticket', '2023-11-21 07:07:11', 'tracking', 4, 'glpi adds the item 207'),
(965, 208, 'ticket', '2023-11-21 07:07:32', 'tracking', 4, 'glpi adds the item 208'),
(966, 209, 'ticket', '2023-11-21 07:07:53', 'tracking', 4, 'glpi adds the item 209'),
(967, 210, 'ticket', '2023-11-21 07:08:03', 'tracking', 4, 'glpi adds the item 210'),
(968, 211, 'ticket', '2023-11-21 07:08:33', 'tracking', 4, 'glpi adds the item 211'),
(969, 212, 'ticket', '2023-11-21 07:08:38', 'tracking', 4, 'glpi adds the item 212'),
(970, 213, 'ticket', '2023-11-21 07:09:18', 'tracking', 4, 'glpi adds the item 213'),
(971, 214, 'ticket', '2023-11-21 07:09:29', 'tracking', 4, 'glpi adds the item 214'),
(972, 215, 'ticket', '2023-11-21 07:09:37', 'tracking', 4, 'glpi adds the item 215'),
(973, 216, 'ticket', '2023-11-21 07:09:38', 'tracking', 4, 'glpi adds the item 216'),
(974, 217, 'ticket', '2023-11-21 07:09:49', 'tracking', 4, 'glpi adds the item 217'),
(975, 218, 'ticket', '2023-11-21 07:10:08', 'tracking', 4, 'glpi adds the item 218'),
(976, 219, 'ticket', '2023-11-21 07:10:37', 'tracking', 4, 'glpi adds the item 219'),
(977, 220, 'ticket', '2023-11-21 07:10:49', 'tracking', 4, 'glpi adds the item 220'),
(978, 221, 'ticket', '2023-11-21 07:11:03', 'tracking', 4, 'glpi adds the item 221'),
(979, 222, 'ticket', '2023-11-21 07:11:04', 'tracking', 4, 'glpi adds the item 222'),
(980, 223, 'ticket', '2023-11-21 07:11:06', 'tracking', 4, 'glpi adds the item 223'),
(981, 224, 'ticket', '2023-11-21 07:11:07', 'tracking', 4, 'glpi adds the item 224'),
(982, 225, 'ticket', '2023-11-21 07:12:19', 'tracking', 4, 'glpi adds the item 225'),
(983, 226, 'ticket', '2023-11-21 07:12:22', 'tracking', 4, 'glpi adds the item 226'),
(984, 227, 'ticket', '2023-11-21 07:12:23', 'tracking', 4, 'glpi adds the item 227'),
(985, 228, 'ticket', '2023-11-21 07:12:37', 'tracking', 4, 'glpi adds the item 228'),
(986, 229, 'ticket', '2023-11-21 07:12:58', 'tracking', 4, 'glpi adds the item 229'),
(987, 230, 'ticket', '2023-11-21 07:13:18', 'tracking', 4, 'glpi adds the item 230'),
(988, 231, 'ticket', '2023-11-21 07:14:03', 'tracking', 4, 'glpi adds the item 231'),
(989, 232, 'ticket', '2023-11-21 07:14:08', 'tracking', 4, 'glpi adds the item 232'),
(990, 233, 'ticket', '2023-11-21 07:14:34', 'tracking', 4, 'glpi adds the item 233'),
(991, 234, 'ticket', '2023-11-21 07:14:47', 'tracking', 4, 'glpi adds the item 234'),
(992, 235, 'ticket', '2023-11-21 07:15:05', 'tracking', 4, 'glpi adds the item 235'),
(993, 236, 'ticket', '2023-11-21 07:15:06', 'tracking', 4, 'glpi adds the item 236'),
(994, 237, 'ticket', '2023-11-21 07:15:24', 'tracking', 4, 'glpi adds the item 237'),
(995, 238, 'ticket', '2023-11-21 07:15:42', 'tracking', 4, 'glpi adds the item 238'),
(996, 239, 'ticket', '2023-11-21 07:15:46', 'tracking', 4, 'glpi adds the item 239'),
(997, 240, 'ticket', '2023-11-21 07:16:08', 'tracking', 4, 'glpi adds the item 240'),
(998, 241, 'ticket', '2023-11-21 07:16:09', 'tracking', 4, 'glpi adds the item 241'),
(999, 242, 'ticket', '2023-11-21 07:16:32', 'tracking', 4, 'glpi adds the item 242'),
(1000, 243, 'ticket', '2023-11-21 07:16:38', 'tracking', 4, 'glpi adds the item 243'),
(1001, 244, 'ticket', '2023-11-21 07:17:09', 'tracking', 4, 'glpi adds the item 244'),
(1002, 245, 'ticket', '2023-11-21 07:17:37', 'tracking', 4, 'glpi adds the item 245'),
(1003, 246, 'ticket', '2023-11-21 07:17:40', 'tracking', 4, 'glpi adds the item 246'),
(1004, 247, 'ticket', '2023-11-21 07:17:44', 'tracking', 4, 'glpi adds the item 247'),
(1005, 248, 'ticket', '2023-11-21 07:17:51', 'tracking', 4, 'glpi adds the item 248'),
(1006, 249, 'ticket', '2023-11-21 07:17:58', 'tracking', 4, 'glpi adds the item 249'),
(1007, 250, 'ticket', '2023-11-21 07:17:59', 'tracking', 4, 'glpi adds the item 250'),
(1008, 251, 'ticket', '2023-11-21 07:17:59', 'tracking', 4, 'glpi adds the item 251'),
(1009, 252, 'ticket', '2023-11-21 07:18:32', 'tracking', 4, 'glpi adds the item 252'),
(1010, 253, 'ticket', '2023-11-21 07:18:34', 'tracking', 4, 'glpi adds the item 253'),
(1011, 254, 'ticket', '2023-11-21 07:18:58', 'tracking', 4, 'glpi adds the item 254'),
(1012, 255, 'ticket', '2023-11-21 07:19:33', 'tracking', 4, 'glpi adds the item 255'),
(1013, 256, 'ticket', '2023-11-21 07:19:54', 'tracking', 4, 'glpi adds the item 256'),
(1014, 257, 'ticket', '2023-11-21 07:19:55', 'tracking', 4, 'glpi adds the item 257'),
(1015, 258, 'ticket', '2023-11-21 07:20:15', 'tracking', 4, 'glpi adds the item 258'),
(1016, 259, 'ticket', '2023-11-21 07:20:28', 'tracking', 4, 'glpi adds the item 259'),
(1017, 260, 'ticket', '2023-11-21 07:20:30', 'tracking', 4, 'glpi adds the item 260'),
(1018, 261, 'ticket', '2023-11-21 07:20:35', 'tracking', 4, 'glpi adds the item 261'),
(1019, 262, 'ticket', '2023-11-21 07:20:38', 'tracking', 4, 'glpi adds the item 262'),
(1020, 263, 'ticket', '2023-11-21 07:20:54', 'tracking', 4, 'glpi adds the item 263'),
(1021, 264, 'ticket', '2023-11-21 07:21:16', 'tracking', 4, 'glpi adds the item 264'),
(1022, 265, 'ticket', '2023-11-21 07:21:22', 'tracking', 4, 'glpi adds the item 265'),
(1023, 266, 'ticket', '2023-11-21 07:21:23', 'tracking', 4, 'glpi adds the item 266'),
(1024, 267, 'ticket', '2023-11-21 07:21:54', 'tracking', 4, 'glpi adds the item 267'),
(1025, 268, 'ticket', '2023-11-21 07:21:54', 'tracking', 4, 'glpi adds the item 268'),
(1026, 269, 'ticket', '2023-11-21 07:22:02', 'tracking', 4, 'glpi adds the item 269'),
(1027, 270, 'ticket', '2023-11-21 07:22:08', 'tracking', 4, 'glpi adds the item 270'),
(1028, 271, 'ticket', '2023-11-21 07:22:50', 'tracking', 4, 'glpi adds the item 271'),
(1029, 272, 'ticket', '2023-11-21 07:23:48', 'tracking', 4, 'glpi adds the item 272'),
(1030, 273, 'ticket', '2023-11-21 07:24:08', 'tracking', 4, 'glpi adds the item 273'),
(1031, 274, 'ticket', '2023-11-21 07:24:30', 'tracking', 4, 'glpi adds the item 274'),
(1032, 275, 'ticket', '2023-11-21 07:24:41', 'tracking', 4, 'glpi adds the item 275'),
(1033, 1, 'slms', '2023-11-21 07:25:10', 'setup', 4, 'glpi Updates an Item'),
(1034, 276, 'ticket', '2023-11-21 07:25:24', 'tracking', 4, 'glpi adds the item 276'),
(1035, 277, 'ticket', '2023-11-21 07:25:26', 'tracking', 4, 'glpi adds the item 277'),
(1036, 278, 'ticket', '2023-11-21 07:25:34', 'tracking', 4, 'glpi adds the item 278'),
(1037, 279, 'ticket', '2023-11-21 07:26:07', 'tracking', 4, 'glpi adds the item 279'),
(1038, 280, 'ticket', '2023-11-21 07:26:10', 'tracking', 4, 'glpi adds the item 280'),
(1039, 281, 'ticket', '2023-11-21 07:26:14', 'tracking', 4, 'glpi adds the item 281'),
(1040, 282, 'ticket', '2023-11-21 07:27:02', 'tracking', 4, 'glpi adds the item 282'),
(1041, 283, 'ticket', '2023-11-21 07:27:32', 'tracking', 4, 'glpi adds the item 283'),
(1042, 284, 'ticket', '2023-11-21 07:27:40', 'tracking', 4, 'glpi adds the item 284'),
(1043, 285, 'ticket', '2023-11-21 07:28:34', 'tracking', 4, 'glpi adds the item 285'),
(1044, 286, 'ticket', '2023-11-21 07:28:48', 'tracking', 4, 'glpi adds the item 286'),
(1045, 287, 'ticket', '2023-11-21 07:28:58', 'tracking', 4, 'glpi adds the item 287'),
(1046, 288, 'ticket', '2023-11-21 07:29:22', 'tracking', 4, 'glpi adds the item 288'),
(1047, 289, 'ticket', '2023-11-21 07:29:48', 'tracking', 4, 'glpi adds the item 289'),
(1048, 290, 'ticket', '2023-11-21 07:30:12', 'tracking', 4, 'glpi adds the item 290'),
(1049, 2, 'slms', '2023-11-21 07:35:05', 'setup', 4, 'glpi adds the item SLA_New'),
(1050, 3, 'slas', '2023-11-21 07:35:32', 'setup', 4, 'glpi adds the item SLA_New'),
(1051, 3, 'slas', '2023-11-21 07:36:12', 'setup', 4, 'glpi Adds a Link with an Item'),
(1052, 290, 'ticket', '2023-11-21 07:39:36', 'tracking', 4, 'glpi Updates an Item'),
(1053, 291, 'ticket', '2023-11-21 07:42:58', 'tracking', 4, 'glpi adds the item 291'),
(1054, 292, 'ticket', '2023-11-21 07:48:25', 'tracking', 4, 'glpi adds the item 292'),
(1055, 293, 'ticket', '2023-11-21 07:48:37', 'tracking', 4, 'glpi adds the item 293'),
(1056, 294, 'ticket', '2023-11-21 07:58:21', 'tracking', 4, 'glpi adds the item 294'),
(1057, 3, 'slms', '2023-11-21 07:58:59', 'setup', 4, 'glpi adds the item TTO'),
(1058, 4, 'slas', '2023-11-21 07:59:20', 'setup', 4, 'glpi adds the item TTO'),
(1059, 4, 'slas', '2023-11-21 07:59:40', 'setup', 4, 'glpi Adds a Link with an Item'),
(1060, 295, 'ticket', '2023-11-21 08:00:26', 'tracking', 4, 'glpi adds the item 295'),
(1061, 296, 'ticket', '2023-11-21 08:02:22', 'tracking', 4, 'glpi adds the item 296'),
(1062, 297, 'ticket', '2023-11-21 08:03:36', 'tracking', 4, 'glpi adds the item 297'),
(1063, 298, 'ticket', '2023-11-21 08:05:34', 'tracking', 4, 'glpi adds the item 298'),
(1064, 30, 'notificationtemplates', '2023-11-21 08:06:13', 'notification', 4, 'glpi adds the item SLA_Remainder'),
(1065, 299, 'ticket', '2023-11-21 08:07:24', 'tracking', 4, 'glpi adds the item 299'),
(1066, 300, 'ticket', '2023-11-21 08:08:40', 'tracking', 4, 'glpi adds the item 300'),
(1067, 301, 'ticket', '2023-11-21 08:10:33', 'tracking', 4, 'glpi adds the item 301'),
(1068, 31, 'notificationtemplates', '2023-11-21 08:16:18', 'notification', 4, 'glpi Updates an Item'),
(1069, 32, 'notificationtemplates', '2023-11-21 08:17:49', 'notification', 4, 'glpi adds the item Auto_SLA_Remainder'),
(1070, 31, 'notificationtemplatetranslations', '2023-11-21 08:18:54', 'notification', 4, 'glpi adds the item '),
(1071, 74, 'notifications', '2023-11-21 08:20:30', 'notification', 4, 'glpi adds the item Auto_SLA_Remainder'),
(1072, 5, 'users', '2023-11-21 08:28:46', 'setup', 5, 'glpi Updates an Item'),
(1073, 4, 'users', '2023-11-21 08:29:45', 'setup', 5, 'glpi Updates an Item'),
(1074, 2, 'groups', '2023-11-21 08:30:33', 'setup', 4, 'glpi adds the item Security Manager'),
(1075, 2, 'groups', '2023-11-21 08:30:56', 'setup', 4, 'glpi adds a user to a group'),
(1076, 1, 'groups', '2023-11-21 08:31:54', 'setup', 4, 'glpi adds a user to a group'),
(1077, 302, 'ticket', '2023-11-21 08:33:54', 'tracking', 4, 'glpi adds the item 302'),
(1078, 303, 'ticket', '2023-11-21 08:33:55', 'tracking', 4, 'glpi adds the item 303'),
(1079, 304, 'ticket', '2023-11-21 08:34:25', 'tracking', 4, 'glpi adds the item 304'),
(1080, 305, 'ticket', '2023-11-21 08:34:56', 'tracking', 4, 'glpi adds the item 305'),
(1081, 306, 'ticket', '2023-11-21 08:34:57', 'tracking', 4, 'glpi adds the item 306'),
(1082, 307, 'ticket', '2023-11-21 08:35:25', 'tracking', 4, 'glpi adds the item 307'),
(1083, 308, 'ticket', '2023-11-21 08:35:58', 'tracking', 4, 'glpi adds the item 308'),
(1084, 309, 'ticket', '2023-11-21 08:36:00', 'tracking', 4, 'glpi adds the item 309'),
(1085, 310, 'ticket', '2023-11-21 08:36:25', 'tracking', 4, 'glpi adds the item 310'),
(1086, 311, 'ticket', '2023-11-21 08:36:53', 'tracking', 4, 'glpi adds the item 311'),
(1087, 312, 'ticket', '2023-11-21 08:37:24', 'tracking', 4, 'glpi adds the item 312'),
(1088, 313, 'ticket', '2023-11-21 08:37:26', 'tracking', 4, 'glpi adds the item 313'),
(1089, 314, 'ticket', '2023-11-21 08:37:53', 'tracking', 4, 'glpi adds the item 314'),
(1090, 315, 'ticket', '2023-11-21 08:38:27', 'tracking', 4, 'glpi adds the item 315'),
(1091, 316, 'ticket', '2023-11-21 08:38:28', 'tracking', 4, 'glpi adds the item 316'),
(1092, 317, 'ticket', '2023-11-21 08:38:55', 'tracking', 4, 'glpi adds the item 317'),
(1093, 318, 'ticket', '2023-11-21 08:39:29', 'tracking', 4, 'glpi adds the item 318'),
(1094, 319, 'ticket', '2023-11-21 08:39:32', 'tracking', 4, 'glpi adds the item 319'),
(1095, 320, 'ticket', '2023-11-21 08:40:02', 'tracking', 4, 'glpi adds the item 320'),
(1096, 321, 'ticket', '2023-11-21 08:40:13', 'tracking', 4, 'glpi adds the item 321'),
(1097, 322, 'ticket', '2023-11-21 08:40:37', 'tracking', 4, 'glpi adds the item 322'),
(1098, 323, 'ticket', '2023-11-21 08:40:40', 'tracking', 4, 'glpi adds the item 323'),
(1099, 324, 'ticket', '2023-11-21 08:41:12', 'tracking', 4, 'glpi adds the item 324'),
(1100, 325, 'ticket', '2023-11-21 08:41:41', 'tracking', 4, 'glpi adds the item 325'),
(1101, 326, 'ticket', '2023-11-21 08:41:44', 'tracking', 4, 'glpi adds the item 326'),
(1102, 327, 'ticket', '2023-11-21 08:42:12', 'tracking', 4, 'glpi adds the item 327'),
(1103, 328, 'ticket', '2023-11-21 08:42:43', 'tracking', 4, 'glpi adds the item 328'),
(1104, 329, 'ticket', '2023-11-21 08:42:46', 'tracking', 4, 'glpi adds the item 329'),
(1105, 330, 'ticket', '2023-11-21 08:43:18', 'tracking', 4, 'glpi adds the item 330'),
(1106, 331, 'ticket', '2023-11-21 08:43:49', 'tracking', 4, 'glpi adds the item 331'),
(1107, 332, 'ticket', '2023-11-21 08:43:50', 'tracking', 4, 'glpi adds the item 332'),
(1108, 333, 'ticket', '2023-11-21 08:44:29', 'tracking', 4, 'glpi adds the item 333'),
(1109, 334, 'ticket', '2023-11-21 08:45:00', 'tracking', 4, 'glpi adds the item 334'),
(1110, 335, 'ticket', '2023-11-21 08:45:02', 'tracking', 4, 'glpi adds the item 335'),
(1111, 336, 'ticket', '2023-11-21 08:45:33', 'tracking', 4, 'glpi adds the item 336'),
(1112, 337, 'ticket', '2023-11-21 08:46:06', 'tracking', 4, 'glpi adds the item 337'),
(1113, 338, 'ticket', '2023-11-21 08:46:09', 'tracking', 4, 'glpi adds the item 338'),
(1114, 339, 'ticket', '2023-11-21 08:46:41', 'tracking', 4, 'glpi adds the item 339'),
(1115, 1, 'groups', '2023-11-21 08:46:59', 'setup', 4, 'glpi adds a user to a group'),
(1116, 340, 'ticket', '2023-11-21 08:47:11', 'tracking', 4, 'glpi adds the item 340'),
(1117, 341, 'ticket', '2023-11-21 08:47:14', 'tracking', 4, 'glpi adds the item 341'),
(1118, 342, 'ticket', '2023-11-21 08:47:43', 'tracking', 4, 'glpi adds the item 342'),
(1119, 343, 'ticket', '2023-11-21 08:48:10', 'tracking', 4, 'glpi adds the item 343'),
(1120, 344, 'ticket', '2023-11-21 08:48:38', 'tracking', 4, 'glpi adds the item 344'),
(1121, 345, 'ticket', '2023-11-21 08:48:40', 'tracking', 4, 'glpi adds the item 345'),
(1122, 346, 'ticket', '2023-11-21 08:49:11', 'tracking', 4, 'glpi adds the item 346'),
(1123, 347, 'ticket', '2023-11-21 08:49:38', 'tracking', 4, 'glpi adds the item 347'),
(1124, 348, 'ticket', '2023-11-21 08:49:40', 'tracking', 4, 'glpi adds the item 348'),
(1125, 349, 'ticket', '2023-11-21 08:50:08', 'tracking', 4, 'glpi adds the item 349'),
(1126, 350, 'ticket', '2023-11-21 08:50:41', 'tracking', 4, 'glpi adds the item 350'),
(1127, 351, 'ticket', '2023-11-21 08:50:42', 'tracking', 4, 'glpi adds the item 351'),
(1128, 352, 'ticket', '2023-11-21 08:51:14', 'tracking', 4, 'glpi adds the item 352'),
(1129, 353, 'ticket', '2023-11-21 08:51:51', 'tracking', 4, 'glpi adds the item 353'),
(1130, 354, 'ticket', '2023-11-21 08:51:52', 'tracking', 4, 'glpi adds the item 354'),
(1131, 355, 'ticket', '2023-11-21 08:52:22', 'tracking', 4, 'glpi adds the item 355'),
(1132, 356, 'ticket', '2023-11-21 08:52:26', 'tracking', 4, 'glpi adds the item 356'),
(1133, 357, 'ticket', '2023-11-21 08:52:56', 'tracking', 4, 'glpi adds the item 357'),
(1134, 358, 'ticket', '2023-11-21 08:53:00', 'tracking', 4, 'glpi adds the item 358'),
(1135, 359, 'ticket', '2023-11-21 08:53:30', 'tracking', 4, 'glpi adds the item 359'),
(1136, 360, 'ticket', '2023-11-21 08:54:04', 'tracking', 4, 'glpi adds the item 360'),
(1137, 361, 'ticket', '2023-11-21 08:54:06', 'tracking', 4, 'glpi adds the item 361'),
(1138, 362, 'ticket', '2023-11-21 08:54:38', 'tracking', 4, 'glpi adds the item 362'),
(1139, 363, 'ticket', '2023-11-21 08:55:34', 'tracking', 4, 'glpi adds the item 363'),
(1140, 364, 'ticket', '2023-11-21 08:58:18', 'tracking', 4, 'glpi adds the item 364'),
(1141, 365, 'ticket', '2023-11-21 09:01:11', 'tracking', 4, 'glpi adds the item 365'),
(1142, 366, 'ticket', '2023-11-21 09:03:49', 'tracking', 4, 'glpi adds the item 366'),
(1143, 367, 'ticket', '2023-11-21 09:06:43', 'tracking', 4, 'glpi adds the item 367'),
(1144, 368, 'ticket', '2023-11-21 09:09:39', 'tracking', 4, 'glpi adds the item 368'),
(1145, 369, 'ticket', '2023-11-21 09:12:32', 'tracking', 4, 'glpi adds the item 369'),
(1146, 370, 'ticket', '2023-11-21 09:15:22', 'tracking', 4, 'glpi adds the item 370'),
(1147, 371, 'ticket', '2023-11-21 09:15:23', 'tracking', 4, 'glpi adds the item 371'),
(1148, 372, 'ticket', '2023-11-21 09:16:16', 'tracking', 4, 'glpi adds the item 372'),
(1149, 373, 'ticket', '2023-11-21 09:16:28', 'tracking', 4, 'glpi adds the item 373'),
(1150, 374, 'ticket', '2023-11-21 09:18:12', 'tracking', 4, 'glpi adds the item 374'),
(1151, 375, 'ticket', '2023-11-21 09:32:21', 'tracking', 4, 'glpi adds the item 375'),
(1152, 2, 'Calendar', '2023-11-21 09:32:24', 'setup', 4, 'glpi adds the item SLAFull'),
(1153, 376, 'ticket', '2023-11-21 09:32:31', 'tracking', 4, 'glpi adds the item 376'),
(1154, 377, 'ticket', '2023-11-21 09:32:39', 'tracking', 4, 'glpi adds the item 377'),
(1155, 378, 'ticket', '2023-11-21 09:32:39', 'tracking', 4, 'glpi adds the item 378'),
(1156, 379, 'ticket', '2023-11-21 09:32:47', 'tracking', 4, 'glpi adds the item 379'),
(1157, 5, 'slas', '2023-11-21 09:33:48', 'setup', 4, 'glpi adds the item TTR'),
(1158, 5, 'slas', '2023-11-21 09:34:11', 'setup', 4, 'glpi Adds a Link with an Item'),
(1159, 380, 'ticket', '2023-11-21 09:38:46', 'tracking', 4, 'glpi adds the item 380'),
(1160, 381, 'ticket', '2023-11-21 09:38:47', 'tracking', 4, 'glpi adds the item 381'),
(1161, 4, 'slms', '2023-11-21 09:45:35', 'setup', 4, 'glpi adds the item SLA'),
(1162, 6, 'slas', '2023-11-21 09:47:48', 'setup', 4, 'glpi adds the item TTO'),
(1163, 382, 'ticket', '2023-11-21 09:50:47', 'tracking', 4, 'glpi adds the item 382'),
(1164, 6, 'slas', '2023-11-21 09:51:12', 'setup', 4, 'glpi Adds a Link with an Item'),
(1165, 3, 'Calendar', '2023-11-21 09:59:38', 'setup', 4, 'glpi adds the item 24/7'),
(1166, 5, 'slms', '2023-11-21 10:00:17', 'setup', 4, 'glpi adds the item SLA'),
(1167, 7, 'slas', '2023-11-21 10:00:43', 'setup', 4, 'glpi adds the item SLA'),
(1168, 8, 'slas', '2023-11-21 10:01:03', 'setup', 4, 'glpi adds the item TTR'),
(1169, 7, 'slas', '2023-11-21 10:01:22', 'setup', 4, 'glpi Adds a Link with an Item'),
(1170, 383, 'ticket', '2023-11-21 10:05:00', 'tracking', 4, 'glpi adds the item 383'),
(1171, 384, 'ticket', '2023-11-21 10:05:02', 'tracking', 4, 'glpi adds the item 384'),
(1172, 385, 'ticket', '2023-11-21 10:08:45', 'tracking', 4, 'glpi adds the item 385'),
(1173, 7, 'slas', '2023-11-21 10:11:36', 'setup', 4, 'glpi Updates an Item'),
(1174, 8, 'slas', '2023-11-21 10:12:11', 'setup', 4, 'glpi Adds a Link with an Item'),
(1175, 386, 'ticket', '2023-11-21 10:18:04', 'tracking', 4, 'glpi adds the item 386'),
(1176, 387, 'ticket', '2023-11-21 10:24:17', 'tracking', 4, 'glpi adds the item 387'),
(1177, 388, 'ticket', '2023-11-21 10:25:43', 'tracking', 4, 'glpi adds the item 388'),
(1178, 389, 'ticket', '2023-11-21 10:36:53', 'tracking', 4, 'glpi adds the item 389'),
(1179, 390, 'ticket', '2023-11-21 10:45:19', 'tracking', 4, 'glpi adds the item 390'),
(1180, 391, 'ticket', '2023-11-21 10:45:20', 'tracking', 4, 'glpi adds the item 391'),
(1181, 392, 'ticket', '2023-11-21 10:45:21', 'tracking', 4, 'glpi adds the item 392'),
(1182, 393, 'ticket', '2023-11-21 10:45:22', 'tracking', 4, 'glpi adds the item 393'),
(1183, 394, 'ticket', '2023-11-21 10:45:23', 'tracking', 4, 'glpi adds the item 394'),
(1184, 395, 'ticket', '2023-11-21 10:45:25', 'tracking', 4, 'glpi adds the item 395'),
(1185, 396, 'ticket', '2023-11-21 10:45:26', 'tracking', 4, 'glpi adds the item 396'),
(1186, 397, 'ticket', '2023-11-21 10:45:27', 'tracking', 4, 'glpi adds the item 397'),
(1187, 398, 'ticket', '2023-11-21 10:45:28', 'tracking', 4, 'glpi adds the item 398'),
(1188, 399, 'ticket', '2023-11-21 10:45:29', 'tracking', 4, 'glpi adds the item 399'),
(1189, 400, 'ticket', '2023-11-21 10:45:30', 'tracking', 4, 'glpi adds the item 400'),
(1190, 401, 'ticket', '2023-11-21 10:45:31', 'tracking', 4, 'glpi adds the item 401');
INSERT INTO `glpi_events` (`id`, `items_id`, `type`, `date`, `service`, `level`, `message`) VALUES
(1191, 402, 'ticket', '2023-11-21 10:45:32', 'tracking', 4, 'glpi adds the item 402'),
(1192, 403, 'ticket', '2023-11-21 10:45:33', 'tracking', 4, 'glpi adds the item 403'),
(1193, 404, 'ticket', '2023-11-21 10:45:34', 'tracking', 4, 'glpi adds the item 404'),
(1194, 405, 'ticket', '2023-11-21 10:45:34', 'tracking', 4, 'glpi adds the item 405'),
(1195, 406, 'ticket', '2023-11-21 10:45:35', 'tracking', 4, 'glpi adds the item 406'),
(1196, 407, 'ticket', '2023-11-21 10:45:36', 'tracking', 4, 'glpi adds the item 407'),
(1197, 408, 'ticket', '2023-11-21 10:45:37', 'tracking', 4, 'glpi adds the item 408'),
(1198, 409, 'ticket', '2023-11-21 10:45:38', 'tracking', 4, 'glpi adds the item 409'),
(1199, 410, 'ticket', '2023-11-21 10:45:39', 'tracking', 4, 'glpi adds the item 410'),
(1200, 411, 'ticket', '2023-11-21 10:45:39', 'tracking', 4, 'glpi adds the item 411'),
(1201, 412, 'ticket', '2023-11-21 10:45:40', 'tracking', 4, 'glpi adds the item 412'),
(1202, 413, 'ticket', '2023-11-21 10:45:41', 'tracking', 4, 'glpi adds the item 413'),
(1203, 414, 'ticket', '2023-11-21 10:45:42', 'tracking', 4, 'glpi adds the item 414'),
(1204, 415, 'ticket', '2023-11-21 10:45:43', 'tracking', 4, 'glpi adds the item 415'),
(1205, 416, 'ticket', '2023-11-21 10:45:44', 'tracking', 4, 'glpi adds the item 416'),
(1206, 417, 'ticket', '2023-11-21 10:45:44', 'tracking', 4, 'glpi adds the item 417'),
(1207, 418, 'ticket', '2023-11-21 10:45:45', 'tracking', 4, 'glpi adds the item 418'),
(1208, 419, 'ticket', '2023-11-21 10:45:46', 'tracking', 4, 'glpi adds the item 419'),
(1209, 420, 'ticket', '2023-11-21 10:45:47', 'tracking', 4, 'glpi adds the item 420'),
(1210, 421, 'ticket', '2023-11-21 10:45:48', 'tracking', 4, 'glpi adds the item 421'),
(1211, 422, 'ticket', '2023-11-21 10:45:49', 'tracking', 4, 'glpi adds the item 422'),
(1212, 423, 'ticket', '2023-11-21 10:45:50', 'tracking', 4, 'glpi adds the item 423'),
(1213, 424, 'ticket', '2023-11-21 10:45:51', 'tracking', 4, 'glpi adds the item 424'),
(1214, 425, 'ticket', '2023-11-21 10:45:51', 'tracking', 4, 'glpi adds the item 425'),
(1215, 426, 'ticket', '2023-11-21 10:45:52', 'tracking', 4, 'glpi adds the item 426'),
(1216, 427, 'ticket', '2023-11-21 10:45:53', 'tracking', 4, 'glpi adds the item 427'),
(1217, 428, 'ticket', '2023-11-21 10:45:54', 'tracking', 4, 'glpi adds the item 428'),
(1218, 429, 'ticket', '2023-11-21 10:45:55', 'tracking', 4, 'glpi adds the item 429'),
(1219, 430, 'ticket', '2023-11-21 10:45:55', 'tracking', 4, 'glpi adds the item 430'),
(1220, 431, 'ticket', '2023-11-21 10:45:56', 'tracking', 4, 'glpi adds the item 431'),
(1221, 432, 'ticket', '2023-11-21 10:45:57', 'tracking', 4, 'glpi adds the item 432'),
(1222, 433, 'ticket', '2023-11-21 10:45:58', 'tracking', 4, 'glpi adds the item 433'),
(1223, 434, 'ticket', '2023-11-21 10:45:59', 'tracking', 4, 'glpi adds the item 434'),
(1224, 435, 'ticket', '2023-11-21 10:46:00', 'tracking', 4, 'glpi adds the item 435'),
(1225, 436, 'ticket', '2023-11-21 10:46:00', 'tracking', 4, 'glpi adds the item 436'),
(1226, 437, 'ticket', '2023-11-21 10:46:01', 'tracking', 4, 'glpi adds the item 437'),
(1227, 438, 'ticket', '2023-11-21 10:46:02', 'tracking', 4, 'glpi adds the item 438'),
(1228, 439, 'ticket', '2023-11-21 10:46:03', 'tracking', 4, 'glpi adds the item 439'),
(1229, 440, 'ticket', '2023-11-21 10:46:04', 'tracking', 4, 'glpi adds the item 440'),
(1230, 441, 'ticket', '2023-11-21 10:46:05', 'tracking', 4, 'glpi adds the item 441'),
(1231, 442, 'ticket', '2023-11-21 10:46:05', 'tracking', 4, 'glpi adds the item 442'),
(1232, 443, 'ticket', '2023-11-21 10:46:06', 'tracking', 4, 'glpi adds the item 443'),
(1233, 444, 'ticket', '2023-11-21 10:46:07', 'tracking', 4, 'glpi adds the item 444'),
(1234, 445, 'ticket', '2023-11-21 10:46:08', 'tracking', 4, 'glpi adds the item 445'),
(1235, 446, 'ticket', '2023-11-21 10:46:09', 'tracking', 4, 'glpi adds the item 446'),
(1236, 447, 'ticket', '2023-11-21 10:46:09', 'tracking', 4, 'glpi adds the item 447'),
(1237, 448, 'ticket', '2023-11-21 10:46:10', 'tracking', 4, 'glpi adds the item 448'),
(1238, 449, 'ticket', '2023-11-21 10:46:11', 'tracking', 4, 'glpi adds the item 449'),
(1239, 450, 'ticket', '2023-11-21 10:46:12', 'tracking', 4, 'glpi adds the item 450'),
(1240, 451, 'ticket', '2023-11-21 10:46:13', 'tracking', 4, 'glpi adds the item 451'),
(1241, 452, 'ticket', '2023-11-21 10:46:13', 'tracking', 4, 'glpi adds the item 452'),
(1242, 453, 'ticket', '2023-11-21 10:46:14', 'tracking', 4, 'glpi adds the item 453'),
(1243, 454, 'ticket', '2023-11-21 10:46:15', 'tracking', 4, 'glpi adds the item 454'),
(1244, 455, 'ticket', '2023-11-21 10:46:16', 'tracking', 4, 'glpi adds the item 455'),
(1245, 456, 'ticket', '2023-11-21 10:46:17', 'tracking', 4, 'glpi adds the item 456'),
(1246, 457, 'ticket', '2023-11-21 10:46:17', 'tracking', 4, 'glpi adds the item 457'),
(1247, 458, 'ticket', '2023-11-21 10:46:18', 'tracking', 4, 'glpi adds the item 458'),
(1248, 459, 'ticket', '2023-11-21 10:46:19', 'tracking', 4, 'glpi adds the item 459'),
(1249, 460, 'ticket', '2023-11-21 10:46:20', 'tracking', 4, 'glpi adds the item 460'),
(1250, 461, 'ticket', '2023-11-21 10:46:21', 'tracking', 4, 'glpi adds the item 461'),
(1251, 462, 'ticket', '2023-11-21 10:46:21', 'tracking', 4, 'glpi adds the item 462'),
(1252, 463, 'ticket', '2023-11-21 10:46:22', 'tracking', 4, 'glpi adds the item 463'),
(1253, 464, 'ticket', '2023-11-21 10:46:23', 'tracking', 4, 'glpi adds the item 464'),
(1254, 465, 'ticket', '2023-11-21 10:46:24', 'tracking', 4, 'glpi adds the item 465'),
(1255, 466, 'ticket', '2023-11-21 10:46:25', 'tracking', 4, 'glpi adds the item 466'),
(1256, 467, 'ticket', '2023-11-21 10:46:25', 'tracking', 4, 'glpi adds the item 467'),
(1257, 468, 'ticket', '2023-11-21 10:46:26', 'tracking', 4, 'glpi adds the item 468'),
(1258, 469, 'ticket', '2023-11-21 10:46:27', 'tracking', 4, 'glpi adds the item 469'),
(1259, 470, 'ticket', '2023-11-21 10:46:28', 'tracking', 4, 'glpi adds the item 470'),
(1260, 471, 'ticket', '2023-11-21 10:46:29', 'tracking', 4, 'glpi adds the item 471'),
(1261, 472, 'ticket', '2023-11-21 10:46:29', 'tracking', 4, 'glpi adds the item 472'),
(1262, 473, 'ticket', '2023-11-21 10:46:30', 'tracking', 4, 'glpi adds the item 473'),
(1263, 474, 'ticket', '2023-11-21 10:46:31', 'tracking', 4, 'glpi adds the item 474'),
(1264, 475, 'ticket', '2023-11-21 10:46:32', 'tracking', 4, 'glpi adds the item 475'),
(1265, 476, 'ticket', '2023-11-21 10:46:33', 'tracking', 4, 'glpi adds the item 476'),
(1266, 477, 'ticket', '2023-11-21 10:46:33', 'tracking', 4, 'glpi adds the item 477'),
(1267, 478, 'ticket', '2023-11-21 10:46:34', 'tracking', 4, 'glpi adds the item 478'),
(1268, 479, 'ticket', '2023-11-21 10:46:35', 'tracking', 4, 'glpi adds the item 479'),
(1269, 480, 'ticket', '2023-11-21 10:46:36', 'tracking', 4, 'glpi adds the item 480'),
(1270, 481, 'ticket', '2023-11-21 10:46:36', 'tracking', 4, 'glpi adds the item 481'),
(1271, 482, 'ticket', '2023-11-21 10:46:37', 'tracking', 4, 'glpi adds the item 482'),
(1272, 483, 'ticket', '2023-11-21 10:46:38', 'tracking', 4, 'glpi adds the item 483'),
(1273, 484, 'ticket', '2023-11-21 10:46:39', 'tracking', 4, 'glpi adds the item 484'),
(1274, 485, 'ticket', '2023-11-21 10:46:40', 'tracking', 4, 'glpi adds the item 485'),
(1275, 486, 'ticket', '2023-11-21 10:46:40', 'tracking', 4, 'glpi adds the item 486'),
(1276, 487, 'ticket', '2023-11-21 10:46:41', 'tracking', 4, 'glpi adds the item 487'),
(1277, 488, 'ticket', '2023-11-21 10:46:42', 'tracking', 4, 'glpi adds the item 488'),
(1278, 489, 'ticket', '2023-11-21 10:46:43', 'tracking', 4, 'glpi adds the item 489'),
(1279, 490, 'ticket', '2023-11-21 10:46:44', 'tracking', 4, 'glpi adds the item 490'),
(1280, 491, 'ticket', '2023-11-21 10:46:44', 'tracking', 4, 'glpi adds the item 491'),
(1281, 492, 'ticket', '2023-11-21 10:46:45', 'tracking', 4, 'glpi adds the item 492'),
(1282, 493, 'ticket', '2023-11-21 10:46:46', 'tracking', 4, 'glpi adds the item 493'),
(1283, 494, 'ticket', '2023-11-21 10:46:47', 'tracking', 4, 'glpi adds the item 494'),
(1284, 495, 'ticket', '2023-11-21 10:46:48', 'tracking', 4, 'glpi adds the item 495'),
(1285, 496, 'ticket', '2023-11-21 10:46:48', 'tracking', 4, 'glpi adds the item 496'),
(1286, 497, 'ticket', '2023-11-21 10:46:49', 'tracking', 4, 'glpi adds the item 497'),
(1287, 498, 'ticket', '2023-11-21 10:46:50', 'tracking', 4, 'glpi adds the item 498'),
(1288, 499, 'ticket', '2023-11-21 10:46:51', 'tracking', 4, 'glpi adds the item 499'),
(1289, 500, 'ticket', '2023-11-21 10:46:51', 'tracking', 4, 'glpi adds the item 500'),
(1290, 501, 'ticket', '2023-11-21 10:46:52', 'tracking', 4, 'glpi adds the item 501'),
(1291, 502, 'ticket', '2023-11-21 10:46:53', 'tracking', 4, 'glpi adds the item 502'),
(1292, 503, 'ticket', '2023-11-21 10:46:54', 'tracking', 4, 'glpi adds the item 503'),
(1293, 504, 'ticket', '2023-11-21 11:00:32', 'tracking', 4, 'glpi adds the item 504'),
(1294, 505, 'ticket', '2023-11-21 11:02:02', 'tracking', 4, 'glpi adds the item 505'),
(1295, 506, 'ticket', '2023-11-21 11:09:22', 'tracking', 4, 'glpi adds the item 506'),
(1296, 507, 'ticket', '2023-11-21 11:09:29', 'tracking', 4, 'glpi adds the item 507'),
(1297, 508, 'ticket', '2023-11-21 12:00:17', 'tracking', 4, 'glpi adds the item 508'),
(1298, 509, 'ticket', '2023-11-21 12:03:50', 'tracking', 4, 'glpi adds the item 509'),
(1299, 510, 'ticket', '2023-11-21 12:06:11', 'tracking', 4, 'glpi adds the item 510'),
(1300, 511, 'ticket', '2023-11-21 12:06:23', 'tracking', 4, 'glpi adds the item 511'),
(1301, 512, 'ticket', '2023-11-21 12:06:31', 'tracking', 4, 'glpi adds the item 512'),
(1302, 513, 'ticket', '2023-11-21 12:06:32', 'tracking', 4, 'glpi adds the item 513'),
(1303, 514, 'ticket', '2023-11-21 12:06:44', 'tracking', 4, 'glpi adds the item 514'),
(1304, 515, 'ticket', '2023-11-21 12:30:21', 'tracking', 4, 'glpi adds the item 515'),
(1305, 516, 'ticket', '2023-11-21 12:30:33', 'tracking', 4, 'glpi adds the item 516'),
(1306, 517, 'ticket', '2023-11-21 12:30:38', 'tracking', 4, 'glpi adds the item 517'),
(1307, 518, 'ticket', '2023-11-21 12:30:53', 'tracking', 4, 'glpi adds the item 518'),
(1308, 519, 'ticket', '2023-11-21 12:31:12', 'tracking', 4, 'glpi adds the item 519'),
(1309, 520, 'ticket', '2023-11-21 12:31:13', 'tracking', 4, 'glpi adds the item 520'),
(1310, 521, 'ticket', '2023-11-21 12:31:26', 'tracking', 4, 'glpi adds the item 521'),
(1311, 522, 'ticket', '2023-11-21 12:31:40', 'tracking', 4, 'glpi adds the item 522'),
(1312, 523, 'ticket', '2023-11-21 12:31:59', 'tracking', 4, 'glpi adds the item 523'),
(1313, 524, 'ticket', '2023-11-21 12:31:59', 'tracking', 4, 'glpi adds the item 524'),
(1314, 525, 'ticket', '2023-11-21 12:32:10', 'tracking', 4, 'glpi adds the item 525'),
(1315, 526, 'ticket', '2023-11-21 12:32:12', 'tracking', 4, 'glpi adds the item 526'),
(1316, 527, 'ticket', '2023-11-21 12:32:13', 'tracking', 4, 'glpi adds the item 527'),
(1317, 528, 'ticket', '2023-11-21 12:32:20', 'tracking', 4, 'glpi adds the item 528'),
(1318, 529, 'ticket', '2023-11-21 12:32:30', 'tracking', 4, 'glpi adds the item 529'),
(1319, 530, 'ticket', '2023-11-21 12:32:54', 'tracking', 4, 'glpi adds the item 530'),
(1320, 531, 'ticket', '2023-11-21 12:33:15', 'tracking', 4, 'glpi adds the item 531'),
(1321, 532, 'ticket', '2023-11-21 12:33:22', 'tracking', 4, 'glpi adds the item 532'),
(1322, 533, 'ticket', '2023-11-21 12:33:32', 'tracking', 4, 'glpi adds the item 533'),
(1323, 534, 'ticket', '2023-11-21 12:33:54', 'tracking', 4, 'glpi adds the item 534'),
(1324, 535, 'ticket', '2023-11-21 12:34:19', 'tracking', 4, 'glpi adds the item 535'),
(1325, 536, 'ticket', '2023-11-21 12:34:34', 'tracking', 4, 'glpi adds the item 536'),
(1326, 537, 'ticket', '2023-11-21 12:34:36', 'tracking', 4, 'glpi adds the item 537'),
(1327, 538, 'ticket', '2023-11-21 12:34:37', 'tracking', 4, 'glpi adds the item 538'),
(1328, 539, 'ticket', '2023-11-21 12:34:55', 'tracking', 4, 'glpi adds the item 539'),
(1329, 540, 'ticket', '2023-11-21 12:35:14', 'tracking', 4, 'glpi adds the item 540'),
(1330, 541, 'ticket', '2023-11-21 12:35:31', 'tracking', 4, 'glpi adds the item 541'),
(1331, 542, 'ticket', '2023-11-21 12:35:45', 'tracking', 4, 'glpi adds the item 542'),
(1332, 543, 'ticket', '2023-11-21 12:35:50', 'tracking', 4, 'glpi adds the item 543'),
(1333, 544, 'ticket', '2023-11-21 12:36:09', 'tracking', 4, 'glpi adds the item 544'),
(1334, 545, 'ticket', '2023-11-21 12:36:20', 'tracking', 4, 'glpi adds the item 545'),
(1335, 546, 'ticket', '2023-11-21 12:36:37', 'tracking', 4, 'glpi adds the item 546'),
(1336, 547, 'ticket', '2023-11-21 12:36:54', 'tracking', 4, 'glpi adds the item 547'),
(1337, 548, 'ticket', '2023-11-21 12:36:55', 'tracking', 4, 'glpi adds the item 548'),
(1338, 549, 'ticket', '2023-11-21 12:37:01', 'tracking', 4, 'glpi adds the item 549'),
(1339, 550, 'ticket', '2023-11-21 12:37:07', 'tracking', 4, 'glpi adds the item 550'),
(1340, 551, 'ticket', '2023-11-21 12:37:22', 'tracking', 4, 'glpi adds the item 551'),
(1341, 552, 'ticket', '2023-11-21 12:37:45', 'tracking', 4, 'glpi adds the item 552'),
(1342, 553, 'ticket', '2023-11-21 12:38:01', 'tracking', 4, 'glpi adds the item 553'),
(1343, 554, 'ticket', '2023-11-21 12:38:03', 'tracking', 4, 'glpi adds the item 554'),
(1344, 555, 'ticket', '2023-11-21 12:38:09', 'tracking', 4, 'glpi adds the item 555'),
(1345, 556, 'ticket', '2023-11-21 12:38:25', 'tracking', 4, 'glpi adds the item 556'),
(1346, 557, 'ticket', '2023-11-21 12:38:45', 'tracking', 4, 'glpi adds the item 557'),
(1347, 558, 'ticket', '2023-11-21 12:38:52', 'tracking', 4, 'glpi adds the item 558'),
(1348, 559, 'ticket', '2023-11-21 12:38:55', 'tracking', 4, 'glpi adds the item 559'),
(1349, 560, 'ticket', '2023-11-21 12:39:07', 'tracking', 4, 'glpi adds the item 560'),
(1350, 7, 'slas', '2023-11-21 12:40:04', 'setup', 4, 'glpi Updates an Item'),
(1351, 8, 'slas', '2023-11-21 12:40:20', 'setup', 4, 'glpi Updates an Item'),
(1352, 561, 'ticket', '2023-11-21 13:13:03', 'tracking', 4, 'glpi adds the item 561'),
(1353, 0, 'system', '2023-11-21 13:15:06', 'login', 3, 'glpi login from IP 172.20.0.5'),
(1354, 562, 'ticket', '2023-11-21 13:24:57', 'tracking', 4, 'glpi adds the item 562'),
(1355, 0, 'system', '2023-11-21 13:51:41', 'login', 3, 'glpi login from IP 172.20.0.5'),
(1356, 563, 'ticket', '2023-11-21 14:15:32', 'tracking', 4, 'glpi adds the item 563'),
(1357, 564, 'ticket', '2023-11-21 14:26:26', 'tracking', 4, 'glpi adds the item 564'),
(1358, 565, 'ticket', '2023-11-21 14:26:28', 'tracking', 4, 'glpi adds the item 565'),
(1359, 566, 'ticket', '2023-11-21 14:26:55', 'tracking', 4, 'glpi adds the item 566'),
(1360, 567, 'ticket', '2023-11-21 15:08:43', 'tracking', 4, 'glpi adds the item 567'),
(1361, 568, 'ticket', '2023-11-21 15:09:04', 'tracking', 4, 'glpi adds the item 568'),
(1362, 569, 'ticket', '2023-11-21 15:09:14', 'tracking', 4, 'glpi adds the item 569'),
(1363, 570, 'ticket', '2023-11-21 15:09:20', 'tracking', 4, 'glpi adds the item 570'),
(1364, 571, 'ticket', '2023-11-21 15:09:33', 'tracking', 4, 'glpi adds the item 571'),
(1365, 572, 'ticket', '2023-11-21 15:09:35', 'tracking', 4, 'glpi adds the item 572'),
(1366, 573, 'ticket', '2023-11-21 15:09:50', 'tracking', 4, 'glpi adds the item 573'),
(1367, 574, 'ticket', '2023-11-21 15:10:00', 'tracking', 4, 'glpi adds the item 574'),
(1368, 575, 'ticket', '2023-11-21 15:10:14', 'tracking', 4, 'glpi adds the item 575'),
(1369, 576, 'ticket', '2023-11-21 15:10:16', 'tracking', 4, 'glpi adds the item 576'),
(1370, 577, 'ticket', '2023-11-21 15:10:28', 'tracking', 4, 'glpi adds the item 577'),
(1371, 578, 'ticket', '2023-11-21 15:10:37', 'tracking', 4, 'glpi adds the item 578'),
(1372, 579, 'ticket', '2023-11-21 15:10:40', 'tracking', 4, 'glpi adds the item 579'),
(1373, 580, 'ticket', '2023-11-21 15:10:56', 'tracking', 4, 'glpi adds the item 580'),
(1374, 581, 'ticket', '2023-11-21 15:11:16', 'tracking', 4, 'glpi adds the item 581'),
(1375, 582, 'ticket', '2023-11-21 15:11:29', 'tracking', 4, 'glpi adds the item 582'),
(1376, 583, 'ticket', '2023-11-21 15:11:44', 'tracking', 4, 'glpi adds the item 583'),
(1377, 584, 'ticket', '2023-11-21 15:11:54', 'tracking', 4, 'glpi adds the item 584'),
(1378, 585, 'ticket', '2023-11-21 15:12:16', 'tracking', 4, 'glpi adds the item 585'),
(1379, 586, 'ticket', '2023-11-21 15:12:32', 'tracking', 4, 'glpi adds the item 586'),
(1380, 587, 'ticket', '2023-11-21 15:12:34', 'tracking', 4, 'glpi adds the item 587'),
(1381, 588, 'ticket', '2023-11-21 15:12:54', 'tracking', 4, 'glpi adds the item 588'),
(1382, 589, 'ticket', '2023-11-21 15:12:57', 'tracking', 4, 'glpi adds the item 589'),
(1383, 590, 'ticket', '2023-11-21 15:13:16', 'tracking', 4, 'glpi adds the item 590'),
(1384, 591, 'ticket', '2023-11-21 15:13:34', 'tracking', 4, 'glpi adds the item 591'),
(1385, 592, 'ticket', '2023-11-21 15:13:54', 'tracking', 4, 'glpi adds the item 592'),
(1386, 593, 'ticket', '2023-11-21 15:14:09', 'tracking', 4, 'glpi adds the item 593'),
(1387, 594, 'ticket', '2023-11-21 15:14:16', 'tracking', 4, 'glpi adds the item 594'),
(1388, 595, 'ticket', '2023-11-21 15:14:32', 'tracking', 4, 'glpi adds the item 595'),
(1389, 596, 'ticket', '2023-11-21 15:14:51', 'tracking', 4, 'glpi adds the item 596'),
(1390, 597, 'ticket', '2023-11-21 15:15:08', 'tracking', 4, 'glpi adds the item 597'),
(1391, 598, 'ticket', '2023-11-21 15:15:10', 'tracking', 4, 'glpi adds the item 598'),
(1392, 599, 'ticket', '2023-11-21 15:15:20', 'tracking', 4, 'glpi adds the item 599'),
(1393, 600, 'ticket', '2023-11-21 15:15:22', 'tracking', 4, 'glpi adds the item 600'),
(1394, 601, 'ticket', '2023-11-21 15:15:44', 'tracking', 4, 'glpi adds the item 601'),
(1395, 602, 'ticket', '2023-11-21 15:16:00', 'tracking', 4, 'glpi adds the item 602'),
(1396, 603, 'ticket', '2023-11-21 15:16:14', 'tracking', 4, 'glpi adds the item 603'),
(1397, 604, 'ticket', '2023-11-21 15:16:22', 'tracking', 4, 'glpi adds the item 604'),
(1398, 605, 'ticket', '2023-11-21 15:16:32', 'tracking', 4, 'glpi adds the item 605'),
(1399, 606, 'ticket', '2023-11-21 15:16:36', 'tracking', 4, 'glpi adds the item 606'),
(1400, 607, 'ticket', '2023-11-21 15:16:54', 'tracking', 4, 'glpi adds the item 607'),
(1401, 608, 'ticket', '2023-11-21 15:17:02', 'tracking', 4, 'glpi adds the item 608'),
(1402, 609, 'ticket', '2023-11-21 15:17:03', 'tracking', 4, 'glpi adds the item 609'),
(1403, 610, 'ticket', '2023-11-21 15:17:10', 'tracking', 4, 'glpi adds the item 610'),
(1404, 611, 'ticket', '2023-11-21 15:29:18', 'tracking', 4, 'glpi adds the item 611'),
(1405, 612, 'ticket', '2023-11-21 15:31:35', 'tracking', 4, 'glpi adds the item 612'),
(1406, 613, 'ticket', '2023-11-21 15:33:43', 'tracking', 4, 'glpi adds the item 613'),
(1407, 614, 'ticket', '2023-11-21 15:35:49', 'tracking', 4, 'glpi adds the item 614'),
(1408, 615, 'ticket', '2023-11-21 15:37:53', 'tracking', 4, 'glpi adds the item 615'),
(1409, 616, 'ticket', '2023-11-21 15:39:49', 'tracking', 4, 'glpi adds the item 616'),
(1410, 617, 'ticket', '2023-11-21 15:42:01', 'tracking', 4, 'glpi adds the item 617'),
(1411, 618, 'ticket', '2023-11-21 15:49:34', 'tracking', 4, 'glpi adds the item 618'),
(1412, 619, 'ticket', '2023-11-21 15:49:35', 'tracking', 4, 'glpi adds the item 619'),
(1413, 620, 'ticket', '2023-11-21 16:29:38', 'tracking', 4, 'glpi adds the item 620'),
(1414, 621, 'ticket', '2023-11-21 16:30:38', 'tracking', 4, 'glpi adds the item 621'),
(1415, 622, 'ticket', '2023-11-21 17:41:47', 'tracking', 4, 'glpi adds the item 622'),
(1416, 623, 'ticket', '2023-11-21 17:42:45', 'tracking', 4, 'glpi adds the item 623'),
(1417, 624, 'ticket', '2023-11-21 17:44:19', 'tracking', 4, 'glpi adds the item 624'),
(1418, 625, 'ticket', '2023-11-21 17:46:47', 'tracking', 4, 'glpi adds the item 625'),
(1419, 626, 'ticket', '2023-11-21 17:48:31', 'tracking', 4, 'glpi adds the item 626'),
(1420, 627, 'ticket', '2023-11-21 17:48:40', 'tracking', 4, 'glpi adds the item 627'),
(1421, 628, 'ticket', '2023-11-21 17:48:53', 'tracking', 4, 'glpi adds the item 628'),
(1422, 629, 'ticket', '2023-11-21 17:49:07', 'tracking', 4, 'glpi adds the item 629'),
(1423, 630, 'ticket', '2023-11-21 17:49:14', 'tracking', 4, 'glpi adds the item 630'),
(1424, 631, 'ticket', '2023-11-21 17:49:40', 'tracking', 4, 'glpi adds the item 631'),
(1425, 632, 'ticket', '2023-11-21 17:50:09', 'tracking', 4, 'glpi adds the item 632'),
(1426, 633, 'ticket', '2023-11-21 17:50:11', 'tracking', 4, 'glpi adds the item 633'),
(1427, 634, 'ticket', '2023-11-21 17:51:35', 'tracking', 4, 'glpi adds the item 634'),
(1428, 635, 'ticket', '2023-11-21 17:54:01', 'tracking', 4, 'glpi adds the item 635'),
(1429, 636, 'ticket', '2023-11-21 17:56:33', 'tracking', 4, 'glpi adds the item 636'),
(1430, 637, 'ticket', '2023-11-21 17:59:02', 'tracking', 4, 'glpi adds the item 637'),
(1431, 638, 'ticket', '2023-11-21 18:01:38', 'tracking', 4, 'glpi adds the item 638'),
(1432, 639, 'ticket', '2023-11-21 18:32:33', 'tracking', 4, 'glpi adds the item 639'),
(1433, 640, 'ticket', '2023-11-21 19:58:43', 'tracking', 4, 'glpi adds the item 640'),
(1434, 641, 'ticket', '2023-11-21 20:09:28', 'tracking', 4, 'glpi adds the item 641'),
(1435, 642, 'ticket', '2023-11-21 20:20:38', 'tracking', 4, 'glpi adds the item 642'),
(1436, 643, 'ticket', '2023-11-21 20:21:04', 'tracking', 4, 'glpi adds the item 643'),
(1437, 644, 'ticket', '2023-11-21 20:21:26', 'tracking', 4, 'glpi adds the item 644'),
(1438, 645, 'ticket', '2023-11-21 20:21:49', 'tracking', 4, 'glpi adds the item 645'),
(1439, 646, 'ticket', '2023-11-21 20:21:58', 'tracking', 4, 'glpi adds the item 646'),
(1440, 647, 'ticket', '2023-11-21 20:22:12', 'tracking', 4, 'glpi adds the item 647'),
(1441, 648, 'ticket', '2023-11-21 20:27:41', 'tracking', 4, 'glpi adds the item 648'),
(1442, 649, 'ticket', '2023-11-21 20:30:26', 'tracking', 4, 'glpi adds the item 649'),
(1443, 650, 'ticket', '2023-11-21 20:33:08', 'tracking', 4, 'glpi adds the item 650'),
(1444, 651, 'ticket', '2023-11-21 20:35:44', 'tracking', 4, 'glpi adds the item 651'),
(1445, 652, 'ticket', '2023-11-21 20:38:23', 'tracking', 4, 'glpi adds the item 652'),
(1446, 653, 'ticket', '2023-11-21 20:40:53', 'tracking', 4, 'glpi adds the item 653'),
(1447, 654, 'ticket', '2023-11-21 20:40:59', 'tracking', 4, 'glpi adds the item 654'),
(1448, 655, 'ticket', '2023-11-21 20:47:40', 'tracking', 4, 'glpi adds the item 655'),
(1449, 656, 'ticket', '2023-11-21 20:53:56', 'tracking', 4, 'glpi adds the item 656'),
(1450, 657, 'ticket', '2023-11-21 21:00:04', 'tracking', 4, 'glpi adds the item 657'),
(1451, 658, 'ticket', '2023-11-21 21:06:20', 'tracking', 4, 'glpi adds the item 658'),
(1452, 659, 'ticket', '2023-11-21 21:25:50', 'tracking', 4, 'glpi adds the item 659'),
(1453, 660, 'ticket', '2023-11-21 21:28:36', 'tracking', 4, 'glpi adds the item 660'),
(1454, 661, 'ticket', '2023-11-21 21:31:05', 'tracking', 4, 'glpi adds the item 661'),
(1455, 662, 'ticket', '2023-11-21 21:33:41', 'tracking', 4, 'glpi adds the item 662'),
(1456, 663, 'ticket', '2023-11-21 21:35:43', 'tracking', 4, 'glpi adds the item 663'),
(1457, 664, 'ticket', '2023-11-21 21:37:05', 'tracking', 4, 'glpi adds the item 664'),
(1458, 665, 'ticket', '2023-11-21 21:39:00', 'tracking', 4, 'glpi adds the item 665'),
(1459, 666, 'ticket', '2023-11-21 21:39:34', 'tracking', 4, 'glpi adds the item 666'),
(1460, 667, 'ticket', '2023-11-21 21:39:36', 'tracking', 4, 'glpi adds the item 667'),
(1461, 668, 'ticket', '2023-11-21 21:40:06', 'tracking', 4, 'glpi adds the item 668'),
(1462, 669, 'ticket', '2023-11-21 21:40:35', 'tracking', 4, 'glpi adds the item 669'),
(1463, 670, 'ticket', '2023-11-21 21:40:38', 'tracking', 4, 'glpi adds the item 670'),
(1464, 671, 'ticket', '2023-11-21 21:41:08', 'tracking', 4, 'glpi adds the item 671'),
(1465, 672, 'ticket', '2023-11-21 21:41:30', 'tracking', 4, 'glpi adds the item 672'),
(1466, 673, 'ticket', '2023-11-21 21:41:38', 'tracking', 4, 'glpi adds the item 673'),
(1467, 674, 'ticket', '2023-11-21 21:41:40', 'tracking', 4, 'glpi adds the item 674'),
(1468, 675, 'ticket', '2023-11-21 21:42:08', 'tracking', 4, 'glpi adds the item 675'),
(1469, 676, 'ticket', '2023-11-21 21:42:42', 'tracking', 4, 'glpi adds the item 676'),
(1470, 677, 'ticket', '2023-11-21 21:42:44', 'tracking', 4, 'glpi adds the item 677'),
(1471, 678, 'ticket', '2023-11-21 21:43:08', 'tracking', 4, 'glpi adds the item 678'),
(1472, 679, 'ticket', '2023-11-21 21:43:35', 'tracking', 4, 'glpi adds the item 679'),
(1473, 680, 'ticket', '2023-11-21 21:43:46', 'tracking', 4, 'glpi adds the item 680'),
(1474, 681, 'ticket', '2023-11-21 21:44:08', 'tracking', 4, 'glpi adds the item 681'),
(1475, 682, 'ticket', '2023-11-21 21:44:10', 'tracking', 4, 'glpi adds the item 682'),
(1476, 683, 'ticket', '2023-11-21 21:44:34', 'tracking', 4, 'glpi adds the item 683'),
(1477, 684, 'ticket', '2023-11-21 21:45:04', 'tracking', 4, 'glpi adds the item 684'),
(1478, 685, 'ticket', '2023-11-21 21:45:31', 'tracking', 4, 'glpi adds the item 685'),
(1479, 686, 'ticket', '2023-11-21 21:45:31', 'tracking', 4, 'glpi adds the item 686'),
(1480, 687, 'ticket', '2023-11-21 21:45:58', 'tracking', 4, 'glpi adds the item 687'),
(1481, 688, 'ticket', '2023-11-21 21:46:29', 'tracking', 4, 'glpi adds the item 688'),
(1482, 689, 'ticket', '2023-11-21 21:59:58', 'tracking', 4, 'glpi adds the item 689'),
(1483, 690, 'ticket', '2023-11-21 22:02:41', 'tracking', 4, 'glpi adds the item 690'),
(1484, 691, 'ticket', '2023-11-21 22:05:27', 'tracking', 4, 'glpi adds the item 691'),
(1485, 692, 'ticket', '2023-11-21 22:09:48', 'tracking', 4, 'glpi adds the item 692'),
(1486, 693, 'ticket', '2023-11-21 22:15:54', 'tracking', 4, 'glpi adds the item 693'),
(1487, 694, 'ticket', '2023-11-21 22:18:47', 'tracking', 4, 'glpi adds the item 694'),
(1488, 695, 'ticket', '2023-11-21 22:21:33', 'tracking', 4, 'glpi adds the item 695'),
(1489, 696, 'ticket', '2023-11-21 22:24:11', 'tracking', 4, 'glpi adds the item 696'),
(1490, 697, 'ticket', '2023-11-21 22:31:05', 'tracking', 4, 'glpi adds the item 697'),
(1491, 698, 'ticket', '2023-11-21 22:31:11', 'tracking', 4, 'glpi adds the item 698'),
(1492, 699, 'ticket', '2023-11-21 22:31:27', 'tracking', 4, 'glpi adds the item 699'),
(1493, 700, 'ticket', '2023-11-21 22:37:46', 'tracking', 4, 'glpi adds the item 700'),
(1494, 701, 'ticket', '2023-11-21 22:40:31', 'tracking', 4, 'glpi adds the item 701'),
(1495, 702, 'ticket', '2023-11-21 22:40:33', 'tracking', 4, 'glpi adds the item 702'),
(1496, 703, 'ticket', '2023-11-21 22:43:12', 'tracking', 4, 'glpi adds the item 703'),
(1497, 704, 'ticket', '2023-11-21 22:45:56', 'tracking', 4, 'glpi adds the item 704'),
(1498, 705, 'ticket', '2023-11-21 22:48:35', 'tracking', 4, 'glpi adds the item 705'),
(1499, 706, 'ticket', '2023-11-21 22:51:22', 'tracking', 4, 'glpi adds the item 706'),
(1500, 707, 'ticket', '2023-11-21 23:13:22', 'tracking', 4, 'glpi adds the item 707'),
(1501, 708, 'ticket', '2023-11-21 23:59:07', 'tracking', 4, 'glpi adds the item 708'),
(1502, 709, 'ticket', '2023-11-21 23:59:08', 'tracking', 4, 'glpi adds the item 709'),
(1503, 0, 'system', '2023-11-22 00:48:22', 'login', 3, 'glpi login from IP 172.20.0.5');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_fieldblacklists`
--

CREATE TABLE `glpi_fieldblacklists` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_fieldunicities`
--

CREATE TABLE `glpi_fieldunicities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fields` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `action_refuse` tinyint(4) NOT NULL DEFAULT 0,
  `action_notify` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores field unicity criterias' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_filesystems`
--

CREATE TABLE `glpi_filesystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_filesystems`
--

INSERT INTO `glpi_filesystems` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'ext', NULL, NULL, NULL),
(2, 'ext2', NULL, NULL, NULL),
(3, 'ext3', NULL, NULL, NULL),
(4, 'ext4', NULL, NULL, NULL),
(5, 'FAT', NULL, NULL, NULL),
(6, 'FAT32', NULL, NULL, NULL),
(7, 'VFAT', NULL, NULL, NULL),
(8, 'HFS', NULL, NULL, NULL),
(9, 'HPFS', NULL, NULL, NULL),
(10, 'HTFS', NULL, NULL, NULL),
(11, 'JFS', NULL, NULL, NULL),
(12, 'JFS2', NULL, NULL, NULL),
(13, 'NFS', NULL, NULL, NULL),
(14, 'NTFS', NULL, NULL, NULL),
(15, 'ReiserFS', NULL, NULL, NULL),
(16, 'SMBFS', NULL, NULL, NULL),
(17, 'UDF', NULL, NULL, NULL),
(18, 'UFS', NULL, NULL, NULL),
(19, 'XFS', NULL, NULL, NULL),
(20, 'ZFS', NULL, NULL, NULL),
(21, 'APFS', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_fqdns`
--

CREATE TABLE `glpi_fqdns` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `fqdn` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups`
--

CREATE TABLE `glpi_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `ldap_field` varchar(255) DEFAULT NULL,
  `ldap_value` text DEFAULT NULL,
  `ldap_group_dn` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_requester` tinyint(4) NOT NULL DEFAULT 1,
  `is_watcher` tinyint(4) NOT NULL DEFAULT 1,
  `is_assign` tinyint(4) NOT NULL DEFAULT 1,
  `is_task` tinyint(4) NOT NULL DEFAULT 1,
  `is_notify` tinyint(4) NOT NULL DEFAULT 1,
  `is_itemgroup` tinyint(4) NOT NULL DEFAULT 1,
  `is_usergroup` tinyint(4) NOT NULL DEFAULT 1,
  `is_manager` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_groups`
--

INSERT INTO `glpi_groups` (`id`, `entities_id`, `is_recursive`, `name`, `comment`, `ldap_field`, `ldap_value`, `ldap_group_dn`, `date_mod`, `groups_id`, `completename`, `level`, `ancestors_cache`, `sons_cache`, `is_requester`, `is_watcher`, `is_assign`, `is_task`, `is_notify`, `is_itemgroup`, `is_usergroup`, `is_manager`, `date_creation`) VALUES
(1, 0, 0, 'Security Team', '', NULL, NULL, NULL, '2023-11-18 09:48:36', 0, 'Security Team', 1, '[]', '{\"1\":1}', 1, 1, 1, 1, 1, 1, 1, 1, '2023-11-18 09:48:36'),
(2, 0, 0, 'Security Manager', '', NULL, NULL, NULL, '2023-11-21 08:30:33', 0, 'Security Manager', 1, '[]', '{\"2\":2}', 1, 1, 1, 1, 1, 1, 1, 1, '2023-11-21 08:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups_knowbaseitems`
--

CREATE TABLE `glpi_groups_knowbaseitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups_problems`
--

CREATE TABLE `glpi_groups_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups_reminders`
--

CREATE TABLE `glpi_groups_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups_rssfeeds`
--

CREATE TABLE `glpi_groups_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups_tickets`
--

CREATE TABLE `glpi_groups_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_groups_tickets`
--

INSERT INTO `glpi_groups_tickets` (`id`, `tickets_id`, `groups_id`, `type`) VALUES
(1, 41, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_groups_users`
--

CREATE TABLE `glpi_groups_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_manager` tinyint(4) NOT NULL DEFAULT 0,
  `is_userdelegate` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_groups_users`
--

INSERT INTO `glpi_groups_users` (`id`, `users_id`, `groups_id`, `is_dynamic`, `is_manager`, `is_userdelegate`) VALUES
(2, 4, 2, 0, 1, 1),
(4, 2, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_holidays`
--

CREATE TABLE `glpi_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_imageformats`
--

CREATE TABLE `glpi_imageformats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_imageresolutions`
--

CREATE TABLE `glpi_imageresolutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_video` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_impactcompounds`
--

CREATE TABLE `glpi_impactcompounds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_impactcontexts`
--

CREATE TABLE `glpi_impactcontexts` (
  `id` int(10) UNSIGNED NOT NULL,
  `positions` mediumtext NOT NULL,
  `zoom` float NOT NULL DEFAULT 0,
  `pan_x` float NOT NULL DEFAULT 0,
  `pan_y` float NOT NULL DEFAULT 0,
  `impact_color` varchar(255) NOT NULL DEFAULT '',
  `depends_color` varchar(255) NOT NULL DEFAULT '',
  `impact_and_depends_color` varchar(255) NOT NULL DEFAULT '',
  `show_depends` tinyint(4) NOT NULL DEFAULT 1,
  `show_impact` tinyint(4) NOT NULL DEFAULT 1,
  `max_depth` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_impactitems`
--

CREATE TABLE `glpi_impactitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impactcontexts_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_slave` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_impactrelations`
--

CREATE TABLE `glpi_impactrelations` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype_source` varchar(255) NOT NULL DEFAULT '',
  `items_id_source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype_impacted` varchar(255) NOT NULL DEFAULT '',
  `items_id_impacted` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_infocoms`
--

CREATE TABLE `glpi_infocoms` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int(11) NOT NULL DEFAULT 0,
  `warranty_info` varchar(255) DEFAULT NULL,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `order_number` varchar(255) DEFAULT NULL,
  `delivery_number` varchar(255) DEFAULT NULL,
  `immo_number` varchar(255) DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `warranty_value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `sink_time` int(11) NOT NULL DEFAULT 0,
  `sink_type` int(11) NOT NULL DEFAULT 0,
  `sink_coeff` float NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alert` int(11) NOT NULL DEFAULT 0,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `decommission_date` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_interfacetypes`
--

CREATE TABLE `glpi_interfacetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_interfacetypes`
--

INSERT INTO `glpi_interfacetypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'IDE', NULL, NULL, NULL),
(2, 'SATA', NULL, NULL, NULL),
(3, 'SCSI', NULL, NULL, NULL),
(4, 'USB', NULL, NULL, NULL),
(5, 'AGP', NULL, NULL, NULL),
(6, 'PCI', NULL, NULL, NULL),
(7, 'PCIe', NULL, NULL, NULL),
(8, 'PCI-X', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ipaddresses`
--

CREATE TABLE `glpi_ipaddresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `version` tinyint(3) UNSIGNED DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `binary_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `binary_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `binary_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `binary_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `mainitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mainitemtype` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ipaddresses_ipnetworks`
--

CREATE TABLE `glpi_ipaddresses_ipnetworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddresses_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ipnetworks`
--

CREATE TABLE `glpi_ipnetworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `addressable` tinyint(4) NOT NULL DEFAULT 0,
  `version` tinyint(3) UNSIGNED DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `address_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask` varchar(40) DEFAULT NULL,
  `netmask_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway` varchar(40) DEFAULT NULL,
  `gateway_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ipnetworks_vlans`
--

CREATE TABLE `glpi_ipnetworks_vlans` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vlans_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_clusters`
--

CREATE TABLE `glpi_items_clusters` (
  `id` int(10) UNSIGNED NOT NULL,
  `clusters_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicebatteries`
--

CREATE TABLE `glpi_items_devicebatteries` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicebatteries_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturing_date` date DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `real_capacity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicecameras`
--

CREATE TABLE `glpi_items_devicecameras` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecameras_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicecameras_imageformats`
--

CREATE TABLE `glpi_items_devicecameras_imageformats` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_devicecameras_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `imageformats_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicecameras_imageresolutions`
--

CREATE TABLE `glpi_items_devicecameras_imageresolutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_devicecameras_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `imageresolutions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicecases`
--

CREATE TABLE `glpi_items_devicecases` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecases_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicecontrols`
--

CREATE TABLE `glpi_items_devicecontrols` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecontrols_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicedrives`
--

CREATE TABLE `glpi_items_devicedrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicedrives_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicefirmwares`
--

CREATE TABLE `glpi_items_devicefirmwares` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicefirmwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicegenerics`
--

CREATE TABLE `glpi_items_devicegenerics` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegenerics_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicegraphiccards`
--

CREATE TABLE `glpi_items_devicegraphiccards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegraphiccards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `memory` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_deviceharddrives`
--

CREATE TABLE `glpi_items_deviceharddrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceharddrives_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicememories`
--

CREATE TABLE `glpi_items_devicememories` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicememories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicemotherboards`
--

CREATE TABLE `glpi_items_devicemotherboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicemotherboards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicenetworkcards`
--

CREATE TABLE `glpi_items_devicenetworkcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mac` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicepcis`
--

CREATE TABLE `glpi_items_devicepcis` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepcis_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicepowersupplies`
--

CREATE TABLE `glpi_items_devicepowersupplies` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepowersupplies_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_deviceprocessors`
--

CREATE TABLE `glpi_items_deviceprocessors` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceprocessors_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `frequency` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `nbcores` int(11) DEFAULT NULL,
  `nbthreads` int(11) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicesensors`
--

CREATE TABLE `glpi_items_devicesensors` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesensors_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicesimcards`
--

CREATE TABLE `glpi_items_devicesimcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to various table, according to itemtype (id)',
  `itemtype` varchar(100) NOT NULL,
  `devicesimcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lines_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pin` varchar(255) NOT NULL DEFAULT '',
  `pin2` varchar(255) NOT NULL DEFAULT '',
  `puk` varchar(255) NOT NULL DEFAULT '',
  `puk2` varchar(255) NOT NULL DEFAULT '',
  `msin` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_devicesoundcards`
--

CREATE TABLE `glpi_items_devicesoundcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesoundcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_disks`
--

CREATE TABLE `glpi_items_disks` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
  `filesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalsize` int(11) NOT NULL DEFAULT 0,
  `freesize` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `encryption_status` int(11) NOT NULL DEFAULT 0,
  `encryption_tool` varchar(255) DEFAULT NULL,
  `encryption_algorithm` varchar(255) DEFAULT NULL,
  `encryption_type` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_enclosures`
--

CREATE TABLE `glpi_items_enclosures` (
  `id` int(10) UNSIGNED NOT NULL,
  `enclosures_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_kanbans`
--

CREATE TABLE `glpi_items_kanbans` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `state` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_operatingsystems`
--

CREATE TABLE `glpi_items_operatingsystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `operatingsystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemversions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemservicepacks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemarchitectures_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemkernelversions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `license_number` varchar(255) DEFAULT NULL,
  `licenseid` varchar(255) DEFAULT NULL,
  `operatingsystemeditions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `install_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_problems`
--

CREATE TABLE `glpi_items_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_projects`
--

CREATE TABLE `glpi_items_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_racks`
--

CREATE TABLE `glpi_items_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `racks_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL,
  `orientation` tinyint(4) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `hpos` tinyint(4) NOT NULL DEFAULT 0,
  `is_reserved` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_remotemanagements`
--

CREATE TABLE `glpi_items_remotemanagements` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `remoteid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_softwarelicenses`
--

CREATE TABLE `glpi_items_softwarelicenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `softwarelicenses_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_softwareversions`
--

CREATE TABLE `glpi_items_softwareversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `softwareversions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted_item` tinyint(4) NOT NULL DEFAULT 0,
  `is_template_item` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_install` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_items_tickets`
--

CREATE TABLE `glpi_items_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_itilcategories`
--

CREATE TABLE `glpi_itilcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` varchar(255) DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_helpdeskvisible` tinyint(4) NOT NULL DEFAULT 1,
  `tickettemplates_id_incident` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickettemplates_id_demand` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_incident` int(11) NOT NULL DEFAULT 1,
  `is_request` int(11) NOT NULL DEFAULT 1,
  `is_problem` int(11) NOT NULL DEFAULT 1,
  `is_change` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_itilcategories`
--

INSERT INTO `glpi_itilcategories` (`id`, `entities_id`, `is_recursive`, `itilcategories_id`, `name`, `completename`, `comment`, `level`, `knowbaseitemcategories_id`, `users_id`, `groups_id`, `code`, `ancestors_cache`, `sons_cache`, `is_helpdeskvisible`, `tickettemplates_id_incident`, `tickettemplates_id_demand`, `changetemplates_id`, `problemtemplates_id`, `is_incident`, `is_request`, `is_problem`, `is_change`, `date_mod`, `date_creation`) VALUES
(1, 0, 0, 0, 'Incident', 'Incident', '', 1, 0, 0, 0, '', '[]', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2023-11-18 08:54:19', '2023-11-18 08:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_itilfollowups`
--

CREATE TABLE `glpi_itilfollowups` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `requesttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `sourceitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sourceof_items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_itilfollowuptemplates`
--

CREATE TABLE `glpi_itilfollowuptemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `requesttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_itilsolutions`
--

CREATE TABLE `glpi_itilsolutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solutiontypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solutiontype_name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_approval` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_name` varchar(255) DEFAULT NULL,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_approval` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_name_approval` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `itilfollowups_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Followup reference on reject or approve a solution'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_itils_projects`
--

CREATE TABLE `glpi_itils_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitemcategories`
--

CREATE TABLE `glpi_knowbaseitemcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `sons_cache` longtext DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems`
--

CREATE TABLE `glpi_knowbaseitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `is_faq` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems_comments`
--

CREATE TABLE `glpi_knowbaseitems_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(10) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `parent_comment_id` int(10) UNSIGNED DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems_items`
--

CREATE TABLE `glpi_knowbaseitems_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems_knowbaseitemcategories`
--

CREATE TABLE `glpi_knowbaseitems_knowbaseitemcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems_profiles`
--

CREATE TABLE `glpi_knowbaseitems_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems_revisions`
--

CREATE TABLE `glpi_knowbaseitems_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL,
  `revision` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitems_users`
--

CREATE TABLE `glpi_knowbaseitems_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_knowbaseitemtranslations`
--

CREATE TABLE `glpi_knowbaseitemtranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(10) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_lineoperators`
--

CREATE TABLE `glpi_lineoperators` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `mcc` int(11) DEFAULT NULL,
  `mnc` int(11) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_lines`
--

CREATE TABLE `glpi_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `caller_num` varchar(255) NOT NULL DEFAULT '',
  `caller_name` varchar(255) NOT NULL DEFAULT '',
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lineoperators_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `linetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_linetypes`
--

CREATE TABLE `glpi_linetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_links`
--

CREATE TABLE `glpi_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `open_window` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_links_itemtypes`
--

CREATE TABLE `glpi_links_itemtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `links_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_locations`
--

CREATE TABLE `glpi_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_lockedfields`
--

CREATE TABLE `glpi_lockedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `field` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_global` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_logs`
--

CREATE TABLE `glpi_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype_link` varchar(100) NOT NULL DEFAULT '',
  `linked_action` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `id_search_option` int(11) NOT NULL DEFAULT 0 COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_mailcollectors`
--

CREATE TABLE `glpi_mailcollectors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `filesize_max` int(11) NOT NULL DEFAULT 2097152,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `accepted` varchar(255) DEFAULT NULL,
  `refused` varchar(255) DEFAULT NULL,
  `errors` int(11) NOT NULL DEFAULT 0,
  `use_mail_date` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `requester_field` int(11) NOT NULL DEFAULT 0,
  `add_cc_to_observer` tinyint(4) NOT NULL DEFAULT 0,
  `collect_only_unread` tinyint(4) NOT NULL DEFAULT 0,
  `last_collect_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_manuallinks`
--

CREATE TABLE `glpi_manuallinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(8096) NOT NULL,
  `open_window` tinyint(4) NOT NULL DEFAULT 1,
  `icon` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_manufacturers`
--

CREATE TABLE `glpi_manufacturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_monitormodels`
--

CREATE TABLE `glpi_monitormodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_monitors`
--

CREATE TABLE `glpi_monitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `size` decimal(5,2) NOT NULL DEFAULT 0.00,
  `have_micro` tinyint(4) NOT NULL DEFAULT 0,
  `have_speaker` tinyint(4) NOT NULL DEFAULT 0,
  `have_subd` tinyint(4) NOT NULL DEFAULT 0,
  `have_bnc` tinyint(4) NOT NULL DEFAULT 0,
  `have_dvi` tinyint(4) NOT NULL DEFAULT 0,
  `have_pivot` tinyint(4) NOT NULL DEFAULT 0,
  `have_hdmi` tinyint(4) NOT NULL DEFAULT 0,
  `have_displayport` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `monitortypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `monitormodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_monitortypes`
--

CREATE TABLE `glpi_monitortypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkaliases`
--

CREATE TABLE `glpi_networkaliases` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networknames_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `fqdns_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkequipmentmodels`
--

CREATE TABLE `glpi_networkequipmentmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkequipments`
--

CREATE TABLE `glpi_networkequipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ram` int(10) UNSIGNED DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkequipmenttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkequipmentmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sysdescr` text DEFAULT NULL,
  `cpu` int(11) NOT NULL DEFAULT 0,
  `uptime` varchar(255) NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkequipmenttypes`
--

CREATE TABLE `glpi_networkequipmenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkinterfaces`
--

CREATE TABLE `glpi_networkinterfaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networknames`
--

CREATE TABLE `glpi_networknames` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `fqdns_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportaggregates`
--

CREATE TABLE `glpi_networkportaggregates` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_list` text DEFAULT NULL COMMENT 'array of associated networkports_id',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportaliases`
--

CREATE TABLE `glpi_networkportaliases` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_alias` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportconnectionlogs`
--

CREATE TABLE `glpi_networkportconnectionlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `connected` tinyint(4) NOT NULL DEFAULT 0,
  `networkports_id_source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_destination` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportdialups`
--

CREATE TABLE `glpi_networkportdialups` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportethernets`
--

CREATE TABLE `glpi_networkportethernets` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(10) DEFAULT '' COMMENT 'T, LX, SX',
  `speed` int(11) NOT NULL DEFAULT 10 COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportfiberchannels`
--

CREATE TABLE `glpi_networkportfiberchannels` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkportfiberchanneltypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wwn` varchar(50) DEFAULT '',
  `speed` int(11) NOT NULL DEFAULT 10 COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportfiberchanneltypes`
--

CREATE TABLE `glpi_networkportfiberchanneltypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportlocals`
--

CREATE TABLE `glpi_networkportlocals` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportmetrics`
--

CREATE TABLE `glpi_networkportmetrics` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `ifinbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifinerrors` bigint(20) NOT NULL DEFAULT 0,
  `ifoutbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifouterrors` bigint(20) NOT NULL DEFAULT 0,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkports`
--

CREATE TABLE `glpi_networkports` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `logical_number` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `ifmtu` int(11) NOT NULL DEFAULT 0,
  `ifspeed` bigint(20) NOT NULL DEFAULT 0,
  `ifinternalstatus` varchar(255) DEFAULT NULL,
  `ifconnectionstatus` int(11) NOT NULL DEFAULT 0,
  `iflastchange` varchar(255) DEFAULT NULL,
  `ifinbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifinerrors` bigint(20) NOT NULL DEFAULT 0,
  `ifoutbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifouterrors` bigint(20) NOT NULL DEFAULT 0,
  `ifstatus` varchar(255) DEFAULT NULL,
  `ifdescr` varchar(255) DEFAULT NULL,
  `ifalias` varchar(255) DEFAULT NULL,
  `portduplex` varchar(255) DEFAULT NULL,
  `trunk` tinyint(4) NOT NULL DEFAULT 0,
  `lastup` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkports_networkports`
--

CREATE TABLE `glpi_networkports_networkports` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_2` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkports_vlans`
--

CREATE TABLE `glpi_networkports_vlans` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vlans_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tagged` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkporttypes`
--

CREATE TABLE `glpi_networkporttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `value_decimal` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_importable` tinyint(4) NOT NULL DEFAULT 0,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_networkporttypes`
--

INSERT INTO `glpi_networkporttypes` (`id`, `entities_id`, `is_recursive`, `value_decimal`, `name`, `comment`, `is_importable`, `instantiation_type`, `date_creation`, `date_mod`) VALUES
(1, 0, 0, 0, 'Name', 'Description References', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(2, 0, 0, 1, 'other', 'none of the following [RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(3, 0, 0, 2, 'regular1822', 'BBN Report 1822 [RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(4, 0, 0, 3, 'hdh1822', 'BBN Report 1822 [RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(5, 0, 0, 4, 'ddn-x25', 'BBN Report 1822 [RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(6, 0, 0, 5, 'x25', 'X.25 [RFC1382]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(7, 0, 0, 6, 'ethernet-csmacd', '[RFC1213]', 1, 'NetworkPortEthernet', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(8, 0, 0, 7, 'IEEE802.3', 'DEPRECATED [RFC3635]', 1, 'NetworkPortEthernet', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(9, 0, 0, 8, 'IEEE802.4', 'Token Bus-like Objects [RFC1239]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(10, 0, 0, 9, 'IEEE802.5', 'Token Ring-like Objects [RFC1748]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(11, 0, 0, 10, 'iso88026-man', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(12, 0, 0, 11, 'starLan', 'DEPRECATED [RFC3635]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(13, 0, 0, 12, 'proteon-10Mbit', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(14, 0, 0, 13, 'proteon-80Mbit', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(15, 0, 0, 14, 'hyperchannel', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(16, 0, 0, 15, 'FDDI', 'FDDI Objects [RFC1512]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(17, 0, 0, 16, 'lapb', 'LAP B [RFC1381]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(18, 0, 0, 17, 'sdlc', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(19, 0, 0, 18, 'ds1', 'T1/E1 Carrier Objects [RFC4805]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(20, 0, 0, 19, 'e1', 'obsolete [RFC4805]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(21, 0, 0, 20, 'basicISDN', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(22, 0, 0, 21, 'primaryISDN', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(23, 0, 0, 22, 'propPointToPointSerial', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(24, 0, 0, 23, 'ppp', 'Point-to-Point Protocol [RFC1213][RFC1471]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(25, 0, 0, 24, 'softwareLoopback', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(26, 0, 0, 25, 'eon', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(27, 0, 0, 26, 'ethernet-3Mbit', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(28, 0, 0, 27, 'nsip', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(29, 0, 0, 28, 'slip', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(30, 0, 0, 29, 'ultra', '[RFC1213]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(31, 0, 0, 30, 'ds3', 'DS3/E3 Interface Objects [RFC3896]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(32, 0, 0, 31, 'sip', 'SMDS Interface Objects [RFC1694]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(33, 0, 0, 32, 'frame-relay', 'Frame Relay Objects for DTE [RFC2115]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(34, 0, 0, 33, 'RS-232', 'RS-232 Objects [RFC1659]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(35, 0, 0, 34, 'Parallel', 'Parallel Printer Objects [RFC1660]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(36, 0, 0, 35, 'arcnet', 'ARC network', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(37, 0, 0, 36, 'arcnet-plus', 'ARC network plus', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(38, 0, 0, 37, 'atm', 'ATM', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(39, 0, 0, 38, 'MIOX25', 'MIOX25 [RFC1461]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(40, 0, 0, 39, 'SONET', 'SONET or SDH', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(41, 0, 0, 40, 'x25ple', 'X.25 packet level [RFC2127]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(42, 0, 0, 41, 'iso88022llc', '802.2 LLC', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(43, 0, 0, 42, 'localTalk', '', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(44, 0, 0, 43, 'smds-dxi', 'SMDS DXI', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(45, 0, 0, 44, 'frameRelayService', 'Frame Relay DCE [RFC2954]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(46, 0, 0, 45, 'v35', 'V.35', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(47, 0, 0, 46, 'hssi', 'HSSI', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(48, 0, 0, 47, 'hippi', 'HIPPI', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(49, 0, 0, 48, 'modem', 'generic modem', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(50, 0, 0, 49, 'aal5', 'AAL5 over ATM', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(51, 0, 0, 50, 'sonetPath', '', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(52, 0, 0, 51, 'sonetVT', '', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(53, 0, 0, 52, 'smds-icip', 'SMDS Inter-Carrier Interface Protocol', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(54, 0, 0, 53, 'propVirtual', 'proprietary vitural/internal interface [RFC2863]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(55, 0, 0, 54, 'propMultiLink', 'proprietary multi-link multiplexing [RFC2863]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(56, 0, 0, 55, 'ieee80212', '100BaseVG', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(57, 0, 0, 56, 'fibre-channel', 'Fibre Channel', 1, 'NetworkPortFiberchannel', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(58, 0, 0, 57, 'hippiInterfaces', 'HIPPI interfaces [Philip_Cameron]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(59, 0, 0, 58, 'FrameRelayInterconnect', 'Interconnet over FR [Unknown]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(60, 0, 0, 59, 'aflane8023', 'ATM Emulated LAN for 802.3 [Keith_McCloghrie]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(61, 0, 0, 60, 'aflane8025', 'ATM Emulated LAN for 802.5 [Keith_McCloghrie]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(62, 0, 0, 61, 'cctEmul', 'ATM Emulated circuit [Guy_Fedorkow]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(63, 0, 0, 62, 'fastEther', 'DEPRECATED [RFC3635]', 1, 'NetworkPortEthernet', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(64, 0, 0, 63, 'isdn', 'ISDN and X.25 [RFC1356]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(65, 0, 0, 64, 'v11', 'CCITT V.11/X.21 [Satish_Popat]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(66, 0, 0, 65, 'v36', 'CCITT V.36 [Satish_Popat]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(67, 0, 0, 66, 'g703-64k', 'CCITT G703 at 64Kbps [Satish_Popat]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(68, 0, 0, 67, 'g703-2mb', 'CCITT G703 at 2Mbps [Satish_Popat]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(69, 0, 0, 68, 'qllc', 'SNA QLLC [Satish_Popat]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(70, 0, 0, 69, 'fastEtherFX', 'DEPRECATED [RFC3635]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(71, 0, 0, 70, 'channel', 'channel [Steven_Schwell]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(72, 0, 0, 71, 'IEEE802.11', 'radio spread spectrum [Dawkoon_Paul_Lee]', 1, 'NetworkPortWifi', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(73, 0, 0, 72, 'ibm370parChan', 'IBM System 360/370 OEMI Channel [Bill_Kwan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(74, 0, 0, 73, 'ESCON', 'IBM Enterprise Systems Connection [Bill_Kwan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(75, 0, 0, 74, 'DLSw', 'Data Link Switching [Bill_Kwan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(76, 0, 0, 75, 'ISDNs', 'ISDN S/T interface [Ed_Alcoff]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(77, 0, 0, 76, 'ISDNu', 'ISDN U interface [Ed_Alcoff]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(78, 0, 0, 77, 'lapd', 'Link Access Protocol D [Ed_Alcoff]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(79, 0, 0, 78, 'ip-switch', 'IP Switching Objects [Joe_Wei]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(80, 0, 0, 79, 'rsrb', 'Remote Source Route Bridging [Bob_Clouston]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(81, 0, 0, 80, 'atm-logical', 'ATM Logical Port [RFC3606]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(82, 0, 0, 81, 'ds0', 'Digital Signal Level 0 [RFC2494]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(83, 0, 0, 82, 'ds0Bundle', 'group of ds0s on the same ds1 [RFC2494]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(84, 0, 0, 83, 'bsc', 'Bisynchronous Protocol [Bill_Kwan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(85, 0, 0, 84, 'async', 'Asynchronous Protocol [Bill_Kwan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(86, 0, 0, 85, 'cnr', 'Combat Net Radio [Herb_Jensen]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(87, 0, 0, 86, 'iso88025Dtr', 'ISO 802.5r DTR [Trevor_Warwick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(88, 0, 0, 87, 'eplrs', 'Enhanced  Pos Loc Report Sys [Herb_Jensen]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(89, 0, 0, 88, 'arap', 'Appletalk Remote Access Protocol [Jim_Halpin]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(90, 0, 0, 89, 'propCnls', 'Proprietary Connectionless Proto. [Robert_Neill]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(91, 0, 0, 90, 'hostPad', 'CCITT-ITU X.29 PAD Protocol [Robert_Neill]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(92, 0, 0, 91, 'termPad', 'CCITT-ITU X.3 PAD Facility [Robert_Neill]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(93, 0, 0, 92, 'frameRelayMPI', 'Multiproto Interconnect over FR [Robert_Neill]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(94, 0, 0, 93, 'x213', 'CCITT-ITU X213 [Robert_Neill]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(95, 0, 0, 94, 'adsl', 'Asymmetric Digital Subscriber Loop [Gregory_Bathrick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(96, 0, 0, 95, 'radsl', 'Rate-Adapt. Digital Subscriber Loop [Gregory_Bathrick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(97, 0, 0, 96, 'sdsl', 'Symmetric Digital Subscriber Loop [Gregory_Bathrick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(98, 0, 0, 97, 'vdsl', 'Very H-Speed Digital Subscrib. Loop [Gregory_Bathrick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(99, 0, 0, 98, 'iso88025CRFPInt', 'ISO 802.5 CRFP [Trevor_Warwick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(100, 0, 0, 99, 'myrinet', 'Myricom Myrinet [Bob_Felderman]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(101, 0, 0, 100, 'voiceEM', 'Voice recEive and transMit (E&#38;M) [Bob_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(102, 0, 0, 101, 'voiceFXO', 'Voice Foreign Exchange Office [Bob_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(103, 0, 0, 102, 'voiceFXS', 'Voice Foreign Exchange Station [Bob_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(104, 0, 0, 103, 'voiceEncap', 'Voice encapsulation [Bob_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(105, 0, 0, 104, 'voiceOverIp', 'Voice over IP encapsulation [Bob_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(106, 0, 0, 105, 'atmDxi', 'ATM DXI [Gary_Hanson]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(107, 0, 0, 106, 'atmFuni', 'ATM FUNI [Gary_Hanson]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(108, 0, 0, 107, 'atmIma', 'ATM IMA [Chris_Martin]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(109, 0, 0, 108, 'pppMultilinkBundle', 'PPP Multilink Bundle [John_Shriver]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(110, 0, 0, 109, 'ipOverCdlc', 'IBM ipOverCdlc [Ken_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(111, 0, 0, 110, 'ipOverClaw', 'IBM Common Link Access to Workstn [Ken_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(112, 0, 0, 111, 'stackToStack', 'IBM stackToStack [Ken_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(113, 0, 0, 112, 'virtualIpAddress', 'IBM VIPA [Ken_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(114, 0, 0, 113, 'mpc', 'IBM multi-protocol channel support [Ken_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(115, 0, 0, 114, 'ipOverAtm', 'IBM ipOverAtm [RFC2320]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(116, 0, 0, 115, 'iso88025Fiber', 'ISO 802.5j Fiber Token Ring [Kevin_Lingle]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(117, 0, 0, 116, 'tdlc', 'IBM twinaxial data link control [John_Pechacek]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(118, 0, 0, 117, 'gigabitEthernet', 'DEPRECATED [RFC3635]', 1, 'NetworkPortEthernet', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(119, 0, 0, 118, 'hdlc', 'HDLC [Sebastien_Rosset]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(120, 0, 0, 119, 'lapf', 'LAP F [Sebastien_Rosset]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(121, 0, 0, 120, 'v37', 'V.37 [Sebastien_Rosset]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(122, 0, 0, 121, 'x25mlp', 'Multi-Link Protocol [Sebastien_Rosset]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(123, 0, 0, 122, 'x25huntGroup', 'X25 Hunt Group [Sebastien_Rosset]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(124, 0, 0, 123, 'transpHdlc', 'Transp HDLC [Sebastien_Rosset]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(125, 0, 0, 124, 'interleave', 'Interleave channel [Karmous_Edwards]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(126, 0, 0, 125, 'fast', 'Fast channel [Karmous_Edwards]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(127, 0, 0, 126, 'ip', 'IP (for APPN HPR in IP networks) [Robert_Moore]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(128, 0, 0, 127, 'docsCableMaclayer', 'CATV Mac Layer [Azlina_Palmer]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(129, 0, 0, 128, 'docsCableDownstream', 'CATV Downstream interface [Azlina_Palmer]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(130, 0, 0, 129, 'docsCableUpstream', 'CATV Upstream interface [Azlina_Palmer]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(131, 0, 0, 130, 'a12MppSwitch', 'Avalon Parallel Processor [Ross_Harvey]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(132, 0, 0, 131, 'tunnel', 'Encapsulation interface [Dave_Thaler]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(133, 0, 0, 132, 'coffee', 'coffee pot [RFC2325]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(134, 0, 0, 133, 'ces', 'Circiut Emulation Service [Ron_Carmona]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(135, 0, 0, 134, 'atmSubInterface', '(x)  ATM Sub Interface [Keith_McCloghrie]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(136, 0, 0, 135, 'l2vlan', 'Layer 2 Virtual LAN using 802.1Q [Mike_MacFaden]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(137, 0, 0, 136, 'l3ipvlan', 'Layer 3 Virtual LAN - IP Protocol [Mike_MacFaden]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(138, 0, 0, 137, 'l3ipxvlan', 'Layer 3 Virtual LAN - IPX Prot. [Mike_MacFaden]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(139, 0, 0, 138, 'digitalPowerLine', 'IP over Power Lines [Hans_Scholtes]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(140, 0, 0, 139, 'mediaMailOverIp', '(xxx)  Multimedia Mail over IP [Hongchi_Shih]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(141, 0, 0, 140, 'dtm', 'Dynamic synchronous Transfer Mode [Jakob_Ellerstedt]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(142, 0, 0, 141, 'dcn', 'Data Communications Network [James_Card]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(143, 0, 0, 142, 'ipForward', 'IP Forwarding Interface [James_Card]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(144, 0, 0, 143, 'msdsl', 'Multi-rate Symmetric DSL [Gopinath_Durairaj]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(145, 0, 0, 144, 'ieee1394     IEEE1394', 'High Performance Serial Bus [Kenji_Fujisawa]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(146, 0, 0, 145, 'if-gsn', 'HIPPI-6400 [Jean_Michel_Pittet]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(147, 0, 0, 146, 'dvbRccMacLayer', 'DVB-RCC MAC Layer [Maarten_Oelering]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(148, 0, 0, 147, 'dvbRccDownstream', 'DVB-RCC Downstream Channel [Maarten_Oelering]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(149, 0, 0, 148, 'dvbRccUpstream', 'DVB-RCC Upstream Channel [Maarten_Oelering]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(150, 0, 0, 149, 'atmVirtual', 'ATM Virtual Interface [Subrahmanya_Hegde]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(151, 0, 0, 150, 'mplsTunnel', 'MPLS Tunnel Virtual Interface [Cheenu_Srinivasan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(152, 0, 0, 151, 'srp', 'Spatial Reuse Protocol [Bill_Shetti]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(153, 0, 0, 152, 'voiceOverAtm', 'Voice over ATM [Chris_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(154, 0, 0, 153, 'voiceOverFrameRelay', 'Voice Over Frame Relay [Chris_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(155, 0, 0, 154, 'idsl', 'Digital Subscriber Loop over ISDN [Patrick_Gili]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(156, 0, 0, 155, 'compositeLink', 'Avici Composite Link Interface [Joseph_Dube]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(157, 0, 0, 156, 'ss7SigLink', 'SS7 Signaling Link [Cheenu_Srinivasan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(158, 0, 0, 157, 'propWirelessP2P', 'Prop. P2P wireless interface [Joseph_Raja]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(159, 0, 0, 158, 'frForward', 'Frame forward Interface [Subrahmanya_Hegde]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(160, 0, 0, 159, 'rfc1483', 'Multiprotocol over ATM AAL5 [RFC1483]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(161, 0, 0, 160, 'USB', 'USB Interface [Bejamin_Dolnik]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(162, 0, 0, 161, 'ieee8023adLag', 'IEEE 802.3ad Link Aggregate [Les_Bell]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(163, 0, 0, 162, 'bgpPolicyAccounting', 'BGP Policy Accounting [Vinod_B_C]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(164, 0, 0, 163, 'frf16MfrBundle', 'FRF.16 Multilik Frame Relay [Pate_Prayson]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(165, 0, 0, 164, 'h323Gatekeeper', 'H323 Gatekeeper [Chris_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(166, 0, 0, 165, 'h323Proxy', 'H323 Voice and Video Proxy [Chris_White]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(167, 0, 0, 166, 'mpls', 'MPLS [Cheenu_Srinivasan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(168, 0, 0, 167, 'mfSigLink', 'Multi-frequency signaling link [Cheenu_Srinivasan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(169, 0, 0, 168, 'hdsl2', 'High Bit-Rate DSL, 2nd gen. [Bob_Ray]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(170, 0, 0, 169, 'shdsl', 'Multirate HDSL2 [Bob_Ray]', 1, 'NetworkPortEthernet', '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(171, 0, 0, 170, 'ds1FDL', 'Facility Data Link (4Kbps) on a DS1 [Bill_Kwan]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(172, 0, 0, 171, 'POS', 'Packet over SONET/SDH Interface [Ewart_Tempest]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(173, 0, 0, 172, 'dvbAsiIn', 'DVB-ASI Input [Hezi_Oved]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(174, 0, 0, 173, 'dvbAsiOut', 'DVB-ASI Output [Hezi_Oved]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(175, 0, 0, 174, 'plc', 'Power Line Communications [Andrew_Lunn]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(176, 0, 0, 175, 'NFAS', 'Non-Facility Associated Signaling [Sidney_Antommarchi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(177, 0, 0, 176, 'TR008', 'TROO8 [Sidney_Antommarchi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(178, 0, 0, 177, 'GR303RDT', 'Remote Digital Terminal [Sidney_Antommarchi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(179, 0, 0, 178, 'GR303IDT', 'Integrated Digital Terminal [Sidney_Antommarchi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(180, 0, 0, 179, 'ISUP', 'ISUP [Sidney_Antommarchi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(181, 0, 0, 180, 'propDocsWirelessMaclayer', 'Cisco proprietary Maclayer [Joseph_Raja]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(182, 0, 0, 181, 'propDocsWirelessDownstream', 'Cisco proprietary Downstream [Joseph_Raja]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(183, 0, 0, 182, 'propDocsWirelessUpstream', 'Cisco proprietary Upstream [Joseph_Raja]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(184, 0, 0, 183, 'hiperlan2', 'HIPERLAN Type 2 Radio Interface [Jamshid_Khun_Jush]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(185, 0, 0, 184, 'propBWAp2Mp', 'PropBroadbandWirelessAccesspt2Multipt\n(use of this type for IEEE 802.16\nWMAN, interfaces as per IEEE 802.16\nis deprecated and iftype 237 should\nbe used instead) [Zvika_Zilberman]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(186, 0, 0, 185, 'sonetOverheadChannel', 'SONET Overhead Channel [ODSI_Coalition_K_Arv]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(187, 0, 0, 186, 'digitalWrapperOverheadChannel', 'Digital Wrapper\nOverhead [ODSI_Coalition_K_Arv]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(188, 0, 0, 187, 'aal2', 'ATM adaptation layer 2 [K_Ashoka]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(189, 0, 0, 188, 'radioMAC', 'MAC layer over radio links [Daniele_Behar]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(190, 0, 0, 189, 'atmRadio', 'ATM over radio links [Daniele_Behar]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(191, 0, 0, 190, 'IMT', 'Inter-Machine Trunks [Sidney_Antommarchi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(192, 0, 0, 191, 'mvl', 'Multiple Virtual Lines DSL [Kevin_Baughman]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(193, 0, 0, 192, 'reachDSL', 'Long Reach DSL [Kevin_Baughman]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(194, 0, 0, 193, 'frDlciEndPt', 'Frame Relay DLCI End Point [Robert_Steinberger]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(195, 0, 0, 194, 'atmVciEndPt', 'ATM VCI End Point [Robert_Steinberger]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(196, 0, 0, 195, 'opticalChannel', 'Optical Channel [Mark_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(197, 0, 0, 196, 'opticalTransport', 'Optical Transport [Mark_Stewart]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(198, 0, 0, 197, 'propAtm', 'Proprietary ATM [Subrahmanya_Hegde]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(199, 0, 0, 198, 'voiceOverCable', 'Voice Over Cable Interface [Eugene_Nechamkin]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(200, 0, 0, 199, 'infiniband', 'Infiniband [Bill_Strahm]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(201, 0, 0, 200, 'teLink', 'TE Link [Martin_Dubuc]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(202, 0, 0, 201, 'q2931', 'Q.2931 [Sidney_Antommarchi_2]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(203, 0, 0, 202, 'virtualTg', 'Virtual Trunk Group [Sidney_Antommarchi_2]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(204, 0, 0, 203, 'sipTg', 'SIP Trunk Group [Sidney_Antommarchi_2]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(205, 0, 0, 204, 'sipSig', 'SIP Signaling [Sidney_Antommarchi_2]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(206, 0, 0, 205, 'docsCableUpstreamChannel', 'CATV Upstream Channel [Greg_Nakanishi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(207, 0, 0, 206, 'econet', 'Acorn Econet [Ben_Harris]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(208, 0, 0, 207, 'pon155', 'FSAN 155Mb Symetrical PON interface [Graham_Higgins]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(209, 0, 0, 208, 'pon622', 'FSAN 622Mb Symetrical PON interface [Graham_Higgins]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(210, 0, 0, 209, 'bridge', 'Transparent bridge interface [Yuzo_Watanabe]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(211, 0, 0, 210, 'linegroup', 'Interface common to multiple lines [Yuzo_Watanabe]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(212, 0, 0, 211, 'voiceEMFGD', 'voice E&#38;M Feature Group D [Taher_Shaikh]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(213, 0, 0, 212, 'voiceFGDEANA', 'voice FGD Exchange Access North American [Taher_Shaikh]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(214, 0, 0, 213, 'voiceDID', 'voice Direct Inward Dialing [Taher_Shaikh]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(215, 0, 0, 214, 'mpegTransport', 'MPEG transport interface [Gaurav_Aggarwal]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(216, 0, 0, 215, 'sixToFour', '6to4 interface  (DEPRECATED) [RFC4087]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(217, 0, 0, 216, 'gtp', 'GTP (GPRS Tunneling Protocol) [Rajesh_M_L]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(218, 0, 0, 217, 'pdnEtherLoop1', 'Paradyne EtherLoop 1 [Shu_Dong]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(219, 0, 0, 218, 'pdnEtherLoop2', 'Paradyne EtherLoop 2 [Shu_Dong]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(220, 0, 0, 219, 'opticalChannelGroup', 'Optical Channel Group [Hing_Kam_Lam]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(221, 0, 0, 220, 'homepna', 'HomePNA ITU-T G.989 [Stephen_Palm]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(222, 0, 0, 221, 'gfp', 'Generic Framing Procedure (GFP) [Italo_Busi]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(223, 0, 0, 222, 'ciscoISLvlan', 'Layer 2 Virtual LAN using Cisco ISL [Sandeep_Raghavendra]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(224, 0, 0, 223, 'actelisMetaLOOP', 'Acteleis proprietary MetaLOOP\nHigh Speed Link [Edward_Beili]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(225, 0, 0, 224, 'fcipLink', 'FCIP Link [Anil_Rijhsinghani]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(226, 0, 0, 225, 'rpr', 'Resilient Packet Ring Interface Type [IEEE 802.17]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(227, 0, 0, 226, 'qam', 'RF Qam Interface [Jeyachitra_Alagar]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(228, 0, 0, 227, 'lmp', 'Link Management Protocol [RFC4327]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(229, 0, 0, 228, 'cblVectaStar', 'Cambridge Broadband Networks Limited\nVectaStar [John_Naylon]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(230, 0, 0, 229, 'docsCableMCmtsDownstream', 'CATV Modular CMTS Downstream\nInterface [Eduardo_Cardona][\"Data-Over-Cable Service Interface Specifications:\nM-CMTS Operations Support System Interface Specification,\nCM-SP-M-OSSI-I01-050805\", DOCSIS, August 2005.][http://www.cablemodem.com/specifications][https://www.cablelabs.com/specifications/archives/docsis.html]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(231, 0, 0, 230, 'adsl2', 'Asymmetric Digital Subscriber Loop\nVersion 2 (DEPRECATED - REPLACED\nBY 238) [RFC4706]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(232, 0, 0, 231, 'macSecControlledIF', 'MACSecControlled [Paul_Congdon]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(233, 0, 0, 232, 'macSecUncontrolledIF', 'MACSecUncontrolled [Paul_Congdon]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(234, 0, 0, 233, 'aviciOpticalEther', 'Avici Optical Ethernet Aggregate [Somen_Bhattacharya]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(235, 0, 0, 234, 'atmbond', 'atmbond [https://www.itu.int/rec/T-REC-G.998.1-200501-I/en]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(236, 0, 0, 235, 'voiceFGDOS', 'voice FGD Operator Services [Lizzie_Cheung]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(237, 0, 0, 236, 'mocaVersion1', 'MultiMedia over Coax Alliance [Ladd_Wardani]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(238, 0, 0, 237, 'ieee80216WMAN', 'IEEE 802.16 WMAN interface [http://standards.ieee.org/getieee802/802.16.html]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(239, 0, 0, 238, 'adsl2plus', 'Asymmetric Digital Subscriber Loop\nVersion 2 -- Version 2 Plus and all\nvariants [RFC4706]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(240, 0, 0, 239, 'dvbRcsMacLayer', 'DVB-RCS MAC Layer [RFC5728][ETSI EN 301 790][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(241, 0, 0, 240, 'dvbTdm', 'DVB Satellite TDM [RFC5728][ETSI EN 300 421][ETSI EN 302 307][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(242, 0, 0, 241, 'dvbRcsTdma', 'DVB-RCS TDMA [RFC5728][ETSI EN 301 790][ETSI EN 300 421][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(243, 0, 0, 242, 'x86Laps', 'LAPS based on ITU-T X.86/Y.1323 [Orly_Nicklass][http://grouper.ieee.org/groups/802/3/ad_hoc/etholaps/public/docs/opening_report_0301.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(244, 0, 0, 243, 'wwanPP', '3GPP WWAN [Gabriel_Montenegro][https://www.3gpp.org/ftp/specs/archive/23_series/23.060/23060-740.zip]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(245, 0, 0, 244, 'wwanPP2', '3GPP2 WWAN [Gabriel_Montenegro][http://www.3gpp2.org/Public_html/Specs/C.S0017-005-A_v1.0_040617.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(246, 0, 0, 245, 'voiceEBS', 'voice P-phone EBS physical interface [Tom_Chou]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(247, 0, 0, 246, 'ifPwType', 'Pseudowire interface type [RFC5601]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(248, 0, 0, 247, 'ILAN', 'Internal LAN on a bridge per IEEE\n802.1ap [Glenn_Parsons][http://www.ieee802.org/1/files/private/ap-drafts/d3/802-1ap-D3-4.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(249, 0, 0, 248, 'PIP', 'Provider Instance Port on a bridge\nper IEEE 802.1ah PBB [Glenn_Parsons][http://www.ieee802.org/1/files/private/ah-drafts/d4/802-1ah-d4-2.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(250, 0, 0, 249, 'aluELP', 'Alcatel-Lucent Ethernet Link Protection [Xiaohua_Ma]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(251, 0, 0, 250, 'gpon', 'Gigabit-capable passive optical networks\n(G-PON)  as per ITU-T G.984 [Hyeri_Koh]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(252, 0, 0, 251, 'vdsl2', 'Very high speed digital subscriber\nline Version 2 (as per ITU-T Recommendation\nG.993.2) [Markus_Freudenberger][RFC5650]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(253, 0, 0, 252, 'capwapDot11Profile', 'WLAN Profile Interface [RFC5834]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(254, 0, 0, 253, 'capwapDot11Bss', 'WLAN BSS Interface [RFC5834]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(255, 0, 0, 254, 'capwapWtpVirtualRadio', 'WTP Virtual Radio Interface [RFC5833]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(256, 0, 0, 255, 'bits', 'bitsport [Du_Feng]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(257, 0, 0, 256, 'docsCableUpstreamRfPort', 'DOCSIS CATV Upstream RF\nPort [Michael_Patrick][https://www.cablelabs.com/specifications/CM-SP-EQAM-PMI-I01-081209.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(258, 0, 0, 257, 'cableDownstreamRfPort', 'CATV downstream RF port [Michael_Patrick]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(259, 0, 0, 258, 'vmwareVirtualNic', 'VMware Virtual Network Interface [Mike_MacFaden]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(260, 0, 0, 259, 'ieee802154', 'IEEE 802.15.4 WPAN interface [Juergen_Schoenwaelde][\"IEEE Std. 802.15.4-2006\", October 2006.]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(261, 0, 0, 260, 'otnOdu', 'OTN Optical Data Unit [Jim_Vance][https://www.itu.int/ITU-T/studygroups/com15/otn/OTNtutorial.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(262, 0, 0, 261, 'otnOtu', 'OTN Optical channel Transport Unit [Jim_Vance][https://www.itu.int/ITU-T/studygroups/com15/otn/OTNtutorial.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(263, 0, 0, 262, 'ifVfiType', 'VPLS Forwarding Instance Interface\nType [Manas_Pati]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(264, 0, 0, 263, 'g9981', 'G.998.1 bonded interface [RFC6768][RFC Errata 3591]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(265, 0, 0, 264, 'g9982', 'G.998.2 bonded interface [RFC6767][RFC Errata 3589]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(266, 0, 0, 265, 'g9983', 'G.998.3 bonded interface [RFC6766][RFC Errata 3588]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(267, 0, 0, 266, 'aluEpon (E-PON)', 'Ethernet Passive Optical Networks [Karel_Meijfroidt]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(268, 0, 0, 267, 'aluEponOnu', 'EPON Optical Network Unit [Karel_Meijfroidt]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(269, 0, 0, 268, 'aluEponPhysicalUni', 'EPON physical User to Network\ninterface [Karel_Meijfroidt]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(270, 0, 0, 269, 'aluEponLogicalLink', 'The emulation of a point-to-point\nlink over the EPON layer [Karel_Meijfroidt]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(271, 0, 0, 270, 'aluGponOnu', 'GPON Optical Network Unit [Karel_Meijfroidt][https://www.itu.int/rec/T-REC-G.984.2/en]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(272, 0, 0, 271, 'aluGponPhysicalUni', 'GPON physical User to Network\ninterface [Karel_Meijfroidt][https://www.itu.int/rec/T-REC-G.984.2/en]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(273, 0, 0, 272, 'vmwareNicTeam', 'VMware NIC Team [Michael_MacFaden][https://www.vmware.com/pdf/esx2_NIC_Teaming.pdf]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(274, 0, 0, 273, 'Reserved', 'The corresponding transmission value\nis allocated according to the following\nreference. [RFC6825]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(275, 0, 0, 274, 'Reserved', 'The corresponding transmission value\nis allocated according to the following reference. [RFC7257]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(276, 0, 0, 275, 'Reserved', 'The corresponding transmission value\nis allocated according to the following reference. [RFC7257]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(277, 0, 0, 276, 'Reserved', 'The corresponding transmission value\nis allocated according to the following reference. [RFC7257]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(278, 0, 0, 277, 'docsOfdmDownstream', 'CATV Downstream OFDM interface [https://www.cablelabs.com/specification/cable-modem-operations-support-system-interface-specification][Miguel_O_Alvarez]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(279, 0, 0, 278, 'docsOfdmaUpstream', 'CATV Upstream OFDMA interface [https://www.cablelabs.com/specification/cable-modem-operations-support-system-interface-specification][Miguel_O_Alvarez]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(280, 0, 0, 279, 'gfast', 'G.fast port [ITU-T G.9701]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(281, 0, 0, 280, 'sdci', 'SDCI (IO-Link) [IEC 61131-9 Edition 1.0 2013-09][Markus_Rentschler]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(282, 0, 0, 281, 'xboxWireless', 'Xbox wireless [Brandon_Jiang]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(283, 0, 0, 282, 'fastdsl', 'FastDSL [BBF TR-355][Broadband_Forum]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(284, 0, 0, 283, 'docsCableScte55d1FwdOob', 'Cable SCTE 55-1 OOB Forward Channel [https://www.scte.org/documents/pdf/Standards/ANSI_SCTE-55-1-2009.pdf][Brian_Hedstrom]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(285, 0, 0, 284, 'docsCableScte55d1RetOob', 'Cable SCTE 55-1 OOB Return Channel [https://www.scte.org/documents/pdf/Standards/ANSI_SCTE-55-1-2009.pdf][Brian_Hedstrom]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(286, 0, 0, 285, 'docsCableScte55d2DsOob', 'Cable SCTE 55-2 OOB Downstream Channel [https://web.archive.org/web/20190822104256/http://www.scte.org/documents/pdf/Standards/ANSI_SCTE%2055-2%202008.pdf][Brian_Hedstrom]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(287, 0, 0, 286, 'docsCableScte55d2UsOob', 'Cable SCTE 55-2 OOB Upstream Channel [https://web.archive.org/web/20190822104256/http://www.scte.org/documents/pdf/Standards/ANSI_SCTE%2055-2%202008.pdf][Brian_Hedstrom]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(288, 0, 0, 287, 'docsCableNdf', 'Cable Narrowband Digital Forward [http://www.cablelabs.com/wp-content/uploads/specdocs/CM-SP-R-OOB-I04-160923.pdf][Brian_Hedstrom]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(289, 0, 0, 288, 'docsCableNdr', 'Cable Narrowband Digital Return [http://www.cablelabs.com/wp-content/uploads/specdocs/CM-SP-R-OOB-I04-160923.pdf][Brian_Hedstrom]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(290, 0, 0, 289, 'ptm', 'Packet Transfer Mode [ITU-T G.993.1, Annex H][ITU-T G.993.2][ITU-T G.9701][Broadband_Forum]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(291, 0, 0, 290, 'ghn', 'G.hn port [ITU-T G.9961][Broadband_Forum]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(292, 0, 0, 291, 'otnOtsi', 'Optical Tributary Signal [ITU-T G.959.1][Koteswara_Boyapati]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(293, 0, 0, 292, 'otnOtuc', 'OTN OTUCn [ITU-T G.709/Y.1331][Koteswara_Boyapati]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(294, 0, 0, 293, 'otnOduc', 'OTN ODUC [ITU-T G.709][Koteswara_Boyapati]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(295, 0, 0, 294, 'otnOtsig', 'OTN OTUC Signal [ITU-T G.709][Koteswara_Boyapati]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(296, 0, 0, 295, 'microwaveCarrierTermination', 'air interface of a single microwave carrier [RFC8561]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(297, 0, 0, 296, 'microwaveRadioLinkTerminal', 'radio link interface for one or several aggregated microwave carriers [RFC8561]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(298, 0, 0, 297, 'ieee8021axDrni', 'IEEE 802.1AX Distributed Resilient Network Interface [IEEE 802.1AX-Rev-d2-0][John_Messenger]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(299, 0, 0, 298, 'ax25', 'AX.25 network interfaces [AX.25 Link Access Protocol for Amateur Packet Radio version 2.2][Iain_Learmonth]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(300, 0, 0, 299, 'ieee19061nanocom', 'Nanoscale and Molecular Communication [IEEE 1906.1-2015][Stephen_F_Bush]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(301, 0, 0, 300, 'cpri', 'Common Public Radio Interface [CPRI v7.0][Renwang_Liu]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(302, 0, 0, 301, 'omni', 'Overlay Multilink Network Interface (OMNI) [draft-templin-6man-omni-00][Fred_L_Templin]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(303, 0, 0, 302, 'roe', 'Radio over Ethernet Interface [1914.3-2018 - IEEE Standard for Radio over Ethernet Encapsulations and Mappings][Renwang_Liu]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25'),
(304, 0, 0, 303, 'p2pOverLan', 'Point to Point over LAN interface [RFC9296]', 0, NULL, '2023-11-18 08:20:25', '2023-11-18 08:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networkportwifis`
--

CREATE TABLE `glpi_networkportwifis` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wifinetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkportwifis_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'only useful in case of Managed node',
  `version` varchar(20) DEFAULT NULL COMMENT 'a, a/b, a/b/g, a/b/g/n, a/b/g/n/y',
  `mode` varchar(20) DEFAULT NULL COMMENT 'ad-hoc, managed, master, repeater, secondary, monitor, auto',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_networks`
--

CREATE TABLE `glpi_networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notepads`
--

CREATE TABLE `glpi_notepads` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notifications`
--

CREATE TABLE `glpi_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `event` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_response` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_notifications`
--

INSERT INTO `glpi_notifications` (`id`, `name`, `entities_id`, `itemtype`, `event`, `comment`, `is_recursive`, `is_active`, `date_mod`, `date_creation`, `allow_response`) VALUES
(1, 'Alert Tickets not closed', 0, 'Ticket', 'alertnotclosed', NULL, 1, 1, NULL, NULL, 1),
(2, 'New Ticket', 0, 'Ticket', 'new', NULL, 1, 1, NULL, NULL, 1),
(3, 'Update Ticket', 0, 'Ticket', 'update', NULL, 1, 0, NULL, NULL, 1),
(4, 'Close Ticket', 0, 'Ticket', 'closed', NULL, 1, 1, NULL, NULL, 1),
(5, 'Add Followup', 0, 'Ticket', 'add_followup', NULL, 1, 1, NULL, NULL, 1),
(6, 'Add Task', 0, 'Ticket', 'add_task', NULL, 1, 1, NULL, NULL, 1),
(7, 'Update Followup', 0, 'Ticket', 'update_followup', NULL, 1, 1, NULL, NULL, 1),
(8, 'Update Task', 0, 'Ticket', 'update_task', NULL, 1, 1, NULL, NULL, 1),
(9, 'Delete Followup', 0, 'Ticket', 'delete_followup', NULL, 1, 1, NULL, NULL, 1),
(10, 'Delete Task', 0, 'Ticket', 'delete_task', NULL, 1, 1, NULL, NULL, 1),
(11, 'Resolve ticket', 0, 'Ticket', 'solved', NULL, 1, 1, NULL, NULL, 1),
(12, 'Ticket Validation', 0, 'Ticket', 'validation', NULL, 1, 1, NULL, NULL, 1),
(13, 'New Reservation', 0, 'Reservation', 'new', NULL, 1, 1, NULL, NULL, 1),
(14, 'Update Reservation', 0, 'Reservation', 'update', NULL, 1, 1, NULL, NULL, 1),
(15, 'Delete Reservation', 0, 'Reservation', 'delete', NULL, 1, 1, NULL, NULL, 1),
(16, 'Alert Reservation', 0, 'Reservation', 'alert', NULL, 1, 1, NULL, NULL, 1),
(17, 'Contract Notice', 0, 'Contract', 'notice', NULL, 1, 1, NULL, NULL, 1),
(18, 'Contract End', 0, 'Contract', 'end', NULL, 1, 1, NULL, NULL, 1),
(19, 'MySQL Synchronization', 0, 'DBConnection', 'desynchronization', NULL, 1, 1, NULL, NULL, 1),
(20, 'Cartridges', 0, 'CartridgeItem', 'alert', NULL, 1, 1, NULL, NULL, 1),
(21, 'Consumables', 0, 'ConsumableItem', 'alert', NULL, 1, 1, NULL, NULL, 1),
(22, 'Infocoms', 0, 'Infocom', 'alert', NULL, 1, 1, NULL, NULL, 1),
(23, 'Software Licenses', 0, 'SoftwareLicense', 'alert', NULL, 1, 1, NULL, NULL, 1),
(24, 'Ticket Recall', 0, 'Ticket', 'recall', NULL, 1, 1, NULL, NULL, 1),
(25, 'Password Forget', 0, 'User', 'passwordforget', NULL, 1, 1, NULL, NULL, 1),
(26, 'Ticket Satisfaction', 0, 'Ticket', 'satisfaction', NULL, 1, 1, NULL, NULL, 1),
(27, 'Item not unique', 0, 'FieldUnicity', 'refuse', NULL, 1, 1, NULL, NULL, 1),
(28, 'CronTask Watcher', 0, 'CronTask', 'alert', NULL, 1, 1, NULL, NULL, 1),
(29, 'New Problem', 0, 'Problem', 'new', NULL, 1, 1, NULL, NULL, 1),
(30, 'Update Problem', 0, 'Problem', 'update', NULL, 1, 1, NULL, NULL, 1),
(31, 'Resolve Problem', 0, 'Problem', 'solved', NULL, 1, 1, NULL, NULL, 1),
(32, 'Add Task', 0, 'Problem', 'add_task', NULL, 1, 1, NULL, NULL, 1),
(33, 'Update Task', 0, 'Problem', 'update_task', NULL, 1, 1, NULL, NULL, 1),
(34, 'Delete Task', 0, 'Problem', 'delete_task', NULL, 1, 1, NULL, NULL, 1),
(35, 'Close Problem', 0, 'Problem', 'closed', NULL, 1, 1, NULL, NULL, 1),
(36, 'Delete Problem', 0, 'Problem', 'delete', NULL, 1, 1, NULL, NULL, 1),
(37, 'Ticket Validation Answer', 0, 'Ticket', 'validation_answer', NULL, 1, 1, NULL, NULL, 1),
(38, 'Contract End Periodicity', 0, 'Contract', 'periodicity', NULL, 1, 1, NULL, NULL, 1),
(39, 'Contract Notice Periodicity', 0, 'Contract', 'periodicitynotice', NULL, 1, 1, NULL, NULL, 1),
(40, 'Planning recall', 0, 'PlanningRecall', 'planningrecall', NULL, 1, 1, NULL, NULL, 1),
(41, 'Delete Ticket', 0, 'Ticket', 'delete', NULL, 1, 1, NULL, NULL, 1),
(42, 'New Change', 0, 'Change', 'new', NULL, 1, 1, NULL, NULL, 1),
(43, 'Update Change', 0, 'Change', 'update', NULL, 1, 1, NULL, NULL, 1),
(44, 'Resolve Change', 0, 'Change', 'solved', NULL, 1, 1, NULL, NULL, 1),
(45, 'Add Task', 0, 'Change', 'add_task', NULL, 1, 1, NULL, NULL, 1),
(46, 'Update Task', 0, 'Change', 'update_task', NULL, 1, 1, NULL, NULL, 1),
(47, 'Delete Task', 0, 'Change', 'delete_task', NULL, 1, 1, NULL, NULL, 1),
(48, 'Close Change', 0, 'Change', 'closed', NULL, 1, 1, NULL, NULL, 1),
(49, 'Delete Change', 0, 'Change', 'delete', NULL, 1, 1, NULL, NULL, 1),
(50, 'Ticket Satisfaction Answer', 0, 'Ticket', 'replysatisfaction', NULL, 1, 1, NULL, NULL, 1),
(51, 'Receiver errors', 0, 'MailCollector', 'error', NULL, 1, 1, NULL, NULL, 1),
(52, 'New Project', 0, 'Project', 'new', NULL, 1, 1, NULL, NULL, 1),
(53, 'Update Project', 0, 'Project', 'update', NULL, 1, 1, NULL, NULL, 1),
(54, 'Delete Project', 0, 'Project', 'delete', NULL, 1, 1, NULL, NULL, 1),
(55, 'New Project Task', 0, 'ProjectTask', 'new', NULL, 1, 1, NULL, NULL, 1),
(56, 'Update Project Task', 0, 'ProjectTask', 'update', NULL, 1, 1, NULL, NULL, 1),
(57, 'Delete Project Task', 0, 'ProjectTask', 'delete', NULL, 1, 1, NULL, NULL, 1),
(58, 'Request Unlock Items', 0, 'ObjectLock', 'unlock', NULL, 1, 1, NULL, NULL, 1),
(59, 'New user in requesters', 0, 'Ticket', 'requester_user', NULL, 1, 1, NULL, NULL, 1),
(60, 'New group in requesters', 0, 'Ticket', 'requester_group', NULL, 1, 1, NULL, NULL, 1),
(61, 'New user in observers', 0, 'Ticket', 'observer_user', NULL, 1, 1, NULL, NULL, 1),
(62, 'New group in observers', 0, 'Ticket', 'observer_group', NULL, 1, 1, NULL, NULL, 1),
(63, 'New user in assignees', 0, 'Ticket', 'assign_user', NULL, 1, 1, NULL, NULL, 1),
(64, 'New group in assignees', 0, 'Ticket', 'assign_group', NULL, 1, 1, NULL, NULL, 1),
(65, 'New supplier in assignees', 0, 'Ticket', 'assign_supplier', NULL, 1, 1, NULL, NULL, 1),
(66, 'Saved searches', 0, 'SavedSearch_Alert', 'alert', NULL, 1, 1, NULL, NULL, 1),
(67, 'Certificates', 0, 'Certificate', 'alert', NULL, 1, 1, NULL, NULL, 1),
(68, 'Alert expired domains', 0, 'Domain', 'ExpiredDomains', NULL, 1, 1, NULL, NULL, 1),
(69, 'Alert domains close expiries', 0, 'Domain', 'DomainsWhichExpire', NULL, 1, 1, NULL, NULL, 1),
(70, 'Password expires alert', 0, 'User', 'passwordexpires', NULL, 1, 1, NULL, NULL, 1),
(71, 'Check plugin updates', 0, 'Glpi\\Marketplace\\Controller', 'checkpluginsupdate', NULL, 1, 1, NULL, NULL, 1),
(72, 'New user mentioned', 0, 'Ticket', 'user_mention', NULL, 1, 1, NULL, NULL, 1),
(73, 'Browser Notification', 0, 'Ticket', 'new', '', 0, 1, '2023-11-18 13:59:37', '2023-11-18 13:59:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notifications_notificationtemplates`
--

CREATE TABLE `glpi_notifications_notificationtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `notifications_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mode` varchar(20) NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `notificationtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_notifications_notificationtemplates`
--

INSERT INTO `glpi_notifications_notificationtemplates` (`id`, `notifications_id`, `mode`, `notificationtemplates_id`) VALUES
(1, 1, 'mailing', 6),
(2, 2, 'mailing', 4),
(3, 3, 'mailing', 4),
(4, 4, 'mailing', 4),
(5, 5, 'mailing', 4),
(6, 6, 'mailing', 4),
(7, 7, 'mailing', 4),
(8, 8, 'mailing', 4),
(9, 9, 'mailing', 4),
(10, 10, 'mailing', 4),
(11, 11, 'mailing', 4),
(12, 12, 'mailing', 7),
(13, 13, 'mailing', 2),
(14, 14, 'mailing', 2),
(15, 15, 'mailing', 2),
(16, 16, 'mailing', 3),
(17, 17, 'mailing', 12),
(18, 18, 'mailing', 12),
(19, 19, 'mailing', 1),
(20, 20, 'mailing', 8),
(21, 21, 'mailing', 9),
(22, 22, 'mailing', 10),
(23, 23, 'mailing', 11),
(24, 24, 'mailing', 4),
(25, 25, 'mailing', 13),
(26, 26, 'mailing', 14),
(27, 27, 'mailing', 15),
(28, 28, 'mailing', 16),
(29, 29, 'mailing', 17),
(30, 30, 'mailing', 17),
(31, 31, 'mailing', 17),
(32, 32, 'mailing', 17),
(33, 33, 'mailing', 17),
(34, 34, 'mailing', 17),
(35, 35, 'mailing', 17),
(36, 36, 'mailing', 17),
(37, 37, 'mailing', 7),
(38, 38, 'mailing', 12),
(39, 39, 'mailing', 12),
(40, 40, 'mailing', 18),
(41, 41, 'mailing', 4),
(42, 42, 'mailing', 19),
(43, 43, 'mailing', 19),
(44, 44, 'mailing', 19),
(45, 45, 'mailing', 19),
(46, 46, 'mailing', 19),
(47, 47, 'mailing', 19),
(48, 48, 'mailing', 19),
(49, 49, 'mailing', 19),
(50, 50, 'mailing', 14),
(51, 51, 'mailing', 20),
(52, 52, 'mailing', 21),
(53, 53, 'mailing', 21),
(54, 54, 'mailing', 21),
(55, 55, 'mailing', 22),
(56, 56, 'mailing', 22),
(57, 57, 'mailing', 22),
(58, 58, 'mailing', 23),
(59, 59, 'mailing', 4),
(60, 60, 'mailing', 4),
(61, 61, 'mailing', 4),
(62, 62, 'mailing', 4),
(63, 63, 'mailing', 4),
(64, 64, 'mailing', 4),
(65, 65, 'mailing', 4),
(66, 66, 'mailing', 24),
(67, 67, 'mailing', 25),
(68, 68, 'mailing', 26),
(69, 69, 'mailing', 26),
(70, 70, 'mailing', 27),
(71, 71, 'mailing', 28),
(72, 72, 'mailing', 4),
(73, 73, 'ajax', 29);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notificationtargets`
--

CREATE TABLE `glpi_notificationtargets` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `notifications_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_notificationtargets`
--

INSERT INTO `glpi_notificationtargets` (`id`, `items_id`, `type`, `notifications_id`) VALUES
(1, 3, 1, 13),
(2, 1, 1, 13),
(5, 1, 1, 3),
(6, 1, 1, 5),
(7, 1, 1, 4),
(8, 2, 1, 3),
(9, 4, 1, 3),
(11, 3, 1, 3),
(12, 3, 1, 5),
(13, 3, 1, 4),
(14, 1, 1, 19),
(15, 14, 1, 12),
(16, 3, 1, 14),
(17, 1, 1, 14),
(18, 3, 1, 15),
(19, 1, 1, 15),
(20, 1, 1, 6),
(21, 3, 1, 6),
(22, 1, 1, 7),
(23, 3, 1, 7),
(24, 1, 1, 8),
(25, 3, 1, 8),
(26, 1, 1, 9),
(27, 3, 1, 9),
(28, 1, 1, 10),
(29, 3, 1, 10),
(30, 1, 1, 11),
(31, 3, 1, 11),
(32, 19, 1, 25),
(33, 3, 1, 26),
(35, 21, 1, 3),
(36, 21, 1, 5),
(37, 21, 1, 4),
(38, 21, 1, 6),
(39, 21, 1, 7),
(40, 21, 1, 8),
(41, 21, 1, 9),
(42, 21, 1, 10),
(43, 21, 1, 11),
(46, 1, 1, 28),
(47, 3, 1, 29),
(48, 1, 1, 29),
(49, 21, 1, 29),
(50, 2, 1, 30),
(51, 4, 1, 30),
(52, 3, 1, 30),
(53, 1, 1, 30),
(54, 21, 1, 30),
(55, 3, 1, 31),
(56, 1, 1, 31),
(57, 21, 1, 31),
(58, 3, 1, 32),
(59, 1, 1, 32),
(60, 21, 1, 32),
(61, 3, 1, 33),
(62, 1, 1, 33),
(63, 21, 1, 33),
(64, 3, 1, 34),
(65, 1, 1, 34),
(66, 21, 1, 34),
(67, 3, 1, 35),
(68, 1, 1, 35),
(69, 21, 1, 35),
(70, 3, 1, 36),
(71, 1, 1, 36),
(72, 21, 1, 36),
(73, 14, 1, 37),
(74, 3, 1, 40),
(75, 1, 1, 41),
(76, 3, 1, 42),
(77, 1, 1, 42),
(78, 21, 1, 42),
(79, 2, 1, 43),
(80, 4, 1, 43),
(81, 3, 1, 43),
(82, 1, 1, 43),
(83, 21, 1, 43),
(84, 3, 1, 44),
(85, 1, 1, 44),
(86, 21, 1, 44),
(87, 3, 1, 45),
(88, 1, 1, 45),
(89, 21, 1, 45),
(90, 3, 1, 46),
(91, 1, 1, 46),
(92, 21, 1, 46),
(93, 3, 1, 47),
(94, 1, 1, 47),
(95, 21, 1, 47),
(96, 3, 1, 48),
(97, 1, 1, 48),
(98, 21, 1, 48),
(99, 3, 1, 49),
(100, 1, 1, 49),
(101, 21, 1, 49),
(102, 3, 1, 50),
(103, 2, 1, 50),
(104, 1, 1, 51),
(105, 27, 1, 52),
(106, 1, 1, 52),
(107, 28, 1, 52),
(108, 27, 1, 53),
(109, 1, 1, 53),
(110, 28, 1, 53),
(111, 27, 1, 54),
(112, 1, 1, 54),
(113, 28, 1, 54),
(114, 31, 1, 55),
(115, 1, 1, 55),
(116, 32, 1, 55),
(117, 31, 1, 56),
(118, 1, 1, 56),
(119, 32, 1, 56),
(120, 31, 1, 57),
(121, 1, 1, 57),
(122, 32, 1, 57),
(123, 19, 1, 58),
(124, 3, 1, 59),
(125, 13, 1, 60),
(126, 21, 1, 61),
(127, 20, 1, 62),
(128, 2, 1, 63),
(129, 9, 1, 64),
(130, 8, 1, 65),
(131, 19, 1, 66),
(132, 5, 1, 67),
(133, 23, 1, 67),
(134, 5, 1, 68),
(135, 23, 1, 68),
(136, 5, 1, 69),
(137, 23, 1, 69),
(138, 19, 1, 70),
(139, 1, 1, 71),
(140, 39, 1, 72),
(141, 1, 3, 2),
(142, 1, 3, 73),
(147, 2, 3, 1),
(148, 1, 5, 24);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notificationtemplates`
--

CREATE TABLE `glpi_notificationtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `css` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_notificationtemplates`
--

INSERT INTO `glpi_notificationtemplates` (`id`, `name`, `itemtype`, `date_mod`, `comment`, `css`, `date_creation`) VALUES
(1, 'MySQL Synchronization', 'DBConnection', NULL, NULL, NULL, NULL),
(2, 'Reservations', 'Reservation', NULL, NULL, NULL, NULL),
(3, 'Alert Reservation', 'Reservation', NULL, NULL, NULL, NULL),
(4, 'Tickets', 'Ticket', NULL, NULL, NULL, NULL),
(5, 'Tickets (Simple)', 'Ticket', NULL, NULL, NULL, NULL),
(6, 'Alert Tickets not closed', 'Ticket', NULL, NULL, NULL, NULL),
(7, 'Tickets Validation', 'Ticket', NULL, NULL, NULL, NULL),
(8, 'Cartridges', 'CartridgeItem', NULL, NULL, NULL, NULL),
(9, 'Consumables', 'ConsumableItem', NULL, NULL, NULL, NULL),
(10, 'Infocoms', 'Infocom', NULL, NULL, NULL, NULL),
(11, 'Licenses', 'SoftwareLicense', NULL, NULL, NULL, NULL),
(12, 'Contracts', 'Contract', NULL, NULL, NULL, NULL),
(13, 'Password Forget', 'User', NULL, NULL, NULL, NULL),
(14, 'Ticket Satisfaction', 'Ticket', NULL, NULL, NULL, NULL),
(15, 'Item not unique', 'FieldUnicity', NULL, NULL, NULL, NULL),
(16, 'CronTask', 'CronTask', NULL, NULL, NULL, NULL),
(17, 'Problems', 'Problem', NULL, NULL, NULL, NULL),
(18, 'Planning recall', 'PlanningRecall', NULL, NULL, NULL, NULL),
(19, 'Changes', 'Change', NULL, NULL, NULL, NULL),
(20, 'Receiver errors', 'MailCollector', NULL, NULL, NULL, NULL),
(21, 'Projects', 'Project', NULL, NULL, NULL, NULL),
(22, 'Project Tasks', 'ProjectTask', NULL, NULL, NULL, NULL),
(23, 'Unlock Item request', 'ObjectLock', NULL, NULL, NULL, NULL),
(24, 'Saved searches alerts', 'SavedSearch_Alert', NULL, NULL, NULL, NULL),
(25, 'Certificates', 'Certificate', NULL, NULL, NULL, NULL),
(26, 'Alert domains', 'Domain', NULL, NULL, NULL, NULL),
(27, 'Password expires alert', 'User', NULL, NULL, NULL, NULL),
(28, 'Plugin updates', 'Glpi\\Marketplace\\Controller', NULL, NULL, NULL, NULL),
(29, 'Browser Notification', 'Ticket', '2023-11-18 13:49:01', '', '', '2023-11-18 13:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notificationtemplatetranslations`
--

CREATE TABLE `glpi_notificationtemplatetranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `notificationtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(10) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL,
  `content_text` text DEFAULT NULL,
  `content_html` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_notificationtemplatetranslations`
--

INSERT INTO `glpi_notificationtemplatetranslations` (`id`, `notificationtemplates_id`, `language`, `subject`, `content_text`, `content_html`) VALUES
(1, 1, '', '##lang.dbconnection.title##', '##lang.dbconnection.delay## : ##dbconnection.delay##', '&lt;p&gt;##lang.dbconnection.delay## : ##dbconnection.delay##&lt;/p&gt;'),
(2, 2, '', '##reservation.action##', '======================================================================\n##lang.reservation.user##: ##reservation.user##\n##lang.reservation.item.name##: ##reservation.itemtype## - ##reservation.item.name##\n##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech## ##ENDIFreservation.tech##\n##lang.reservation.begin##: ##reservation.begin##\n##lang.reservation.end##: ##reservation.end##\n##lang.reservation.comment##: ##reservation.comment##\n======================================================================', '&lt;!-- description{ color: inherit; background: #ebebeb;border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; } --&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.user##:&lt;/span&gt;##reservation.user##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.item.name##:&lt;/span&gt;##reservation.itemtype## - ##reservation.item.name##&lt;br /&gt;##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech####ENDIFreservation.tech##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.begin##:&lt;/span&gt; ##reservation.begin##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.end##:&lt;/span&gt;##reservation.end##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.comment##:&lt;/span&gt; ##reservation.comment##&lt;/p&gt;'),
(3, 3, '', '##reservation.action##  ##reservation.entity##', '##lang.reservation.entity## : ##reservation.entity##\n\n\n##FOREACHreservations##\n##lang.reservation.itemtype## : ##reservation.itemtype##\n\n ##lang.reservation.item## : ##reservation.item##\n\n ##reservation.url##\n\n ##ENDFOREACHreservations##', '&lt;p&gt;##lang.reservation.entity## : ##reservation.entity## &lt;br /&gt; &lt;br /&gt;\n##FOREACHreservations## &lt;br /&gt;##lang.reservation.itemtype## :  ##reservation.itemtype##&lt;br /&gt;\n ##lang.reservation.item## :  ##reservation.item##&lt;br /&gt; &lt;br /&gt;\n &lt;a href=\"##reservation.url##\"&gt; ##reservation.url##&lt;/a&gt;&lt;br /&gt;\n ##ENDFOREACHreservations##&lt;/p&gt;'),
(4, 4, '', '##ticket.action## ##ticket.title##', ' ##IFticket.storestatus=5##\n ##lang.ticket.url## : ##ticket.urlapprove##\n ##lang.ticket.autoclosewarning##\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description## ##ENDIFticket.storestatus##\n ##ELSEticket.storestatus## ##lang.ticket.url## : ##ticket.url## ##ENDELSEticket.storestatus##\n\n ##lang.ticket.description##\n\n ##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.authors## : ##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors## ##ELSEticket.authors##--##ENDELSEticket.authors##\n ##lang.ticket.creationdate## : ##ticket.creationdate##\n ##lang.ticket.closedate## : ##ticket.closedate##\n ##lang.ticket.requesttype## : ##ticket.requesttype##\n##lang.ticket.item.name## :\n\n##FOREACHitems##\n\n ##IFticket.itemtype##\n  ##ticket.itemtype## - ##ticket.item.name##\n  ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model##\n  ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial##\n  ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial##\n ##ENDIFticket.itemtype##\n\n##ENDFOREACHitems##\n##IFticket.assigntousers## ##lang.ticket.assigntousers## : ##ticket.assigntousers## ##ENDIFticket.assigntousers##\n ##lang.ticket.status## : ##ticket.status##\n##IFticket.assigntogroups## ##lang.ticket.assigntogroups## : ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##\n ##lang.ticket.urgency## : ##ticket.urgency##\n ##lang.ticket.impact## : ##ticket.impact##\n ##lang.ticket.priority## : ##ticket.priority##\n##IFticket.user.email## ##lang.ticket.user.email## : ##ticket.user.email ##ENDIFticket.user.email##\n##IFticket.category## ##lang.ticket.category## : ##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n ##lang.ticket.content## : ##ticket.content##\n ##IFticket.storestatus=6##\n\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description##\n ##ENDIFticket.storestatus##\n\n##FOREACHtimelineitems##\n[##timelineitems.date##]\n##lang.timelineitems.author## ##timelineitems.author##\n##lang.timelineitems.description## ##timelineitems.description##\n##lang.timelineitems.date## ##timelineitems.date##\n##lang.timelineitems.position## ##timelineitems.position##\n##lang.timelineitems.type## ##timelineitems.type##\n##lang.timelineitems.typename## ##timelineitems.typename##\n##ENDFOREACHtimelineitems##\n\n##lang.ticket.numberoffollowups## : ##ticket.numberoffollowups##\n##lang.ticket.numberoftasks## : ##ticket.numberoftasks##', '&lt;!-- description{ color: inherit; background: #ebebeb; border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; }    --&gt;\n&lt;div&gt;##IFticket.storestatus=5##&lt;/div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlapprove##\"&gt;##ticket.urlapprove##&lt;/a&gt; &lt;strong&gt;&#160;&lt;/strong&gt;&lt;/div&gt;\n&lt;div&gt;&lt;strong&gt;##lang.ticket.autoclosewarning##&lt;/strong&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.ticket.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.description## ##ENDIFticket.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEticket.storestatus## ##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;##ticket.url##&lt;/a&gt; ##ENDELSEticket.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.ticket.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.authors##&lt;/span&gt;&#160;:##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors##    ##ELSEticket.authors##--##ENDELSEticket.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.creationdate##&lt;/span&gt;&#160;:##ticket.creationdate## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.closedate##&lt;/span&gt;&#160;:##ticket.closedate## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.requesttype##&lt;/span&gt;&#160;:##ticket.requesttype##&lt;br /&gt;\n&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.item.name##&lt;/span&gt;&#160;:\n&lt;p&gt;##FOREACHitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##IFticket.itemtype## ##ticket.itemtype##&#160;- ##ticket.item.name## ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model## ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial## ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype## &lt;/div&gt;&lt;br /&gt;\n&lt;p&gt;##ENDFOREACHitems##&lt;/p&gt;\n##IFticket.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.assigntousers##&lt;/span&gt;&#160;: ##ticket.assigntousers## ##ENDIFticket.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.ticket.status## &lt;/span&gt;&#160;: ##ticket.status##&lt;br /&gt; ##IFticket.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.assigntogroups##&lt;/span&gt;&#160;: ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.urgency##&lt;/span&gt;&#160;: ##ticket.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.impact##&lt;/span&gt;&#160;: ##ticket.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.priority##&lt;/span&gt;&#160;: ##ticket.priority## &lt;br /&gt; ##IFticket.user.email##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.user.email##&lt;/span&gt;&#160;: ##ticket.user.email ##ENDIFticket.user.email##    &lt;br /&gt; ##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.content##&lt;/span&gt;&#160;: ##ticket.content##&lt;/p&gt;\n&lt;br /&gt;##IFticket.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.ticket.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.ticket.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.description##&lt;br /&gt;##ENDIFticket.storestatus##&lt;/p&gt;\n&lt;p&gt;##FOREACHtimelineitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt;&lt;strong&gt; [##timelineitems.date##]&lt;/strong&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.author## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.author##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.description## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.description##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.date## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.date##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.position## &lt;/span&gt;&lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt; ##timelineitems.position##&lt;/span&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.type## &lt;/span&gt;&lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt; ##timelineitems.type##&lt;/span&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.typename## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.typename##&lt;/span&gt;&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtimelineitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.ticket.numberoffollowups##&#160;: ##ticket.numberoffollowups##&lt;/div&gt;\n&lt;div class=\"description b\"&gt;##lang.ticket.numberoftasks##&#160;: ##ticket.numberoftasks##&lt;/div&gt;'),
(5, 12, '', '##contract.action##  ##contract.entity##', '##lang.contract.entity## : ##contract.entity##\n\n##FOREACHcontracts##\n##lang.contract.name## : ##contract.name##\n##lang.contract.number## : ##contract.number##\n##lang.contract.time## : ##contract.time##\n##IFcontract.type####lang.contract.type## : ##contract.type####ENDIFcontract.type##\n##contract.url##\n##ENDFOREACHcontracts##', '&lt;p&gt;##lang.contract.entity## : ##contract.entity##&lt;br /&gt;\n&lt;br /&gt;##FOREACHcontracts##&lt;br /&gt;##lang.contract.name## :\n##contract.name##&lt;br /&gt;\n##lang.contract.number## : ##contract.number##&lt;br /&gt;\n##lang.contract.time## : ##contract.time##&lt;br /&gt;\n##IFcontract.type####lang.contract.type## : ##contract.type##\n##ENDIFcontract.type##&lt;br /&gt;\n&lt;a href=\"##contract.url##\"&gt;\n##contract.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcontracts##&lt;/p&gt;'),
(6, 5, '', '##ticket.action## ##ticket.title##', '##lang.ticket.url## : ##ticket.url##\n\n##lang.ticket.description##\n\n\n##lang.ticket.title##  :##ticket.title##\n\n##lang.ticket.authors##  :##IFticket.authors##\n##ticket.authors## ##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n\n##IFticket.category## ##lang.ticket.category##  :##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n\n##lang.ticket.content##  : ##ticket.content##\n##IFticket.itemtype##\n##lang.ticket.item.name##  : ##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##', '&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;\n##ticket.url##&lt;/a&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;\n##lang.ticket.description##&lt;/div&gt;\n&lt;p&gt;&lt;span\nstyle=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.authors##&lt;/span&gt;\n##IFticket.authors## ##ticket.authors##\n##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n&lt;/span&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;\n##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.content##&lt;/span&gt;&#160;:\n##ticket.content##&lt;br /&gt;##IFticket.itemtype##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.item.name##&lt;/span&gt;&#160;:\n##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##&lt;/p&gt;'),
(7, 7, '', '##ticket.action## ##ticket.title##', '##FOREACHvalidations##\n\n##IFvalidation.storestatus=2##\n##validation.submission.title##\n##lang.validation.commentsubmission## : ##validation.commentsubmission##\n##ENDIFvalidation.storestatus##\n##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##\n\n##lang.ticket.url## : ##ticket.urlvalidation##\n\n##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n##IFvalidation.commentvalidation##\n##lang.validation.commentvalidation## : ##validation.commentvalidation##\n##ENDIFvalidation.commentvalidation##\n##ENDFOREACHvalidations##', '&lt;div&gt;##FOREACHvalidations##&lt;/div&gt;\n&lt;p&gt;##IFvalidation.storestatus=2##&lt;/p&gt;\n&lt;div&gt;##validation.submission.title##&lt;/div&gt;\n&lt;div&gt;##lang.validation.commentsubmission## : ##validation.commentsubmission##&lt;/div&gt;\n&lt;div&gt;##ENDIFvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;&lt;/div&gt;\n&lt;div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlvalidation##\"&gt; ##ticket.urlvalidation## &lt;/a&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;p&gt;##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n&lt;br /&gt; ##IFvalidation.commentvalidation##&lt;br /&gt; ##lang.validation.commentvalidation## :\n&#160; ##validation.commentvalidation##&lt;br /&gt; ##ENDIFvalidation.commentvalidation##\n&lt;br /&gt;##ENDFOREACHvalidations##&lt;/p&gt;'),
(8, 6, '', '##ticket.action## ##ticket.entity##', '##FOREACHtickets##\n##lang.ticket.authors##: ##ticket.authors##\n##lang.ticket.title##: ##ticket.title##\n##lang.ticket.priority##: ##ticket.priority##\n##lang.ticket.status##: ##ticket.status##\n##lang.ticket.attribution##: ##IFticket.assigntousers####ticket.assigntousers##\n##ENDIFticket.assigntousers####IFticket.assigntogroups##\n##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##\n##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##\n##lang.ticket.creationdate##: ##ticket.creationdate##\n##lang.ticket.content##: ##ticket.content## ##ENDFOREACHtickets##', '&lt;table class=\"tab_cadre\" border=\"1\" cellspacing=\"2\" cellpadding=\"3\"&gt;\n&lt;tbody&gt;\n&lt;tr&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.title##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.attribution##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.content##&lt;/span&gt;##FOREACHtickets##&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;&lt;a href=\"##ticket.url##\"&gt;##ticket.title##&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##IFticket.assigntousers####ticket.assigntousers##&lt;br /&gt;##ENDIFticket.assigntousers####IFticket.assigntogroups##&lt;br /&gt;##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##&lt;br /&gt;##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.content##&lt;/span&gt;##ENDFOREACHtickets##&lt;/td&gt;\n&lt;/tr&gt;\n&lt;/tbody&gt;\n&lt;/table&gt;'),
(9, 9, '', '##consumable.action##  ##consumable.entity##', '##lang.consumable.entity## : ##consumable.entity##\n\n\n##FOREACHconsumables##\n##lang.consumable.item## : ##consumable.item##\n\n\n##lang.consumable.reference## : ##consumable.reference##\n\n##lang.consumable.remaining## : ##consumable.remaining##\n##lang.consumable.stock_target## : ##consumable.stock_target##\n##lang.consumable.to_order## : ##consumable.to_order##\n\n##consumable.url##\n\n##ENDFOREACHconsumables##', '&lt;p&gt;\n##lang.consumable.entity## : ##consumable.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHconsumables##\n&lt;br /&gt;##lang.consumable.item## : ##consumable.item##&lt;br /&gt;\n&lt;br /&gt;##lang.consumable.reference## : ##consumable.reference##&lt;br /&gt;\n##lang.consumable.remaining## : ##consumable.remaining##&lt;br /&gt;\n##lang.consumable.stock_target## : ##consumable.stock_target##&lt;br /&gt;\n##lang.consumable.to_order## : ##consumable.to_order##&lt;br /&gt;\n&lt;a href=\"##consumable.url##\"&gt; ##consumable.url##&lt;/a&gt;&lt;br /&gt;\n   ##ENDFOREACHconsumables##&lt;/p&gt;'),
(10, 8, '', '##cartridge.action##  ##cartridge.entity##', '##lang.cartridge.entity## : ##cartridge.entity##\n\n\n##FOREACHcartridges##\n##lang.cartridge.item## : ##cartridge.item##\n\n\n##lang.cartridge.reference## : ##cartridge.reference##\n\n##lang.cartridge.remaining## : ##cartridge.remaining##\n##lang.cartridge.stock_target## : ##cartridge.stock_target##\n##lang.cartridge.to_order## : ##cartridge.to_order##\n\n##cartridge.url##\n ##ENDFOREACHcartridges##', '&lt;p&gt;##lang.cartridge.entity## : ##cartridge.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHcartridges##\n&lt;br /&gt;##lang.cartridge.item## :\n##cartridge.item##&lt;br /&gt; &lt;br /&gt;\n##lang.cartridge.reference## :\n##cartridge.reference##&lt;br /&gt;\n##lang.cartridge.remaining## :\n##cartridge.remaining##&lt;br /&gt;\n##lang.cartridge.stock_target## :\n##cartridge.stock_target##&lt;br /&gt;\n##lang.cartridge.to_order## :\n##cartridge.to_order##&lt;br /&gt;\n&lt;a href=\"##cartridge.url##\"&gt;\n##cartridge.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcartridges##&lt;/p&gt;'),
(11, 10, '', '##infocom.action##  ##infocom.entity##', '##lang.infocom.entity## : ##infocom.entity##\n\n\n##FOREACHinfocoms##\n\n##lang.infocom.itemtype## : ##infocom.itemtype##\n\n##lang.infocom.item## : ##infocom.item##\n\n\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n\n##infocom.url##\n ##ENDFOREACHinfocoms##', '&lt;p&gt;##lang.infocom.entity## : ##infocom.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHinfocoms##\n&lt;br /&gt;##lang.infocom.itemtype## : ##infocom.itemtype##&lt;br /&gt;\n##lang.infocom.item## : ##infocom.item##&lt;br /&gt; &lt;br /&gt;\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n&lt;br /&gt; &lt;a href=\"##infocom.url##\"&gt;\n##infocom.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHinfocoms##&lt;/p&gt;'),
(12, 11, '', '##license.action##  ##license.entity##', '##lang.license.entity## : ##license.entity##\n\n##FOREACHlicenses##\n\n##lang.license.item## : ##license.item##\n\n##lang.license.serial## : ##license.serial##\n\n##lang.license.expirationdate## : ##license.expirationdate##\n\n##license.url##\n ##ENDFOREACHlicenses##', '&lt;p&gt;\n##lang.license.entity## : ##license.entity##&lt;br /&gt;\n##FOREACHlicenses##\n&lt;br /&gt;##lang.license.item## : ##license.item##&lt;br /&gt;\n##lang.license.serial## : ##license.serial##&lt;br /&gt;\n##lang.license.expirationdate## : ##license.expirationdate##\n&lt;br /&gt; &lt;a href=\"##license.url##\"&gt; ##license.url##\n&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHlicenses##&lt;/p&gt;'),
(13, 13, '', '##user.action##', '##user.realname## ##user.firstname##\n\n##lang.passwordforget.information##\n\n##lang.passwordforget.link## ##user.passwordforgeturl##', '&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.information##&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.link## &lt;a title=\"##user.passwordforgeturl##\" href=\"##user.passwordforgeturl##\"&gt;##user.passwordforgeturl##&lt;/a&gt;&lt;/p&gt;'),
(14, 14, '', '##ticket.action## ##ticket.title##', '##lang.ticket.title## : ##ticket.title##\n\n##lang.ticket.closedate## : ##ticket.closedate##\n\n##lang.satisfaction.text## ##ticket.urlsatisfaction##', '&lt;p&gt;##lang.ticket.title## : ##ticket.title##&lt;/p&gt;\n&lt;p&gt;##lang.ticket.closedate## : ##ticket.closedate##&lt;/p&gt;\n&lt;p&gt;##lang.satisfaction.text## &lt;a href=\"##ticket.urlsatisfaction##\"&gt;##ticket.urlsatisfaction##&lt;/a&gt;&lt;/p&gt;'),
(15, 15, '', '##lang.unicity.action##', '##lang.unicity.entity## : ##unicity.entity##\n\n##lang.unicity.itemtype## : ##unicity.itemtype##\n\n##lang.unicity.message## : ##unicity.message##\n\n##lang.unicity.action_user## : ##unicity.action_user##\n\n##lang.unicity.action_type## : ##unicity.action_type##\n\n##lang.unicity.date## : ##unicity.date##', '&lt;p&gt;##lang.unicity.entity## : ##unicity.entity##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.itemtype## : ##unicity.itemtype##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.message## : ##unicity.message##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_user## : ##unicity.action_user##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_type## : ##unicity.action_type##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.date## : ##unicity.date##&lt;/p&gt;'),
(16, 16, '', '##crontask.action##', '##lang.crontask.warning##\n\n##FOREACHcrontasks##\n ##crontask.name## : ##crontask.description##\n\n##ENDFOREACHcrontasks##', '&lt;p&gt;##lang.crontask.warning##&lt;/p&gt;\n&lt;p&gt;##FOREACHcrontasks## &lt;br /&gt;&lt;a href=\"##crontask.url##\"&gt;##crontask.name##&lt;/a&gt; : ##crontask.description##&lt;br /&gt; &lt;br /&gt;##ENDFOREACHcrontasks##&lt;/p&gt;'),
(17, 17, '', '##problem.action## ##problem.title##', '##IFproblem.storestatus=5##\n ##lang.problem.url## : ##problem.urlapprove##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description## ##ENDIFproblem.storestatus##\n ##ELSEproblem.storestatus## ##lang.problem.url## : ##problem.url## ##ENDELSEproblem.storestatus##\n\n ##lang.problem.description##\n\n ##lang.problem.title##  :##problem.title##\n ##lang.problem.authors##  :##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors## ##ELSEproblem.authors##--##ENDELSEproblem.authors##\n ##lang.problem.creationdate##  :##problem.creationdate##\n ##IFproblem.assigntousers## ##lang.problem.assigntousers##  : ##problem.assigntousers## ##ENDIFproblem.assigntousers##\n ##lang.problem.status##  : ##problem.status##\n ##IFproblem.assigntogroups## ##lang.problem.assigntogroups##  : ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##\n ##lang.problem.urgency##  : ##problem.urgency##\n ##lang.problem.impact##  : ##problem.impact##\n ##lang.problem.priority## : ##problem.priority##\n##IFproblem.category## ##lang.problem.category##  :##problem.category## ##ENDIFproblem.category## ##ELSEproblem.category## ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##\n ##lang.problem.content##  : ##problem.content##\n\n##IFproblem.storestatus=6##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description##\n##ENDIFproblem.storestatus##\n ##lang.problem.numberoffollowups## : ##problem.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.problem.numberoftickets## : ##problem.numberoftickets##\n\n##FOREACHtickets##\n [##ticket.date##] ##lang.problem.title## : ##ticket.title##\n ##lang.problem.content## ##ticket.content##\n\n##ENDFOREACHtickets##\n ##lang.problem.numberoftasks## : ##problem.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n', '&lt;p&gt;##IFproblem.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.problem.url## : &lt;a href=\"##problem.urlapprove##\"&gt;##problem.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description## ##ENDIFproblem.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEproblem.storestatus## ##lang.problem.url## : &lt;a href=\"##problem.url##\"&gt;##problem.url##&lt;/a&gt; ##ENDELSEproblem.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.problem.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.title##&lt;/span&gt;&#160;:##problem.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.authors##&lt;/span&gt;&#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors##    ##ELSEproblem.authors##--##ENDELSEproblem.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.creationdate##&lt;/span&gt;&#160;:##problem.creationdate## &lt;br /&gt; ##IFproblem.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntousers##&lt;/span&gt;&#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.status## &lt;/span&gt;&#160;: ##problem.status##&lt;br /&gt; ##IFproblem.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntogroups##&lt;/span&gt;&#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.urgency##&lt;/span&gt;&#160;: ##problem.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.impact##&lt;/span&gt;&#160;: ##problem.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.priority##&lt;/span&gt; : ##problem.priority## &lt;br /&gt;##IFproblem.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.category## &lt;/span&gt;&#160;:##problem.category##  ##ENDIFproblem.category## ##ELSEproblem.category##  ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.content##&lt;/span&gt;&#160;: ##problem.content##&lt;/p&gt;\n&lt;p&gt;##IFproblem.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description##&lt;br /&gt;##ENDIFproblem.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoffollowups##&#160;: ##problem.numberoffollowups##&lt;/div&gt;\n&lt;p&gt;##FOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt; &lt;strong&gt; [##followup.date##] &lt;em&gt;##lang.followup.isprivate## : ##followup.isprivate## &lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.author## &lt;/span&gt; ##followup.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.description## &lt;/span&gt; ##followup.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.date## &lt;/span&gt; ##followup.date##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.requesttype## &lt;/span&gt; ##followup.requesttype##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##&lt;/div&gt;\n&lt;p&gt;##FOREACHtickets##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##ticket.date##] &lt;em&gt;##lang.problem.title## : &lt;a href=\"##ticket.url##\"&gt;##ticket.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.content## &lt;/span&gt; ##ticket.content##\n&lt;p&gt;##ENDFOREACHtickets##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(18, 18, '', '##recall.action##: ##recall.item.name##', '##recall.action##: ##recall.item.name##\n\n##recall.item.content##\n\n##lang.recall.planning.begin##: ##recall.planning.begin##\n##lang.recall.planning.end##: ##recall.planning.end##\n##lang.recall.planning.state##: ##recall.planning.state##\n##lang.recall.item.private##: ##recall.item.private##', '&lt;p&gt;##recall.action##: &lt;a href=\"##recall.item.url##\"&gt;##recall.item.name##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;##recall.item.content##&lt;/p&gt;\n&lt;p&gt;##lang.recall.planning.begin##: ##recall.planning.begin##&lt;br /&gt;##lang.recall.planning.end##: ##recall.planning.end##&lt;br /&gt;##lang.recall.planning.state##: ##recall.planning.state##&lt;br /&gt;##lang.recall.item.private##: ##recall.item.private##&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;'),
(19, 19, '', '##change.action## ##change.title##', '##IFchange.storestatus=5##\n ##lang.change.url## : ##change.urlapprove##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description## ##ENDIFchange.storestatus##\n ##ELSEchange.storestatus## ##lang.change.url## : ##change.url## ##ENDELSEchange.storestatus##\n\n ##lang.change.description##\n\n ##lang.change.title##  :##change.title##\n ##lang.change.authors##  :##IFchange.authors## ##change.authors## ##ENDIFchange.authors## ##ELSEchange.authors##--##ENDELSEchange.authors##\n ##lang.change.creationdate##  :##change.creationdate##\n ##IFchange.assigntousers## ##lang.change.assigntousers##  : ##change.assigntousers## ##ENDIFchange.assigntousers##\n ##lang.change.status##  : ##change.status##\n ##IFchange.assigntogroups## ##lang.change.assigntogroups##  : ##change.assigntogroups## ##ENDIFchange.assigntogroups##\n ##lang.change.urgency##  : ##change.urgency##\n ##lang.change.impact##  : ##change.impact##\n ##lang.change.priority## : ##change.priority##\n##IFchange.category## ##lang.change.category##  :##change.category## ##ENDIFchange.category## ##ELSEchange.category## ##lang.change.nocategoryassigned## ##ENDELSEchange.category##\n ##lang.change.content##  : ##change.content##\n\n##IFchange.storestatus=6##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description##\n##ENDIFchange.storestatus##\n ##lang.change.numberoffollowups## : ##change.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.change.numberofproblems## : ##change.numberofproblems##\n\n##FOREACHproblems##\n [##problem.date##] ##lang.change.title## : ##problem.title##\n ##lang.change.content## ##problem.content##\n\n##ENDFOREACHproblems##\n ##lang.change.numberoftasks## : ##change.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n', '&lt;p&gt;##IFchange.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.change.url## : &lt;a href=\"##change.urlapprove##\"&gt;##change.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description## ##ENDIFchange.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEchange.storestatus## ##lang.change.url## : &lt;a href=\"##change.url##\"&gt;##change.url##&lt;/a&gt; ##ENDELSEchange.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.change.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.title##&lt;/span&gt;&#160;:##change.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.authors##&lt;/span&gt;&#160;:##IFchange.authors## ##change.authors## ##ENDIFchange.authors##    ##ELSEchange.authors##--##ENDELSEchange.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.creationdate##&lt;/span&gt;&#160;:##change.creationdate## &lt;br /&gt; ##IFchange.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntousers##&lt;/span&gt;&#160;: ##change.assigntousers## ##ENDIFchange.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.status## &lt;/span&gt;&#160;: ##change.status##&lt;br /&gt; ##IFchange.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntogroups##&lt;/span&gt;&#160;: ##change.assigntogroups## ##ENDIFchange.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.urgency##&lt;/span&gt;&#160;: ##change.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.impact##&lt;/span&gt;&#160;: ##change.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.priority##&lt;/span&gt; : ##change.priority## &lt;br /&gt;##IFchange.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.category## &lt;/span&gt;&#160;:##change.category##  ##ENDIFchange.category## ##ELSEchange.category##  ##lang.change.nocategoryassigned## ##ENDELSEchange.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.content##&lt;/span&gt;&#160;: ##change.content##&lt;/p&gt;\n&lt;p&gt;##IFchange.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description##&lt;br /&gt;##ENDIFchange.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoffollowups##&#160;: ##change.numberoffollowups##&lt;/div&gt;\n&lt;p&gt;##FOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt; &lt;strong&gt; [##followup.date##] &lt;em&gt;##lang.followup.isprivate## : ##followup.isprivate## &lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.author## &lt;/span&gt; ##followup.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.description## &lt;/span&gt; ##followup.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.date## &lt;/span&gt; ##followup.date##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.requesttype## &lt;/span&gt; ##followup.requesttype##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberofproblems##&#160;: ##change.numberofproblems##&lt;/div&gt;\n&lt;p&gt;##FOREACHproblems##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##problem.date##] &lt;em&gt;##lang.change.title## : &lt;a href=\"##problem.url##\"&gt;##problem.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.content## &lt;/span&gt; ##problem.content##\n&lt;p&gt;##ENDFOREACHproblems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoftasks##&#160;: ##change.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(20, 20, '', '##mailcollector.action##', '##FOREACHmailcollectors##\n##lang.mailcollector.name## : ##mailcollector.name##\n##lang.mailcollector.errors## : ##mailcollector.errors##\n##mailcollector.url##\n##ENDFOREACHmailcollectors##', '&lt;p&gt;##FOREACHmailcollectors##&lt;br /&gt;##lang.mailcollector.name## : ##mailcollector.name##&lt;br /&gt; ##lang.mailcollector.errors## : ##mailcollector.errors##&lt;br /&gt;&lt;a href=\"##mailcollector.url##\"&gt;##mailcollector.url##&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHmailcollectors##&lt;/p&gt;\n&lt;p&gt;&lt;/p&gt;'),
(21, 21, '', '##project.action## ##project.name## ##project.code##', '##lang.project.url## : ##project.url##\n\n##lang.project.description##\n\n##lang.project.name## : ##project.name##\n##lang.project.code## : ##project.code##\n##lang.project.manager## : ##project.manager##\n##lang.project.managergroup## : ##project.managergroup##\n##lang.project.creationdate## : ##project.creationdate##\n##lang.project.priority## : ##project.priority##\n##lang.project.state## : ##project.state##\n##lang.project.type## : ##project.type##\n##lang.project.description## : ##project.description##\n\n##lang.project.numberoftasks## : ##project.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##', '&lt;p&gt;##lang.project.url## : &lt;a href=\"##project.url##\"&gt;##project.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.project.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.project.name## : ##project.name##&lt;br /&gt;##lang.project.code## : ##project.code##&lt;br /&gt; ##lang.project.manager## : ##project.manager##&lt;br /&gt;##lang.project.managergroup## : ##project.managergroup##&lt;br /&gt; ##lang.project.creationdate## : ##project.creationdate##&lt;br /&gt;##lang.project.priority## : ##project.priority## &lt;br /&gt;##lang.project.state## : ##project.state##&lt;br /&gt;##lang.project.type## : ##project.type##&lt;br /&gt;##lang.project.description## : ##project.description##&lt;/p&gt;\n&lt;p&gt;##lang.project.numberoftasks## : ##project.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt; ##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` (`id`, `notificationtemplates_id`, `language`, `subject`, `content_text`, `content_html`) VALUES
(22, 22, '', '##projecttask.action## ##projecttask.name##', '##lang.projecttask.url## : ##projecttask.url##\n\n##lang.projecttask.description##\n\n##lang.projecttask.name## : ##projecttask.name##\n##lang.projecttask.project## : ##projecttask.project##\n##lang.projecttask.creationdate## : ##projecttask.creationdate##\n##lang.projecttask.state## : ##projecttask.state##\n##lang.projecttask.type## : ##projecttask.type##\n##lang.projecttask.description## : ##projecttask.description##\n\n##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##', '&lt;p&gt;##lang.projecttask.url## : &lt;a href=\"##projecttask.url##\"&gt;##projecttask.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.projecttask.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.name## : ##projecttask.name##&lt;br /&gt;##lang.projecttask.project## : &lt;a href=\"##projecttask.projecturl##\"&gt;##projecttask.project##&lt;/a&gt;&lt;br /&gt;##lang.projecttask.creationdate## : ##projecttask.creationdate##&lt;br /&gt;##lang.projecttask.state## : ##projecttask.state##&lt;br /&gt;##lang.projecttask.type## : ##projecttask.type##&lt;br /&gt;##lang.projecttask.description## : ##projecttask.description##&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt;##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(23, 23, '', '##objectlock.action##', '##objectlock.type## ###objectlock.id## - ##objectlock.name##\n\n      ##lang.objectlock.url##\n      ##objectlock.url##\n\n      ##lang.objectlock.date_mod##\n      ##objectlock.date_mod##\n\n      Hello ##objectlock.lockedby.firstname##,\n      Could go to this item and unlock it for me?\n      Thank you,\n      Regards,\n      ##objectlock.requester.firstname##', '&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##objectlock.url##\"&gt;##objectlock.type## ###objectlock.id## - ##objectlock.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.url##&lt;/td&gt;\n      &lt;td&gt;##objectlock.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.date_mod##&lt;/td&gt;\n      &lt;td&gt;##objectlock.date_mod##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello ##objectlock.lockedby.firstname##,&lt;br /&gt;Could go to this item and unlock it for me?&lt;br /&gt;Thank you,&lt;br /&gt;Regards,&lt;br /&gt;##objectlock.requester.firstname## ##objectlock.requester.lastname##&lt;/span&gt;&lt;/p&gt;'),
(24, 24, '', '##savedsearch.action## ##savedsearch.name##', '##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##\n\n      ##savedsearch.message##\n\n      ##lang.savedsearch.url##\n      ##savedsearch.url##\n\n      Regards,', '&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;&lt;td colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.message##&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.savedsearch.url##&lt;/td&gt;\n      &lt;td&gt;##savedsearch.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello &lt;br /&gt;Regards,&lt;/span&gt;&lt;/p&gt;'),
(25, 25, '', '##certificate.action##  ##certificate.name##', '##lang.certificate.entity## : ##certificate.entity##\n\n##lang.certificate.serial## : ##certificate.serial##\n\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n\n##certificate.url##', '&lt;p&gt;\n##lang.certificate.entity## : ##certificate.entity##&lt;br /&gt;\n&lt;br /&gt;##lang.certificate.name## : ##certificate.name##&lt;br /&gt;\n##lang.certificate.serial## : ##certificate.serial##&lt;br /&gt;\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n&lt;br /&gt; &lt;a href=\"##certificate.url##\"&gt; ##certificate.url##\n&lt;/a&gt;&lt;br /&gt;\n&lt;/p&gt;'),
(26, 26, '', '##domain.action## : ##domain.name##', '##lang.domain.entity## :##domain.entity##\n   ##lang.domain.name## : ##domain.name## - ##lang.domain.dateexpiration## : ##domain.dateexpiration##', '&lt;p&gt;##lang.domain.entity## :##domain.entity##&lt;br /&gt; &lt;br /&gt;\n                        ##lang.domain.name##  : ##domain.name## - ##lang.domain.dateexpiration## :  ##domain.dateexpiration##&lt;br /&gt;\n                        &lt;/p&gt;'),
(27, 27, '', '##user.action##', '##user.realname## ##user.firstname##,\n\n##IFuser.password.has_expired=1##\n##lang.password.has_expired.information##\n##ENDIFuser.password.has_expired##\n##ELSEuser.password.has_expired##\n##lang.password.expires_soon.information##\n##ENDELSEuser.password.has_expired##\n##lang.user.password.expiration.date##: ##user.password.expiration.date##\n##IFuser.account.lock.date##\n##lang.user.account.lock.date##: ##user.account.lock.date##\n##ENDIFuser.account.lock.date##\n\n##password.update.link## ##user.password.update.url##', '&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n\n##IFuser.password.has_expired=1##\n&lt;p&gt;##lang.password.has_expired.information##&lt;/p&gt;\n##ENDIFuser.password.has_expired##\n##ELSEuser.password.has_expired##\n&lt;p&gt;##lang.password.expires_soon.information##&lt;/p&gt;\n##ENDELSEuser.password.has_expired##\n&lt;p&gt;##lang.user.password.expiration.date##: ##user.password.expiration.date##&lt;/p&gt;\n##IFuser.account.lock.date##\n&lt;p&gt;##lang.user.account.lock.date##: ##user.account.lock.date##&lt;/p&gt;\n##ENDIFuser.account.lock.date##\n\n&lt;p&gt;##lang.password.update.link## &lt;a href=\"##user.password.update.url##\"&gt;##user.password.update.url##&lt;/a&gt;&lt;/p&gt;'),
(28, 28, '', '##lang.plugins_updates_available##', '##lang.plugins_updates_available##\n\n##FOREACHplugins##\n##plugin.name## :##plugin.old_version## -&gt; ##plugin.version##\n##ENDFOREACHplugins##\n\n##lang.marketplace.url## : ##marketplace.url##', '&lt;p&gt;##lang.plugins_updates_available##&lt;/p&gt;\n&lt;ul&gt;##FOREACHplugins##\n&lt;li&gt;##plugin.name## :##plugin.old_version## -&gt; ##plugin.version##&lt;/li&gt;\n##ENDFOREACHplugins##&lt;/ul&gt;\n&lt;p&gt;##lang.marketplace.url## : &lt;a title=\"##lang.marketplace.url##\" href=\"##marketplace.url##\" target=\"_blank\" rel=\"noopener\"&gt;##marketplace.url##&lt;/a&gt;&lt;/p&gt;'),
(29, 29, '', '##ticket.action## ##ticket.title##', '##ticket.action## ##ticket.title##', '&#60;p&#62;##ticket.action## ##ticket.title##&#60;/p&#62;');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_notimportedemails`
--

CREATE TABLE `glpi_notimportedemails` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `subject` text DEFAULT NULL,
  `messageid` varchar(255) NOT NULL,
  `reason` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_objectlocks`
--

CREATE TABLE `glpi_objectlocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL COMMENT 'Type of locked object',
  `items_id` int(10) UNSIGNED NOT NULL COMMENT 'RELATION to various tables, according to itemtype (ID)',
  `users_id` int(10) UNSIGNED NOT NULL COMMENT 'id of the locker',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_olalevelactions`
--

CREATE TABLE `glpi_olalevelactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `olalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_olalevelcriterias`
--

CREATE TABLE `glpi_olalevelcriterias` (
  `id` int(10) UNSIGNED NOT NULL,
  `olalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_olalevels`
--

CREATE TABLE `glpi_olalevels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `olas_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_olalevels_tickets`
--

CREATE TABLE `glpi_olalevels_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `olalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_olas`
--

CREATE TABLE `glpi_olas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `number_time` int(11) NOT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystemarchitectures`
--

CREATE TABLE `glpi_operatingsystemarchitectures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystemeditions`
--

CREATE TABLE `glpi_operatingsystemeditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystemkernels`
--

CREATE TABLE `glpi_operatingsystemkernels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystemkernelversions`
--

CREATE TABLE `glpi_operatingsystemkernelversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `operatingsystemkernels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystems`
--

CREATE TABLE `glpi_operatingsystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystemservicepacks`
--

CREATE TABLE `glpi_operatingsystemservicepacks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_operatingsystemversions`
--

CREATE TABLE `glpi_operatingsystemversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_passivedcequipmentmodels`
--

CREATE TABLE `glpi_passivedcequipmentmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_passivedcequipments`
--

CREATE TABLE `glpi_passivedcequipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `passivedcequipmentmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `passivedcequipmenttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_passivedcequipmenttypes`
--

CREATE TABLE `glpi_passivedcequipmenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pcivendors`
--

CREATE TABLE `glpi_pcivendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pdumodels`
--

CREATE TABLE `glpi_pdumodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `max_power` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `is_rackable` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pdus`
--

CREATE TABLE `glpi_pdus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pdumodels_id` int(10) UNSIGNED DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdutypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pdus_plugs`
--

CREATE TABLE `glpi_pdus_plugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugs_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdus_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_plugs` int(11) DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pdus_racks`
--

CREATE TABLE `glpi_pdus_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `racks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdus_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `side` int(11) DEFAULT 0,
  `position` int(11) NOT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pdutypes`
--

CREATE TABLE `glpi_pdutypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pendingreasons`
--

CREATE TABLE `glpi_pendingreasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `followup_frequency` int(11) NOT NULL DEFAULT 0,
  `followups_before_resolution` int(11) NOT NULL DEFAULT 0,
  `itilfollowuptemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solutiontemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_pendingreasons_items`
--

CREATE TABLE `glpi_pendingreasons_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `pendingreasons_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `followup_frequency` int(11) NOT NULL DEFAULT 0,
  `followups_before_resolution` int(11) NOT NULL DEFAULT 0,
  `bump_count` int(11) NOT NULL DEFAULT 0,
  `last_bump_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_peripheralmodels`
--

CREATE TABLE `glpi_peripheralmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_peripherals`
--

CREATE TABLE `glpi_peripherals` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peripheraltypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peripheralmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_peripheraltypes`
--

CREATE TABLE `glpi_peripheraltypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_phonemodels`
--

CREATE TABLE `glpi_phonemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_phonepowersupplies`
--

CREATE TABLE `glpi_phonepowersupplies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_phones`
--

CREATE TABLE `glpi_phones` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `phonetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `phonemodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `phonepowersupplies_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_line` varchar(255) DEFAULT NULL,
  `have_headset` tinyint(4) NOT NULL DEFAULT 0,
  `have_hp` tinyint(4) NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_phonetypes`
--

CREATE TABLE `glpi_phonetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_planningeventcategories`
--

CREATE TABLE `glpi_planningeventcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_planningexternalevents`
--

CREATE TABLE `glpi_planningexternalevents` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `planningexternaleventtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_guests` text DEFAULT NULL,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rrule` text DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `planningeventcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `background` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_planningexternaleventtemplates`
--

CREATE TABLE `glpi_planningexternaleventtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `before_time` int(11) NOT NULL DEFAULT 0,
  `rrule` text DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `planningeventcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `background` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_planningrecalls`
--

CREATE TABLE `glpi_planningrecalls` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `before_time` int(11) NOT NULL DEFAULT -10,
  `when` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_plugins`
--

CREATE TABLE `glpi_plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `directory` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_plugs`
--

CREATE TABLE `glpi_plugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_printerlogs`
--

CREATE TABLE `glpi_printerlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `printers_id` int(10) UNSIGNED NOT NULL,
  `total_pages` int(11) NOT NULL DEFAULT 0,
  `bw_pages` int(11) NOT NULL DEFAULT 0,
  `color_pages` int(11) NOT NULL DEFAULT 0,
  `rv_pages` int(11) NOT NULL DEFAULT 0,
  `prints` int(11) NOT NULL DEFAULT 0,
  `bw_prints` int(11) NOT NULL DEFAULT 0,
  `color_prints` int(11) NOT NULL DEFAULT 0,
  `copies` int(11) NOT NULL DEFAULT 0,
  `bw_copies` int(11) NOT NULL DEFAULT 0,
  `color_copies` int(11) NOT NULL DEFAULT 0,
  `scanned` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `faxed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_printermodels`
--

CREATE TABLE `glpi_printermodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_printers`
--

CREATE TABLE `glpi_printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `have_serial` tinyint(4) NOT NULL DEFAULT 0,
  `have_parallel` tinyint(4) NOT NULL DEFAULT 0,
  `have_usb` tinyint(4) NOT NULL DEFAULT 0,
  `have_wifi` tinyint(4) NOT NULL DEFAULT 0,
  `have_ethernet` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `memory_size` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printermodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `init_pages_counter` int(11) NOT NULL DEFAULT 0,
  `last_pages_counter` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `sysdescr` text DEFAULT NULL,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_printers_cartridgeinfos`
--

CREATE TABLE `glpi_printers_cartridgeinfos` (
  `id` int(10) UNSIGNED NOT NULL,
  `printers_id` int(10) UNSIGNED NOT NULL,
  `property` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_printertypes`
--

CREATE TABLE `glpi_printertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problemcosts`
--

CREATE TABLE `glpi_problemcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problems`
--

CREATE TABLE `glpi_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impactcontent` longtext DEFAULT NULL,
  `causecontent` longtext DEFAULT NULL,
  `symptomcontent` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problems_suppliers`
--

CREATE TABLE `glpi_problems_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problems_tickets`
--

CREATE TABLE `glpi_problems_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problems_users`
--

CREATE TABLE `glpi_problems_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problemtasks`
--

CREATE TABLE `glpi_problemtasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problemtemplatehiddenfields`
--

CREATE TABLE `glpi_problemtemplatehiddenfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problemtemplatemandatoryfields`
--

CREATE TABLE `glpi_problemtemplatemandatoryfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_problemtemplatemandatoryfields`
--

INSERT INTO `glpi_problemtemplatemandatoryfields` (`id`, `problemtemplates_id`, `num`) VALUES
(1, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problemtemplatepredefinedfields`
--

CREATE TABLE `glpi_problemtemplatepredefinedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_problemtemplates`
--

CREATE TABLE `glpi_problemtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_problemtemplates`
--

INSERT INTO `glpi_problemtemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_profilerights`
--

CREATE TABLE `glpi_profilerights` (
  `id` int(10) UNSIGNED NOT NULL,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `rights` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_profilerights`
--

INSERT INTO `glpi_profilerights` (`id`, `profiles_id`, `name`, `rights`) VALUES
(1, 1, 'computer', 0),
(2, 1, 'monitor', 0),
(3, 1, 'software', 0),
(4, 1, 'networking', 0),
(5, 1, 'internet', 0),
(6, 1, 'printer', 0),
(7, 1, 'peripheral', 0),
(8, 1, 'cartridge', 0),
(9, 1, 'consumable', 0),
(10, 1, 'phone', 0),
(11, 6, 'queuednotification', 0),
(12, 1, 'contact_enterprise', 0),
(13, 1, 'document', 0),
(14, 1, 'contract', 0),
(15, 1, 'infocom', 0),
(16, 1, 'knowbase', 2048),
(17, 1, 'reservation', 1024),
(18, 1, 'reports', 0),
(19, 1, 'dropdown', 0),
(20, 1, 'device', 0),
(21, 1, 'typedoc', 0),
(22, 1, 'link', 0),
(23, 1, 'config', 0),
(24, 1, 'rule_ticket', 0),
(25, 1, 'rule_import', 0),
(26, 1, 'rule_location', 0),
(27, 1, 'rule_ldap', 0),
(28, 1, 'rule_softwarecategories', 0),
(29, 1, 'search_config', 0),
(30, 5, 'location', 0),
(31, 7, 'domain', 31),
(32, 1, 'profile', 0),
(33, 1, 'user', 0),
(34, 1, 'group', 0),
(35, 1, 'entity', 0),
(36, 1, 'transfer', 0),
(37, 1, 'logs', 0),
(38, 1, 'reminder_public', 1),
(39, 1, 'rssfeed_public', 1),
(40, 1, 'bookmark_public', 0),
(41, 1, 'backup', 0),
(42, 1, 'ticket', 5),
(43, 1, 'followup', 5),
(44, 1, 'task', 1),
(45, 1, 'planning', 0),
(46, 2, 'state', 0),
(47, 2, 'taskcategory', 0),
(48, 1, 'statistic', 0),
(49, 1, 'password_update', 1),
(50, 1, 'show_group_hardware', 0),
(51, 1, 'rule_dictionnary_software', 0),
(52, 1, 'rule_dictionnary_dropdown', 0),
(53, 1, 'budget', 0),
(54, 1, 'notification', 0),
(55, 1, 'rule_mailcollector', 0),
(56, 7, 'solutiontemplate', 23),
(57, 7, 'itilfollowuptemplate', 23),
(58, 1, 'calendar', 0),
(59, 1, 'slm', 0),
(60, 1, 'rule_dictionnary_printer', 0),
(61, 1, 'problem', 0),
(62, 2, 'cable_management', 0),
(63, 4, 'knowbasecategory', 23),
(64, 5, 'itilcategory', 0),
(65, 1, 'itiltemplate', 0),
(66, 1, 'ticketrecurrent', 0),
(67, 1, 'ticketcost', 0),
(68, 6, 'changevalidation', 20),
(69, 1, 'ticketvalidation', 0),
(70, 2, 'computer', 33),
(71, 2, 'monitor', 33),
(72, 2, 'software', 33),
(73, 2, 'networking', 33),
(74, 2, 'internet', 1),
(75, 2, 'printer', 33),
(76, 2, 'peripheral', 33),
(77, 2, 'cartridge', 33),
(78, 2, 'consumable', 33),
(79, 2, 'phone', 33),
(80, 5, 'queuednotification', 0),
(81, 2, 'contact_enterprise', 33),
(82, 2, 'document', 33),
(83, 2, 'contract', 33),
(84, 2, 'infocom', 1),
(85, 2, 'knowbase', 10241),
(86, 2, 'reservation', 1025),
(87, 2, 'reports', 1),
(88, 2, 'dropdown', 0),
(89, 2, 'device', 0),
(90, 2, 'typedoc', 1),
(91, 2, 'link', 1),
(92, 2, 'config', 0),
(93, 2, 'rule_ticket', 0),
(94, 2, 'rule_import', 0),
(95, 2, 'rule_location', 0),
(96, 2, 'rule_ldap', 0),
(97, 2, 'rule_softwarecategories', 0),
(98, 2, 'search_config', 1024),
(99, 4, 'location', 23),
(100, 6, 'domain', 0),
(101, 2, 'profile', 0),
(102, 2, 'user', 2049),
(103, 2, 'group', 33),
(104, 2, 'entity', 0),
(105, 2, 'transfer', 0),
(106, 2, 'logs', 0),
(107, 2, 'reminder_public', 129),
(108, 2, 'rssfeed_public', 129),
(109, 2, 'bookmark_public', 0),
(110, 2, 'backup', 0),
(111, 2, 'ticket', 168989),
(112, 2, 'followup', 5),
(113, 2, 'task', 1),
(114, 6, 'projecttask', 1025),
(115, 7, 'projecttask', 1025),
(116, 2, 'planning', 1),
(117, 1, 'state', 0),
(118, 1, 'taskcategory', 0),
(119, 2, 'statistic', 1),
(120, 2, 'password_update', 1),
(121, 2, 'show_group_hardware', 0),
(122, 2, 'rule_dictionnary_software', 0),
(123, 2, 'rule_dictionnary_dropdown', 0),
(124, 2, 'budget', 33),
(125, 2, 'notification', 0),
(126, 2, 'rule_mailcollector', 0),
(127, 5, 'solutiontemplate', 0),
(128, 5, 'itilfollowuptemplate', 0),
(129, 6, 'solutiontemplate', 0),
(130, 6, 'itilfollowuptemplate', 0),
(131, 2, 'calendar', 0),
(132, 2, 'slm', 0),
(133, 2, 'rule_dictionnary_printer', 0),
(134, 2, 'problem', 1057),
(135, 1, 'cable_management', 0),
(136, 3, 'knowbasecategory', 23),
(137, 4, 'itilcategory', 23),
(138, 2, 'itiltemplate', 0),
(139, 2, 'ticketrecurrent', 0),
(140, 2, 'ticketcost', 1),
(141, 4, 'changevalidation', 1044),
(142, 5, 'changevalidation', 20),
(143, 2, 'ticketvalidation', 15376),
(144, 3, 'computer', 127),
(145, 3, 'monitor', 127),
(146, 3, 'software', 127),
(147, 3, 'networking', 127),
(148, 3, 'internet', 31),
(149, 3, 'printer', 127),
(150, 3, 'peripheral', 127),
(151, 3, 'cartridge', 127),
(152, 3, 'consumable', 127),
(153, 3, 'phone', 127),
(154, 4, 'queuednotification', 31),
(155, 3, 'contact_enterprise', 127),
(156, 3, 'document', 127),
(157, 3, 'contract', 127),
(158, 3, 'infocom', 23),
(159, 3, 'knowbase', 14359),
(160, 3, 'reservation', 1055),
(161, 3, 'reports', 1),
(162, 3, 'dropdown', 23),
(163, 3, 'device', 23),
(164, 3, 'typedoc', 23),
(165, 3, 'link', 23),
(166, 3, 'config', 0),
(167, 3, 'rule_ticket', 1047),
(168, 3, 'rule_import', 0),
(169, 3, 'rule_location', 0),
(170, 3, 'rule_ldap', 0),
(171, 3, 'rule_softwarecategories', 0),
(172, 3, 'search_config', 3072),
(173, 3, 'location', 23),
(174, 5, 'domain', 0),
(175, 3, 'profile', 1),
(176, 3, 'user', 7199),
(177, 3, 'group', 119),
(178, 3, 'entity', 33),
(179, 3, 'transfer', 1),
(180, 3, 'logs', 1),
(181, 3, 'reminder_public', 151),
(182, 3, 'rssfeed_public', 151),
(183, 3, 'bookmark_public', 23),
(184, 3, 'backup', 1024),
(185, 3, 'ticket', 261151),
(186, 3, 'followup', 31767),
(187, 3, 'task', 13329),
(188, 3, 'projecttask', 1121),
(189, 4, 'projecttask', 1121),
(190, 5, 'projecttask', 0),
(191, 3, 'planning', 3073),
(192, 7, 'taskcategory', 23),
(193, 7, 'cable_management', 31),
(194, 3, 'statistic', 1),
(195, 3, 'password_update', 1),
(196, 3, 'show_group_hardware', 0),
(197, 3, 'rule_dictionnary_software', 0),
(198, 3, 'rule_dictionnary_dropdown', 0),
(199, 3, 'budget', 127),
(200, 3, 'notification', 0),
(201, 3, 'rule_mailcollector', 23),
(202, 3, 'solutiontemplate', 23),
(203, 3, 'itilfollowuptemplate', 23),
(204, 4, 'solutiontemplate', 23),
(205, 4, 'itilfollowuptemplate', 23),
(206, 3, 'calendar', 23),
(207, 3, 'slm', 23),
(208, 3, 'rule_dictionnary_printer', 0),
(209, 3, 'problem', 1151),
(210, 2, 'knowbasecategory', 0),
(211, 3, 'itilcategory', 23),
(212, 3, 'itiltemplate', 23),
(213, 3, 'ticketrecurrent', 1),
(214, 3, 'ticketcost', 23),
(215, 2, 'changevalidation', 1044),
(216, 3, 'changevalidation', 1044),
(217, 3, 'ticketvalidation', 15376),
(218, 4, 'computer', 255),
(219, 4, 'monitor', 255),
(220, 4, 'software', 255),
(221, 4, 'networking', 255),
(222, 4, 'internet', 159),
(223, 4, 'printer', 255),
(224, 4, 'peripheral', 255),
(225, 4, 'cartridge', 255),
(226, 4, 'consumable', 255),
(227, 4, 'phone', 255),
(228, 4, 'contact_enterprise', 255),
(229, 4, 'document', 255),
(230, 4, 'contract', 255),
(231, 4, 'infocom', 23),
(232, 4, 'knowbase', 15383),
(233, 4, 'reservation', 1055),
(234, 4, 'reports', 1),
(235, 4, 'dropdown', 23),
(236, 4, 'device', 23),
(237, 4, 'typedoc', 23),
(238, 4, 'link', 159),
(239, 4, 'config', 3),
(240, 4, 'rule_ticket', 1047),
(241, 4, 'rule_import', 23),
(242, 4, 'rule_location', 23),
(243, 4, 'rule_ldap', 23),
(244, 4, 'rule_softwarecategories', 23),
(245, 4, 'search_config', 3072),
(246, 2, 'location', 0),
(247, 4, 'domain', 31),
(248, 4, 'profile', 23),
(249, 4, 'user', 7327),
(250, 4, 'group', 119),
(251, 4, 'entity', 3327),
(252, 4, 'transfer', 23),
(253, 4, 'logs', 1),
(254, 4, 'reminder_public', 159),
(255, 4, 'rssfeed_public', 159),
(256, 4, 'bookmark_public', 23),
(257, 4, 'backup', 1045),
(258, 4, 'ticket', 261151),
(259, 4, 'followup', 31767),
(260, 4, 'task', 13329),
(261, 7, 'project', 1151),
(262, 1, 'projecttask', 0),
(263, 2, 'projecttask', 1025),
(264, 4, 'planning', 3073),
(265, 6, 'taskcategory', 0),
(266, 6, 'cable_management', 0),
(267, 4, 'statistic', 1),
(268, 4, 'password_update', 1),
(269, 4, 'show_group_hardware', 1),
(270, 4, 'rule_dictionnary_software', 23),
(271, 4, 'rule_dictionnary_dropdown', 23),
(272, 4, 'budget', 127),
(273, 4, 'notification', 23),
(274, 4, 'rule_mailcollector', 23),
(275, 1, 'solutiontemplate', 0),
(276, 1, 'itilfollowuptemplate', 0),
(277, 2, 'solutiontemplate', 0),
(278, 2, 'itilfollowuptemplate', 0),
(279, 4, 'calendar', 23),
(280, 4, 'slm', 23),
(281, 4, 'rule_dictionnary_printer', 23),
(282, 4, 'problem', 1151),
(283, 1, 'knowbasecategory', 0),
(284, 2, 'itilcategory', 0),
(285, 4, 'itiltemplate', 23),
(286, 4, 'ticketrecurrent', 23),
(287, 4, 'ticketcost', 23),
(288, 7, 'change', 1151),
(289, 1, 'changevalidation', 0),
(290, 4, 'ticketvalidation', 15376),
(291, 5, 'computer', 0),
(292, 5, 'monitor', 0),
(293, 5, 'software', 0),
(294, 5, 'networking', 0),
(295, 5, 'internet', 0),
(296, 5, 'printer', 0),
(297, 5, 'peripheral', 0),
(298, 5, 'cartridge', 0),
(299, 5, 'consumable', 0),
(300, 5, 'phone', 0),
(301, 3, 'queuednotification', 0),
(302, 5, 'contact_enterprise', 0),
(303, 5, 'document', 0),
(304, 5, 'contract', 0),
(305, 5, 'infocom', 0),
(306, 5, 'knowbase', 10240),
(307, 5, 'reservation', 0),
(308, 5, 'reports', 0),
(309, 5, 'dropdown', 0),
(310, 5, 'device', 0),
(311, 5, 'typedoc', 0),
(312, 5, 'link', 0),
(313, 5, 'config', 0),
(314, 5, 'rule_ticket', 0),
(315, 5, 'rule_import', 0),
(316, 5, 'rule_location', 0),
(317, 5, 'rule_ldap', 0),
(318, 5, 'rule_softwarecategories', 0),
(319, 5, 'search_config', 0),
(320, 1, 'location', 0),
(321, 3, 'domain', 31),
(322, 5, 'profile', 0),
(323, 5, 'user', 1025),
(324, 5, 'group', 0),
(325, 5, 'entity', 0),
(326, 5, 'transfer', 0),
(327, 5, 'logs', 0),
(328, 5, 'reminder_public', 128),
(329, 5, 'rssfeed_public', 128),
(330, 5, 'bookmark_public', 0),
(331, 5, 'backup', 0),
(332, 5, 'ticket', 140295),
(333, 5, 'followup', 12295),
(334, 5, 'task', 8193),
(335, 4, 'project', 1151),
(336, 5, 'project', 1151),
(337, 6, 'project', 1151),
(338, 5, 'planning', 1),
(339, 5, 'taskcategory', 0),
(340, 5, 'cable_management', 0),
(341, 5, 'statistic', 1),
(342, 5, 'password_update', 1),
(343, 5, 'show_group_hardware', 0),
(344, 5, 'rule_dictionnary_software', 0),
(345, 5, 'rule_dictionnary_dropdown', 0),
(346, 5, 'budget', 0),
(347, 5, 'notification', 0),
(348, 5, 'rule_mailcollector', 0),
(349, 6, 'state', 0),
(350, 7, 'state', 23),
(351, 5, 'calendar', 0),
(352, 5, 'slm', 0),
(353, 5, 'rule_dictionnary_printer', 0),
(354, 5, 'problem', 1024),
(355, 7, 'knowbasecategory', 23),
(356, 1, 'itilcategory', 0),
(357, 5, 'itiltemplate', 0),
(358, 5, 'ticketrecurrent', 0),
(359, 5, 'ticketcost', 23),
(360, 5, 'change', 1054),
(361, 6, 'change', 1151),
(362, 5, 'ticketvalidation', 3088),
(363, 6, 'computer', 127),
(364, 6, 'monitor', 127),
(365, 6, 'software', 127),
(366, 6, 'networking', 127),
(367, 6, 'internet', 31),
(368, 6, 'printer', 127),
(369, 6, 'peripheral', 127),
(370, 6, 'cartridge', 127),
(371, 6, 'consumable', 127),
(372, 6, 'phone', 127),
(373, 2, 'queuednotification', 0),
(374, 6, 'contact_enterprise', 96),
(375, 6, 'document', 127),
(376, 6, 'contract', 96),
(377, 6, 'infocom', 0),
(378, 6, 'knowbase', 14359),
(379, 6, 'reservation', 1055),
(380, 6, 'reports', 1),
(381, 6, 'dropdown', 0),
(382, 6, 'device', 0),
(383, 6, 'typedoc', 0),
(384, 6, 'link', 0),
(385, 6, 'config', 0),
(386, 6, 'rule_ticket', 0),
(387, 6, 'rule_import', 0),
(388, 6, 'rule_location', 0),
(389, 6, 'rule_ldap', 0),
(390, 6, 'rule_softwarecategories', 0),
(391, 6, 'search_config', 0),
(392, 2, 'domain', 0),
(393, 6, 'profile', 0),
(394, 6, 'user', 1055),
(395, 6, 'group', 1),
(396, 6, 'entity', 33),
(397, 6, 'transfer', 1),
(398, 6, 'logs', 0),
(399, 6, 'reminder_public', 151),
(400, 6, 'rssfeed_public', 151),
(401, 6, 'bookmark_public', 0),
(402, 6, 'backup', 0),
(403, 6, 'ticket', 166919),
(404, 6, 'followup', 13319),
(405, 6, 'task', 13329),
(406, 1, 'project', 0),
(407, 2, 'project', 1025),
(408, 3, 'project', 1151),
(409, 6, 'planning', 1),
(410, 4, 'taskcategory', 23),
(411, 4, 'cable_management', 31),
(412, 6, 'statistic', 1),
(413, 6, 'password_update', 1),
(414, 6, 'show_group_hardware', 0),
(415, 6, 'rule_dictionnary_software', 0),
(416, 6, 'rule_dictionnary_dropdown', 0),
(417, 6, 'budget', 96),
(418, 6, 'notification', 0),
(419, 6, 'rule_mailcollector', 0),
(420, 4, 'state', 23),
(421, 5, 'state', 0),
(422, 6, 'calendar', 0),
(423, 6, 'slm', 1),
(424, 6, 'rule_dictionnary_printer', 0),
(425, 6, 'problem', 1121),
(426, 6, 'knowbasecategory', 0),
(427, 7, 'itilcategory', 23),
(428, 7, 'location', 23),
(429, 6, 'itiltemplate', 1),
(430, 6, 'ticketrecurrent', 1),
(431, 6, 'ticketcost', 23),
(432, 3, 'change', 1151),
(433, 4, 'change', 1151),
(434, 6, 'ticketvalidation', 3088),
(435, 7, 'computer', 127),
(436, 7, 'monitor', 127),
(437, 7, 'software', 127),
(438, 7, 'networking', 127),
(439, 7, 'internet', 31),
(440, 7, 'printer', 127),
(441, 7, 'peripheral', 127),
(442, 7, 'cartridge', 127),
(443, 7, 'consumable', 127),
(444, 7, 'phone', 127),
(445, 1, 'queuednotification', 0),
(446, 7, 'contact_enterprise', 96),
(447, 7, 'document', 127),
(448, 7, 'contract', 96),
(449, 7, 'infocom', 0),
(450, 7, 'knowbase', 14359),
(451, 7, 'reservation', 1055),
(452, 7, 'reports', 1),
(453, 7, 'dropdown', 0),
(454, 7, 'device', 0),
(455, 7, 'typedoc', 0),
(456, 7, 'link', 0),
(457, 7, 'config', 0),
(458, 7, 'rule_ticket', 1047),
(459, 7, 'rule_import', 0),
(460, 7, 'rule_location', 0),
(461, 7, 'rule_ldap', 0),
(462, 7, 'rule_softwarecategories', 0),
(463, 7, 'search_config', 0),
(464, 1, 'domain', 0),
(465, 7, 'profile', 0),
(466, 7, 'user', 1055),
(467, 7, 'group', 1),
(468, 7, 'entity', 33),
(469, 7, 'transfer', 1),
(470, 7, 'logs', 1),
(471, 7, 'reminder_public', 151),
(472, 7, 'rssfeed_public', 151),
(473, 7, 'bookmark_public', 0),
(474, 7, 'backup', 0),
(475, 7, 'ticket', 261151),
(476, 7, 'followup', 31767),
(477, 7, 'task', 13329),
(478, 7, 'queuednotification', 0),
(479, 7, 'planning', 3073),
(480, 3, 'taskcategory', 23),
(481, 3, 'cable_management', 31),
(482, 7, 'statistic', 1),
(483, 7, 'password_update', 1),
(484, 7, 'show_group_hardware', 0),
(485, 7, 'rule_dictionnary_software', 0),
(486, 7, 'rule_dictionnary_dropdown', 0),
(487, 7, 'budget', 96),
(488, 7, 'notification', 0),
(489, 7, 'rule_mailcollector', 23),
(490, 7, 'changevalidation', 1044),
(491, 3, 'state', 23),
(492, 7, 'calendar', 23),
(493, 7, 'slm', 23),
(494, 7, 'rule_dictionnary_printer', 0),
(495, 7, 'problem', 1151),
(496, 5, 'knowbasecategory', 0),
(497, 6, 'itilcategory', 0),
(498, 6, 'location', 0),
(499, 7, 'itiltemplate', 23),
(500, 7, 'ticketrecurrent', 1),
(501, 7, 'ticketcost', 23),
(502, 1, 'change', 0),
(503, 2, 'change', 1057),
(504, 7, 'ticketvalidation', 15376),
(505, 8, 'backup', 1),
(506, 8, 'bookmark_public', 1),
(507, 8, 'budget', 33),
(508, 8, 'calendar', 1),
(509, 8, 'cartridge', 33),
(510, 8, 'change', 1057),
(511, 8, 'changevalidation', 0),
(512, 8, 'computer', 33),
(513, 8, 'config', 1),
(514, 8, 'consumable', 33),
(515, 8, 'contact_enterprise', 33),
(516, 8, 'contract', 33),
(517, 8, 'device', 1),
(518, 8, 'document', 33),
(519, 8, 'domain', 1),
(520, 8, 'dropdown', 1),
(521, 8, 'entity', 33),
(522, 8, 'followup', 8193),
(523, 8, 'global_validation', 0),
(524, 8, 'group', 33),
(525, 8, 'infocom', 1),
(526, 8, 'internet', 1),
(527, 8, 'itilcategory', 1),
(528, 8, 'knowbase', 10241),
(529, 8, 'knowbasecategory', 1),
(530, 8, 'link', 1),
(531, 8, 'location', 1),
(532, 8, 'logs', 1),
(533, 8, 'monitor', 33),
(534, 8, 'cable_management', 1),
(535, 8, 'networking', 33),
(536, 8, 'notification', 1),
(537, 8, 'password_update', 0),
(538, 8, 'peripheral', 33),
(539, 8, 'phone', 33),
(540, 8, 'planning', 3073),
(541, 8, 'printer', 33),
(542, 8, 'problem', 1057),
(543, 8, 'profile', 1),
(544, 8, 'project', 1057),
(545, 8, 'projecttask', 33),
(546, 8, 'queuednotification', 1),
(547, 8, 'reminder_public', 1),
(548, 8, 'reports', 1),
(549, 8, 'reservation', 129),
(550, 8, 'rssfeed_public', 129),
(551, 8, 'rule_dictionnary_dropdown', 1),
(552, 8, 'rule_dictionnary_printer', 1),
(553, 8, 'rule_dictionnary_software', 1),
(554, 8, 'rule_import', 1),
(555, 8, 'rule_location', 1),
(556, 8, 'rule_ldap', 1),
(557, 8, 'rule_mailcollector', 1),
(558, 8, 'rule_softwarecategories', 1),
(559, 8, 'rule_ticket', 1),
(560, 8, 'search_config', 0),
(561, 8, 'show_group_hardware', 1),
(562, 8, 'slm', 1),
(563, 8, 'software', 33),
(564, 8, 'solutiontemplate', 1),
(565, 8, 'itilfollowuptemplate', 1),
(566, 8, 'state', 1),
(567, 8, 'statistic', 1),
(568, 8, 'task', 8193),
(569, 8, 'taskcategory', 1),
(570, 8, 'ticket', 138241),
(571, 8, 'ticketcost', 1),
(572, 8, 'ticketrecurrent', 1),
(573, 8, 'itiltemplate', 1),
(574, 8, 'ticketvalidation', 0),
(575, 8, 'transfer', 1),
(576, 8, 'typedoc', 1),
(577, 8, 'user', 1),
(578, 1, 'license', 0),
(579, 2, 'license', 33),
(580, 3, 'license', 127),
(581, 4, 'license', 255),
(582, 5, 'license', 0),
(583, 6, 'license', 127),
(584, 7, 'license', 127),
(585, 8, 'license', 33),
(586, 1, 'line', 0),
(587, 2, 'line', 33),
(588, 3, 'line', 127),
(589, 4, 'line', 255),
(590, 5, 'line', 0),
(591, 6, 'line', 127),
(592, 7, 'line', 127),
(593, 8, 'line', 33),
(594, 1, 'lineoperator', 0),
(595, 2, 'lineoperator', 33),
(596, 3, 'lineoperator', 23),
(597, 4, 'lineoperator', 23),
(598, 5, 'lineoperator', 0),
(599, 6, 'lineoperator', 0),
(600, 7, 'lineoperator', 23),
(601, 8, 'lineoperator', 1),
(602, 1, 'devicesimcard_pinpuk', 0),
(603, 2, 'devicesimcard_pinpuk', 1),
(604, 3, 'devicesimcard_pinpuk', 3),
(605, 4, 'devicesimcard_pinpuk', 3),
(606, 5, 'devicesimcard_pinpuk', 0),
(607, 6, 'devicesimcard_pinpuk', 3),
(608, 7, 'devicesimcard_pinpuk', 3),
(609, 8, 'devicesimcard_pinpuk', 1),
(610, 1, 'certificate', 0),
(611, 2, 'certificate', 33),
(612, 3, 'certificate', 127),
(613, 4, 'certificate', 255),
(614, 5, 'certificate', 0),
(615, 6, 'certificate', 127),
(616, 7, 'certificate', 127),
(617, 8, 'certificate', 33),
(618, 1, 'datacenter', 0),
(619, 2, 'datacenter', 1),
(620, 3, 'datacenter', 31),
(621, 4, 'datacenter', 31),
(622, 5, 'datacenter', 0),
(623, 6, 'datacenter', 31),
(624, 7, 'datacenter', 31),
(625, 8, 'datacenter', 1),
(626, 4, 'rule_asset', 1047),
(627, 1, 'personalization', 3),
(628, 2, 'personalization', 3),
(629, 3, 'personalization', 3),
(630, 4, 'personalization', 3),
(631, 5, 'personalization', 3),
(632, 6, 'personalization', 3),
(633, 7, 'personalization', 3),
(634, 8, 'personalization', 3),
(635, 1, 'rule_asset', 0),
(636, 2, 'rule_asset', 0),
(637, 3, 'rule_asset', 0),
(638, 5, 'rule_asset', 0),
(639, 6, 'rule_asset', 0),
(640, 7, 'rule_asset', 0),
(641, 8, 'rule_asset', 0),
(642, 1, 'global_validation', 0),
(643, 2, 'global_validation', 0),
(644, 3, 'global_validation', 0),
(645, 4, 'global_validation', 0),
(646, 5, 'global_validation', 0),
(647, 6, 'global_validation', 0),
(648, 7, 'global_validation', 0),
(649, 1, 'cluster', 0),
(650, 2, 'cluster', 1),
(651, 3, 'cluster', 31),
(652, 4, 'cluster', 31),
(653, 5, 'cluster', 0),
(654, 6, 'cluster', 31),
(655, 7, 'cluster', 31),
(656, 8, 'cluster', 1),
(657, 1, 'externalevent', 0),
(658, 2, 'externalevent', 1),
(659, 3, 'externalevent', 1055),
(660, 4, 'externalevent', 1055),
(661, 5, 'externalevent', 0),
(662, 6, 'externalevent', 1),
(663, 7, 'externalevent', 31),
(664, 8, 'externalevent', 1),
(665, 1, 'dashboard', 0),
(666, 2, 'dashboard', 0),
(667, 3, 'dashboard', 0),
(668, 4, 'dashboard', 23),
(669, 5, 'dashboard', 0),
(670, 6, 'dashboard', 0),
(671, 7, 'dashboard', 0),
(672, 8, 'dashboard', 0),
(673, 1, 'appliance', 0),
(674, 2, 'appliance', 1),
(675, 3, 'appliance', 31),
(676, 4, 'appliance', 31),
(677, 5, 'appliance', 0),
(678, 6, 'appliance', 31),
(679, 7, 'appliance', 31),
(680, 8, 'appliance', 1),
(681, 1, 'inventory', 0),
(682, 2, 'inventory', 0),
(683, 3, 'inventory', 3073),
(684, 4, 'inventory', 3073),
(685, 5, 'inventory', 0),
(686, 6, 'inventory', 0),
(687, 7, 'inventory', 0),
(688, 8, 'inventory', 0),
(689, 1, 'pendingreason', 0),
(690, 2, 'pendingreason', 0),
(691, 3, 'pendingreason', 31),
(692, 4, 'pendingreason', 31),
(693, 5, 'pendingreason', 1),
(694, 6, 'pendingreason', 1),
(695, 7, 'pendingreason', 1),
(696, 8, 'pendingreason', 1),
(697, 1, 'database', 0),
(698, 2, 'database', 1),
(699, 3, 'database', 31),
(700, 4, 'database', 31),
(701, 5, 'database', 0),
(702, 6, 'database', 31),
(703, 7, 'database', 31),
(704, 8, 'database', 1),
(705, 1, 'recurrentchange', 0),
(706, 2, 'recurrentchange', 0),
(707, 3, 'recurrentchange', 1),
(708, 4, 'recurrentchange', 31),
(709, 5, 'recurrentchange', 0),
(710, 6, 'recurrentchange', 1),
(711, 7, 'recurrentchange', 1),
(712, 8, 'recurrentchange', 1),
(713, 1, 'locked_field', 0),
(714, 2, 'locked_field', 0),
(715, 3, 'locked_field', 0),
(716, 4, 'locked_field', 6),
(717, 5, 'locked_field', 0),
(718, 6, 'locked_field', 0),
(719, 7, 'locked_field', 0),
(720, 8, 'locked_field', 0),
(721, 1, 'snmpcredential', 0),
(722, 2, 'snmpcredential', 0),
(723, 3, 'snmpcredential', 0),
(724, 4, 'snmpcredential', 31),
(725, 5, 'snmpcredential', 0),
(726, 6, 'snmpcredential', 0),
(727, 7, 'snmpcredential', 0),
(728, 8, 'snmpcredential', 0),
(729, 1, 'refusedequipment', 0),
(730, 2, 'refusedequipment', 0),
(731, 3, 'refusedequipment', 0),
(732, 4, 'refusedequipment', 19),
(733, 5, 'refusedequipment', 0),
(734, 6, 'refusedequipment', 0),
(735, 7, 'refusedequipment', 0),
(736, 8, 'refusedequipment', 0),
(737, 1, 'agent', 0),
(738, 2, 'agent', 0),
(739, 3, 'agent', 0),
(740, 4, 'agent', 19),
(741, 5, 'agent', 0),
(742, 6, 'agent', 0),
(743, 7, 'agent', 0),
(744, 8, 'agent', 0),
(745, 1, 'unmanaged', 0),
(746, 2, 'unmanaged', 0),
(747, 3, 'unmanaged', 0),
(748, 4, 'unmanaged', 27),
(749, 5, 'unmanaged', 0),
(750, 6, 'unmanaged', 0),
(751, 7, 'unmanaged', 0),
(752, 8, 'unmanaged', 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_profiles`
--

CREATE TABLE `glpi_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT 'helpdesk',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `helpdesk_hardware` int(11) NOT NULL DEFAULT 0,
  `helpdesk_item_type` text DEFAULT NULL,
  `ticket_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `problem_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint(4) NOT NULL DEFAULT 0,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `change_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `managed_domainrecordtypes` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_profiles`
--

INSERT INTO `glpi_profiles` (`id`, `name`, `interface`, `is_default`, `helpdesk_hardware`, `helpdesk_item_type`, `ticket_status`, `date_mod`, `comment`, `problem_status`, `create_ticket_on_login`, `tickettemplates_id`, `changetemplates_id`, `problemtemplates_id`, `change_status`, `managed_domainrecordtypes`, `date_creation`) VALUES
(1, 'Self-Service', 'helpdesk', 1, 1, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', NULL, '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(2, 'Observer', 'central', 0, 1, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(3, 'Admin', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[-1]', NULL),
(4, 'Super-Admin', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[-1]', NULL),
(5, 'Hotliner', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 1, 0, 0, 0, NULL, '[]', NULL),
(6, 'Technician', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(7, 'Supervisor', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(8, 'Read-Only', 'central', 0, 0, '[]', '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', NULL, 'This profile defines read-only access. It is used when objects are locked. It can also be used to give to users rights to unlock objects.', '{\"1\":{\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"2\":{\"1\":0,\"7\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"3\":{\"1\":0,\"7\":0,\"2\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0}}', 0, 0, 0, 0, '{\"1\":{\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"9\":{\"1\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"10\":{\"1\":0,\"9\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"9\":0,\"10\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"11\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"12\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0}}', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_profiles_reminders`
--

CREATE TABLE `glpi_profiles_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_profiles_rssfeeds`
--

CREATE TABLE `glpi_profiles_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_profiles_users`
--

CREATE TABLE `glpi_profiles_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_default_profile` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_profiles_users`
--

INSERT INTO `glpi_profiles_users` (`id`, `users_id`, `profiles_id`, `entities_id`, `is_recursive`, `is_dynamic`, `is_default_profile`) VALUES
(2, 2, 4, 0, 1, 0, 0),
(3, 3, 1, 0, 1, 0, 0),
(4, 4, 6, 0, 1, 0, 0),
(5, 5, 2, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projectcosts`
--

CREATE TABLE `glpi_projectcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projects`
--

CREATE TABLE `glpi_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projectstates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `auto_percent_done` tinyint(4) NOT NULL DEFAULT 0,
  `show_on_global_gantt` tinyint(4) NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `projecttemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projectstates`
--

CREATE TABLE `glpi_projectstates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_finished` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_projectstates`
--

INSERT INTO `glpi_projectstates` (`id`, `name`, `comment`, `color`, `is_finished`, `date_mod`, `date_creation`) VALUES
(1, 'New', NULL, '#06ff00', 0, NULL, NULL),
(2, 'Processing', NULL, '#ffb800', 0, NULL, NULL),
(3, 'Closed', NULL, '#ff0000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttasklinks`
--

CREATE TABLE `glpi_projecttasklinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `projecttasks_id_source` int(10) UNSIGNED NOT NULL,
  `source_uuid` varchar(255) NOT NULL,
  `projecttasks_id_target` int(10) UNSIGNED NOT NULL,
  `target_uuid` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `lag` smallint(6) DEFAULT 0,
  `lead` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttasks`
--

CREATE TABLE `glpi_projecttasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT 0,
  `effective_duration` int(11) NOT NULL DEFAULT 0,
  `projectstates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasktypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `auto_percent_done` tinyint(4) NOT NULL DEFAULT 0,
  `is_milestone` tinyint(4) NOT NULL DEFAULT 0,
  `projecttasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttasks_tickets`
--

CREATE TABLE `glpi_projecttasks_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttaskteams`
--

CREATE TABLE `glpi_projecttaskteams` (
  `id` int(10) UNSIGNED NOT NULL,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttasktemplates`
--

CREATE TABLE `glpi_projecttasktemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT 0,
  `effective_duration` int(11) NOT NULL DEFAULT 0,
  `projectstates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasktypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `is_milestone` tinyint(4) NOT NULL DEFAULT 0,
  `comments` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttasktypes`
--

CREATE TABLE `glpi_projecttasktypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projectteams`
--

CREATE TABLE `glpi_projectteams` (
  `id` int(10) UNSIGNED NOT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_projecttypes`
--

CREATE TABLE `glpi_projecttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_queuednotifications`
--

CREATE TABLE `glpi_queuednotifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notificationtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `sent_try` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp NULL DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `name` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `sendername` text DEFAULT NULL,
  `recipient` text DEFAULT NULL,
  `recipientname` text DEFAULT NULL,
  `replyto` text DEFAULT NULL,
  `replytoname` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `body_text` longtext DEFAULT NULL,
  `messageid` text DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `mode` varchar(20) NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `event` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rackmodels`
--

CREATE TABLE `glpi_rackmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_racks`
--

CREATE TABLE `glpi_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `rackmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `racktypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `number_units` int(11) DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `dcrooms_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `room_orientation` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `max_power` int(11) NOT NULL DEFAULT 0,
  `mesured_power` int(11) NOT NULL DEFAULT 0,
  `max_weight` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_racktypes`
--

CREATE TABLE `glpi_racktypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_recurrentchanges`
--

CREATE TABLE `glpi_recurrentchanges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT 0,
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_refusedequipments`
--

CREATE TABLE `glpi_refusedequipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `rules_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `agents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_registeredids`
--

CREATE TABLE `glpi_registeredids` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `device_type` varchar(100) NOT NULL COMMENT 'USB, PCI ...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_reminders`
--

CREATE TABLE `glpi_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `is_planned` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `begin_view_date` timestamp NULL DEFAULT NULL,
  `end_view_date` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_reminders_users`
--

CREATE TABLE `glpi_reminders_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_remindertranslations`
--

CREATE TABLE `glpi_remindertranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(5) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_requesttypes`
--

CREATE TABLE `glpi_requesttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_helpdesk_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_followup_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_mail_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_mailfollowup_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_ticketheader` tinyint(4) NOT NULL DEFAULT 1,
  `is_itilfollowup` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_requesttypes`
--

INSERT INTO `glpi_requesttypes` (`id`, `name`, `is_helpdesk_default`, `is_followup_default`, `is_mail_default`, `is_mailfollowup_default`, `is_active`, `is_ticketheader`, `is_itilfollowup`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'Incident', 1, 1, 0, 0, 1, 1, 1, NULL, '2023-11-18 08:53:50', NULL),
(2, 'E-Mail', 0, 0, 1, 1, 1, 1, 1, NULL, NULL, NULL),
(3, 'Phone', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(4, 'Direct', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(5, 'Written', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(6, 'Other', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_reservationitems`
--

CREATE TABLE `glpi_reservationitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_reservations`
--

CREATE TABLE `glpi_reservations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reservationitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rssfeeds`
--

CREATE TABLE `glpi_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `refresh_rate` int(11) NOT NULL DEFAULT 86400,
  `max_items` int(11) NOT NULL DEFAULT 20,
  `have_error` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rssfeeds_users`
--

CREATE TABLE `glpi_rssfeeds_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ruleactions`
--

CREATE TABLE `glpi_ruleactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `rules_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_ruleactions`
--

INSERT INTO `glpi_ruleactions` (`id`, `rules_id`, `action_type`, `field`, `value`) VALUES
(1, 1, 'assign', '_inventory', '2'),
(2, 2, 'assign', '_inventory', '0'),
(3, 3, 'assign', '_inventory', '0'),
(4, 4, 'assign', '_inventory', '0'),
(5, 5, 'assign', '_inventory', '0'),
(6, 6, 'assign', '_inventory', '0'),
(7, 7, 'assign', '_inventory', '0'),
(8, 8, 'assign', '_inventory', '0'),
(9, 9, 'assign', '_inventory', '0'),
(10, 10, 'assign', '_inventory', '2'),
(11, 11, 'assign', '_inventory', '0'),
(12, 12, 'assign', '_inventory', '0'),
(13, 13, 'assign', '_inventory', '0'),
(14, 14, 'assign', '_inventory', '0'),
(15, 15, 'assign', '_inventory', '0'),
(16, 16, 'assign', '_inventory', '0'),
(17, 17, 'assign', '_inventory', '0'),
(18, 18, 'assign', '_inventory', '0'),
(19, 19, 'assign', '_inventory', '0'),
(20, 20, 'assign', '_inventory', '0'),
(21, 21, 'assign', '_inventory', '0'),
(22, 22, 'assign', '_inventory', '2'),
(23, 23, 'assign', '_inventory', '2'),
(24, 24, 'assign', '_inventory', '0'),
(25, 25, 'assign', '_inventory', '0'),
(26, 26, 'assign', '_inventory', '0'),
(27, 27, 'assign', '_inventory', '0'),
(28, 28, 'assign', '_inventory', '2'),
(29, 29, 'assign', '_inventory', '2'),
(30, 30, 'assign', '_inventory', '0'),
(31, 31, 'assign', '_inventory', '0'),
(32, 32, 'assign', '_inventory', '0'),
(33, 33, 'assign', '_inventory', '0'),
(34, 34, 'assign', '_inventory', '2'),
(35, 35, 'assign', '_inventory', '0'),
(36, 36, 'assign', '_inventory', '0'),
(37, 37, 'assign', '_inventory', '2'),
(38, 38, 'assign', '_inventory', '0'),
(39, 39, 'assign', '_inventory', '0'),
(40, 40, 'assign', '_inventory', '2'),
(41, 41, 'assign', '_inventory', '2'),
(42, 42, 'assign', '_inventory', '0'),
(43, 43, 'assign', '_inventory', '0'),
(44, 44, 'assign', '_inventory', '2'),
(45, 45, 'assign', '_inventory', '0'),
(46, 46, 'assign', '_inventory', '0'),
(47, 47, 'assign', '_inventory', '2'),
(48, 48, 'assign', '_inventory', '0'),
(49, 49, 'assign', '_inventory', '0'),
(50, 50, 'assign', '_inventory', '2'),
(51, 51, 'assign', '_inventory', '2'),
(52, 52, 'assign', '_inventory', '0'),
(53, 53, 'assign', '_inventory', '0'),
(54, 54, 'assign', '_inventory', '0'),
(55, 55, 'assign', '_inventory', '0'),
(56, 56, 'assign', '_inventory', '2'),
(57, 57, 'assign', '_inventory', '0'),
(58, 58, 'assign', '_inventory', '0'),
(59, 59, 'assign', '_inventory', '2'),
(60, 60, 'assign', '_inventory', '0'),
(61, 61, 'assign', '_inventory', '0'),
(62, 62, 'assign', '_inventory', '2'),
(63, 63, 'assign', 'entities_id', '0'),
(64, 64, 'assign', '_refuse_email_no_response', '1'),
(65, 65, 'assign', '_refuse_email_no_response', '1'),
(66, 66, 'assign', 'entities_id', '0'),
(67, 67, 'assign', '_import_category', '1'),
(68, 68, 'fromitem', 'locations_id', '1'),
(69, 69, 'fromuser', 'locations_id', '1'),
(70, 70, 'regex_result', '_affect_user_by_regex', '#0'),
(71, 71, 'regex_result', '_affect_user_by_regex', '#0'),
(72, 72, 'regex_result', '_affect_user_by_regex', '#0'),
(73, 73, 'append_regex_result', 'name', '#0'),
(74, 74, 'append_regex_result', 'name', '#1'),
(75, 75, 'append_regex_result', 'name', '#1 #2'),
(76, 76, 'append_regex_result', 'name', '#1'),
(77, 77, 'append_regex_result', 'name', '#2'),
(78, 78, 'append_regex_result', 'name', '#3'),
(79, 79, 'append_regex_result', 'name', '#2'),
(80, 80, 'append_regex_result', 'name', '#4'),
(81, 81, 'append_regex_result', 'name', '#4');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rulecriterias`
--

CREATE TABLE `glpi_rulecriterias` (
  `id` int(10) UNSIGNED NOT NULL,
  `rules_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_rulecriterias`
--

INSERT INTO `glpi_rulecriterias` (`id`, `rules_id`, `criteria`, `condition`, `pattern`) VALUES
(1, 1, 'partial', 0, '1'),
(2, 1, 'itemtype', 9, '1'),
(3, 2, 'itemtype', 9, '1'),
(4, 2, 'mac', 10, '1'),
(5, 2, 'mac', 8, '1'),
(6, 2, 'ifnumber', 10, '1'),
(7, 2, 'ifnumber', 8, '1'),
(8, 2, 'link_criteria_port', 203, '1'),
(9, 3, 'itemtype', 9, '1'),
(10, 3, 'mac', 10, '1'),
(11, 3, 'mac', 8, '1'),
(12, 3, 'ifnumber', 10, '1'),
(13, 3, 'ifnumber', 8, '1'),
(14, 4, 'itemtype', 9, '1'),
(15, 4, 'mac', 8, '1'),
(16, 4, 'ifnumber', 8, '1'),
(17, 5, 'itemtype', 9, '1'),
(18, 5, 'ip', 10, '1'),
(19, 5, 'ip', 8, '1'),
(20, 5, 'ifdescr', 10, '1'),
(21, 5, 'ifdescr', 8, '1'),
(22, 5, 'link_criteria_port', 203, '1'),
(23, 6, 'itemtype', 9, '1'),
(24, 6, 'ip', 10, '1'),
(25, 6, 'ip', 8, '1'),
(26, 6, 'ifdescr', 10, '1'),
(27, 6, 'ifdescr', 8, '1'),
(28, 7, 'itemtype', 9, '1'),
(29, 7, 'ip', 8, '1'),
(30, 7, 'ifdescr', 8, '1'),
(31, 8, 'itemtype', 9, '1'),
(32, 8, 'mac', 10, '1'),
(33, 8, 'mac', 8, '1'),
(34, 8, 'only_these_criteria', 204, '1'),
(35, 9, 'itemtype', 9, '1'),
(36, 9, 'mac', 8, '1'),
(37, 9, 'only_these_criteria', 204, '1'),
(38, 10, 'itemtype', 0, 'Computer'),
(39, 10, 'name', 9, '1'),
(40, 11, 'itemtype', 0, 'Computer'),
(41, 11, 'serial', 10, '1'),
(42, 11, 'serial', 8, '1'),
(43, 11, 'uuid', 10, '1'),
(44, 11, 'uuid', 8, '1'),
(45, 12, 'itemtype', 0, 'Computer'),
(46, 12, 'serial', 10, '1'),
(47, 12, 'serial', 8, '1'),
(48, 12, 'uuid', 30, '1'),
(49, 13, 'itemtype', 0, 'Computer'),
(50, 13, 'uuid', 8, '1'),
(51, 13, 'serial', 8, '1'),
(52, 14, 'itemtype', 0, 'Computer'),
(53, 14, 'serial', 10, '1'),
(54, 14, 'serial', 8, '1'),
(55, 15, 'itemtype', 0, 'Computer'),
(56, 15, 'uuid', 10, '1'),
(57, 15, 'uuid', 8, '1'),
(58, 16, 'itemtype', 0, 'Computer'),
(59, 16, 'mac', 10, '1'),
(60, 16, 'mac', 8, '1'),
(61, 17, 'itemtype', 0, 'Computer'),
(62, 17, 'name', 10, '1'),
(63, 17, 'name', 8, '1'),
(64, 18, 'itemtype', 0, 'Computer'),
(65, 18, 'serial', 8, '1'),
(66, 19, 'itemtype', 0, 'Computer'),
(67, 19, 'uuid', 8, '1'),
(68, 20, 'itemtype', 0, 'Computer'),
(69, 20, 'mac', 8, '1'),
(70, 21, 'itemtype', 0, 'Computer'),
(71, 21, 'name', 8, '1'),
(72, 22, 'itemtype', 0, 'Computer'),
(73, 23, 'itemtype', 0, 'Printer'),
(74, 23, 'name', 9, '1'),
(75, 24, 'itemtype', 0, 'Printer'),
(76, 24, 'serial', 8, '1'),
(77, 24, 'serial', 10, '1'),
(78, 25, 'itemtype', 0, 'Printer'),
(79, 25, 'mac', 8, '1'),
(80, 25, 'mac', 10, '1'),
(81, 26, 'itemtype', 0, 'Printer'),
(82, 26, 'serial', 8, '1'),
(83, 27, 'itemtype', 0, 'Printer'),
(84, 27, 'mac', 8, '1'),
(85, 28, 'itemtype', 0, 'Printer'),
(86, 29, 'itemtype', 0, 'NetworkEquipment'),
(87, 29, 'name', 9, '1'),
(88, 30, 'itemtype', 0, 'NetworkEquipment'),
(89, 30, 'serial', 8, '1'),
(90, 30, 'serial', 10, '1'),
(91, 31, 'itemtype', 0, 'NetworkEquipment'),
(92, 31, 'mac', 8, '1'),
(93, 31, 'mac', 10, '1'),
(94, 32, 'itemtype', 0, 'NetworkEquipment'),
(95, 32, 'serial', 8, '1'),
(96, 33, 'itemtype', 0, 'NetworkEquipment'),
(97, 33, 'mac', 8, '1'),
(98, 34, 'itemtype', 0, 'NetworkEquipment'),
(99, 35, 'itemtype', 0, 'Peripheral'),
(100, 35, 'serial', 8, '1'),
(101, 35, 'serial', 10, '1'),
(102, 36, 'itemtype', 0, 'Peripheral'),
(103, 36, 'serial', 8, '1'),
(104, 37, 'itemtype', 0, 'Peripheral'),
(105, 38, 'itemtype', 0, 'Monitor'),
(106, 38, 'serial', 8, '1'),
(107, 38, 'serial', 10, '1'),
(108, 39, 'itemtype', 0, 'Monitor'),
(109, 39, 'serial', 8, '1'),
(110, 40, 'itemtype', 0, 'Monitor'),
(111, 41, 'itemtype', 0, 'Phone'),
(112, 41, 'name', 9, '1'),
(113, 42, 'itemtype', 0, 'Phone'),
(114, 42, 'mac', 10, '1'),
(115, 42, 'mac', 8, '1'),
(116, 43, 'itemtype', 0, 'Phone'),
(117, 43, 'mac', 8, '1'),
(118, 44, 'itemtype', 0, 'Phone'),
(119, 45, 'itemtype', 0, 'Cluster'),
(120, 45, 'uuid', 8, '1'),
(121, 45, 'uuid', 10, '1'),
(122, 46, 'itemtype', 0, 'Cluster'),
(123, 46, 'uuid', 8, '1'),
(124, 47, 'itemtype', 0, 'Cluster'),
(125, 48, 'itemtype', 0, 'Enclosure'),
(126, 48, 'serial', 8, '1'),
(127, 48, 'serial', 10, '1'),
(128, 49, 'itemtype', 0, 'Enclosure'),
(129, 49, 'serial', 8, '1'),
(130, 50, 'itemtype', 0, 'Enclosure'),
(131, 51, 'name', 9, '1'),
(132, 52, 'serial', 8, '1'),
(133, 52, 'serial', 10, '1'),
(134, 53, 'mac', 8, '1'),
(135, 53, 'mac', 10, '1'),
(136, 54, 'serial', 8, '1'),
(137, 55, 'mac', 8, '1'),
(138, 56, 'itemtype', 0, ''),
(139, 57, 'itemtype', 0, 'DatabaseInstance'),
(140, 57, 'name', 8, '1'),
(141, 57, 'name', 10, '1'),
(142, 57, 'linked_item', 10, '1'),
(143, 58, 'itemtype', 0, 'DatabaseInstance'),
(144, 58, 'name', 8, '1'),
(145, 59, 'itemtype', 0, 'DatabaseInstance'),
(146, 60, 'itemtype', 0, 'Unmanaged'),
(147, 60, 'name', 8, '1'),
(148, 60, 'name', 10, '1'),
(149, 61, 'itemtype', 0, 'Unmanaged'),
(150, 61, 'name', 8, '1'),
(151, 62, 'itemtype', 0, 'Unmanaged'),
(152, 63, 'subject', 6, '/.*/'),
(153, 64, 'x-auto-response-suppress', 6, '/\\S+/'),
(154, 65, 'auto-submitted', 6, '/^(?!.*no).+$/i'),
(155, 66, 'TYPE', 0, '3'),
(156, 66, 'TYPE', 0, '2'),
(157, 67, 'name', 0, '*'),
(158, 68, 'locations_id', 9, '1'),
(159, 68, '_locations_id_of_item', 8, '1'),
(160, 69, 'locations_id', 9, '1'),
(161, 69, '_locations_id_of_requester', 8, '1'),
(162, 70, '_itemtype', 0, 'Computer'),
(163, 70, '_auto', 0, '1'),
(164, 70, 'contact', 6, '/(.*)@/'),
(165, 71, '_itemtype', 0, 'Computer'),
(166, 71, '_auto', 0, '1'),
(167, 71, 'contact', 6, '/(.*)[,|\\/]/'),
(168, 72, '_itemtype', 0, 'Computer'),
(169, 72, '_auto', 0, '1'),
(170, 72, 'contact', 6, '/(.*)/'),
(171, 73, 'os_name', 6, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:\\D+|)([\\d.]*) ?(?:\\(?([\\w ]+)\\)?)?/'),
(172, 74, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(173, 75, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/'),
(174, 76, 'os_name', 6, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/'),
(175, 77, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(176, 78, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/'),
(177, 79, 'os_name', 6, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/'),
(178, 80, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(179, 81, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rulematchedlogs`
--

CREATE TABLE `glpi_rulematchedlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `rules_id` int(10) UNSIGNED DEFAULT NULL,
  `agents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rulerightparameters`
--

CREATE TABLE `glpi_rulerightparameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_rulerightparameters`
--

INSERT INTO `glpi_rulerightparameters` (`id`, `name`, `value`, `comment`, `date_mod`, `date_creation`) VALUES
(1, '(LDAP)Organization', 'o', NULL, NULL, NULL),
(2, '(LDAP)Common Name', 'cn', NULL, NULL, NULL),
(3, '(LDAP)Department Number', 'departmentnumber', NULL, NULL, NULL),
(4, '(LDAP)Email', 'mail', NULL, NULL, NULL),
(5, 'Object Class', 'objectclass', NULL, NULL, NULL),
(6, '(LDAP)User ID', 'uid', NULL, NULL, NULL),
(7, '(LDAP)Telephone Number', 'phone', NULL, NULL, NULL),
(8, '(LDAP)Employee Number', 'employeenumber', NULL, NULL, NULL),
(9, '(LDAP)Manager', 'manager', NULL, NULL, NULL),
(10, '(LDAP)DistinguishedName', 'dn', NULL, NULL, NULL),
(12, '(AD)User ID', 'samaccountname', NULL, NULL, NULL),
(13, '(LDAP) Title', 'title', NULL, NULL, NULL),
(14, '(LDAP) MemberOf', 'memberof', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_rules`
--

CREATE TABLE `glpi_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sub_type` varchar(255) NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_rules`
--

INSERT INTO `glpi_rules` (`id`, `entities_id`, `sub_type`, `ranking`, `name`, `description`, `match`, `is_active`, `comment`, `date_mod`, `is_recursive`, `uuid`, `condition`, `date_creation`) VALUES
(1, 0, 'RuleImportAsset', 1, 'No creation on partial import', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_no_creation_on_partial_import', 0, '2023-11-18 08:20:25'),
(2, 0, 'RuleImportAsset', 2, 'Global update (by mac+ifnumber restricted port)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_update_mac_ifnumber_restricted_port', 0, '2023-11-18 08:20:25'),
(3, 0, 'RuleImportAsset', 3, 'Global update (by mac+ifnumber not restricted port)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_update_mac_ifnumber_no_restricted_port', 0, '2023-11-18 08:20:25'),
(4, 0, 'RuleImportAsset', 4, 'Global import (by mac+ifnumber)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_import_mac_ifnumber', 0, '2023-11-18 08:20:25'),
(5, 0, 'RuleImportAsset', 5, 'Global update (by ip+ifdescr restricted port)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_update_mac_ifdescr_restricted_port', 0, '2023-11-18 08:20:25'),
(6, 0, 'RuleImportAsset', 6, 'Global update (by ip+ifdescr not restricted port)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_update_ip_ifdescr_no_restricted_port', 0, '2023-11-18 08:20:25'),
(7, 0, 'RuleImportAsset', 7, 'Global import (by ip+ifdescr)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_import_ip_ifdescr', 0, '2023-11-18 08:20:25'),
(8, 0, 'RuleImportAsset', 8, 'Update only mac address (mac on switch port)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_update_only_mac_adress', 0, '2023-11-18 08:20:25'),
(9, 0, 'RuleImportAsset', 9, 'Import only mac address (mac on switch port)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_import_only_mac_adress', 0, '2023-11-18 08:20:25'),
(10, 0, 'RuleImportAsset', 10, 'Computer constraint (name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_constraint_name', 0, '2023-11-18 08:20:25'),
(11, 0, 'RuleImportAsset', 11, 'Computer update (by serial + uuid)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_update_serial_uuid', 0, '2023-11-18 08:20:25'),
(12, 0, 'RuleImportAsset', 12, 'Computer update (by serial + uuid is empty in GLPI)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_update_serial_uuid_empty', 0, '2023-11-18 08:20:25'),
(13, 0, 'RuleImportAsset', 13, 'Computer import (by serial + uuid)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_import_serial_uuid', 0, '2023-11-18 08:20:25'),
(14, 0, 'RuleImportAsset', 14, 'Computer update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_update_serial', 0, '2023-11-18 08:20:25'),
(15, 0, 'RuleImportAsset', 15, 'Computer update (by uuid)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_update_uuid', 0, '2023-11-18 08:20:25'),
(16, 0, 'RuleImportAsset', 16, 'Computer update (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_update_mac', 0, '2023-11-18 08:20:25'),
(17, 0, 'RuleImportAsset', 17, 'Computer update (by name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_update_name', 0, '2023-11-18 08:20:25'),
(18, 0, 'RuleImportAsset', 18, 'Computer import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_import_serial', 0, '2023-11-18 08:20:25'),
(19, 0, 'RuleImportAsset', 19, 'Computer import (by uuid)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_import_uuid', 0, '2023-11-18 08:20:25'),
(20, 0, 'RuleImportAsset', 20, 'Computer import (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_import_mac', 0, '2023-11-18 08:20:25'),
(21, 0, 'RuleImportAsset', 21, 'Computer import (by name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_import_name', 0, '2023-11-18 08:20:25'),
(22, 0, 'RuleImportAsset', 22, 'Computer import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_computer_import_denied', 0, '2023-11-18 08:20:25'),
(23, 0, 'RuleImportAsset', 23, 'Printer constraint (name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_printer_constraint_name', 0, '2023-11-18 08:20:25'),
(24, 0, 'RuleImportAsset', 24, 'Printer update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_printer_update_serial', 0, '2023-11-18 08:20:25'),
(25, 0, 'RuleImportAsset', 25, 'Printer update (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_printer_update_mac', 0, '2023-11-18 08:20:25'),
(26, 0, 'RuleImportAsset', 26, 'Printer import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_printer_import_serial', 0, '2023-11-18 08:20:25'),
(27, 0, 'RuleImportAsset', 27, 'Printer import (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_printer_import_mac', 0, '2023-11-18 08:20:25'),
(28, 0, 'RuleImportAsset', 28, 'Printer import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_printer_import_denied', 0, '2023-11-18 08:20:25'),
(29, 0, 'RuleImportAsset', 29, 'NetworkEquipment constraint (name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_networkequipment_constraint_name', 0, '2023-11-18 08:20:25'),
(30, 0, 'RuleImportAsset', 30, 'NetworkEquipment update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_networkequipment_update_serial', 0, '2023-11-18 08:20:25'),
(31, 0, 'RuleImportAsset', 31, 'NetworkEquipment update (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_networkequipment_update_mac', 0, '2023-11-18 08:20:25'),
(32, 0, 'RuleImportAsset', 32, 'NetworkEquipment import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_networkequipment_import_serial', 0, '2023-11-18 08:20:25'),
(33, 0, 'RuleImportAsset', 33, 'NetworkEquipment import (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_networkequipment_import_mac', 0, '2023-11-18 08:20:25'),
(34, 0, 'RuleImportAsset', 34, 'NetworkEquipment import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_networkequipment_import_denied', 0, '2023-11-18 08:20:25'),
(35, 0, 'RuleImportAsset', 35, 'Device update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_device_update_serial', 0, '2023-11-18 08:20:25'),
(36, 0, 'RuleImportAsset', 36, 'Device import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_device_importe_serial', 0, '2023-11-18 08:20:25'),
(37, 0, 'RuleImportAsset', 37, 'Device import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_device_import_denied', 0, '2023-11-18 08:20:25'),
(38, 0, 'RuleImportAsset', 38, 'Monitor update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_monitor_update_serial', 0, '2023-11-18 08:20:25'),
(39, 0, 'RuleImportAsset', 39, 'Monitor import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_monitor_import_serial', 0, '2023-11-18 08:20:25'),
(40, 0, 'RuleImportAsset', 40, 'Monitor import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_monitor_import_denied', 0, '2023-11-18 08:20:25'),
(41, 0, 'RuleImportAsset', 41, 'Phone constraint (name)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_phone_constraint_name', 0, '2023-11-18 08:20:25'),
(42, 0, 'RuleImportAsset', 42, 'Phone update (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_phone_update_mac', 0, '2023-11-18 08:20:25'),
(43, 0, 'RuleImportAsset', 43, 'Phone import (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_phone_import_mac', 0, '2023-11-18 08:20:25'),
(44, 0, 'RuleImportAsset', 44, 'Phone import denied', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_phone_import_denied', 0, '2023-11-18 08:20:25'),
(45, 0, 'RuleImportAsset', 45, 'Cluster update (by uuid)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_cluster_update_uuid', 0, '2023-11-18 08:20:25'),
(46, 0, 'RuleImportAsset', 46, 'Cluster import (by uuid)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_cluster_import_uuid', 0, '2023-11-18 08:20:25'),
(47, 0, 'RuleImportAsset', 47, 'Cluster import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_cluster_import_denied', 0, '2023-11-18 08:20:25'),
(48, 0, 'RuleImportAsset', 48, 'Enclosure update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_enclosure_update_serial', 0, '2023-11-18 08:20:25'),
(49, 0, 'RuleImportAsset', 49, 'Enclosure import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_enclosure_import_serial', 0, '2023-11-18 08:20:25'),
(50, 0, 'RuleImportAsset', 50, 'Enclosure import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_enclosure_import_denied', 0, '2023-11-18 08:20:25'),
(51, 0, 'RuleImportAsset', 51, 'Global constraint (name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_constraint_name', 0, '2023-11-18 08:20:25'),
(52, 0, 'RuleImportAsset', 52, 'Global update (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_update_serial', 0, '2023-11-18 08:20:25'),
(53, 0, 'RuleImportAsset', 53, 'Global update (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_update_mac', 0, '2023-11-18 08:20:25'),
(54, 0, 'RuleImportAsset', 54, 'Global import (by serial)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_import_serial', 0, '2023-11-18 08:20:25'),
(55, 0, 'RuleImportAsset', 55, 'Global import (by mac)', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_import_mac', 0, '2023-11-18 08:20:25'),
(56, 0, 'RuleImportAsset', 56, 'Global import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_global_import_denied', 0, '2023-11-18 08:20:25'),
(57, 0, 'RuleImportAsset', 57, 'Database update (by name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_database_update_name', 0, '2023-11-18 08:20:25'),
(58, 0, 'RuleImportAsset', 58, 'Database import (by name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_database_import_name', 0, '2023-11-18 08:20:25'),
(59, 0, 'RuleImportAsset', 59, 'Database import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_database_import_denied', 0, '2023-11-18 08:20:25'),
(60, 0, 'RuleImportAsset', 60, 'Unmanaged update (by name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_unmanaged_update_name', 0, '2023-11-18 08:20:25'),
(61, 0, 'RuleImportAsset', 61, 'Unmanaged import (by name)', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_unmanaged_import_name', 0, '2023-11-18 08:20:25'),
(62, 0, 'RuleImportAsset', 62, 'Unmanaged import denied', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_import_asset_unmanaged_import_denied', 0, '2023-11-18 08:20:25'),
(63, 0, 'RuleMailCollector', 3, 'Root', '', 'OR', 1, '', '2023-11-18 08:20:25', 0, 'glpi_rule_mail_collector_root', 0, '2023-11-18 08:20:25'),
(64, 0, 'RuleMailCollector', 1, 'X-Auto-Response-Suppress', 'Exclude Auto-Reply emails using X-Auto-Response-Suppress header', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_mail_collector_x_auto_response_suppress', 0, '2023-11-18 08:20:25'),
(65, 0, 'RuleMailCollector', 2, 'Auto-Reply Auto-Submitted', 'Exclude Auto-Reply emails using Auto-Submitted header', 'OR', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_mail_collector_auto_reply_auto_submitted', 0, '2023-11-18 08:20:25'),
(66, 0, 'RuleRight', 1, 'Root', '', 'OR', 1, '', '2023-11-18 08:20:25', 0, 'glpi_rule_right_root', 0, '2023-11-18 08:20:25'),
(67, 0, 'RuleSoftwareCategory', 1, 'Import category from inventory tool', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_rule_software_category_import_category_from_inventory_tool', 1, '2023-11-18 08:20:25'),
(68, 0, 'RuleTicket', 1, 'Ticket location from item', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_rule_ticket_location_from_item', 1, '2023-11-18 08:20:25'),
(69, 0, 'RuleTicket', 2, 'Ticket location from user', '', 'AND', 0, '', '2023-11-18 08:20:25', 1, 'glpi_rule_rule_ticket_location_from_user', 1, '2023-11-18 08:20:25'),
(70, 0, 'RuleAsset', 1, 'Domain user assignation', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_rule_asset_domain_user_assignation', 3, '2023-11-18 08:20:25'),
(71, 0, 'RuleAsset', 2, 'Multiple users: assign to the first', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_rule_asset_multiple_user_assign_to_first', 3, '2023-11-18 08:20:25'),
(72, 0, 'RuleAsset', 3, 'One user assignation', '', 'AND', 1, '', '2023-11-18 08:20:25', 1, 'glpi_rule_rule_asset_one_user_assignation', 3, '2023-11-18 08:20:25'),
(73, 0, 'RuleDictionnaryOperatingSystem', 1, 'Clean Linux OS Name', '', 'AND', 0, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:\\D+|)([\\d.]*) ?(?:\\(?([\\w ]+)\\)?)?/\n\n            Example :\n            Ubuntu 22.04.1 LTS -&#62; #0 = Ubuntu\n            SUSE Linux Enterprise Server 11 (x86_64)  -&#62;#0 = SUSE\n            SunOS -&#62; #0 = SunOS\n            Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #0 = Red Hat\n            Oracle Linux Server release 7.3 -&#62; #0 = Oracle\n            Fedora release 36 (Thirty Six) -&#62; #0 = Fedora\n            Debian GNU/Linux 9.5 (stretch) -&#62; #0 = Debian\n            CentOS Stream release 8 -&#62; #0 = CentOS\n            AlmaLinux 9.0 (Emerald Puma) -&#62; #0 = AlmaLinux\n            Amazon Linux 2023 -&#62; #0 = Amazon Linux', '2023-11-18 08:20:25', 1, 'clean_linux_os_name', 0, '2023-11-18 08:20:25'),
(74, 0, 'RuleDictionnaryOperatingSystem', 2, 'Clean Windows OS Name', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n            Example :\n            Microsoft Windows XP Professionnel -&#62; #1 : Windows\n            Microsoft Windows 7 Enterprise  -&#62; #1 : Windows\n            Microsoft® Windows Vista Professionnel  -&#62; #1 : Windows\n            Microsoft Windows XP Édition familiale  -&#62; #1 : Windows\n            Microsoft Windows 10 Entreprise  -&#62; #1 : Windows\n            Microsoft Windows 10 Professionnel  -&#62; #1 : Windows\n            Microsoft Windows 11 Professionnel  -&#62; #1 : Windows', '2023-11-18 08:20:25', 1, 'clean_windows_os_name', 0, '2023-11-18 08:20:25'),
(75, 0, 'RuleDictionnaryOperatingSystem', 3, 'Clean Windows Server OS Name', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n            Example :\n            Microsoft Windows Server 2012 R2 Datacenter -&#62; #1 #2 : Windows Server\n            Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #1 #2 : Windows Server\n            Microsoft Hyper-V Server 2012 R2 -&#62; #1 #2 : Hyper-V Server\n            Microsoft® Windows Server® 2008 Standard -&#62; #1 #2 : Windows Server', '2023-11-18 08:20:25', 1, 'clean_windows_server_os_name', 0, '2023-11-18 08:20:25'),
(76, 0, 'RuleDictionnaryOperatingSystemVersion', 1, 'Clean Linux OS Version', '', 'AND', 0, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/\n\n            Example :\n            Ubuntu 22.04.1 LTS -&#62; #1 = 22.04.1\n            SUSE Linux Enterprise Server 11 (x86_64) -&#62; #1 =  11\n            SunOS 5.10 -&#62; #1 = 5.10\n            Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #1 = 7.9\n            Oracle Linux Server release 7.3 -&#62; #1 = 7.3\n            Fedora release 36 (Thirty Six) -&#62; #1 =  36\n            Debian GNU/Linux 9.5 (stretch) -&#62; #1 = 9.5\n            CentOS release 6.9 (Final) -&#62; #1 = 6.9\n            AlmaLinux 9.0 (Emerald Puma) -&#62; #1 = 9.0', '2023-11-18 08:20:25', 1, 'clean_linux_os_version', 0, '2023-11-18 08:20:25'),
(77, 0, 'RuleDictionnaryOperatingSystemVersion', 2, 'Clean Windows OS Version', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n            Example :\n            Microsoft Windows XP Professionnel -&#62; #2 : XP\n            Microsoft Windows 7 Enterprise  -&#62; #2 : 7\n            Microsoft® Windows Vista Professionnel  -&#62; #2 : Vista\n            Microsoft Windows XP Édition familiale  -&#62; #2 : XP\n            Microsoft Windows 10 Entreprise  -&#62; #2 : 10\n            Microsoft Windows 10 Professionnel  -&#62; #2 : 10\n            Microsoft Windows 11 Professionnel  -&#62; #2 : 11', '2023-11-18 08:20:25', 1, 'clean_windows_os_version', 0, '2023-11-18 08:20:25'),
(78, 0, 'RuleDictionnaryOperatingSystemVersion', 3, 'Clean Windows Server OS Version', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n            Example :\n            Microsoft Windows Server 2012 R2 Datacenter -&#62; #3 : 2012 R2\n            Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #3 : 2003\n            Microsoft Hyper-V Server 2012 R2 -&#62; #3 : 2012 R2\n            Microsoft® Windows Server® 2008 Standard -&#62; #3 : 2008', '2023-11-18 08:20:25', 1, 'clean_windows_server_os_version', 0, '2023-11-18 08:20:25'),
(79, 0, 'RuleDictionnaryOperatingSystemEdition', 1, 'Clean Linux OS Edition', '', 'AND', 0, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/\n\n        Example :\n        Ubuntu 22.04.1 LTS -&#62; #2 = LTS\n        SUSE Linux Enterprise Server 11 (x86_64) -&#62; #2 = x86_64\n        Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #2 = Maipo\n        Red Hat Enterprise Linux Server release 6.10 (Santiago) -&#62; #2 = Santiago\n        Fedora release 36 (Thirty Six) -&#62; #2 = Thirty Six\n        Debian GNU/Linux 9.5 (stretch) -&#62; #2 = stretch\n        Debian GNU/Linux 8.9 (jessie) -&#62; #2 = jessie\n        CentOS Linux release 7.2.1511 (Core) -&#62; #2 = Core\n        AlmaLinux 9.0 (Emerald Puma) -&#62; #2 = Emerald Puma\n        AlmaLinux 8.6 (Sky Tiger) -&#62; #2 = Sky Tiger', '2023-11-18 08:20:25', 1, 'clean_linux_os_edition', 0, '2023-11-18 08:20:25'),
(80, 0, 'RuleDictionnaryOperatingSystemEdition', 2, 'Clean Windows OS Edition', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n        Example :\n        Microsoft Windows XP Professionnel -&#62; #4 : Professionnel\n        Microsoft Windows 7 Enterprise  -&#62; #4 : Enterprise\n        Microsoft® Windows Vista Professionnel  -&#62; #4 : Professionnel\n        Microsoft Windows XP Édition familiale  -&#62; #4 : Édition familiale\n        Microsoft Windows 10 Entreprise  -&#62; #4 : Entreprise\n        Microsoft Windows 10 Professionnel  -&#62; #4 : Professionnel\n        Microsoft Windows 11 Professionnel  -&#62; #4 : Professionnel', '2023-11-18 08:20:25', 1, 'clean_windows_os_edition', 0, '2023-11-18 08:20:25'),
(81, 0, 'RuleDictionnaryOperatingSystemEdition', 3, 'Clean Windows Server OS Edition', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n        Example :\n        Microsoft Windows Server 2012 R2 Datacenter -&#62; #4 : Datacenter\n        Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #4 : Standard\n        Microsoft Hyper-V Server 2012 R2 -&#62; #4 :\n        Microsoft® Windows Server® 2008 Standard -&#62; #4: Standard', '2023-11-18 08:20:25', 1, 'clean_windows_server_os_edition', 0, '2023-11-18 08:20:25'),
(82, 0, 'RuleImportEntity', 1, 'SLA', '', 'AND', 1, '', '2023-11-18 16:11:19', 0, '9e00622c-e509fb39-6558e2274d2997.90742859', 0, '2023-11-18 16:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_savedsearches`
--

CREATE TABLE `glpi_savedsearches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'see SavedSearch:: constants',
  `itemtype` varchar(100) NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `query` text DEFAULT NULL,
  `last_execution_time` int(11) DEFAULT NULL,
  `do_count` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'Do or do not count results on list display see SavedSearch::COUNT_* constants',
  `last_execution_date` timestamp NULL DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_savedsearches_alerts`
--

CREATE TABLE `glpi_savedsearches_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `savedsearches_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `operator` tinyint(4) NOT NULL,
  `value` int(11) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `frequency` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_savedsearches_users`
--

CREATE TABLE `glpi_savedsearches_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `savedsearches_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_slalevelactions`
--

CREATE TABLE `glpi_slalevelactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `slalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_slalevelactions`
--

INSERT INTO `glpi_slalevelactions` (`id`, `slalevels_id`, `action_type`, `field`, `value`) VALUES
(5, 9, 'send', 'recall', '1'),
(6, 10, 'send', 'recall', '1');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_slalevelcriterias`
--

CREATE TABLE `glpi_slalevelcriterias` (
  `id` int(10) UNSIGNED NOT NULL,
  `slalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_slalevelcriterias`
--

INSERT INTO `glpi_slalevelcriterias` (`id`, `slalevels_id`, `criteria`, `condition`, `pattern`) VALUES
(10, 9, 'slas_id_tto', 0, '7'),
(11, 9, '_users_id_assign', 9, '1'),
(12, 10, 'slas_id_ttr', 0, '8'),
(13, 10, '_users_id_assign', 9, '1');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_slalevels`
--

CREATE TABLE `glpi_slalevels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slas_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_slalevels`
--

INSERT INTO `glpi_slalevels` (`id`, `name`, `slas_id`, `execution_time`, `is_active`, `entities_id`, `is_recursive`, `match`, `uuid`) VALUES
(9, 'TTO', 7, 0, 1, 0, 0, 'AND', '8b7d7fa5-e509fb39-655c7ff2818c25.07471289'),
(10, 'TTR', 8, 0, 1, 0, 0, 'AND', '8b7d7fa5-e509fb39-655c827b4a65d6.94210766');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_slalevels_tickets`
--

CREATE TABLE `glpi_slalevels_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_slalevels_tickets`
--

INSERT INTO `glpi_slalevels_tickets` (`id`, `tickets_id`, `slalevels_id`, `date`) VALUES
(539, 656, 10, '2023-11-22 00:53:56'),
(541, 657, 10, '2023-11-22 01:00:04'),
(543, 658, 10, '2023-11-22 01:06:20'),
(545, 659, 10, '2023-11-22 01:25:50'),
(547, 660, 10, '2023-11-22 01:28:36'),
(549, 661, 10, '2023-11-22 01:31:05'),
(551, 662, 10, '2023-11-22 01:33:41'),
(553, 663, 10, '2023-11-22 01:35:43'),
(555, 664, 10, '2023-11-22 01:37:05'),
(557, 665, 10, '2023-11-22 01:39:00'),
(559, 666, 10, '2023-11-22 01:39:34'),
(561, 667, 10, '2023-11-22 01:39:36'),
(563, 668, 10, '2023-11-22 01:40:06'),
(565, 669, 10, '2023-11-22 01:40:35'),
(567, 670, 10, '2023-11-22 01:40:38'),
(569, 671, 10, '2023-11-22 01:41:08'),
(571, 672, 10, '2023-11-22 01:41:30'),
(573, 673, 10, '2023-11-22 01:41:38'),
(575, 674, 10, '2023-11-22 01:41:40'),
(577, 675, 10, '2023-11-22 01:42:08'),
(579, 676, 10, '2023-11-22 01:42:42'),
(581, 677, 10, '2023-11-22 01:42:44'),
(583, 678, 10, '2023-11-22 01:43:08'),
(585, 679, 10, '2023-11-22 01:43:35'),
(587, 680, 10, '2023-11-22 01:43:46'),
(589, 681, 10, '2023-11-22 01:44:08'),
(591, 682, 10, '2023-11-22 01:44:10'),
(593, 683, 10, '2023-11-22 01:44:34'),
(595, 684, 10, '2023-11-22 01:45:04'),
(597, 685, 10, '2023-11-22 01:45:31'),
(599, 686, 10, '2023-11-22 01:45:31'),
(601, 687, 10, '2023-11-22 01:45:58'),
(603, 688, 10, '2023-11-22 01:46:29'),
(605, 689, 10, '2023-11-22 01:59:58'),
(607, 690, 10, '2023-11-22 02:02:41'),
(609, 691, 10, '2023-11-22 02:05:27'),
(611, 692, 10, '2023-11-22 02:09:48'),
(613, 693, 10, '2023-11-22 02:15:54'),
(615, 694, 10, '2023-11-22 02:18:47'),
(617, 695, 10, '2023-11-22 02:21:33'),
(619, 696, 10, '2023-11-22 02:24:11'),
(621, 697, 10, '2023-11-22 02:31:05'),
(623, 698, 10, '2023-11-22 02:31:11'),
(625, 699, 10, '2023-11-22 02:31:27'),
(627, 700, 10, '2023-11-22 02:37:46'),
(629, 701, 10, '2023-11-22 02:40:31'),
(631, 702, 10, '2023-11-22 02:40:33'),
(633, 703, 10, '2023-11-22 02:43:12'),
(635, 704, 10, '2023-11-22 02:45:56'),
(637, 705, 10, '2023-11-22 02:48:35'),
(639, 706, 10, '2023-11-22 02:51:22'),
(640, 706, 9, '2023-11-22 00:51:22'),
(641, 707, 10, '2023-11-22 03:13:22'),
(642, 707, 9, '2023-11-22 01:13:22'),
(643, 708, 10, '2023-11-22 03:59:07'),
(644, 708, 9, '2023-11-22 01:59:07'),
(645, 709, 10, '2023-11-22 03:59:08'),
(646, 709, 9, '2023-11-22 01:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_slas`
--

CREATE TABLE `glpi_slas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `number_time` int(11) NOT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_slas`
--

INSERT INTO `glpi_slas` (`id`, `name`, `entities_id`, `is_recursive`, `type`, `comment`, `number_time`, `use_ticket_calendar`, `calendars_id`, `date_mod`, `definition_time`, `end_of_working_day`, `date_creation`, `slms_id`) VALUES
(7, 'TTO', 0, 0, 1, '', 2, 0, 3, '2023-11-21 12:40:04', 'hour', 0, '2023-11-21 10:00:43', 5),
(8, 'TTR', 0, 0, 0, '', 4, 0, 3, '2023-11-21 12:40:20', 'hour', 0, '2023-11-21 10:01:03', 5);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_slms`
--

CREATE TABLE `glpi_slms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_slms`
--

INSERT INTO `glpi_slms` (`id`, `name`, `entities_id`, `is_recursive`, `comment`, `use_ticket_calendar`, `calendars_id`, `date_mod`, `date_creation`) VALUES
(5, 'SLA', 0, 0, '', 0, 3, '2023-11-21 10:00:17', '2023-11-21 10:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_snmpcredentials`
--

CREATE TABLE `glpi_snmpcredentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `snmpversion` varchar(8) NOT NULL DEFAULT '1',
  `community` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `auth_passphrase` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `priv_passphrase` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_snmpcredentials`
--

INSERT INTO `glpi_snmpcredentials` (`id`, `name`, `snmpversion`, `community`, `username`, `authentication`, `auth_passphrase`, `encryption`, `priv_passphrase`, `is_deleted`) VALUES
(1, 'Public community v1', '1', 'public', NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Public community v2c', '2', 'public', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_socketmodels`
--

CREATE TABLE `glpi_socketmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_sockets`
--

CREATE TABLE `glpi_sockets` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `socketmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wiring_side` tinyint(4) DEFAULT 1,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_softwarecategories`
--

CREATE TABLE `glpi_softwarecategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `softwarecategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_softwarecategories`
--

INSERT INTO `glpi_softwarecategories` (`id`, `name`, `comment`, `softwarecategories_id`, `completename`, `level`, `ancestors_cache`, `sons_cache`) VALUES
(1, 'Inventoried', NULL, 0, 'Software from inventories', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_softwarelicenses`
--

CREATE TABLE `glpi_softwarelicenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `softwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `softwarelicenses_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL DEFAULT 0,
  `softwarelicensetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `softwareversions_id_buy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `softwareversions_id_use` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expire` date DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_valid` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `allow_overquota` tinyint(4) NOT NULL DEFAULT 0,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_softwarelicensetypes`
--

CREATE TABLE `glpi_softwarelicensetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `softwarelicensetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_softwarelicensetypes`
--

INSERT INTO `glpi_softwarelicensetypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`, `softwarelicensetypes_id`, `level`, `ancestors_cache`, `sons_cache`, `entities_id`, `is_recursive`, `completename`) VALUES
(1, 'OEM', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 1, 'OEM');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_softwares`
--

CREATE TABLE `glpi_softwares` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_update` tinyint(4) NOT NULL DEFAULT 0,
  `softwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `softwarecategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_valid` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_softwareversions`
--

CREATE TABLE `glpi_softwareversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `softwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `arch` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `operatingsystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_solutiontemplates`
--

CREATE TABLE `glpi_solutiontemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `solutiontypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_solutiontypes`
--

CREATE TABLE `glpi_solutiontypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ssovariables`
--

CREATE TABLE `glpi_ssovariables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_ssovariables`
--

INSERT INTO `glpi_ssovariables` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'HTTP_AUTH_USER', NULL, NULL, NULL),
(2, 'REMOTE_USER', NULL, NULL, NULL),
(3, 'PHP_AUTH_USER', NULL, NULL, NULL),
(4, 'USERNAME', NULL, NULL, NULL),
(5, 'REDIRECT_REMOTE_USER', NULL, NULL, NULL),
(6, 'HTTP_REMOTE_USER', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_states`
--

CREATE TABLE `glpi_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_visible_computer` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_monitor` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_networkequipment` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_peripheral` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_phone` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_printer` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_softwareversion` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_softwarelicense` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_line` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_certificate` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_rack` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_passivedcequipment` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_enclosure` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_pdu` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_cluster` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_contract` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_appliance` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_databaseinstance` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_cable` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_suppliers`
--

CREATE TABLE `glpi_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `suppliertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_suppliers_tickets`
--

CREATE TABLE `glpi_suppliers_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 1,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_suppliertypes`
--

CREATE TABLE `glpi_suppliertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_taskcategories`
--

CREATE TABLE `glpi_taskcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_helpdeskvisible` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tasktemplates`
--

CREATE TABLE `glpi_tasktemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ticketcosts`
--

CREATE TABLE `glpi_ticketcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ticketrecurrents`
--

CREATE TABLE `glpi_ticketrecurrents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT 0,
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickets`
--

CREATE TABLE `glpi_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `takeintoaccountdate` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `users_id_recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `requesttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `global_validation` int(11) NOT NULL DEFAULT 1,
  `slas_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slas_id_tto` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slalevels_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `time_to_own` timestamp NULL DEFAULT NULL,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `sla_waiting_duration` int(11) NOT NULL DEFAULT 0,
  `ola_waiting_duration` int(11) NOT NULL DEFAULT 0,
  `olas_id_tto` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `olas_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `olalevels_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ola_tto_begin_date` timestamp NULL DEFAULT NULL,
  `ola_ttr_begin_date` timestamp NULL DEFAULT NULL,
  `internal_time_to_resolve` timestamp NULL DEFAULT NULL,
  `internal_time_to_own` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `takeintoaccount_delay_stat` int(11) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `validation_percent` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ticketsatisfactions`
--

CREATE TABLE `glpi_ticketsatisfactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_answered` timestamp NULL DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickets_contracts`
--

CREATE TABLE `glpi_tickets_contracts` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickets_tickets`
--

CREATE TABLE `glpi_tickets_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `link` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickets_users`
--

CREATE TABLE `glpi_tickets_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 1,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_tickets_users`
--

INSERT INTO `glpi_tickets_users` (`id`, `tickets_id`, `users_id`, `type`, `use_notification`, `alternative_email`) VALUES
(1, 23, 2, 1, 1, ''),
(2, 23, 2, 2, 1, ''),
(3, 24, 2, 1, 1, ''),
(4, 24, 2, 2, 1, ''),
(5, 25, 2, 1, 1, ''),
(6, 25, 2, 2, 1, ''),
(7, 276, 4, 2, 0, ''),
(8, 290, 5, 2, 0, ''),
(9, 291, 2, 1, 1, ''),
(10, 293, 2, 1, 1, ''),
(11, 370, 2, 1, 1, ''),
(12, 370, 2, 2, 1, ''),
(13, 385, 2, 1, 1, ''),
(14, 385, 2, 2, 1, ''),
(15, 386, 2, 1, 1, ''),
(16, 388, 2, 1, 1, ''),
(17, 388, 2, 2, 1, ''),
(18, 389, 2, 1, 1, ''),
(19, 389, 2, 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickettasks`
--

CREATE TABLE `glpi_tickettasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `sourceitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sourceof_items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickettemplatehiddenfields`
--

CREATE TABLE `glpi_tickettemplatehiddenfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickettemplatemandatoryfields`
--

CREATE TABLE `glpi_tickettemplatemandatoryfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_tickettemplatemandatoryfields`
--

INSERT INTO `glpi_tickettemplatemandatoryfields` (`id`, `tickettemplates_id`, `num`) VALUES
(1, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickettemplatepredefinedfields`
--

CREATE TABLE `glpi_tickettemplatepredefinedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_tickettemplates`
--

CREATE TABLE `glpi_tickettemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_tickettemplates`
--

INSERT INTO `glpi_tickettemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_ticketvalidations`
--

CREATE TABLE `glpi_ticketvalidations` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_validate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_submission` text DEFAULT NULL,
  `comment_validation` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_transfers`
--

CREATE TABLE `glpi_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keep_ticket` int(11) NOT NULL DEFAULT 0,
  `keep_networklink` int(11) NOT NULL DEFAULT 0,
  `keep_reservation` int(11) NOT NULL DEFAULT 0,
  `keep_history` int(11) NOT NULL DEFAULT 0,
  `keep_device` int(11) NOT NULL DEFAULT 0,
  `keep_infocom` int(11) NOT NULL DEFAULT 0,
  `keep_dc_monitor` int(11) NOT NULL DEFAULT 0,
  `clean_dc_monitor` int(11) NOT NULL DEFAULT 0,
  `keep_dc_phone` int(11) NOT NULL DEFAULT 0,
  `clean_dc_phone` int(11) NOT NULL DEFAULT 0,
  `keep_dc_peripheral` int(11) NOT NULL DEFAULT 0,
  `clean_dc_peripheral` int(11) NOT NULL DEFAULT 0,
  `keep_dc_printer` int(11) NOT NULL DEFAULT 0,
  `clean_dc_printer` int(11) NOT NULL DEFAULT 0,
  `keep_supplier` int(11) NOT NULL DEFAULT 0,
  `clean_supplier` int(11) NOT NULL DEFAULT 0,
  `keep_contact` int(11) NOT NULL DEFAULT 0,
  `clean_contact` int(11) NOT NULL DEFAULT 0,
  `keep_contract` int(11) NOT NULL DEFAULT 0,
  `clean_contract` int(11) NOT NULL DEFAULT 0,
  `keep_software` int(11) NOT NULL DEFAULT 0,
  `clean_software` int(11) NOT NULL DEFAULT 0,
  `keep_document` int(11) NOT NULL DEFAULT 0,
  `clean_document` int(11) NOT NULL DEFAULT 0,
  `keep_cartridgeitem` int(11) NOT NULL DEFAULT 0,
  `clean_cartridgeitem` int(11) NOT NULL DEFAULT 0,
  `keep_cartridge` int(11) NOT NULL DEFAULT 0,
  `keep_consumable` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `keep_disk` int(11) NOT NULL DEFAULT 0,
  `keep_certificate` int(11) NOT NULL DEFAULT 0,
  `clean_certificate` int(11) NOT NULL DEFAULT 0,
  `lock_updated_fields` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_transfers`
--

INSERT INTO `glpi_transfers` (`id`, `name`, `keep_ticket`, `keep_networklink`, `keep_reservation`, `keep_history`, `keep_device`, `keep_infocom`, `keep_dc_monitor`, `clean_dc_monitor`, `keep_dc_phone`, `clean_dc_phone`, `keep_dc_peripheral`, `clean_dc_peripheral`, `keep_dc_printer`, `clean_dc_printer`, `keep_supplier`, `clean_supplier`, `keep_contact`, `clean_contact`, `keep_contract`, `clean_contract`, `keep_software`, `clean_software`, `keep_document`, `clean_document`, `keep_cartridgeitem`, `clean_cartridgeitem`, `keep_cartridge`, `keep_consumable`, `date_mod`, `date_creation`, `comment`, `keep_disk`, `keep_certificate`, `clean_certificate`, `lock_updated_fields`) VALUES
(1, 'complete', 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_unmanageds`
--

CREATE TABLE `glpi_unmanageds` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sysdescr` text DEFAULT NULL,
  `agents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `hub` tinyint(4) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `snmpcredentials_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_usbvendors`
--

CREATE TABLE `glpi_usbvendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_usercategories`
--

CREATE TABLE `glpi_usercategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_useremails`
--

CREATE TABLE `glpi_useremails` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_useremails`
--

INSERT INTO `glpi_useremails` (`id`, `users_id`, `is_default`, `is_dynamic`, `email`) VALUES
(1, 2, 1, 0, 'navinkr431@gmail.com'),
(2, 5, 1, 0, 'navinkr431@gmail.com'),
(3, 4, 1, 0, 'naveen@codesecure.in');

-- --------------------------------------------------------

--
-- Table structure for table `glpi_users`
--

CREATE TABLE `glpi_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_last_update` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(10) DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int(11) NOT NULL DEFAULT 0,
  `list_limit` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `auths_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authtype` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_sync` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usertitles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usercategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_format` int(11) DEFAULT NULL,
  `number_format` int(11) DEFAULT NULL,
  `names_format` int(11) DEFAULT NULL,
  `csv_delimiter` char(1) DEFAULT NULL,
  `is_ids_visible` tinyint(4) DEFAULT NULL,
  `use_flat_dropdowntree` tinyint(4) DEFAULT NULL,
  `use_flat_dropdowntree_on_search_result` tinyint(4) DEFAULT NULL,
  `show_jobs_at_login` tinyint(4) DEFAULT NULL,
  `priority_1` char(20) DEFAULT NULL,
  `priority_2` char(20) DEFAULT NULL,
  `priority_3` char(20) DEFAULT NULL,
  `priority_4` char(20) DEFAULT NULL,
  `priority_5` char(20) DEFAULT NULL,
  `priority_6` char(20) DEFAULT NULL,
  `followup_private` tinyint(4) DEFAULT NULL,
  `task_private` tinyint(4) DEFAULT NULL,
  `default_requesttypes_id` int(10) UNSIGNED DEFAULT NULL,
  `password_forget_token` char(40) DEFAULT NULL,
  `password_forget_token_date` timestamp NULL DEFAULT NULL,
  `user_dn` text DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `show_count_on_tabs` tinyint(4) DEFAULT NULL,
  `refresh_views` int(11) DEFAULT NULL,
  `set_default_tech` tinyint(4) DEFAULT NULL,
  `personal_token` varchar(255) DEFAULT NULL,
  `personal_token_date` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `api_token_date` timestamp NULL DEFAULT NULL,
  `cookie_token` varchar(255) DEFAULT NULL,
  `cookie_token_date` timestamp NULL DEFAULT NULL,
  `display_count_on_home` int(11) DEFAULT NULL,
  `notification_to_myself` tinyint(4) DEFAULT NULL,
  `duedateok_color` varchar(255) DEFAULT NULL,
  `duedatewarning_color` varchar(255) DEFAULT NULL,
  `duedatecritical_color` varchar(255) DEFAULT NULL,
  `duedatewarning_less` int(11) DEFAULT NULL,
  `duedatecritical_less` int(11) DEFAULT NULL,
  `duedatewarning_unit` varchar(255) DEFAULT NULL,
  `duedatecritical_unit` varchar(255) DEFAULT NULL,
  `display_options` text DEFAULT NULL,
  `is_deleted_ldap` tinyint(4) NOT NULL DEFAULT 0,
  `pdffont` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint(4) DEFAULT NULL,
  `privatebookmarkorder` longtext DEFAULT NULL,
  `backcreated` tinyint(4) DEFAULT NULL,
  `task_state` int(11) DEFAULT NULL,
  `palette` char(20) DEFAULT NULL,
  `page_layout` char(20) DEFAULT NULL,
  `fold_menu` tinyint(4) DEFAULT NULL,
  `fold_search` tinyint(4) DEFAULT NULL,
  `savedsearches_pinned` text DEFAULT NULL,
  `timeline_order` char(20) DEFAULT NULL,
  `itil_layout` text DEFAULT NULL,
  `richtext_layout` char(20) DEFAULT NULL,
  `set_default_requester` tinyint(4) DEFAULT NULL,
  `lock_autolock_mode` tinyint(4) DEFAULT NULL,
  `lock_directunlock_notification` tinyint(4) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `highcontrast_css` tinyint(4) DEFAULT 0,
  `plannings` text DEFAULT NULL,
  `sync_field` varchar(255) DEFAULT NULL,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_supervisor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timezone` varchar(50) DEFAULT NULL,
  `default_dashboard_central` varchar(100) DEFAULT NULL,
  `default_dashboard_assets` varchar(100) DEFAULT NULL,
  `default_dashboard_helpdesk` varchar(100) DEFAULT NULL,
  `default_dashboard_mini_ticket` varchar(100) DEFAULT NULL,
  `default_central_tab` tinyint(4) DEFAULT 0,
  `nickname` varchar(255) DEFAULT NULL,
  `timeline_action_btn_layout` tinyint(4) DEFAULT 0,
  `timeline_date_format` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `glpi_users`
--

INSERT INTO `glpi_users` (`id`, `name`, `password`, `password_last_update`, `phone`, `phone2`, `mobile`, `realname`, `firstname`, `locations_id`, `language`, `use_mode`, `list_limit`, `is_active`, `comment`, `auths_id`, `authtype`, `last_login`, `date_mod`, `date_sync`, `is_deleted`, `profiles_id`, `entities_id`, `usertitles_id`, `usercategories_id`, `date_format`, `number_format`, `names_format`, `csv_delimiter`, `is_ids_visible`, `use_flat_dropdowntree`, `use_flat_dropdowntree_on_search_result`, `show_jobs_at_login`, `priority_1`, `priority_2`, `priority_3`, `priority_4`, `priority_5`, `priority_6`, `followup_private`, `task_private`, `default_requesttypes_id`, `password_forget_token`, `password_forget_token_date`, `user_dn`, `registration_number`, `show_count_on_tabs`, `refresh_views`, `set_default_tech`, `personal_token`, `personal_token_date`, `api_token`, `api_token_date`, `cookie_token`, `cookie_token_date`, `display_count_on_home`, `notification_to_myself`, `duedateok_color`, `duedatewarning_color`, `duedatecritical_color`, `duedatewarning_less`, `duedatecritical_less`, `duedatewarning_unit`, `duedatecritical_unit`, `display_options`, `is_deleted_ldap`, `pdffont`, `picture`, `begin_date`, `end_date`, `keep_devices_when_purging_item`, `privatebookmarkorder`, `backcreated`, `task_state`, `palette`, `page_layout`, `fold_menu`, `fold_search`, `savedsearches_pinned`, `timeline_order`, `itil_layout`, `richtext_layout`, `set_default_requester`, `lock_autolock_mode`, `lock_directunlock_notification`, `date_creation`, `highcontrast_css`, `plannings`, `sync_field`, `groups_id`, `users_id_supervisor`, `timezone`, `default_dashboard_central`, `default_dashboard_assets`, `default_dashboard_helpdesk`, `default_dashboard_mini_ticket`, `default_central_tab`, `nickname`, `timeline_action_btn_layout`, `timeline_date_format`) VALUES
(2, 'glpi', '$2y$10$9MJat7XrhoX4yQW6AAs//.s6ae8JMg6WrRZl4x1aHspSy.GuZA/8S', '2023-11-20 01:23:36', NULL, NULL, NULL, 'GLPI SuperAdmin', NULL, 0, NULL, 0, 20, 1, NULL, 0, 1, '2023-11-22 00:48:22', '2023-11-21 09:56:36', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FaRrUvwWwhddH9UYCZ5OKHq7eoCvlgEluai9aGov', '2023-11-18 15:23:07', 'sXkSqfRSXRslxCBRL7xPhhN9XxOKeXxbizigK1d4', '2023-11-18 08:21:11', '$2y$10$VHEZJnf9eIl7K7iA8A16r.Fy2EYWX7U/gTBl//4v.4ENxkeD3y6z6', '2023-11-21 05:33:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"collapsed\":\"false\",\"expanded\":\"true\",\"items\":{\"item-main\":\"false\",\"actors\":\"true\",\"items\":\"false\",\"service-levels\":\"true\",\"linked_tickets\":\"false\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'post-only', '$2y$10$FIEo0YpAUVe4mqP6kw.Ug.yAcjOPZTgO.dYeHyPIdMixx67Z2xU3q', '2023-11-20 01:27:22', NULL, NULL, NULL, NULL, NULL, 0, 'en_GB', 0, 20, 1, NULL, 0, 1, NULL, '2023-11-20 01:27:22', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0),
(4, 'manager', '$2y$10$ewnY8QMRH1.6BIrrPJJPbO3EokFWPs6KxTEp84eUL4ka9h4ki5Puy', '2023-11-20 01:25:07', NULL, NULL, NULL, 'Security Manager', NULL, 0, 'en_GB', 0, 20, 1, NULL, 0, 1, NULL, '2023-11-21 08:29:45', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0),
(5, 'team', '$2y$10$xFMrpcYuHp4XV4EbpfoE..0kM9hU0LZQtwI6Hkae3pEsgB.t7kxn6', '2023-11-20 01:27:09', NULL, NULL, NULL, 'Security Team', NULL, 0, 'en_GB', 0, 20, 1, NULL, 0, 1, NULL, '2023-11-21 08:28:46', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0),
(6, 'glpi-system', '', NULL, NULL, NULL, NULL, 'Support', NULL, 0, NULL, 0, NULL, 1, NULL, 0, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `glpi_usertitles`
--

CREATE TABLE `glpi_usertitles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_virtualmachinestates`
--

CREATE TABLE `glpi_virtualmachinestates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_virtualmachinesystems`
--

CREATE TABLE `glpi_virtualmachinesystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_virtualmachinetypes`
--

CREATE TABLE `glpi_virtualmachinetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_vlans`
--

CREATE TABLE `glpi_vlans` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `tag` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_vobjects`
--

CREATE TABLE `glpi_vobjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glpi_wifinetworks`
--

CREATE TABLE `glpi_wifinetworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `essid` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL COMMENT 'ad-hoc, access_point',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `glpi_agents`
--
ALTER TABLE `glpi_agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deviceid` (`deviceid`),
  ADD KEY `name` (`name`),
  ADD KEY `agenttypes_id` (`agenttypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_agenttypes`
--
ALTER TABLE `glpi_agenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_alerts`
--
ALTER TABLE `glpi_alerts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  ADD KEY `type` (`type`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `glpi_apiclients`
--
ALTER TABLE `glpi_apiclients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_applianceenvironments`
--
ALTER TABLE `glpi_applianceenvironments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_appliances`
--
ALTER TABLE `glpi_appliances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`externalidentifier`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `appliancetypes_id` (`appliancetypes_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `applianceenvironments_id` (`applianceenvironments_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_appliances_items`
--
ALTER TABLE `glpi_appliances_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`appliances_id`,`items_id`,`itemtype`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_appliances_items_relations`
--
ALTER TABLE `glpi_appliances_items_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appliances_items_id` (`appliances_items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_appliancetypes`
--
ALTER TABLE `glpi_appliancetypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `externalidentifier` (`externalidentifier`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_authldapreplicates`
--
ALTER TABLE `glpi_authldapreplicates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `authldaps_id` (`authldaps_id`);

--
-- Indexes for table `glpi_authldaps`
--
ALTER TABLE `glpi_authldaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `sync_field` (`sync_field`);

--
-- Indexes for table `glpi_authmails`
--
ALTER TABLE `glpi_authmails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `glpi_autoupdatesystems`
--
ALTER TABLE `glpi_autoupdatesystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_blacklistedmailcontents`
--
ALTER TABLE `glpi_blacklistedmailcontents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_blacklists`
--
ALTER TABLE `glpi_blacklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_budgets`
--
ALTER TABLE `glpi_budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `budgettypes_id` (`budgettypes_id`);

--
-- Indexes for table `glpi_budgettypes`
--
ALTER TABLE `glpi_budgettypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_businesscriticities`
--
ALTER TABLE `glpi_businesscriticities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`businesscriticities_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_cables`
--
ALTER TABLE `glpi_cables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item_endpoint_a` (`itemtype_endpoint_a`,`items_id_endpoint_a`),
  ADD KEY `item_endpoint_b` (`itemtype_endpoint_b`,`items_id_endpoint_b`),
  ADD KEY `items_id_endpoint_b` (`items_id_endpoint_b`),
  ADD KEY `items_id_endpoint_a` (`items_id_endpoint_a`),
  ADD KEY `socketmodels_id_endpoint_a` (`socketmodels_id_endpoint_a`),
  ADD KEY `socketmodels_id_endpoint_b` (`socketmodels_id_endpoint_b`),
  ADD KEY `sockets_id_endpoint_a` (`sockets_id_endpoint_a`),
  ADD KEY `sockets_id_endpoint_b` (`sockets_id_endpoint_b`),
  ADD KEY `cablestrands_id` (`cablestrands_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `complete` (`entities_id`,`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `cabletypes_id` (`cabletypes_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `glpi_cablestrands`
--
ALTER TABLE `glpi_cablestrands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_cabletypes`
--
ALTER TABLE `glpi_cabletypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_calendars`
--
ALTER TABLE `glpi_calendars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_calendarsegments`
--
ALTER TABLE `glpi_calendarsegments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `day` (`day`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_calendars_holidays`
--
ALTER TABLE `glpi_calendars_holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  ADD KEY `holidays_id` (`holidays_id`);

--
-- Indexes for table `glpi_cartridgeitems`
--
ALTER TABLE `glpi_cartridgeitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `alarm_threshold` (`alarm_threshold`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_cartridgeitems_printermodels`
--
ALTER TABLE `glpi_cartridgeitems_printermodels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  ADD KEY `cartridgeitems_id` (`cartridgeitems_id`);

--
-- Indexes for table `glpi_cartridgeitemtypes`
--
ALTER TABLE `glpi_cartridgeitemtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_cartridges`
--
ALTER TABLE `glpi_cartridges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartridgeitems_id` (`cartridgeitems_id`),
  ADD KEY `printers_id` (`printers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_certificates`
--
ALTER TABLE `glpi_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `certificatetypes_id` (`certificatetypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_certificates_items`
--
ALTER TABLE `glpi_certificates_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`certificates_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_certificatetypes`
--
ALTER TABLE `glpi_certificatetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_changecosts`
--
ALTER TABLE `glpi_changecosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `changes_id` (`changes_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Indexes for table `glpi_changes`
--
ALTER TABLE `glpi_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date` (`date`),
  ADD KEY `closedate` (`closedate`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `users_id_recipient` (`users_id_recipient`),
  ADD KEY `solvedate` (`solvedate`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `impact` (`impact`),
  ADD KEY `time_to_resolve` (`time_to_resolve`),
  ADD KEY `global_validation` (`global_validation`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `locations_id` (`locations_id`);

--
-- Indexes for table `glpi_changes_groups`
--
ALTER TABLE `glpi_changes_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  ADD KEY `group` (`groups_id`,`type`);

--
-- Indexes for table `glpi_changes_items`
--
ALTER TABLE `glpi_changes_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_changes_problems`
--
ALTER TABLE `glpi_changes_problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  ADD KEY `problems_id` (`problems_id`);

--
-- Indexes for table `glpi_changes_suppliers`
--
ALTER TABLE `glpi_changes_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  ADD KEY `group` (`suppliers_id`,`type`);

--
-- Indexes for table `glpi_changes_tickets`
--
ALTER TABLE `glpi_changes_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  ADD KEY `tickets_id` (`tickets_id`);

--
-- Indexes for table `glpi_changes_users`
--
ALTER TABLE `glpi_changes_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  ADD KEY `user` (`users_id`,`type`);

--
-- Indexes for table `glpi_changetasks`
--
ALTER TABLE `glpi_changetasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `changes_id` (`changes_id`),
  ADD KEY `state` (`state`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `tasktemplates_id` (`tasktemplates_id`),
  ADD KEY `is_private` (`is_private`);

--
-- Indexes for table `glpi_changetemplatehiddenfields`
--
ALTER TABLE `glpi_changetemplatehiddenfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changetemplates_id`,`num`);

--
-- Indexes for table `glpi_changetemplatemandatoryfields`
--
ALTER TABLE `glpi_changetemplatemandatoryfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changetemplates_id`,`num`);

--
-- Indexes for table `glpi_changetemplatepredefinedfields`
--
ALTER TABLE `glpi_changetemplatepredefinedfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changetemplates_id` (`changetemplates_id`);

--
-- Indexes for table `glpi_changetemplates`
--
ALTER TABLE `glpi_changetemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_changevalidations`
--
ALTER TABLE `glpi_changevalidations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_validate` (`users_id_validate`),
  ADD KEY `changes_id` (`changes_id`),
  ADD KEY `submission_date` (`submission_date`),
  ADD KEY `validation_date` (`validation_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `glpi_clusters`
--
ALTER TABLE `glpi_clusters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `clustertypes_id` (`clustertypes_id`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_clustertypes`
--
ALTER TABLE `glpi_clustertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_computerantiviruses`
--
ALTER TABLE `glpi_computerantiviruses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `antivirus_version` (`antivirus_version`),
  ADD KEY `signature_version` (`signature_version`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_uptodate` (`is_uptodate`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `computers_id` (`computers_id`),
  ADD KEY `date_expiration` (`date_expiration`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`);

--
-- Indexes for table `glpi_computermodels`
--
ALTER TABLE `glpi_computermodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_computers`
--
ALTER TABLE `glpi_computers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `computermodels_id` (`computermodels_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `computertypes_id` (`computertypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_computers_items`
--
ALTER TABLE `glpi_computers_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computers_id` (`computers_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Indexes for table `glpi_computertypes`
--
ALTER TABLE `glpi_computertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_computervirtualmachines`
--
ALTER TABLE `glpi_computervirtualmachines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computers_id` (`computers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `name` (`name`),
  ADD KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  ADD KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  ADD KEY `vcpu` (`vcpu`),
  ADD KEY `ram` (`ram`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `virtualmachinetypes_id` (`virtualmachinetypes_id`);

--
-- Indexes for table `glpi_configs`
--
ALTER TABLE `glpi_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`context`,`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_consumableitems`
--
ALTER TABLE `glpi_consumableitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `alarm_threshold` (`alarm_threshold`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `otherserial` (`otherserial`);

--
-- Indexes for table `glpi_consumableitemtypes`
--
ALTER TABLE `glpi_consumableitemtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_consumables`
--
ALTER TABLE `glpi_consumables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_in` (`date_in`),
  ADD KEY `date_out` (`date_out`),
  ADD KEY `consumableitems_id` (`consumableitems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_contacts`
--
ALTER TABLE `glpi_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `contacttypes_id` (`contacttypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `usertitles_id` (`usertitles_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_contacts_suppliers`
--
ALTER TABLE `glpi_contacts_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  ADD KEY `contacts_id` (`contacts_id`);

--
-- Indexes for table `glpi_contacttypes`
--
ALTER TABLE `glpi_contacttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_contractcosts`
--
ALTER TABLE `glpi_contractcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `contracts_id` (`contracts_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Indexes for table `glpi_contracts`
--
ALTER TABLE `glpi_contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `name` (`name`),
  ADD KEY `contracttypes_id` (`contracttypes_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `use_sunday` (`use_sunday`),
  ADD KEY `use_saturday` (`use_saturday`),
  ADD KEY `alert` (`alert`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_contracts_items`
--
ALTER TABLE `glpi_contracts_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_contracts_suppliers`
--
ALTER TABLE `glpi_contracts_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  ADD KEY `contracts_id` (`contracts_id`);

--
-- Indexes for table `glpi_contracttypes`
--
ALTER TABLE `glpi_contracttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_crontasklogs`
--
ALTER TABLE `glpi_crontasklogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `crontasks_id` (`crontasks_id`),
  ADD KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`);

--
-- Indexes for table `glpi_crontasks`
--
ALTER TABLE `glpi_crontasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `mode` (`mode`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_dashboards_dashboards`
--
ALTER TABLE `glpi_dashboards_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `name` (`name`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `glpi_dashboards_filters`
--
ALTER TABLE `glpi_dashboards_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `glpi_dashboards_items`
--
ALTER TABLE `glpi_dashboards_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`);

--
-- Indexes for table `glpi_dashboards_rights`
--
ALTER TABLE `glpi_dashboards_rights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`dashboards_dashboards_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_databaseinstancecategories`
--
ALTER TABLE `glpi_databaseinstancecategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_databaseinstances`
--
ALTER TABLE `glpi_databaseinstances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `databaseinstancetypes_id` (`databaseinstancetypes_id`),
  ADD KEY `databaseinstancecategories_id` (`databaseinstancecategories_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`);

--
-- Indexes for table `glpi_databaseinstancetypes`
--
ALTER TABLE `glpi_databaseinstancetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_databases`
--
ALTER TABLE `glpi_databases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `databaseinstances_id` (`databaseinstances_id`);

--
-- Indexes for table `glpi_datacenters`
--
ALTER TABLE `glpi_datacenters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_dcrooms`
--
ALTER TABLE `glpi_dcrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `datacenters_id` (`datacenters_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicebatteries`
--
ALTER TABLE `glpi_devicebatteries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicebatterymodels_id` (`devicebatterymodels_id`),
  ADD KEY `devicebatterytypes_id` (`devicebatterytypes_id`);

--
-- Indexes for table `glpi_devicebatterymodels`
--
ALTER TABLE `glpi_devicebatterymodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicebatterytypes`
--
ALTER TABLE `glpi_devicebatterytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicecameramodels`
--
ALTER TABLE `glpi_devicecameramodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicecameras`
--
ALTER TABLE `glpi_devicecameras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicecameramodels_id` (`devicecameramodels_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicecasemodels`
--
ALTER TABLE `glpi_devicecasemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicecases`
--
ALTER TABLE `glpi_devicecases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicecasetypes_id` (`devicecasetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicecasemodels_id` (`devicecasemodels_id`);

--
-- Indexes for table `glpi_devicecasetypes`
--
ALTER TABLE `glpi_devicecasetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicecontrolmodels`
--
ALTER TABLE `glpi_devicecontrolmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicecontrols`
--
ALTER TABLE `glpi_devicecontrols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicecontrolmodels_id` (`devicecontrolmodels_id`);

--
-- Indexes for table `glpi_devicedrivemodels`
--
ALTER TABLE `glpi_devicedrivemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicedrives`
--
ALTER TABLE `glpi_devicedrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicedrivemodels_id` (`devicedrivemodels_id`);

--
-- Indexes for table `glpi_devicefirmwaremodels`
--
ALTER TABLE `glpi_devicefirmwaremodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicefirmwares`
--
ALTER TABLE `glpi_devicefirmwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicefirmwaremodels_id` (`devicefirmwaremodels_id`),
  ADD KEY `devicefirmwaretypes_id` (`devicefirmwaretypes_id`);

--
-- Indexes for table `glpi_devicefirmwaretypes`
--
ALTER TABLE `glpi_devicefirmwaretypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicegenericmodels`
--
ALTER TABLE `glpi_devicegenericmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicegenerics`
--
ALTER TABLE `glpi_devicegenerics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicegenerictypes_id` (`devicegenerictypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicegenericmodels_id` (`devicegenericmodels_id`);

--
-- Indexes for table `glpi_devicegenerictypes`
--
ALTER TABLE `glpi_devicegenerictypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_devicegraphiccardmodels`
--
ALTER TABLE `glpi_devicegraphiccardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicegraphiccards`
--
ALTER TABLE `glpi_devicegraphiccards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `chipset` (`chipset`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicegraphiccardmodels_id` (`devicegraphiccardmodels_id`);

--
-- Indexes for table `glpi_deviceharddrivemodels`
--
ALTER TABLE `glpi_deviceharddrivemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_deviceharddrives`
--
ALTER TABLE `glpi_deviceharddrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `deviceharddrivemodels_id` (`deviceharddrivemodels_id`);

--
-- Indexes for table `glpi_devicememories`
--
ALTER TABLE `glpi_devicememories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicememorytypes_id` (`devicememorytypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicememorymodels_id` (`devicememorymodels_id`);

--
-- Indexes for table `glpi_devicememorymodels`
--
ALTER TABLE `glpi_devicememorymodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicememorytypes`
--
ALTER TABLE `glpi_devicememorytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicemotherboardmodels`
--
ALTER TABLE `glpi_devicemotherboardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicemotherboards`
--
ALTER TABLE `glpi_devicemotherboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicemotherboardmodels_id` (`devicemotherboardmodels_id`);

--
-- Indexes for table `glpi_devicenetworkcardmodels`
--
ALTER TABLE `glpi_devicenetworkcardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicenetworkcards`
--
ALTER TABLE `glpi_devicenetworkcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`);

--
-- Indexes for table `glpi_devicepcimodels`
--
ALTER TABLE `glpi_devicepcimodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicepcis`
--
ALTER TABLE `glpi_devicepcis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicepcimodels_id` (`devicepcimodels_id`);

--
-- Indexes for table `glpi_devicepowersupplies`
--
ALTER TABLE `glpi_devicepowersupplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicepowersupplymodels_id` (`devicepowersupplymodels_id`);

--
-- Indexes for table `glpi_devicepowersupplymodels`
--
ALTER TABLE `glpi_devicepowersupplymodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_deviceprocessormodels`
--
ALTER TABLE `glpi_deviceprocessormodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_deviceprocessors`
--
ALTER TABLE `glpi_deviceprocessors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `deviceprocessormodels_id` (`deviceprocessormodels_id`);

--
-- Indexes for table `glpi_devicesensormodels`
--
ALTER TABLE `glpi_devicesensormodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicesensors`
--
ALTER TABLE `glpi_devicesensors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicesensortypes_id` (`devicesensortypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicesensormodels_id` (`devicesensormodels_id`);

--
-- Indexes for table `glpi_devicesensortypes`
--
ALTER TABLE `glpi_devicesensortypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_devicesimcards`
--
ALTER TABLE `glpi_devicesimcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `devicesimcardtypes_id` (`devicesimcardtypes_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`);

--
-- Indexes for table `glpi_devicesimcardtypes`
--
ALTER TABLE `glpi_devicesimcardtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_devicesoundcardmodels`
--
ALTER TABLE `glpi_devicesoundcardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_devicesoundcards`
--
ALTER TABLE `glpi_devicesoundcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicesoundcardmodels_id` (`devicesoundcardmodels_id`);

--
-- Indexes for table `glpi_displaypreferences`
--
ALTER TABLE `glpi_displaypreferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  ADD KEY `rank` (`rank`),
  ADD KEY `num` (`num`),
  ADD KEY `itemtype` (`itemtype`);

--
-- Indexes for table `glpi_documentcategories`
--
ALTER TABLE `glpi_documentcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`documentcategories_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_documents`
--
ALTER TABLE `glpi_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `documentcategories_id` (`documentcategories_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `sha1sum` (`sha1sum`),
  ADD KEY `tag` (`tag`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_documents_items`
--
ALTER TABLE `glpi_documents_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`,`timeline_position`),
  ADD KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `glpi_documenttypes`
--
ALTER TABLE `glpi_documenttypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`ext`),
  ADD KEY `name` (`name`),
  ADD KEY `is_uploadable` (`is_uploadable`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_domainrecords`
--
ALTER TABLE `glpi_domainrecords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `domains_id` (`domains_id`),
  ADD KEY `domainrecordtypes_id` (`domainrecordtypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_domainrecordtypes`
--
ALTER TABLE `glpi_domainrecordtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_domainrelations`
--
ALTER TABLE `glpi_domainrelations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_domains`
--
ALTER TABLE `glpi_domains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `domaintypes_id` (`domaintypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_expiration` (`date_expiration`),
  ADD KEY `date_domaincreation` (`date_domaincreation`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_domains_items`
--
ALTER TABLE `glpi_domains_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`domains_id`,`itemtype`,`items_id`),
  ADD KEY `domainrelations_id` (`domainrelations_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `glpi_domaintypes`
--
ALTER TABLE `glpi_domaintypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_dropdowntranslations`
--
ALTER TABLE `glpi_dropdowntranslations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  ADD KEY `language` (`language`),
  ADD KEY `field` (`field`);

--
-- Indexes for table `glpi_enclosuremodels`
--
ALTER TABLE `glpi_enclosuremodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_enclosures`
--
ALTER TABLE `glpi_enclosures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `enclosuremodels_id` (`enclosuremodels_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_entities`
--
ALTER TABLE `glpi_entities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`entities_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`),
  ADD KEY `transfers_id` (`transfers_id`),
  ADD KEY `authldaps_id` (`authldaps_id`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `entities_id_software` (`entities_id_software`),
  ADD KEY `contracts_id_default` (`contracts_id_default`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_entities_knowbaseitems`
--
ALTER TABLE `glpi_entities_knowbaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_entities_reminders`
--
ALTER TABLE `glpi_entities_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_entities_rssfeeds`
--
ALTER TABLE `glpi_entities_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_events`
--
ALTER TABLE `glpi_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `level` (`level`),
  ADD KEY `item` (`type`,`items_id`);

--
-- Indexes for table `glpi_fieldblacklists`
--
ALTER TABLE `glpi_fieldblacklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_fieldunicities`
--
ALTER TABLE `glpi_fieldunicities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_filesystems`
--
ALTER TABLE `glpi_filesystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_fqdns`
--
ALTER TABLE `glpi_fqdns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `name` (`name`),
  ADD KEY `fqdn` (`fqdn`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_groups`
--
ALTER TABLE `glpi_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `ldap_field` (`ldap_field`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `ldap_value` (`ldap_value`(200)),
  ADD KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_requester` (`is_requester`),
  ADD KEY `is_watcher` (`is_watcher`),
  ADD KEY `is_assign` (`is_assign`),
  ADD KEY `is_notify` (`is_notify`),
  ADD KEY `is_itemgroup` (`is_itemgroup`),
  ADD KEY `is_usergroup` (`is_usergroup`),
  ADD KEY `is_manager` (`is_manager`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_groups_knowbaseitems`
--
ALTER TABLE `glpi_groups_knowbaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_groups_problems`
--
ALTER TABLE `glpi_groups_problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  ADD KEY `group` (`groups_id`,`type`);

--
-- Indexes for table `glpi_groups_reminders`
--
ALTER TABLE `glpi_groups_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_groups_rssfeeds`
--
ALTER TABLE `glpi_groups_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_groups_tickets`
--
ALTER TABLE `glpi_groups_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  ADD KEY `group` (`groups_id`,`type`);

--
-- Indexes for table `glpi_groups_users`
--
ALTER TABLE `glpi_groups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_manager` (`is_manager`),
  ADD KEY `is_userdelegate` (`is_userdelegate`);

--
-- Indexes for table `glpi_holidays`
--
ALTER TABLE `glpi_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `is_perpetual` (`is_perpetual`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_imageformats`
--
ALTER TABLE `glpi_imageformats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_imageresolutions`
--
ALTER TABLE `glpi_imageresolutions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_video` (`is_video`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_impactcompounds`
--
ALTER TABLE `glpi_impactcompounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_impactcontexts`
--
ALTER TABLE `glpi_impactcontexts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glpi_impactitems`
--
ALTER TABLE `glpi_impactitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `source` (`itemtype`,`items_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `impactcontexts_id` (`impactcontexts_id`);

--
-- Indexes for table `glpi_impactrelations`
--
ALTER TABLE `glpi_impactrelations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype_source`,`items_id_source`,`itemtype_impacted`,`items_id_impacted`),
  ADD KEY `impacted_asset` (`itemtype_impacted`,`items_id_impacted`);

--
-- Indexes for table `glpi_infocoms`
--
ALTER TABLE `glpi_infocoms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `buy_date` (`buy_date`),
  ADD KEY `alert` (`alert`),
  ADD KEY `budgets_id` (`budgets_id`),
  ADD KEY `suppliers_id` (`suppliers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `businesscriticities_id` (`businesscriticities_id`);

--
-- Indexes for table `glpi_interfacetypes`
--
ALTER TABLE `glpi_interfacetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_ipaddresses`
--
ALTER TABLE `glpi_ipaddresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  ADD KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`);

--
-- Indexes for table `glpi_ipaddresses_ipnetworks`
--
ALTER TABLE `glpi_ipaddresses_ipnetworks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  ADD KEY `ipnetworks_id` (`ipnetworks_id`);

--
-- Indexes for table `glpi_ipnetworks`
--
ALTER TABLE `glpi_ipnetworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `network_definition` (`entities_id`,`address`,`netmask`),
  ADD KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  ADD KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  ADD KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `ipnetworks_id` (`ipnetworks_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_ipnetworks_vlans`
--
ALTER TABLE `glpi_ipnetworks_vlans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`),
  ADD KEY `vlans_id` (`vlans_id`);

--
-- Indexes for table `glpi_items_clusters`
--
ALTER TABLE `glpi_items_clusters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`clusters_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_devicebatteries`
--
ALTER TABLE `glpi_items_devicebatteries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicebatteries_id` (`devicebatteries_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicecameras`
--
ALTER TABLE `glpi_items_devicecameras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_id` (`items_id`),
  ADD KEY `devicecameras_id` (`devicecameras_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_devicecameras_imageformats`
--
ALTER TABLE `glpi_items_devicecameras_imageformats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_devicecameras_id` (`items_devicecameras_id`),
  ADD KEY `imageformats_id` (`imageformats_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `glpi_items_devicecameras_imageresolutions`
--
ALTER TABLE `glpi_items_devicecameras_imageresolutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_devicecameras_id` (`items_devicecameras_id`),
  ADD KEY `imageresolutions_id` (`imageresolutions_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `glpi_items_devicecases`
--
ALTER TABLE `glpi_items_devicecases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicecases_id` (`devicecases_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicecontrols`
--
ALTER TABLE `glpi_items_devicecontrols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicecontrols_id` (`devicecontrols_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicedrives`
--
ALTER TABLE `glpi_items_devicedrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicedrives_id` (`devicedrives_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicefirmwares`
--
ALTER TABLE `glpi_items_devicefirmwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicefirmwares_id` (`devicefirmwares_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicegenerics`
--
ALTER TABLE `glpi_items_devicegenerics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicegenerics_id` (`devicegenerics_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicegraphiccards`
--
ALTER TABLE `glpi_items_devicegraphiccards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  ADD KEY `specificity` (`memory`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_deviceharddrives`
--
ALTER TABLE `glpi_items_deviceharddrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviceharddrives_id` (`deviceharddrives_id`),
  ADD KEY `specificity` (`capacity`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicememories`
--
ALTER TABLE `glpi_items_devicememories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicememories_id` (`devicememories_id`),
  ADD KEY `specificity` (`size`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicemotherboards`
--
ALTER TABLE `glpi_items_devicemotherboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicemotherboards_id` (`devicemotherboards_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicenetworkcards`
--
ALTER TABLE `glpi_items_devicenetworkcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  ADD KEY `specificity` (`mac`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicepcis`
--
ALTER TABLE `glpi_items_devicepcis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicepcis_id` (`devicepcis_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicepowersupplies`
--
ALTER TABLE `glpi_items_devicepowersupplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_deviceprocessors`
--
ALTER TABLE `glpi_items_deviceprocessors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviceprocessors_id` (`deviceprocessors_id`),
  ADD KEY `specificity` (`frequency`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `nbcores` (`nbcores`),
  ADD KEY `nbthreads` (`nbthreads`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicesensors`
--
ALTER TABLE `glpi_items_devicesensors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicesensors_id` (`devicesensors_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_devicesimcards`
--
ALTER TABLE `glpi_items_devicesimcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `devicesimcards_id` (`devicesimcards_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `lines_id` (`lines_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`);

--
-- Indexes for table `glpi_items_devicesoundcards`
--
ALTER TABLE `glpi_items_devicesoundcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicesoundcards_id` (`devicesoundcards_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Indexes for table `glpi_items_disks`
--
ALTER TABLE `glpi_items_disks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `device` (`device`),
  ADD KEY `mountpoint` (`mountpoint`),
  ADD KEY `totalsize` (`totalsize`),
  ADD KEY `freesize` (`freesize`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `filesystems_id` (`filesystems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_items_enclosures`
--
ALTER TABLE `glpi_items_enclosures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`itemtype`,`items_id`),
  ADD KEY `relation` (`enclosures_id`,`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_kanbans`
--
ALTER TABLE `glpi_items_kanbans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_items_operatingsystems`
--
ALTER TABLE `glpi_items_operatingsystems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`items_id`,`itemtype`,`operatingsystems_id`,`operatingsystemarchitectures_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `operatingsystems_id` (`operatingsystems_id`),
  ADD KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  ADD KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  ADD KEY `operatingsystemarchitectures_id` (`operatingsystemarchitectures_id`),
  ADD KEY `operatingsystemkernelversions_id` (`operatingsystemkernelversions_id`),
  ADD KEY `operatingsystemeditions_id` (`operatingsystemeditions_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_items_problems`
--
ALTER TABLE `glpi_items_problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_projects`
--
ALTER TABLE `glpi_items_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_racks`
--
ALTER TABLE `glpi_items_racks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`itemtype`,`items_id`,`is_reserved`),
  ADD KEY `relation` (`racks_id`,`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_remotemanagements`
--
ALTER TABLE `glpi_items_remotemanagements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_items_softwarelicenses`
--
ALTER TABLE `glpi_items_softwarelicenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `softwarelicenses_id` (`softwarelicenses_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Indexes for table `glpi_items_softwareversions`
--
ALTER TABLE `glpi_items_softwareversions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`softwareversions_id`),
  ADD KEY `softwareversions_id` (`softwareversions_id`),
  ADD KEY `computers_info` (`entities_id`,`is_template_item`,`is_deleted_item`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted_item` (`is_deleted_item`),
  ADD KEY `is_template_item` (`is_template_item`),
  ADD KEY `date_install` (`date_install`);

--
-- Indexes for table `glpi_items_tickets`
--
ALTER TABLE `glpi_items_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  ADD KEY `tickets_id` (`tickets_id`);

--
-- Indexes for table `glpi_itilcategories`
--
ALTER TABLE `glpi_itilcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  ADD KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`),
  ADD KEY `is_incident` (`is_incident`),
  ADD KEY `is_request` (`is_request`),
  ADD KEY `is_problem` (`is_problem`),
  ADD KEY `is_change` (`is_change`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_itilfollowups`
--
ALTER TABLE `glpi_itilfollowups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `requesttypes_id` (`requesttypes_id`),
  ADD KEY `sourceitems_id` (`sourceitems_id`),
  ADD KEY `sourceof_items_id` (`sourceof_items_id`);

--
-- Indexes for table `glpi_itilfollowuptemplates`
--
ALTER TABLE `glpi_itilfollowuptemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `requesttypes_id` (`requesttypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_private` (`is_private`);

--
-- Indexes for table `glpi_itilsolutions`
--
ALTER TABLE `glpi_itilsolutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `solutiontypes_id` (`solutiontypes_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `users_id_approval` (`users_id_approval`),
  ADD KEY `status` (`status`),
  ADD KEY `itilfollowups_id` (`itilfollowups_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_itils_projects`
--
ALTER TABLE `glpi_itils_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`projects_id`),
  ADD KEY `projects_id` (`projects_id`);

--
-- Indexes for table `glpi_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitemcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_knowbaseitems`
--
ALTER TABLE `glpi_knowbaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_faq` (`is_faq`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`);
ALTER TABLE `glpi_knowbaseitems` ADD FULLTEXT KEY `fulltext` (`name`,`answer`);
ALTER TABLE `glpi_knowbaseitems` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `glpi_knowbaseitems` ADD FULLTEXT KEY `answer` (`answer`);

--
-- Indexes for table `glpi_knowbaseitems_comments`
--
ALTER TABLE `glpi_knowbaseitems_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_knowbaseitems_items`
--
ALTER TABLE `glpi_knowbaseitems_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`knowbaseitems_id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_knowbaseitems_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitems_knowbaseitemcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`);

--
-- Indexes for table `glpi_knowbaseitems_profiles`
--
ALTER TABLE `glpi_knowbaseitems_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_knowbaseitems_revisions`
--
ALTER TABLE `glpi_knowbaseitems_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`knowbaseitems_id`,`revision`,`language`),
  ADD KEY `revision` (`revision`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `glpi_knowbaseitems_users`
--
ALTER TABLE `glpi_knowbaseitems_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `glpi_knowbaseitemtranslations`
--
ALTER TABLE `glpi_knowbaseitemtranslations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`knowbaseitems_id`,`language`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);
ALTER TABLE `glpi_knowbaseitemtranslations` ADD FULLTEXT KEY `fulltext` (`name`,`answer`);
ALTER TABLE `glpi_knowbaseitemtranslations` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `glpi_knowbaseitemtranslations` ADD FULLTEXT KEY `answer` (`answer`);

--
-- Indexes for table `glpi_lineoperators`
--
ALTER TABLE `glpi_lineoperators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`mcc`,`mnc`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_lines`
--
ALTER TABLE `glpi_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `lineoperators_id` (`lineoperators_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `linetypes_id` (`linetypes_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_linetypes`
--
ALTER TABLE `glpi_linetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_links`
--
ALTER TABLE `glpi_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_links_itemtypes`
--
ALTER TABLE `glpi_links_itemtypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  ADD KEY `links_id` (`links_id`);

--
-- Indexes for table `glpi_locations`
--
ALTER TABLE `glpi_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_lockedfields`
--
ALTER TABLE `glpi_lockedfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`field`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_global` (`is_global`);

--
-- Indexes for table `glpi_logs`
--
ALTER TABLE `glpi_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `itemtype_link` (`itemtype_link`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `id_search_option` (`id_search_option`);

--
-- Indexes for table `glpi_mailcollectors`
--
ALTER TABLE `glpi_mailcollectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `last_collect_date` (`last_collect_date`);

--
-- Indexes for table `glpi_manuallinks`
--
ALTER TABLE `glpi_manuallinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `items_id` (`items_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_manufacturers`
--
ALTER TABLE `glpi_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_monitormodels`
--
ALTER TABLE `glpi_monitormodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_monitors`
--
ALTER TABLE `glpi_monitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `monitormodels_id` (`monitormodels_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `monitortypes_id` (`monitortypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_monitortypes`
--
ALTER TABLE `glpi_monitortypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkaliases`
--
ALTER TABLE `glpi_networkaliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `name` (`name`),
  ADD KEY `networknames_id` (`networknames_id`),
  ADD KEY `fqdns_id` (`fqdns_id`);

--
-- Indexes for table `glpi_networkequipmentmodels`
--
ALTER TABLE `glpi_networkequipmentmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_networkequipments`
--
ALTER TABLE `glpi_networkequipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `snmpcredentials_id` (`snmpcredentials_id`);

--
-- Indexes for table `glpi_networkequipmenttypes`
--
ALTER TABLE `glpi_networkequipmenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkinterfaces`
--
ALTER TABLE `glpi_networkinterfaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_networknames`
--
ALTER TABLE `glpi_networknames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `FQDN` (`name`,`fqdns_id`),
  ADD KEY `fqdns_id` (`fqdns_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `ipnetworks_id` (`ipnetworks_id`);

--
-- Indexes for table `glpi_networkportaggregates`
--
ALTER TABLE `glpi_networkportaggregates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportaliases`
--
ALTER TABLE `glpi_networkportaliases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `networkports_id_alias` (`networkports_id_alias`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportconnectionlogs`
--
ALTER TABLE `glpi_networkportconnectionlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `networkports_id_source` (`networkports_id_source`),
  ADD KEY `networkports_id_destination` (`networkports_id_destination`);

--
-- Indexes for table `glpi_networkportdialups`
--
ALTER TABLE `glpi_networkportdialups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportethernets`
--
ALTER TABLE `glpi_networkportethernets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `card` (`items_devicenetworkcards_id`),
  ADD KEY `type` (`type`),
  ADD KEY `speed` (`speed`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportfiberchannels`
--
ALTER TABLE `glpi_networkportfiberchannels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `card` (`items_devicenetworkcards_id`),
  ADD KEY `type` (`networkportfiberchanneltypes_id`),
  ADD KEY `wwn` (`wwn`),
  ADD KEY `speed` (`speed`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportfiberchanneltypes`
--
ALTER TABLE `glpi_networkportfiberchanneltypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportlocals`
--
ALTER TABLE `glpi_networkportlocals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportmetrics`
--
ALTER TABLE `glpi_networkportmetrics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`networkports_id`,`date`),
  ADD KEY `date` (`date`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_networkports`
--
ALTER TABLE `glpi_networkports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `mac` (`mac`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkports_networkports`
--
ALTER TABLE `glpi_networkports_networkports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  ADD KEY `networkports_id_2` (`networkports_id_2`);

--
-- Indexes for table `glpi_networkports_vlans`
--
ALTER TABLE `glpi_networkports_vlans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  ADD KEY `vlans_id` (`vlans_id`);

--
-- Indexes for table `glpi_networkporttypes`
--
ALTER TABLE `glpi_networkporttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `value_decimal` (`value_decimal`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_importable` (`is_importable`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_networkportwifis`
--
ALTER TABLE `glpi_networkportwifis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `card` (`items_devicenetworkcards_id`),
  ADD KEY `essid` (`wifinetworks_id`),
  ADD KEY `version` (`version`),
  ADD KEY `mode` (`mode`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `networkportwifis_id` (`networkportwifis_id`);

--
-- Indexes for table `glpi_networks`
--
ALTER TABLE `glpi_networks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_notepads`
--
ALTER TABLE `glpi_notepads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `glpi_notifications`
--
ALTER TABLE `glpi_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `itemtype` (`itemtype`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_notifications_notificationtemplates`
--
ALTER TABLE `glpi_notifications_notificationtemplates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`notifications_id`,`mode`,`notificationtemplates_id`),
  ADD KEY `notificationtemplates_id` (`notificationtemplates_id`),
  ADD KEY `mode` (`mode`);

--
-- Indexes for table `glpi_notificationtargets`
--
ALTER TABLE `glpi_notificationtargets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items` (`type`,`items_id`),
  ADD KEY `notifications_id` (`notifications_id`);

--
-- Indexes for table `glpi_notificationtemplates`
--
ALTER TABLE `glpi_notificationtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemtype` (`itemtype`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_notificationtemplatetranslations`
--
ALTER TABLE `glpi_notificationtemplatetranslations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificationtemplates_id` (`notificationtemplates_id`);

--
-- Indexes for table `glpi_notimportedemails`
--
ALTER TABLE `glpi_notimportedemails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `mailcollectors_id` (`mailcollectors_id`);

--
-- Indexes for table `glpi_objectlocks`
--
ALTER TABLE `glpi_objectlocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`itemtype`,`items_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `glpi_olalevelactions`
--
ALTER TABLE `glpi_olalevelactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `olalevels_id` (`olalevels_id`);

--
-- Indexes for table `glpi_olalevelcriterias`
--
ALTER TABLE `glpi_olalevelcriterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `olalevels_id` (`olalevels_id`),
  ADD KEY `condition` (`condition`);

--
-- Indexes for table `glpi_olalevels`
--
ALTER TABLE `glpi_olalevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `olas_id` (`olas_id`);

--
-- Indexes for table `glpi_olalevels_tickets`
--
ALTER TABLE `glpi_olalevels_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`olalevels_id`),
  ADD KEY `olalevels_id` (`olalevels_id`);

--
-- Indexes for table `glpi_olas`
--
ALTER TABLE `glpi_olas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `slms_id` (`slms_id`);

--
-- Indexes for table `glpi_operatingsystemarchitectures`
--
ALTER TABLE `glpi_operatingsystemarchitectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_operatingsystemeditions`
--
ALTER TABLE `glpi_operatingsystemeditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_operatingsystemkernels`
--
ALTER TABLE `glpi_operatingsystemkernels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_operatingsystemkernelversions`
--
ALTER TABLE `glpi_operatingsystemkernelversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `operatingsystemkernels_id` (`operatingsystemkernels_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_operatingsystems`
--
ALTER TABLE `glpi_operatingsystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_operatingsystemservicepacks`
--
ALTER TABLE `glpi_operatingsystemservicepacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_operatingsystemversions`
--
ALTER TABLE `glpi_operatingsystemversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_passivedcequipmentmodels`
--
ALTER TABLE `glpi_passivedcequipmentmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_passivedcequipments`
--
ALTER TABLE `glpi_passivedcequipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `passivedcequipmentmodels_id` (`passivedcequipmentmodels_id`),
  ADD KEY `passivedcequipmenttypes_id` (`passivedcequipmenttypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_passivedcequipmenttypes`
--
ALTER TABLE `glpi_passivedcequipmenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_pcivendors`
--
ALTER TABLE `glpi_pcivendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  ADD KEY `deviceid` (`deviceid`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_pdumodels`
--
ALTER TABLE `glpi_pdumodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_rackable` (`is_rackable`),
  ADD KEY `product_number` (`product_number`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_pdus`
--
ALTER TABLE `glpi_pdus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `pdumodels_id` (`pdumodels_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `pdutypes_id` (`pdutypes_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_pdus_plugs`
--
ALTER TABLE `glpi_pdus_plugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugs_id` (`plugs_id`),
  ADD KEY `pdus_id` (`pdus_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_pdus_racks`
--
ALTER TABLE `glpi_pdus_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `racks_id` (`racks_id`),
  ADD KEY `pdus_id` (`pdus_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_pdutypes`
--
ALTER TABLE `glpi_pdutypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_pendingreasons`
--
ALTER TABLE `glpi_pendingreasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `itilfollowuptemplates_id` (`itilfollowuptemplates_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `solutiontemplates_id` (`solutiontemplates_id`);

--
-- Indexes for table `glpi_pendingreasons_items`
--
ALTER TABLE `glpi_pendingreasons_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`items_id`,`itemtype`),
  ADD KEY `pendingreasons_id` (`pendingreasons_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_peripheralmodels`
--
ALTER TABLE `glpi_peripheralmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_peripherals`
--
ALTER TABLE `glpi_peripherals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `peripheralmodels_id` (`peripheralmodels_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `peripheraltypes_id` (`peripheraltypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_peripheraltypes`
--
ALTER TABLE `glpi_peripheraltypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_phonemodels`
--
ALTER TABLE `glpi_phonemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_phonepowersupplies`
--
ALTER TABLE `glpi_phonepowersupplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_phones`
--
ALTER TABLE `glpi_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `phonemodels_id` (`phonemodels_id`),
  ADD KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `phonetypes_id` (`phonetypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_phonetypes`
--
ALTER TABLE `glpi_phonetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_planningeventcategories`
--
ALTER TABLE `glpi_planningeventcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_planningexternalevents`
--
ALTER TABLE `glpi_planningexternalevents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `planningexternaleventtemplates_id` (`planningexternaleventtemplates_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date` (`date`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `state` (`state`),
  ADD KEY `planningeventcategories_id` (`planningeventcategories_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_planningexternaleventtemplates`
--
ALTER TABLE `glpi_planningexternaleventtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `state` (`state`),
  ADD KEY `planningeventcategories_id` (`planningeventcategories_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_planningrecalls`
--
ALTER TABLE `glpi_planningrecalls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `before_time` (`before_time`),
  ADD KEY `when` (`when`);

--
-- Indexes for table `glpi_plugins`
--
ALTER TABLE `glpi_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`directory`),
  ADD KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `glpi_plugs`
--
ALTER TABLE `glpi_plugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_printerlogs`
--
ALTER TABLE `glpi_printerlogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`printers_id`,`date`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_printermodels`
--
ALTER TABLE `glpi_printermodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Indexes for table `glpi_printers`
--
ALTER TABLE `glpi_printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `printermodels_id` (`printermodels_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `printertypes_id` (`printertypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `last_pages_counter` (`last_pages_counter`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `snmpcredentials_id` (`snmpcredentials_id`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`);

--
-- Indexes for table `glpi_printers_cartridgeinfos`
--
ALTER TABLE `glpi_printers_cartridgeinfos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_id` (`printers_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_printertypes`
--
ALTER TABLE `glpi_printertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_problemcosts`
--
ALTER TABLE `glpi_problemcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `problems_id` (`problems_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Indexes for table `glpi_problems`
--
ALTER TABLE `glpi_problems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date` (`date`),
  ADD KEY `closedate` (`closedate`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `users_id_recipient` (`users_id_recipient`),
  ADD KEY `solvedate` (`solvedate`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `impact` (`impact`),
  ADD KEY `time_to_resolve` (`time_to_resolve`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `locations_id` (`locations_id`);

--
-- Indexes for table `glpi_problems_suppliers`
--
ALTER TABLE `glpi_problems_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  ADD KEY `group` (`suppliers_id`,`type`);

--
-- Indexes for table `glpi_problems_tickets`
--
ALTER TABLE `glpi_problems_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  ADD KEY `tickets_id` (`tickets_id`);

--
-- Indexes for table `glpi_problems_users`
--
ALTER TABLE `glpi_problems_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  ADD KEY `user` (`users_id`,`type`);

--
-- Indexes for table `glpi_problemtasks`
--
ALTER TABLE `glpi_problemtasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `problems_id` (`problems_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `state` (`state`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `tasktemplates_id` (`tasktemplates_id`),
  ADD KEY `is_private` (`is_private`);

--
-- Indexes for table `glpi_problemtemplatehiddenfields`
--
ALTER TABLE `glpi_problemtemplatehiddenfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problemtemplates_id`,`num`);

--
-- Indexes for table `glpi_problemtemplatemandatoryfields`
--
ALTER TABLE `glpi_problemtemplatemandatoryfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problemtemplates_id`,`num`);

--
-- Indexes for table `glpi_problemtemplatepredefinedfields`
--
ALTER TABLE `glpi_problemtemplatepredefinedfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`);

--
-- Indexes for table `glpi_problemtemplates`
--
ALTER TABLE `glpi_problemtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_profilerights`
--
ALTER TABLE `glpi_profilerights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`profiles_id`,`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `glpi_profiles`
--
ALTER TABLE `glpi_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `interface` (`interface`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`);

--
-- Indexes for table `glpi_profiles_reminders`
--
ALTER TABLE `glpi_profiles_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_profiles_rssfeeds`
--
ALTER TABLE `glpi_profiles_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_profiles_users`
--
ALTER TABLE `glpi_profiles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Indexes for table `glpi_projectcosts`
--
ALTER TABLE `glpi_projectcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Indexes for table `glpi_projects`
--
ALTER TABLE `glpi_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `code` (`code`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `projectstates_id` (`projectstates_id`),
  ADD KEY `projecttypes_id` (`projecttypes_id`),
  ADD KEY `priority` (`priority`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `plan_start_date` (`plan_start_date`),
  ADD KEY `plan_end_date` (`plan_end_date`),
  ADD KEY `real_start_date` (`real_start_date`),
  ADD KEY `real_end_date` (`real_end_date`),
  ADD KEY `percent_done` (`percent_done`),
  ADD KEY `show_on_global_gantt` (`show_on_global_gantt`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `projecttemplates_id` (`projecttemplates_id`),
  ADD KEY `is_template` (`is_template`);

--
-- Indexes for table `glpi_projectstates`
--
ALTER TABLE `glpi_projectstates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_finished` (`is_finished`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_projecttasklinks`
--
ALTER TABLE `glpi_projecttasklinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projecttasks_id_source` (`projecttasks_id_source`),
  ADD KEY `projecttasks_id_target` (`projecttasks_id_target`);

--
-- Indexes for table `glpi_projecttasks`
--
ALTER TABLE `glpi_projecttasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `projecttasks_id` (`projecttasks_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `plan_start_date` (`plan_start_date`),
  ADD KEY `plan_end_date` (`plan_end_date`),
  ADD KEY `real_start_date` (`real_start_date`),
  ADD KEY `real_end_date` (`real_end_date`),
  ADD KEY `percent_done` (`percent_done`),
  ADD KEY `projectstates_id` (`projectstates_id`),
  ADD KEY `projecttasktypes_id` (`projecttasktypes_id`),
  ADD KEY `projecttasktemplates_id` (`projecttasktemplates_id`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_milestone` (`is_milestone`);

--
-- Indexes for table `glpi_projecttasks_tickets`
--
ALTER TABLE `glpi_projecttasks_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  ADD KEY `projects_id` (`projecttasks_id`);

--
-- Indexes for table `glpi_projecttaskteams`
--
ALTER TABLE `glpi_projecttaskteams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_projecttasktemplates`
--
ALTER TABLE `glpi_projecttasktemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `projecttasks_id` (`projecttasks_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `plan_start_date` (`plan_start_date`),
  ADD KEY `plan_end_date` (`plan_end_date`),
  ADD KEY `real_start_date` (`real_start_date`),
  ADD KEY `real_end_date` (`real_end_date`),
  ADD KEY `percent_done` (`percent_done`),
  ADD KEY `projectstates_id` (`projectstates_id`),
  ADD KEY `projecttasktypes_id` (`projecttasktypes_id`),
  ADD KEY `is_milestone` (`is_milestone`);

--
-- Indexes for table `glpi_projecttasktypes`
--
ALTER TABLE `glpi_projecttasktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_projectteams`
--
ALTER TABLE `glpi_projectteams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Indexes for table `glpi_projecttypes`
--
ALTER TABLE `glpi_projecttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_queuednotifications`
--
ALTER TABLE `glpi_queuednotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `sent_try` (`sent_try`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `send_time` (`send_time`),
  ADD KEY `sent_time` (`sent_time`),
  ADD KEY `mode` (`mode`),
  ADD KEY `notificationtemplates_id` (`notificationtemplates_id`);

--
-- Indexes for table `glpi_rackmodels`
--
ALTER TABLE `glpi_rackmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_racks`
--
ALTER TABLE `glpi_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `rackmodels_id` (`rackmodels_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `racktypes_id` (`racktypes_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `dcrooms_id` (`dcrooms_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_racktypes`
--
ALTER TABLE `glpi_racktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_recurrentchanges`
--
ALTER TABLE `glpi_recurrentchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `next_creation_date` (`next_creation_date`),
  ADD KEY `calendars_id` (`calendars_id`);

--
-- Indexes for table `glpi_refusedequipments`
--
ALTER TABLE `glpi_refusedequipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_registeredids`
--
ALTER TABLE `glpi_registeredids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `device_type` (`device_type`);

--
-- Indexes for table `glpi_reminders`
--
ALTER TABLE `glpi_reminders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `date` (`date`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_planned` (`is_planned`),
  ADD KEY `state` (`state`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_reminders_users`
--
ALTER TABLE `glpi_reminders_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `glpi_remindertranslations`
--
ALTER TABLE `glpi_remindertranslations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`reminders_id`,`language`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Indexes for table `glpi_requesttypes`
--
ALTER TABLE `glpi_requesttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_helpdesk_default` (`is_helpdesk_default`),
  ADD KEY `is_followup_default` (`is_followup_default`),
  ADD KEY `is_mail_default` (`is_mail_default`),
  ADD KEY `is_mailfollowup_default` (`is_mailfollowup_default`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_ticketheader` (`is_ticketheader`),
  ADD KEY `is_itilfollowup` (`is_itilfollowup`);

--
-- Indexes for table `glpi_reservationitems`
--
ALTER TABLE `glpi_reservationitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_reservations`
--
ALTER TABLE `glpi_reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `resagroup` (`reservationitems_id`,`group`);

--
-- Indexes for table `glpi_rssfeeds`
--
ALTER TABLE `glpi_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `have_error` (`have_error`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_rssfeeds_users`
--
ALTER TABLE `glpi_rssfeeds_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `glpi_ruleactions`
--
ALTER TABLE `glpi_ruleactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `field_value` (`field`(50),`value`(50));

--
-- Indexes for table `glpi_rulecriterias`
--
ALTER TABLE `glpi_rulecriterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `condition` (`condition`);

--
-- Indexes for table `glpi_rulematchedlogs`
--
ALTER TABLE `glpi_rulematchedlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `rules_id` (`rules_id`);

--
-- Indexes for table `glpi_rulerightparameters`
--
ALTER TABLE `glpi_rulerightparameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_rules`
--
ALTER TABLE `glpi_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `sub_type` (`sub_type`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `condition` (`condition`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_savedsearches`
--
ALTER TABLE `glpi_savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `itemtype` (`itemtype`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `last_execution_time` (`last_execution_time`),
  ADD KEY `last_execution_date` (`last_execution_date`),
  ADD KEY `do_count` (`do_count`);

--
-- Indexes for table `glpi_savedsearches_alerts`
--
ALTER TABLE `glpi_savedsearches_alerts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`savedsearches_id`,`operator`,`value`),
  ADD KEY `name` (`name`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_savedsearches_users`
--
ALTER TABLE `glpi_savedsearches_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  ADD KEY `savedsearches_id` (`savedsearches_id`);

--
-- Indexes for table `glpi_slalevelactions`
--
ALTER TABLE `glpi_slalevelactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slalevels_id` (`slalevels_id`);

--
-- Indexes for table `glpi_slalevelcriterias`
--
ALTER TABLE `glpi_slalevelcriterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slalevels_id` (`slalevels_id`),
  ADD KEY `condition` (`condition`);

--
-- Indexes for table `glpi_slalevels`
--
ALTER TABLE `glpi_slalevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `slas_id` (`slas_id`);

--
-- Indexes for table `glpi_slalevels_tickets`
--
ALTER TABLE `glpi_slalevels_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`slalevels_id`),
  ADD KEY `slalevels_id` (`slalevels_id`);

--
-- Indexes for table `glpi_slas`
--
ALTER TABLE `glpi_slas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `slms_id` (`slms_id`);

--
-- Indexes for table `glpi_slms`
--
ALTER TABLE `glpi_slms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_snmpcredentials`
--
ALTER TABLE `glpi_snmpcredentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `snmpversion` (`snmpversion`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `glpi_socketmodels`
--
ALTER TABLE `glpi_socketmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_sockets`
--
ALTER TABLE `glpi_sockets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `socketmodels_id` (`socketmodels_id`),
  ADD KEY `location_name` (`locations_id`,`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `networkports_id` (`networkports_id`),
  ADD KEY `wiring_side` (`wiring_side`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_softwarecategories`
--
ALTER TABLE `glpi_softwarecategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `softwarecategories_id` (`softwarecategories_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_softwarelicenses`
--
ALTER TABLE `glpi_softwarelicenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `expire` (`expire`),
  ADD KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  ADD KEY `softwareversions_id_use` (`softwareversions_id_use`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `softwares_id_expire_number` (`softwares_id`,`expire`,`number`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `allow_overquota` (`allow_overquota`),
  ADD KEY `softwarelicenses_id` (`softwarelicenses_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_softwarelicensetypes`
--
ALTER TABLE `glpi_softwarelicensetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_softwares`
--
ALTER TABLE `glpi_softwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_update` (`is_update`),
  ADD KEY `softwarecategories_id` (`softwarecategories_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `softwares_id` (`softwares_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_softwareversions`
--
ALTER TABLE `glpi_softwareversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `arch` (`arch`),
  ADD KEY `softwares_id` (`softwares_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `operatingsystems_id` (`operatingsystems_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_solutiontemplates`
--
ALTER TABLE `glpi_solutiontemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `solutiontypes_id` (`solutiontypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_solutiontypes`
--
ALTER TABLE `glpi_solutiontypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_ssovariables`
--
ALTER TABLE `glpi_ssovariables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_states`
--
ALTER TABLE `glpi_states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`states_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_visible_computer` (`is_visible_computer`),
  ADD KEY `is_visible_monitor` (`is_visible_monitor`),
  ADD KEY `is_visible_networkequipment` (`is_visible_networkequipment`),
  ADD KEY `is_visible_peripheral` (`is_visible_peripheral`),
  ADD KEY `is_visible_phone` (`is_visible_phone`),
  ADD KEY `is_visible_printer` (`is_visible_printer`),
  ADD KEY `is_visible_softwareversion` (`is_visible_softwareversion`),
  ADD KEY `is_visible_softwarelicense` (`is_visible_softwarelicense`),
  ADD KEY `is_visible_line` (`is_visible_line`),
  ADD KEY `is_visible_certificate` (`is_visible_certificate`),
  ADD KEY `is_visible_rack` (`is_visible_rack`),
  ADD KEY `is_visible_passivedcequipment` (`is_visible_passivedcequipment`),
  ADD KEY `is_visible_enclosure` (`is_visible_enclosure`),
  ADD KEY `is_visible_pdu` (`is_visible_pdu`),
  ADD KEY `is_visible_cluster` (`is_visible_cluster`),
  ADD KEY `is_visible_contract` (`is_visible_contract`),
  ADD KEY `is_visible_appliance` (`is_visible_appliance`),
  ADD KEY `is_visible_databaseinstance` (`is_visible_databaseinstance`),
  ADD KEY `is_visible_cable` (`is_visible_cable`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_suppliers`
--
ALTER TABLE `glpi_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `suppliertypes_id` (`suppliertypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `glpi_suppliers_tickets`
--
ALTER TABLE `glpi_suppliers_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  ADD KEY `group` (`suppliers_id`,`type`);

--
-- Indexes for table `glpi_suppliertypes`
--
ALTER TABLE `glpi_suppliertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_taskcategories`
--
ALTER TABLE `glpi_taskcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `glpi_tasktemplates`
--
ALTER TABLE `glpi_tasktemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`);

--
-- Indexes for table `glpi_ticketcosts`
--
ALTER TABLE `glpi_ticketcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Indexes for table `glpi_ticketrecurrents`
--
ALTER TABLE `glpi_ticketrecurrents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`),
  ADD KEY `next_creation_date` (`next_creation_date`),
  ADD KEY `calendars_id` (`calendars_id`);

--
-- Indexes for table `glpi_tickets`
--
ALTER TABLE `glpi_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `closedate` (`closedate`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `request_type` (`requesttypes_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `users_id_recipient` (`users_id_recipient`),
  ADD KEY `solvedate` (`solvedate`),
  ADD KEY `takeintoaccountdate` (`takeintoaccountdate`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `impact` (`impact`),
  ADD KEY `global_validation` (`global_validation`),
  ADD KEY `slas_id_tto` (`slas_id_tto`),
  ADD KEY `slas_id_ttr` (`slas_id_ttr`),
  ADD KEY `time_to_resolve` (`time_to_resolve`),
  ADD KEY `time_to_own` (`time_to_own`),
  ADD KEY `olas_id_tto` (`olas_id_tto`),
  ADD KEY `olas_id_ttr` (`olas_id_ttr`),
  ADD KEY `slalevels_id_ttr` (`slalevels_id_ttr`),
  ADD KEY `internal_time_to_resolve` (`internal_time_to_resolve`),
  ADD KEY `internal_time_to_own` (`internal_time_to_own`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `type` (`type`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `ola_waiting_duration` (`ola_waiting_duration`),
  ADD KEY `olalevels_id_ttr` (`olalevels_id_ttr`);

--
-- Indexes for table `glpi_ticketsatisfactions`
--
ALTER TABLE `glpi_ticketsatisfactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_id` (`tickets_id`);

--
-- Indexes for table `glpi_tickets_contracts`
--
ALTER TABLE `glpi_tickets_contracts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`contracts_id`),
  ADD KEY `contracts_id` (`contracts_id`);

--
-- Indexes for table `glpi_tickets_tickets`
--
ALTER TABLE `glpi_tickets_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id_1`,`tickets_id_2`),
  ADD KEY `tickets_id_2` (`tickets_id_2`);

--
-- Indexes for table `glpi_tickets_users`
--
ALTER TABLE `glpi_tickets_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  ADD KEY `user` (`users_id`,`type`);

--
-- Indexes for table `glpi_tickettasks`
--
ALTER TABLE `glpi_tickettasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `state` (`state`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `tasktemplates_id` (`tasktemplates_id`),
  ADD KEY `sourceitems_id` (`sourceitems_id`),
  ADD KEY `sourceof_items_id` (`sourceof_items_id`);

--
-- Indexes for table `glpi_tickettemplatehiddenfields`
--
ALTER TABLE `glpi_tickettemplatehiddenfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickettemplates_id`,`num`);

--
-- Indexes for table `glpi_tickettemplatemandatoryfields`
--
ALTER TABLE `glpi_tickettemplatemandatoryfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickettemplates_id`,`num`);

--
-- Indexes for table `glpi_tickettemplatepredefinedfields`
--
ALTER TABLE `glpi_tickettemplatepredefinedfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`);

--
-- Indexes for table `glpi_tickettemplates`
--
ALTER TABLE `glpi_tickettemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Indexes for table `glpi_ticketvalidations`
--
ALTER TABLE `glpi_ticketvalidations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_validate` (`users_id_validate`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `submission_date` (`submission_date`),
  ADD KEY `validation_date` (`validation_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `glpi_transfers`
--
ALTER TABLE `glpi_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_unmanageds`
--
ALTER TABLE `glpi_unmanageds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `snmpcredentials_id` (`snmpcredentials_id`),
  ADD KEY `users_id_tech` (`users_id_tech`);

--
-- Indexes for table `glpi_usbvendors`
--
ALTER TABLE `glpi_usbvendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  ADD KEY `deviceid` (`deviceid`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_usercategories`
--
ALTER TABLE `glpi_usercategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_useremails`
--
ALTER TABLE `glpi_useremails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`email`),
  ADD KEY `email` (`email`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Indexes for table `glpi_users`
--
ALTER TABLE `glpi_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicityloginauth` (`name`,`authtype`,`auths_id`),
  ADD KEY `firstname` (`firstname`),
  ADD KEY `realname` (`realname`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `usertitles_id` (`usertitles_id`),
  ADD KEY `usercategories_id` (`usercategories_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `authitem` (`authtype`,`auths_id`),
  ADD KEY `is_deleted_ldap` (`is_deleted_ldap`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `sync_field` (`sync_field`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id_supervisor` (`users_id_supervisor`),
  ADD KEY `auths_id` (`auths_id`),
  ADD KEY `default_requesttypes_id` (`default_requesttypes_id`);

--
-- Indexes for table `glpi_usertitles`
--
ALTER TABLE `glpi_usertitles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_virtualmachinestates`
--
ALTER TABLE `glpi_virtualmachinestates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_virtualmachinesystems`
--
ALTER TABLE `glpi_virtualmachinesystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_virtualmachinetypes`
--
ALTER TABLE `glpi_virtualmachinetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_vlans`
--
ALTER TABLE `glpi_vlans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `tag` (`tag`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_vobjects`
--
ALTER TABLE `glpi_vobjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Indexes for table `glpi_wifinetworks`
--
ALTER TABLE `glpi_wifinetworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `essid` (`essid`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `glpi_agents`
--
ALTER TABLE `glpi_agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_agenttypes`
--
ALTER TABLE `glpi_agenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_alerts`
--
ALTER TABLE `glpi_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_apiclients`
--
ALTER TABLE `glpi_apiclients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `glpi_applianceenvironments`
--
ALTER TABLE `glpi_applianceenvironments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_appliances`
--
ALTER TABLE `glpi_appliances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_appliances_items`
--
ALTER TABLE `glpi_appliances_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_appliances_items_relations`
--
ALTER TABLE `glpi_appliances_items_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_appliancetypes`
--
ALTER TABLE `glpi_appliancetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_authldapreplicates`
--
ALTER TABLE `glpi_authldapreplicates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_authldaps`
--
ALTER TABLE `glpi_authldaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_authmails`
--
ALTER TABLE `glpi_authmails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_autoupdatesystems`
--
ALTER TABLE `glpi_autoupdatesystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_blacklistedmailcontents`
--
ALTER TABLE `glpi_blacklistedmailcontents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_blacklists`
--
ALTER TABLE `glpi_blacklists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `glpi_budgets`
--
ALTER TABLE `glpi_budgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_budgettypes`
--
ALTER TABLE `glpi_budgettypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_businesscriticities`
--
ALTER TABLE `glpi_businesscriticities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cables`
--
ALTER TABLE `glpi_cables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cablestrands`
--
ALTER TABLE `glpi_cablestrands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cabletypes`
--
ALTER TABLE `glpi_cabletypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_calendars`
--
ALTER TABLE `glpi_calendars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `glpi_calendarsegments`
--
ALTER TABLE `glpi_calendarsegments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `glpi_calendars_holidays`
--
ALTER TABLE `glpi_calendars_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cartridgeitems`
--
ALTER TABLE `glpi_cartridgeitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cartridgeitems_printermodels`
--
ALTER TABLE `glpi_cartridgeitems_printermodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cartridgeitemtypes`
--
ALTER TABLE `glpi_cartridgeitemtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_cartridges`
--
ALTER TABLE `glpi_cartridges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_certificates`
--
ALTER TABLE `glpi_certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_certificates_items`
--
ALTER TABLE `glpi_certificates_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_certificatetypes`
--
ALTER TABLE `glpi_certificatetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changecosts`
--
ALTER TABLE `glpi_changecosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes`
--
ALTER TABLE `glpi_changes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes_groups`
--
ALTER TABLE `glpi_changes_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes_items`
--
ALTER TABLE `glpi_changes_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes_problems`
--
ALTER TABLE `glpi_changes_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes_suppliers`
--
ALTER TABLE `glpi_changes_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes_tickets`
--
ALTER TABLE `glpi_changes_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changes_users`
--
ALTER TABLE `glpi_changes_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changetasks`
--
ALTER TABLE `glpi_changetasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changetemplatehiddenfields`
--
ALTER TABLE `glpi_changetemplatehiddenfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changetemplatemandatoryfields`
--
ALTER TABLE `glpi_changetemplatemandatoryfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_changetemplatepredefinedfields`
--
ALTER TABLE `glpi_changetemplatepredefinedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_changetemplates`
--
ALTER TABLE `glpi_changetemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_changevalidations`
--
ALTER TABLE `glpi_changevalidations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_clusters`
--
ALTER TABLE `glpi_clusters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_clustertypes`
--
ALTER TABLE `glpi_clustertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_computerantiviruses`
--
ALTER TABLE `glpi_computerantiviruses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_computermodels`
--
ALTER TABLE `glpi_computermodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_computers`
--
ALTER TABLE `glpi_computers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_computers_items`
--
ALTER TABLE `glpi_computers_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_computertypes`
--
ALTER TABLE `glpi_computertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_computervirtualmachines`
--
ALTER TABLE `glpi_computervirtualmachines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_configs`
--
ALTER TABLE `glpi_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `glpi_consumableitems`
--
ALTER TABLE `glpi_consumableitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_consumableitemtypes`
--
ALTER TABLE `glpi_consumableitemtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_consumables`
--
ALTER TABLE `glpi_consumables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contacts`
--
ALTER TABLE `glpi_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contacts_suppliers`
--
ALTER TABLE `glpi_contacts_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contacttypes`
--
ALTER TABLE `glpi_contacttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contractcosts`
--
ALTER TABLE `glpi_contractcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contracts`
--
ALTER TABLE `glpi_contracts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contracts_items`
--
ALTER TABLE `glpi_contracts_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contracts_suppliers`
--
ALTER TABLE `glpi_contracts_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_contracttypes`
--
ALTER TABLE `glpi_contracttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_crontasklogs`
--
ALTER TABLE `glpi_crontasklogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_crontasks`
--
ALTER TABLE `glpi_crontasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `glpi_dashboards_dashboards`
--
ALTER TABLE `glpi_dashboards_dashboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `glpi_dashboards_filters`
--
ALTER TABLE `glpi_dashboards_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_dashboards_items`
--
ALTER TABLE `glpi_dashboards_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `glpi_dashboards_rights`
--
ALTER TABLE `glpi_dashboards_rights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_databaseinstancecategories`
--
ALTER TABLE `glpi_databaseinstancecategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_databaseinstances`
--
ALTER TABLE `glpi_databaseinstances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_databaseinstancetypes`
--
ALTER TABLE `glpi_databaseinstancetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_databases`
--
ALTER TABLE `glpi_databases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_datacenters`
--
ALTER TABLE `glpi_datacenters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_dcrooms`
--
ALTER TABLE `glpi_dcrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicebatteries`
--
ALTER TABLE `glpi_devicebatteries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicebatterymodels`
--
ALTER TABLE `glpi_devicebatterymodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicebatterytypes`
--
ALTER TABLE `glpi_devicebatterytypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecameramodels`
--
ALTER TABLE `glpi_devicecameramodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecameras`
--
ALTER TABLE `glpi_devicecameras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecasemodels`
--
ALTER TABLE `glpi_devicecasemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecases`
--
ALTER TABLE `glpi_devicecases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecasetypes`
--
ALTER TABLE `glpi_devicecasetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecontrolmodels`
--
ALTER TABLE `glpi_devicecontrolmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicecontrols`
--
ALTER TABLE `glpi_devicecontrols`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicedrivemodels`
--
ALTER TABLE `glpi_devicedrivemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicedrives`
--
ALTER TABLE `glpi_devicedrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicefirmwaremodels`
--
ALTER TABLE `glpi_devicefirmwaremodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicefirmwares`
--
ALTER TABLE `glpi_devicefirmwares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicefirmwaretypes`
--
ALTER TABLE `glpi_devicefirmwaretypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `glpi_devicegenericmodels`
--
ALTER TABLE `glpi_devicegenericmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicegenerics`
--
ALTER TABLE `glpi_devicegenerics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicegenerictypes`
--
ALTER TABLE `glpi_devicegenerictypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicegraphiccardmodels`
--
ALTER TABLE `glpi_devicegraphiccardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicegraphiccards`
--
ALTER TABLE `glpi_devicegraphiccards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_deviceharddrivemodels`
--
ALTER TABLE `glpi_deviceharddrivemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_deviceharddrives`
--
ALTER TABLE `glpi_deviceharddrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicememories`
--
ALTER TABLE `glpi_devicememories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicememorymodels`
--
ALTER TABLE `glpi_devicememorymodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicememorytypes`
--
ALTER TABLE `glpi_devicememorytypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `glpi_devicemotherboardmodels`
--
ALTER TABLE `glpi_devicemotherboardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicemotherboards`
--
ALTER TABLE `glpi_devicemotherboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicenetworkcardmodels`
--
ALTER TABLE `glpi_devicenetworkcardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicenetworkcards`
--
ALTER TABLE `glpi_devicenetworkcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicepcimodels`
--
ALTER TABLE `glpi_devicepcimodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicepcis`
--
ALTER TABLE `glpi_devicepcis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicepowersupplies`
--
ALTER TABLE `glpi_devicepowersupplies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicepowersupplymodels`
--
ALTER TABLE `glpi_devicepowersupplymodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_deviceprocessormodels`
--
ALTER TABLE `glpi_deviceprocessormodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_deviceprocessors`
--
ALTER TABLE `glpi_deviceprocessors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicesensormodels`
--
ALTER TABLE `glpi_devicesensormodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicesensors`
--
ALTER TABLE `glpi_devicesensors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicesensortypes`
--
ALTER TABLE `glpi_devicesensortypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicesimcards`
--
ALTER TABLE `glpi_devicesimcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicesimcardtypes`
--
ALTER TABLE `glpi_devicesimcardtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `glpi_devicesoundcardmodels`
--
ALTER TABLE `glpi_devicesoundcardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_devicesoundcards`
--
ALTER TABLE `glpi_devicesoundcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_displaypreferences`
--
ALTER TABLE `glpi_displaypreferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `glpi_documentcategories`
--
ALTER TABLE `glpi_documentcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_documents`
--
ALTER TABLE `glpi_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_documents_items`
--
ALTER TABLE `glpi_documents_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_documenttypes`
--
ALTER TABLE `glpi_documenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `glpi_domainrecords`
--
ALTER TABLE `glpi_domainrecords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_domainrecordtypes`
--
ALTER TABLE `glpi_domainrecordtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `glpi_domainrelations`
--
ALTER TABLE `glpi_domainrelations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `glpi_domains`
--
ALTER TABLE `glpi_domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_domains_items`
--
ALTER TABLE `glpi_domains_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_domaintypes`
--
ALTER TABLE `glpi_domaintypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_dropdowntranslations`
--
ALTER TABLE `glpi_dropdowntranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_enclosuremodels`
--
ALTER TABLE `glpi_enclosuremodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_enclosures`
--
ALTER TABLE `glpi_enclosures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_entities_knowbaseitems`
--
ALTER TABLE `glpi_entities_knowbaseitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_entities_reminders`
--
ALTER TABLE `glpi_entities_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_entities_rssfeeds`
--
ALTER TABLE `glpi_entities_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_events`
--
ALTER TABLE `glpi_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1504;

--
-- AUTO_INCREMENT for table `glpi_fieldblacklists`
--
ALTER TABLE `glpi_fieldblacklists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_fieldunicities`
--
ALTER TABLE `glpi_fieldunicities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_filesystems`
--
ALTER TABLE `glpi_filesystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `glpi_fqdns`
--
ALTER TABLE `glpi_fqdns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_groups`
--
ALTER TABLE `glpi_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `glpi_groups_knowbaseitems`
--
ALTER TABLE `glpi_groups_knowbaseitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_groups_problems`
--
ALTER TABLE `glpi_groups_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_groups_reminders`
--
ALTER TABLE `glpi_groups_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_groups_rssfeeds`
--
ALTER TABLE `glpi_groups_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_groups_tickets`
--
ALTER TABLE `glpi_groups_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_groups_users`
--
ALTER TABLE `glpi_groups_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `glpi_holidays`
--
ALTER TABLE `glpi_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_imageformats`
--
ALTER TABLE `glpi_imageformats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_imageresolutions`
--
ALTER TABLE `glpi_imageresolutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_impactcompounds`
--
ALTER TABLE `glpi_impactcompounds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_impactcontexts`
--
ALTER TABLE `glpi_impactcontexts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_impactitems`
--
ALTER TABLE `glpi_impactitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_impactrelations`
--
ALTER TABLE `glpi_impactrelations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_infocoms`
--
ALTER TABLE `glpi_infocoms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_interfacetypes`
--
ALTER TABLE `glpi_interfacetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `glpi_ipaddresses`
--
ALTER TABLE `glpi_ipaddresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ipaddresses_ipnetworks`
--
ALTER TABLE `glpi_ipaddresses_ipnetworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ipnetworks`
--
ALTER TABLE `glpi_ipnetworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ipnetworks_vlans`
--
ALTER TABLE `glpi_ipnetworks_vlans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_clusters`
--
ALTER TABLE `glpi_items_clusters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicebatteries`
--
ALTER TABLE `glpi_items_devicebatteries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicecameras`
--
ALTER TABLE `glpi_items_devicecameras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicecameras_imageformats`
--
ALTER TABLE `glpi_items_devicecameras_imageformats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicecameras_imageresolutions`
--
ALTER TABLE `glpi_items_devicecameras_imageresolutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicecases`
--
ALTER TABLE `glpi_items_devicecases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicecontrols`
--
ALTER TABLE `glpi_items_devicecontrols`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicedrives`
--
ALTER TABLE `glpi_items_devicedrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicefirmwares`
--
ALTER TABLE `glpi_items_devicefirmwares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicegenerics`
--
ALTER TABLE `glpi_items_devicegenerics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicegraphiccards`
--
ALTER TABLE `glpi_items_devicegraphiccards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_deviceharddrives`
--
ALTER TABLE `glpi_items_deviceharddrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicememories`
--
ALTER TABLE `glpi_items_devicememories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicemotherboards`
--
ALTER TABLE `glpi_items_devicemotherboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicenetworkcards`
--
ALTER TABLE `glpi_items_devicenetworkcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicepcis`
--
ALTER TABLE `glpi_items_devicepcis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicepowersupplies`
--
ALTER TABLE `glpi_items_devicepowersupplies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_deviceprocessors`
--
ALTER TABLE `glpi_items_deviceprocessors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicesensors`
--
ALTER TABLE `glpi_items_devicesensors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicesimcards`
--
ALTER TABLE `glpi_items_devicesimcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_devicesoundcards`
--
ALTER TABLE `glpi_items_devicesoundcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_disks`
--
ALTER TABLE `glpi_items_disks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_enclosures`
--
ALTER TABLE `glpi_items_enclosures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_kanbans`
--
ALTER TABLE `glpi_items_kanbans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_operatingsystems`
--
ALTER TABLE `glpi_items_operatingsystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_problems`
--
ALTER TABLE `glpi_items_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_projects`
--
ALTER TABLE `glpi_items_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_racks`
--
ALTER TABLE `glpi_items_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_remotemanagements`
--
ALTER TABLE `glpi_items_remotemanagements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_softwarelicenses`
--
ALTER TABLE `glpi_items_softwarelicenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_softwareversions`
--
ALTER TABLE `glpi_items_softwareversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_items_tickets`
--
ALTER TABLE `glpi_items_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_itilcategories`
--
ALTER TABLE `glpi_itilcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_itilfollowups`
--
ALTER TABLE `glpi_itilfollowups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_itilfollowuptemplates`
--
ALTER TABLE `glpi_itilfollowuptemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_itilsolutions`
--
ALTER TABLE `glpi_itilsolutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_itils_projects`
--
ALTER TABLE `glpi_itils_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitemcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems`
--
ALTER TABLE `glpi_knowbaseitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems_comments`
--
ALTER TABLE `glpi_knowbaseitems_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems_items`
--
ALTER TABLE `glpi_knowbaseitems_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitems_knowbaseitemcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems_profiles`
--
ALTER TABLE `glpi_knowbaseitems_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems_revisions`
--
ALTER TABLE `glpi_knowbaseitems_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitems_users`
--
ALTER TABLE `glpi_knowbaseitems_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_knowbaseitemtranslations`
--
ALTER TABLE `glpi_knowbaseitemtranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_lineoperators`
--
ALTER TABLE `glpi_lineoperators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_lines`
--
ALTER TABLE `glpi_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_linetypes`
--
ALTER TABLE `glpi_linetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_links`
--
ALTER TABLE `glpi_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_links_itemtypes`
--
ALTER TABLE `glpi_links_itemtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_locations`
--
ALTER TABLE `glpi_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_lockedfields`
--
ALTER TABLE `glpi_lockedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_logs`
--
ALTER TABLE `glpi_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_mailcollectors`
--
ALTER TABLE `glpi_mailcollectors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_manuallinks`
--
ALTER TABLE `glpi_manuallinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_manufacturers`
--
ALTER TABLE `glpi_manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_monitormodels`
--
ALTER TABLE `glpi_monitormodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_monitors`
--
ALTER TABLE `glpi_monitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_monitortypes`
--
ALTER TABLE `glpi_monitortypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkaliases`
--
ALTER TABLE `glpi_networkaliases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkequipmentmodels`
--
ALTER TABLE `glpi_networkequipmentmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkequipments`
--
ALTER TABLE `glpi_networkequipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkequipmenttypes`
--
ALTER TABLE `glpi_networkequipmenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkinterfaces`
--
ALTER TABLE `glpi_networkinterfaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networknames`
--
ALTER TABLE `glpi_networknames`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportaggregates`
--
ALTER TABLE `glpi_networkportaggregates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportaliases`
--
ALTER TABLE `glpi_networkportaliases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportconnectionlogs`
--
ALTER TABLE `glpi_networkportconnectionlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportdialups`
--
ALTER TABLE `glpi_networkportdialups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportethernets`
--
ALTER TABLE `glpi_networkportethernets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportfiberchannels`
--
ALTER TABLE `glpi_networkportfiberchannels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportfiberchanneltypes`
--
ALTER TABLE `glpi_networkportfiberchanneltypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportlocals`
--
ALTER TABLE `glpi_networkportlocals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkportmetrics`
--
ALTER TABLE `glpi_networkportmetrics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkports`
--
ALTER TABLE `glpi_networkports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkports_networkports`
--
ALTER TABLE `glpi_networkports_networkports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkports_vlans`
--
ALTER TABLE `glpi_networkports_vlans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networkporttypes`
--
ALTER TABLE `glpi_networkporttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `glpi_networkportwifis`
--
ALTER TABLE `glpi_networkportwifis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_networks`
--
ALTER TABLE `glpi_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_notepads`
--
ALTER TABLE `glpi_notepads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_notifications`
--
ALTER TABLE `glpi_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `glpi_notifications_notificationtemplates`
--
ALTER TABLE `glpi_notifications_notificationtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `glpi_notificationtargets`
--
ALTER TABLE `glpi_notificationtargets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `glpi_notificationtemplates`
--
ALTER TABLE `glpi_notificationtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `glpi_notificationtemplatetranslations`
--
ALTER TABLE `glpi_notificationtemplatetranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `glpi_notimportedemails`
--
ALTER TABLE `glpi_notimportedemails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_objectlocks`
--
ALTER TABLE `glpi_objectlocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_olalevelactions`
--
ALTER TABLE `glpi_olalevelactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_olalevelcriterias`
--
ALTER TABLE `glpi_olalevelcriterias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_olalevels`
--
ALTER TABLE `glpi_olalevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_olalevels_tickets`
--
ALTER TABLE `glpi_olalevels_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_olas`
--
ALTER TABLE `glpi_olas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `glpi_operatingsystemarchitectures`
--
ALTER TABLE `glpi_operatingsystemarchitectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_operatingsystemeditions`
--
ALTER TABLE `glpi_operatingsystemeditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_operatingsystemkernels`
--
ALTER TABLE `glpi_operatingsystemkernels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_operatingsystemkernelversions`
--
ALTER TABLE `glpi_operatingsystemkernelversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_operatingsystems`
--
ALTER TABLE `glpi_operatingsystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_operatingsystemservicepacks`
--
ALTER TABLE `glpi_operatingsystemservicepacks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_operatingsystemversions`
--
ALTER TABLE `glpi_operatingsystemversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_passivedcequipmentmodels`
--
ALTER TABLE `glpi_passivedcequipmentmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_passivedcequipments`
--
ALTER TABLE `glpi_passivedcequipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_passivedcequipmenttypes`
--
ALTER TABLE `glpi_passivedcequipmenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pcivendors`
--
ALTER TABLE `glpi_pcivendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pdumodels`
--
ALTER TABLE `glpi_pdumodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pdus`
--
ALTER TABLE `glpi_pdus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pdus_plugs`
--
ALTER TABLE `glpi_pdus_plugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pdus_racks`
--
ALTER TABLE `glpi_pdus_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pdutypes`
--
ALTER TABLE `glpi_pdutypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pendingreasons`
--
ALTER TABLE `glpi_pendingreasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_pendingreasons_items`
--
ALTER TABLE `glpi_pendingreasons_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_peripheralmodels`
--
ALTER TABLE `glpi_peripheralmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_peripherals`
--
ALTER TABLE `glpi_peripherals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_peripheraltypes`
--
ALTER TABLE `glpi_peripheraltypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_phonemodels`
--
ALTER TABLE `glpi_phonemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_phonepowersupplies`
--
ALTER TABLE `glpi_phonepowersupplies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_phones`
--
ALTER TABLE `glpi_phones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_phonetypes`
--
ALTER TABLE `glpi_phonetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_planningeventcategories`
--
ALTER TABLE `glpi_planningeventcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_planningexternalevents`
--
ALTER TABLE `glpi_planningexternalevents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_planningexternaleventtemplates`
--
ALTER TABLE `glpi_planningexternaleventtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_planningrecalls`
--
ALTER TABLE `glpi_planningrecalls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_plugins`
--
ALTER TABLE `glpi_plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_plugs`
--
ALTER TABLE `glpi_plugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_printerlogs`
--
ALTER TABLE `glpi_printerlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_printermodels`
--
ALTER TABLE `glpi_printermodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_printers`
--
ALTER TABLE `glpi_printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_printers_cartridgeinfos`
--
ALTER TABLE `glpi_printers_cartridgeinfos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_printertypes`
--
ALTER TABLE `glpi_printertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problemcosts`
--
ALTER TABLE `glpi_problemcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problems`
--
ALTER TABLE `glpi_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problems_suppliers`
--
ALTER TABLE `glpi_problems_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problems_tickets`
--
ALTER TABLE `glpi_problems_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problems_users`
--
ALTER TABLE `glpi_problems_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problemtasks`
--
ALTER TABLE `glpi_problemtasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problemtemplatehiddenfields`
--
ALTER TABLE `glpi_problemtemplatehiddenfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problemtemplatemandatoryfields`
--
ALTER TABLE `glpi_problemtemplatemandatoryfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_problemtemplatepredefinedfields`
--
ALTER TABLE `glpi_problemtemplatepredefinedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_problemtemplates`
--
ALTER TABLE `glpi_problemtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_profilerights`
--
ALTER TABLE `glpi_profilerights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `glpi_profiles`
--
ALTER TABLE `glpi_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `glpi_profiles_reminders`
--
ALTER TABLE `glpi_profiles_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_profiles_rssfeeds`
--
ALTER TABLE `glpi_profiles_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_profiles_users`
--
ALTER TABLE `glpi_profiles_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `glpi_projectcosts`
--
ALTER TABLE `glpi_projectcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projects`
--
ALTER TABLE `glpi_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projectstates`
--
ALTER TABLE `glpi_projectstates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `glpi_projecttasklinks`
--
ALTER TABLE `glpi_projecttasklinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projecttasks`
--
ALTER TABLE `glpi_projecttasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projecttasks_tickets`
--
ALTER TABLE `glpi_projecttasks_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projecttaskteams`
--
ALTER TABLE `glpi_projecttaskteams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projecttasktemplates`
--
ALTER TABLE `glpi_projecttasktemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projecttasktypes`
--
ALTER TABLE `glpi_projecttasktypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projectteams`
--
ALTER TABLE `glpi_projectteams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_projecttypes`
--
ALTER TABLE `glpi_projecttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_queuednotifications`
--
ALTER TABLE `glpi_queuednotifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=843;

--
-- AUTO_INCREMENT for table `glpi_rackmodels`
--
ALTER TABLE `glpi_rackmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_racks`
--
ALTER TABLE `glpi_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_racktypes`
--
ALTER TABLE `glpi_racktypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_recurrentchanges`
--
ALTER TABLE `glpi_recurrentchanges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_refusedequipments`
--
ALTER TABLE `glpi_refusedequipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_registeredids`
--
ALTER TABLE `glpi_registeredids`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_reminders`
--
ALTER TABLE `glpi_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_reminders_users`
--
ALTER TABLE `glpi_reminders_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_remindertranslations`
--
ALTER TABLE `glpi_remindertranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_requesttypes`
--
ALTER TABLE `glpi_requesttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `glpi_reservationitems`
--
ALTER TABLE `glpi_reservationitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_reservations`
--
ALTER TABLE `glpi_reservations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_rssfeeds`
--
ALTER TABLE `glpi_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_rssfeeds_users`
--
ALTER TABLE `glpi_rssfeeds_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ruleactions`
--
ALTER TABLE `glpi_ruleactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `glpi_rulecriterias`
--
ALTER TABLE `glpi_rulecriterias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `glpi_rulematchedlogs`
--
ALTER TABLE `glpi_rulematchedlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_rulerightparameters`
--
ALTER TABLE `glpi_rulerightparameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `glpi_rules`
--
ALTER TABLE `glpi_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `glpi_savedsearches`
--
ALTER TABLE `glpi_savedsearches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_savedsearches_alerts`
--
ALTER TABLE `glpi_savedsearches_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_savedsearches_users`
--
ALTER TABLE `glpi_savedsearches_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_slalevelactions`
--
ALTER TABLE `glpi_slalevelactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `glpi_slalevelcriterias`
--
ALTER TABLE `glpi_slalevelcriterias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `glpi_slalevels`
--
ALTER TABLE `glpi_slalevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `glpi_slalevels_tickets`
--
ALTER TABLE `glpi_slalevels_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=647;

--
-- AUTO_INCREMENT for table `glpi_slas`
--
ALTER TABLE `glpi_slas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `glpi_slms`
--
ALTER TABLE `glpi_slms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `glpi_snmpcredentials`
--
ALTER TABLE `glpi_snmpcredentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `glpi_socketmodels`
--
ALTER TABLE `glpi_socketmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_sockets`
--
ALTER TABLE `glpi_sockets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_softwarecategories`
--
ALTER TABLE `glpi_softwarecategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_softwarelicenses`
--
ALTER TABLE `glpi_softwarelicenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_softwarelicensetypes`
--
ALTER TABLE `glpi_softwarelicensetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_softwares`
--
ALTER TABLE `glpi_softwares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_softwareversions`
--
ALTER TABLE `glpi_softwareversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_solutiontemplates`
--
ALTER TABLE `glpi_solutiontemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_solutiontypes`
--
ALTER TABLE `glpi_solutiontypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ssovariables`
--
ALTER TABLE `glpi_ssovariables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `glpi_states`
--
ALTER TABLE `glpi_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_suppliers`
--
ALTER TABLE `glpi_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_suppliers_tickets`
--
ALTER TABLE `glpi_suppliers_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_suppliertypes`
--
ALTER TABLE `glpi_suppliertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_taskcategories`
--
ALTER TABLE `glpi_taskcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tasktemplates`
--
ALTER TABLE `glpi_tasktemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ticketcosts`
--
ALTER TABLE `glpi_ticketcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ticketrecurrents`
--
ALTER TABLE `glpi_ticketrecurrents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickets`
--
ALTER TABLE `glpi_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_ticketsatisfactions`
--
ALTER TABLE `glpi_ticketsatisfactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickets_contracts`
--
ALTER TABLE `glpi_tickets_contracts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickets_tickets`
--
ALTER TABLE `glpi_tickets_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickets_users`
--
ALTER TABLE `glpi_tickets_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `glpi_tickettasks`
--
ALTER TABLE `glpi_tickettasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickettemplatehiddenfields`
--
ALTER TABLE `glpi_tickettemplatehiddenfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickettemplatemandatoryfields`
--
ALTER TABLE `glpi_tickettemplatemandatoryfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_tickettemplatepredefinedfields`
--
ALTER TABLE `glpi_tickettemplatepredefinedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_tickettemplates`
--
ALTER TABLE `glpi_tickettemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_ticketvalidations`
--
ALTER TABLE `glpi_ticketvalidations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_transfers`
--
ALTER TABLE `glpi_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glpi_unmanageds`
--
ALTER TABLE `glpi_unmanageds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_usbvendors`
--
ALTER TABLE `glpi_usbvendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_usercategories`
--
ALTER TABLE `glpi_usercategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_useremails`
--
ALTER TABLE `glpi_useremails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `glpi_users`
--
ALTER TABLE `glpi_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `glpi_usertitles`
--
ALTER TABLE `glpi_usertitles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_virtualmachinestates`
--
ALTER TABLE `glpi_virtualmachinestates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_virtualmachinesystems`
--
ALTER TABLE `glpi_virtualmachinesystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_virtualmachinetypes`
--
ALTER TABLE `glpi_virtualmachinetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_vlans`
--
ALTER TABLE `glpi_vlans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_vobjects`
--
ALTER TABLE `glpi_vobjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glpi_wifinetworks`
--
ALTER TABLE `glpi_wifinetworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
