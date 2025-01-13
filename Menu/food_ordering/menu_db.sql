-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2024 at 01:14 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add menu item', 7, 'add_menuitem'),
(26, 'Can change menu item', 7, 'change_menuitem'),
(27, 'Can delete menu item', 7, 'delete_menuitem'),
(28, 'Can view menu item', 7, 'view_menuitem'),
(29, 'Can add order item', 8, 'add_orderitem'),
(30, 'Can change order item', 8, 'change_orderitem'),
(31, 'Can delete order item', 8, 'delete_orderitem'),
(32, 'Can view order item', 8, 'view_orderitem'),
(33, 'Can add order', 9, 'add_order'),
(34, 'Can change order', 9, 'change_order'),
(35, 'Can delete order', 9, 'delete_order'),
(36, 'Can view order', 9, 'view_order');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$NAVMFPfV1Xu5FMtDo6KWit$NjUI4MELlsyv17ictwSKOS/bOCmdCIs7Lwc22r9Huw4=', '2024-12-11 11:52:13.838959', 1, 'afridi', '', '', 'sheikhshemantoafridi@gmail.com', 1, 1, '2024-12-08 10:49:31.862310');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-12-08 11:30:20.932583', '1', 'Rice', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-12-08 11:33:15.812963', '1', 'Rice', 3, '', 7, 1),
(3, '2024-12-08 11:34:28.906651', '2', 'Rice', 1, '[{\"added\": {}}]', 7, 1),
(4, '2024-12-08 12:02:17.501390', '2', 'Rice', 2, '[]', 7, 1),
(5, '2024-12-08 12:02:24.205679', '2', 'Rice', 2, '[]', 7, 1),
(6, '2024-12-08 12:02:51.866780', '3', 'Roti', 1, '[{\"added\": {}}]', 7, 1),
(7, '2024-12-08 12:03:29.115131', '4', 'Dal', 1, '[{\"added\": {}}]', 7, 1),
(8, '2024-12-08 12:03:56.683512', '5', 'Fried Egg', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-12-08 12:04:41.795574', '6', 'Mixed Vegetable', 1, '[{\"added\": {}}]', 7, 1),
(10, '2024-12-08 12:05:37.676855', '7', 'Chicken Curry', 1, '[{\"added\": {}}]', 7, 1),
(11, '2024-12-08 12:05:54.212298', '8', 'Beef Curry', 1, '[{\"added\": {}}]', 7, 1),
(12, '2024-12-08 12:06:55.107596', '9', 'Fish Curry', 1, '[{\"added\": {}}]', 7, 1),
(13, '2024-12-08 12:07:08.883354', '10', 'Shingara', 1, '[{\"added\": {}}]', 7, 1),
(14, '2024-12-08 12:07:37.419158', '11', 'Samosa', 1, '[{\"added\": {}}]', 7, 1),
(15, '2024-12-08 12:07:45.514745', '12', 'Puri', 1, '[{\"added\": {}}]', 7, 1),
(16, '2024-12-08 12:09:01.003610', '13', 'Milk Tea', 1, '[{\"added\": {}}]', 7, 1),
(17, '2024-12-08 12:09:14.628174', '14', 'Black Tea', 1, '[{\"added\": {}}]', 7, 1),
(18, '2024-12-08 12:12:05.083563', '2', 'Rice', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 7, 1),
(19, '2024-12-09 07:53:41.213318', '15', 'Chicken Balls', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'menu', 'menuitem'),
(9, 'menu', 'order'),
(8, 'menu', 'orderitem'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-08 10:44:35.559853'),
(2, 'auth', '0001_initial', '2024-12-08 10:44:35.884727'),
(3, 'admin', '0001_initial', '2024-12-08 10:44:35.963082'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-12-08 10:44:35.970960'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-08 10:44:35.975873'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-12-08 10:44:36.024200'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-12-08 10:44:36.060268'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-12-08 10:44:36.077437'),
(9, 'auth', '0004_alter_user_username_opts', '2024-12-08 10:44:36.082457'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-12-08 10:44:36.117076'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-12-08 10:44:36.119334'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-12-08 10:44:36.125015'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-12-08 10:44:36.165320'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-12-08 10:44:36.202482'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-12-08 10:44:36.215539'),
(16, 'auth', '0011_update_proxy_permissions', '2024-12-08 10:44:36.221349'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-12-08 10:44:36.257522'),
(18, 'menu', '0001_initial', '2024-12-08 10:44:36.266169'),
(19, 'sessions', '0001_initial', '2024-12-08 10:44:36.293546'),
(20, 'menu', '0002_initial', '2024-12-08 11:26:08.339734'),
(21, 'menu', '0003_order_orderitem_order_items', '2024-12-09 08:03:20.443570'),
(22, 'menu', '0004_alter_menuitem_price', '2024-12-11 11:46:01.572641'),
(23, 'menu', '0005_order_paid', '2024-12-11 11:59:35.558898'),
(24, 'menu', '0006_remove_order_paid_order_status', '2024-12-12 06:55:47.607713');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_menuitem`
--

CREATE TABLE `menu_menuitem` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(6,0) NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_menuitem`
--

INSERT INTO `menu_menuitem` (`id`, `name`, `price`, `unit`) VALUES
(2, 'Rice', 15, 'Plate'),
(3, 'Roti', 5, 'Piece'),
(4, 'Dal', 10, 'Bowl'),
(5, 'Fried Egg', 10, 'Piece'),
(6, 'Mixed Vegetable', 10, 'Bowl'),
(7, 'Chicken Curry', 30, 'Piece'),
(8, 'Beef Curry', 40, 'Piece'),
(9, 'Fish Curry', 30, 'Piece'),
(10, 'Shingara', 5, 'Piece'),
(11, 'Samosa', 5, 'Piece'),
(12, 'Puri', 5, 'Piece'),
(13, 'Milk Tea', 8, 'Cup'),
(14, 'Black Tea', 5, 'Cup'),
(15, 'Chicken Balls', 30, 'Stick');

-- --------------------------------------------------------

--
-- Table structure for table `menu_order`
--

CREATE TABLE `menu_order` (
  `id` bigint NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_order`
--

INSERT INTO `menu_order` (`id`, `customer_name`, `status`) VALUES
(1, 'Labib', 'Unpaid'),
(2, 'Abid', 'Unpaid'),
(3, 'Akib', 'Unpaid'),
(4, 'Anoy', 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `menu_orderitem`
--

CREATE TABLE `menu_orderitem` (
  `id` bigint NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `menu_item_id` bigint NOT NULL,
  `order_id` bigint NOT NULL
) ;

--
-- Dumping data for table `menu_orderitem`
--

INSERT INTO `menu_orderitem` (`id`, `quantity`, `menu_item_id`, `order_id`) VALUES
(1, 4, 2, 1),
(2, 2, 4, 1),
(3, 2, 5, 1),
(4, 1, 6, 1),
(5, 1, 7, 1),
(6, 1, 15, 1),
(7, 6, 2, 2),
(8, 6, 3, 2),
(9, 4, 4, 2),
(10, 4, 5, 2),
(11, 3, 6, 2),
(12, 1, 7, 2),
(13, 2, 8, 2),
(14, 1, 9, 2),
(15, 4, 15, 2),
(16, 4, 2, 3),
(17, 2, 3, 3),
(18, 4, 4, 3),
(19, 8, 5, 3),
(20, 2, 6, 3),
(21, 3, 7, 3),
(22, 5, 8, 3),
(23, 3, 9, 3),
(24, 5, 12, 3),
(25, 10, 13, 3),
(26, 5, 14, 3),
(27, 15, 15, 3),
(28, 2, 2, 4),
(29, 1, 4, 4),
(30, 2, 5, 4),
(31, 1, 6, 4),
(32, 1, 7, 4),
(33, 1, 8, 4),
(34, 1, 15, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `menu_menuitem`
--
ALTER TABLE `menu_menuitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_order`
--
ALTER TABLE `menu_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_orderitem`
--
ALTER TABLE `menu_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_orderitem_menu_item_id_99cc5c4f_fk_menu_menuitem_id` (`menu_item_id`),
  ADD KEY `menu_orderitem_order_id_78f7348e_fk_menu_order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menu_menuitem`
--
ALTER TABLE `menu_menuitem`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menu_order`
--
ALTER TABLE `menu_order`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_orderitem`
--
ALTER TABLE `menu_orderitem`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `menu_orderitem`
--
ALTER TABLE `menu_orderitem`
  ADD CONSTRAINT `menu_orderitem_menu_item_id_99cc5c4f_fk_menu_menuitem_id` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_menuitem` (`id`),
  ADD CONSTRAINT `menu_orderitem_order_id_78f7348e_fk_menu_order_id` FOREIGN KEY (`order_id`) REFERENCES `menu_order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
