-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2022 at 11:54 PM
-- Server version: 5.7.36-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `ost_api_key`
--

CREATE TABLE `ost_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

CREATE TABLE `ost_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

CREATE TABLE `ost_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'jmplirac@sec.gov.ph', '2022-06-28 14:46:31'),
(2, 'core', 'helpdesk_url', 'http://localhost/imessagemo/', '2022-06-28 14:46:31'),
(3, 'core', 'helpdesk_title', 'i-Message Mo', '2022-06-28 14:46:31'),
(4, 'core', 'schema_signature', 'add628927ee030469f5d3272ebda1e16', '2022-06-28 14:46:31'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2022-06-28 14:46:31'),
(6, 'core', 'time_format', 'hh:mm a', '2022-06-28 14:46:31'),
(7, 'core', 'date_format', 'MM/dd/y', '2022-06-28 14:46:31'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2022-06-28 14:46:31'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2022-06-28 14:46:31'),
(10, 'core', 'default_priority_id', '2', '2022-06-28 14:46:31'),
(11, 'core', 'enable_daylight_saving', '', '2022-06-28 14:46:31'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2022-06-28 14:46:31'),
(13, 'core', 'isonline', '1', '2022-06-28 14:46:31'),
(14, 'core', 'staff_ip_binding', '', '2022-06-28 14:46:31'),
(15, 'core', 'staff_max_logins', '4', '2022-06-28 14:46:31'),
(16, 'core', 'staff_login_timeout', '2', '2022-06-28 14:46:31'),
(17, 'core', 'staff_session_timeout', '30', '2022-06-28 14:46:31'),
(18, 'core', 'passwd_reset_period', '', '2022-06-28 14:46:31'),
(19, 'core', 'client_max_logins', '4', '2022-06-28 14:46:31'),
(20, 'core', 'client_login_timeout', '2', '2022-06-28 14:46:31'),
(21, 'core', 'client_session_timeout', '30', '2022-06-28 14:46:31'),
(22, 'core', 'max_page_size', '25', '2022-06-28 14:46:31'),
(23, 'core', 'max_open_tickets', '', '2022-06-28 14:46:31'),
(24, 'core', 'autolock_minutes', '3', '2022-06-28 14:46:31'),
(25, 'core', 'default_smtp_id', '0', '2022-06-28 15:17:32'),
(26, 'core', 'use_email_priority', '', '2022-06-28 14:46:31'),
(27, 'core', 'enable_kb', '', '2022-06-28 14:46:31'),
(28, 'core', 'enable_premade', '1', '2022-06-28 14:46:31'),
(29, 'core', 'enable_captcha', '', '2022-06-28 14:46:31'),
(30, 'core', 'enable_auto_cron', '', '2022-06-28 14:46:31'),
(31, 'core', 'enable_mail_polling', '', '2022-06-28 14:46:31'),
(32, 'core', 'send_sys_errors', '1', '2022-06-28 14:46:31'),
(33, 'core', 'send_sql_errors', '1', '2022-06-28 14:46:31'),
(34, 'core', 'send_login_errors', '1', '2022-06-28 14:46:31'),
(35, 'core', 'save_email_headers', '1', '2022-06-28 14:46:31'),
(36, 'core', 'strip_quoted_reply', '1', '2022-06-28 14:46:31'),
(37, 'core', 'ticket_autoresponder', '', '2022-06-28 14:46:31'),
(38, 'core', 'message_autoresponder', '', '2022-06-28 14:46:31'),
(39, 'core', 'ticket_notice_active', '1', '2022-06-28 14:46:31'),
(40, 'core', 'ticket_alert_active', '1', '2022-06-28 14:46:31'),
(41, 'core', 'ticket_alert_admin', '1', '2022-06-28 14:46:31'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2022-06-28 14:46:31'),
(43, 'core', 'ticket_alert_dept_members', '', '2022-06-28 14:46:31'),
(44, 'core', 'message_alert_active', '1', '2022-06-28 14:46:31'),
(45, 'core', 'message_alert_laststaff', '1', '2022-06-28 14:46:31'),
(46, 'core', 'message_alert_assigned', '1', '2022-06-28 14:46:31'),
(47, 'core', 'message_alert_dept_manager', '', '2022-06-28 14:46:31'),
(48, 'core', 'note_alert_active', '', '2022-06-28 14:46:31'),
(49, 'core', 'note_alert_laststaff', '1', '2022-06-28 14:46:31'),
(50, 'core', 'note_alert_assigned', '1', '2022-06-28 14:46:31'),
(51, 'core', 'note_alert_dept_manager', '', '2022-06-28 14:46:31'),
(52, 'core', 'transfer_alert_active', '', '2022-06-28 14:46:31'),
(53, 'core', 'transfer_alert_assigned', '', '2022-06-28 14:46:31'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2022-06-28 14:46:31'),
(55, 'core', 'transfer_alert_dept_members', '', '2022-06-28 14:46:31'),
(56, 'core', 'overdue_alert_active', '1', '2022-06-28 14:46:31'),
(57, 'core', 'overdue_alert_assigned', '1', '2022-06-28 14:46:31'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2022-06-28 14:46:31'),
(59, 'core', 'overdue_alert_dept_members', '', '2022-06-28 14:46:31'),
(60, 'core', 'assigned_alert_active', '1', '2022-06-28 14:46:31'),
(61, 'core', 'assigned_alert_staff', '1', '2022-06-28 14:46:31'),
(62, 'core', 'assigned_alert_team_lead', '', '2022-06-28 14:46:31'),
(63, 'core', 'assigned_alert_team_members', '', '2022-06-28 14:46:31'),
(64, 'core', 'auto_claim_tickets', '1', '2022-06-28 14:46:31'),
(65, 'core', 'auto_refer_closed', '1', '2022-06-28 14:46:31'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2022-06-28 14:46:31'),
(67, 'core', 'require_topic_to_close', '', '2022-06-28 14:46:31'),
(68, 'core', 'show_related_tickets', '1', '2022-06-28 14:46:31'),
(69, 'core', 'show_assigned_tickets', '1', '2022-06-28 14:46:31'),
(70, 'core', 'show_answered_tickets', '', '2022-06-28 14:46:31'),
(71, 'core', 'hide_staff_name', '', '2022-06-28 14:46:31'),
(72, 'core', 'disable_agent_collabs', '', '2022-06-28 14:46:31'),
(73, 'core', 'overlimit_notice_active', '', '2022-06-28 14:46:31'),
(74, 'core', 'email_attachments', '1', '2022-06-28 14:46:31'),
(75, 'core', 'ticket_number_format', '######', '2022-06-28 14:46:31'),
(76, 'core', 'ticket_sequence_id', '', '2022-06-28 14:46:31'),
(77, 'core', 'queue_bucket_counts', '', '2022-06-28 14:46:31'),
(78, 'core', 'allow_external_images', '', '2022-06-28 14:46:31'),
(79, 'core', 'task_number_format', '#', '2022-06-28 14:46:31'),
(80, 'core', 'task_sequence_id', '2', '2022-06-28 14:46:31'),
(81, 'core', 'log_level', '2', '2022-06-28 14:46:31'),
(82, 'core', 'log_graceperiod', '12', '2022-06-28 14:46:31'),
(83, 'core', 'client_registration', 'closed', '2022-06-29 06:26:01'),
(84, 'core', 'default_ticket_queue', '1', '2022-06-28 14:46:31'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2022-06-28 14:46:31'),
(86, 'core', 'max_file_size', '262144', '2022-06-29 06:25:20'),
(87, 'core', 'landing_page_id', '1', '2022-06-28 14:46:31'),
(88, 'core', 'thank-you_page_id', '2', '2022-06-28 14:46:31'),
(89, 'core', 'offline_page_id', '3', '2022-06-28 14:46:31'),
(90, 'core', 'system_language', 'en_US', '2022-06-28 14:46:31'),
(91, 'core', 'default_email_id', '1', '2022-06-28 14:46:31'),
(92, 'core', 'alert_email_id', '0', '2022-06-29 06:47:34'),
(93, 'core', 'default_dept_id', '1', '2022-06-28 14:46:31'),
(94, 'core', 'default_sla_id', '1', '2022-06-28 14:46:31'),
(95, 'core', 'schedule_id', '1', '2022-06-28 14:46:31'),
(96, 'core', 'default_template_id', '1', '2022-06-28 14:46:31'),
(97, 'core', 'default_timezone', 'Asia/Shanghai', '2022-06-28 14:46:31'),
(98, 'core', 'client_passwd_policy', ' ', '2022-06-28 15:03:57'),
(99, 'core', 'clients_only', '1', '2022-06-28 15:03:57'),
(100, 'core', 'client_verify_email', '1', '2022-06-28 15:03:57'),
(101, 'core', 'allow_auth_tokens', '1', '2022-06-28 15:03:57'),
(102, 'core', 'client_name_format', 'original', '2022-06-28 15:03:57'),
(103, 'core', 'client_avatar', 'gravatar.mm', '2022-06-28 15:03:57'),
(104, 'pwreset', 't001AWEePy4qWOlrJhewgs0wol1hh8vQJZQckf4QCb_M5LI3', 'c2', '2022-06-28 15:06:30'),
(108, 'core', 'verify_email_addrs', '1', '2022-06-28 15:17:32'),
(109, 'core', 'accept_unregistered_email', '1', '2022-06-28 15:17:32'),
(110, 'core', 'add_email_collabs', '1', '2022-06-28 15:17:32'),
(111, 'core', 'client_logo_id', '0', '2022-06-29 03:37:43'),
(112, 'core', 'staff_logo_id', '9', '2022-06-29 04:56:10'),
(113, 'core', 'staff_backdrop_id', '', '2022-06-29 00:25:40'),
(114, 'core', 'default_storage_bk', 'D', '2022-06-29 00:53:55'),
(115, 'core', 'force_https', '', '2022-06-29 00:53:55'),
(116, 'core', 'date_formats', '', '2022-06-29 00:53:55'),
(117, 'core', 'default_locale', '', '2022-06-29 00:53:55'),
(118, 'core', 'secondary_langs', '', '2022-06-29 00:53:55'),
(119, 'core', 'enable_avatars', '1', '2022-06-29 00:53:55'),
(120, 'core', 'enable_richtext', '1', '2022-06-29 00:53:55'),
(121, 'core', 'files_req_auth', '1', '2022-06-29 00:53:55'),
(122, 'core', 'allow_iframes', '', '2022-06-29 00:53:55'),
(123, 'core', 'acl', '', '2022-06-29 00:53:55'),
(124, 'core', 'acl_backend', '', '2022-06-29 00:53:55'),
(125, 'core', 'agent_passwd_policy', ' ', '2022-06-29 01:04:26'),
(126, 'core', 'allow_pw_reset', '1', '2022-06-29 01:04:26'),
(127, 'core', 'pw_reset_window', '30', '2022-06-29 01:04:26'),
(128, 'core', 'require_agent_2fa', '', '2022-06-29 01:04:26'),
(129, 'core', 'agent_name_format', 'full', '2022-06-29 01:04:26'),
(130, 'core', 'agent_avatar', 'gravatar.mm', '2022-06-29 01:04:26'),
(131, 'mysqlsearch', 'reindex', '0', '2022-06-29 06:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `ost_content`
--

CREATE TABLE `ost_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_content`
--

INSERT INTO `ost_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<p> </p>', '<p>The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.</p>', '2022-06-28 22:46:31', '2022-06-29 10:28:22'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(4, 1, 'registration-staff', 'Welcome to i-Message Mo', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div>We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%%7Blink%7D\">%{link}</a><br /> <br /> <em style=\"font-size:small\">Sincerely,<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2022-06-28 22:46:31', '2022-06-29 09:02:04'),
(5, 1, 'pwreset-staff', 'i-Message Mo Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div>A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%%7Blink%7D\">%{link}</a><br /> <br /> <em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em><br /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2022-06-28 22:46:31', '2022-06-29 09:03:51'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div>We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%%7Blink%7D\">%{link}</a><br /> <br /> <em style=\"font-size:small\">Sincerely,<br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2022-06-28 22:46:31', '2022-06-29 09:05:31'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div>A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%%7Blink%7D\">%{link}</a><br /> <br /> <em style=\"font-size:small\">Sincerely,<br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2022-06-28 22:46:31', '2022-06-29 09:05:10'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br /> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2022-06-28 22:46:31', '2022-06-29 09:05:18'),
(11, 1, 'registration-thanks', 'Account Confirmed!', ' <div><strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Sincerely,</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2022-06-28 22:46:31', '2022-06-29 09:05:48'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(13, 1, 'email2fa-staff', 'i-Message Mo Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div>You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2022-06-28 22:46:31', '2022-06-29 09:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

CREATE TABLE `ost_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'ICTD', '<p>ICTD</p>', 1, 1, 1, 1, '/1/', '2022-06-29 14:22:52', '2022-06-28 22:46:30'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'ERTD', '<p>Maintenance Department</p>', 1, 0, 1, 1, '/3/', '2022-06-29 14:23:07', '2022-06-28 22:46:30'),
(4, NULL, 0, 0, 0, 0, 0, 0, 4, 'HRAD', '', 1, 1, 1, 1, '/4/', '2022-06-29 14:23:30', '2022-06-29 14:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

CREATE TABLE `ost_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

CREATE TABLE `ost_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_folder` varchar(255) DEFAULT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth_creds` int(11) DEFAULT '0',
  `smtp_userid` varchar(255) NOT NULL,
  `smtp_userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `smtp_spoofing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_folder`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_auth_creds`, `smtp_userid`, `smtp_userpass`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'noreply@sec.gov.ph', 'i-Message Mo', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-06-28 22:46:31', '2022-06-29 14:46:17'),
(2, 0, 2, 1, 0, 'noreply@s.g.h', 'i-Message Mo Alerts', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-06-28 22:46:31', '2022-06-29 14:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_account`
--

CREATE TABLE `ost_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

CREATE TABLE `ost_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>Our i-Message Mo team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> </p><div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:10:46'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> <p>You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br />i-Message Mo System Admin</p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:11:19'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> <p>New ticket #%{ticket.number} created <br /> <br /> </p><table><tbody><tr><td><strong>From</strong>:</td> <td>%{ticket.name}</td> </tr> <tr><td><strong>Department</strong>:</td> <td>%{ticket.dept.name}</td> </tr> </tbody> </table> <p><br /> %{message} <br /> <br /> </p><hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system.</div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:12:33'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> <p>New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> </p><table><tbody><tr><td><strong>From</strong>:</td> <td>%{poster.name}</td> </tr> <tr><td><strong>Department</strong>:</td> <td>%{ticket.dept.name}</td> </tr> </tbody> </table> <p><br /> %{message} <br /> <br /> </p><hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system.</div> <p><br /> </p> <p><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:12:21'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> <p>An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> </p><table><tbody><tr><td><strong>From</strong>:</td> <td>%{note.poster}</td> </tr> <tr><td><strong>Title</strong>:</td> <td>%{note.title}</td> </tr> </tbody> </table> <p><br /> %{note.message} <br /> <br /> </p><hr /> <p>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:11:59'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> <p>Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> </p><table><tbody><tr><td><strong>From</strong>:</td> <td>%{ticket.name}</td> </tr> <tr><td><strong>Subject</strong>:</td> <td>%{ticket.subject}</td> </tr> </tbody> </table> <p><br /> %{comments} <br /> <br /> </p><hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system.</div> <p><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:13:08'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> <p>Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> </p><blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:13:20'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> <p>A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} </p><hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em><br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:12:53'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> <p>New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> </p><table><tbody><tr><td><strong>Department</strong>:</td> <td>%{task.dept.name}</td> </tr> </tbody> </table> <p><br /> %{task.description} <br /> <br /> </p><hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system.</div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:14:36'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> <p>Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> </p><hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system.</div> <p><em style=\"color:rgb(127,127,127);font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em><br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:14:21'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> <p>Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> </p><hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system.</div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:15:07'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> <p>Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> </p><blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em> <br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:15:15'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> <p>A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} </p><hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <p><em style=\"font-size:small\"><em style=\"font-size:small\">Sincerely,<br />i-Message Mo System Admin</em></em><br /> </p>', NULL, '2022-06-28 22:46:31', '2022-06-29 09:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

CREATE TABLE `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'i-Message Mo Default Template (H', 'en_US', '<p>Default i-Message Mo templates</p>', '2022-06-28 22:46:31', '2022-06-29 01:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `ost_event`
--

CREATE TABLE `ost_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_event`
--

INSERT INTO `ost_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

CREATE TABLE `ost_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

CREATE TABLE `ost_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2022-06-28 22:46:30'),
(2, 'T', 'D', 'text/plain', 24, 'b-PhdMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2022-06-28 22:46:31'),
(9, 'L', 'D', 'image/png', 63601, 'o47R7w-Rk-753WPiqjxrfsl4zhBaQ8hw', 'w-Rk-753WPiqjxrfikZIo6m1n3UysQ3Q', 'logo.png', NULL, '2022-06-29 12:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);
INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(9, 0, 0x89504e470d0a1a0a0000000d4948445200000331000000aa08060000009ddfc19d000000097048597300001ec200001ec2016ed0753e00000a4f6943435050686f746f73686f70204943432070726f66696c65000078da9d53675453e9163df7def4424b8880944b6f5215082052428b801491262a2109104a8821a1d91551c1114545041bc8a088038e8e808c15512c0c8a0ad807e421a28e83a3888acafbe17ba36bd6bcf7e6cdfeb5d73ee7acf39db3cf07c0080c9648335135800ca9421e11e083c7c4c6e1e42e40810a2470001008b3642173fd230100f87e3c3c2b22c007be000178d30b0800c04d9bc0301c87ff0fea42995c01808401c07491384b08801400407a8e42a600404601809d98265300a0040060cb6362e300502d0060277fe6d300809df8997b01005b94211501a09100201365884400683b00accf568a450058300014664bc43900d82d00304957664800b0b700c0ce100bb200080c00305188852900047b0060c8232378008499001446f2573cf12bae10e72a00007899b23cb9243945815b082d710757572e1e28ce49172b14366102619a402ec27999193281340fe0f3cc0000a0911511e083f3fd78ce0eaecece368eb60e5f2deabf06ff226262e3fee5cfab70400000e1747ed1fe2c2fb31a803b06806dfea225ee04685e0ba075f78b66b20f40b500a0e9da57f370f87e3c3c45a190b9d9d9e5e4e4d84ac4425b61ca577dfe67c25fc057fd6cf97e3cfcf7f5e0bee22481325d814704f8e0c2ccf44ca51ccf92098462dce68f47fcb70bfffc1dd322c44962b9582a14e35112718e449a8cf332a52289429229c525d2ff64e2df2cfb033edf3500b06a3e017b912da85d6303f64b27105874c0e2f70000f2bb6fc1d4280803806883e1cf77ffef3ffd47a02500806649927100005e44242e54cab33fc708000044a0812ab0411bf4c1182cc0061cc105dcc10bfc6036844224c4c24210420a64801c726029ac82422886cdb01d2a602fd4401d34c051688693700e2ec255b80e3d700ffa61089ec128bc81090441c808136121da8801628a58238e08179985f821c14804128b2420c9881451224b91354831528a542055481df23d720239875c46ba913bc8003282fc86bc47319481b2513dd40cb543b9a8371a8446a20bd06474319a8f16a09bd072b41a3d8c36a1e7d0ab680fda8f3e43c730c0e8180733c46c302ec6c342b1382c099363cbb122ac0cabc61ab056ac03bb89f563cfb17704128145c0093604774220611e4148584c584ed848a8201c243411da093709038451c2272293a84bb426ba11f9c4186232318758482c23d6128f132f107b8843c437241289433227b9900249b1a454d212d246d26e5223e92ca99b34481a2393c9da646bb20739942c202bc885e49de4c3e433e41be421f25b0a9d624071a4f853e22852ca6a4a19e510e534e5066598324155a39a52dda8a15411358f5a42ada1b652af5187a81334759a39cd8316494ba5ada295d31a681768f769afe874ba11dd951e4e97d057d2cbe947e897e803f4770c0d861583c7886728199b18071867197718af984ca619d38b19c754303731eb98e7990f996f55582ab62a7c1591ca0a954a9526951b2a2f54a9aaa6aadeaa0b55f355cb548fa95e537dae46553353e3a909d496ab55aa9d50eb531b5367a93ba887aa67a86f543fa47e59fd890659c34cc34f43a451a0b15fe3bcc6200b6319b3782c216b0dab86758135c426b1cdd97c762abb98fd1dbb8b3daaa9a13943334a3357b352f394663f07e39871f89c744e09e728a797f37e8ade14ef29e2291ba6344cb931655c6baa96979658ab48ab51ab47ebbd36aeeda79da6bd45bb59fb810e41c74a275c2747678fce059de753d953dda70aa7164d3d3af5ae2eaa6ba51ba1bb4477bf6ea7ee989ebe5e809e4c6fa7de79bde7fa1c7d2ffd54fd6dfaa7f5470c5806b30c2406db0cce183cc535716f3c1d2fc7dbf151435dc34043a561956197e18491b9d13ca3d5468d460f8c69c65ce324e36dc66dc6a326062621264b4dea4dee9a524db9a629a63b4c3b4cc7cdcccda2cdd699359b3d31d732e79be79bd79bdfb7605a785a2cb6a8b6b86549b2e45aa659eeb6bc6e855a3959a558555a5db346ad9dad25d6bbadbba711a7b94e934eab9ed667c3b0f1b6c9b6a9b719b0e5d806dbaeb66db67d6167621767b7c5aec3ee93bd937dba7d8dfd3d070d87d90eab1d5a1d7e73b472143a563ade9ace9cee3f7dc5f496e92f6758cf10cfd833e3b613cb29c4699d539bd347671767b97383f3888b894b82cb2e973e2e9b1bc6ddc8bde44a74f5715de17ad2f59d9bb39bc2eda8dbafee36ee69ee87dc9fcc349f299e593373d0c3c843e051e5d13f0b9f95306bdfac7e4f434f8167b5e7232f632f9157add7b0b7a577aaf761ef173ef63e729fe33ee33c37de32de595fcc37c0b7c8b7cb4fc36f9e5f85df437f23ff64ff7affd100a78025016703898141815b02fbf87a7c21bf8e3f3adb65f6b2d9ed418ca0b94115418f82ad82e5c1ad2168c8ec90ad21f7e798ce91ce690e85507ee8d6d00761e6618bc37e0c2785878557863f8e7088581ad131973577d1dc4373df44fa449644de9b67314f39af2d4a352a3eaa2e6a3cda37ba34ba3fc62e6659ccd5589d58496c4b1c392e2aae366e6cbedffcedf387e29de20be37b17982fc85d7079a1cec2f485a716a92e122c3a96404c884e3894f041102aa8168c25f21377258e0a79c21dc267222fd136d188d8435c2a1e4ef2482a4d7a92ec91bc357924c533a52ce5b98427a990bc4c0d4cdd9b3a9e169a76206d323d3abd31839291907142aa214d93b667ea67e66676cbac6585b2fec56e8bb72f1e9507c96bb390ac05592d0ab642a6e8545a28d72a07b267655766bfcd89ca3996ab9e2bcdedccb3cadb90379cef9fffed12c212e192b6a5864b572d1d58e6bdac6a39b23c7179db0ae315052b865606ac3cb88ab62a6dd54fabed5797ae7ebd267a4d6b815ec1ca82c1b5016beb0b550ae5857debdcd7ed5d4f582f59dfb561fa869d1b3e15898aae14db1797157fd828dc78e51b876fcabf99dc94b4a9abc4b964cf66d266e9e6de2d9e5b0e96aa97e6970e6e0dd9dab40ddf56b4edf5f645db2f97cd28dbbb83b643b9a3bf3cb8bc65a7c9cecd3b3f54a454f454fa5436eed2ddb561d7f86ed1ee1b7bbcf634ecd5db5bbcf7fd3ec9bedb5501554dd566d565fb49fbb3f73fae89aae9f896fb6d5dad4e6d71edc703d203fd07230eb6d7b9d4d51dd23d54528fd62beb470ec71fbefe9def772d0d360d558d9cc6e223704479e4e9f709dff71e0d3ada768c7bace107d31f761d671d2f6a429af29a469b539afb5b625bba4fcc3ed1d6eade7afc47db1f0f9c343c59794af354c969dae982d39367f2cf8c9d959d7d7e2ef9dc60dba2b67be763cedf6a0f6fefba1074e1d245ff8be73bbc3bce5cf2b874f2b2dbe51357b8579aaf3a5f6dea74ea3cfe93d34fc7bb9cbb9aaeb95c6bb9ee7abdb57b66f7e91b9e37ceddf4bd79f116ffd6d59e393dddbdf37a6ff7c5f7f5df16dd7e7227fdcecbbbd97727eeadbc4fbc5ff440ed41d943dd87d53f5bfedcd8efdc7f6ac077a0f3d1dc47f7068583cffe91f58f0f43058f998fcb860d86eb9e383e3939e23f72fde9fca743cf64cf269e17fea2fecbae17162f7ef8d5ebd7ced198d1a197f29793bf6d7ca5fdeac0eb19afdbc6c2c61ebec97833315ef456fbedc177dc771defa3df0f4fe47c207f28ff68f9b1f553d0a7fb93199393ff040398f3fc63332ddb000000206348524d00007a25000080830000f9ff000080e9000075300000ea6000003a980000176f925fc5460000ed9c4944415478daec9d779c5d55f5b79f7deaed775a26bd5792104820107aef0641294a1145c58ef2b32158003b0aa808161094221d42e83d81901e9290defb4ca6cfede594fdfe71ee4c2621741478dd0f9ff984997bee29bb9df5dd6befb58494128542a15028140a8542a1f8b8a0a9225028140a8542a15028144ac428140a8542a15028140a8512310a8542a15028140a8542a1448c42a15028140a8542a1502246a15028140a8542a1502894885128140a8542a15028140a2562140a8542a15028140a8512310a8542a15028140a8542a1448c42a15028140a8542a1502811a35028140a8542a1502894885128140a8542a15028140a2562140a8542a15028140a854289188542a15028140a8542a1448c42a15028140a8542a1502811a35028140a8542a15028144ac428140a8542a15028140a2562140a8542a15028140a85e2bf83a18ae0bf8f2f7d56b73663e83ab661e04b195486a6a123104260e83a8eeb52f45c344d600a1d0148c0d475342128390e9a1058da2e2dea57fe5f00a6d0b08416fc2204e81a9ae7e34b892f65702e4d074de08b8aaa158262b93c64f9f64d9b7af5efc7602b3ed01262bb2f8353b848a4041d41090f1789b5172d2c088ef591d8e81888eecf52380840ebf1371f89838f2bfdcabdeb009868c1359178d2c723282b1d41581895dff68ed034cac5229d6ded68dadbebf59065b16ec7568ebef402846dbfe5b1d2f709d921ce38e4688e997830d3e7cce0a031fb32b0576f1cd7c5d0751adb5b4965334c1c31867b5e7a8a27e7cfc2f33df03c06f6eec7b9c79cccd6e69d0cecd587df5ff25d5ad31d64f2791cd7e5a06f7d9654260d9deddc7bdd6dec377c345fffd32f7969f64b108e100e853961e2142e38ee3436373732a4775f966d5ac78ed61692d118afad5fc5ccb93349d4d573f8b849389e8b2f2583ebfb629926113bc40b8be7b174e1ab1c73eca95cffd5efd19aea4420d0348db37ffe5dda3ada20ddc9afbe7b0ddf3cfd33b4a43a8886c2cc5df53a675cf1554e3ef4582e3ae1747676b6522c971122a8cf6828cc9c954bf9f7f4fb88d6d573e4be07e0f93e2f2f5bb8db713293e213c74fe5179fff262da98e5df52604856281d7d6afe6b667a6b165fb66302d0470d0a8719c32e548ee9ff10c8f5efd27745d47ca376f0542085ccfe3cf8ffe9b2d4d8d7cf2d0a3e9c866b8e5c98758bd6135c20e215d87ba9a5e5c73d1d739e980c37872c12bacdeba89b2eba255eed5f77d6a935514cb25fe70ef3f10762878866281af9d7d11a3070ca6582e03e0b82efd6aeb39f9c043bbff16b26caebef366c60d1e412414a239d54e341466cdb6cd4c9bf50291501829259b9b1bf10b79be7ef6e719356010c572995838c22bcb5ee3bee9f7d26bd050aefedc3738f7e893d184a02a1a5703aa42a15028fe27519e18c52ec31cb0843e5437f4579ed9b49a79a56de88839026db02a1d8542a15028140ac54705e58951740b988866ecdb512cdcfba347ee1cf0e0fac58487edc4d3b4019f8bedf3a42eb4737cfc15aaa4140a8542a15028141f36ca13a3e8123087b51573b7ffe4917f8dbdf3f947c8840cb6c77d7ed6fe1cb7a75f1febe1ff4b13dac152159742a15028140a85428918c5872a60a424a41bc7eccca66eb8eac9fb0ef8c7ac6771cc08b1440cdbb4d9aa97f965c70c6e4fbf7e8023fd3fd8423f5209198542a15028140a8512318a0f4fc058d6f18d9dedbfffe5930f4cfeeb2bcfe084a2c4aa7b233d0fbbec9108d5b0c9cbf1cbf619fc2bbd744a417abf0f69fab1aaf4140a8542a15028144ac428febb0206493c143e72737bf31f7ff9d403936e7af969fc5098aada5ef8ae131c23c0f73d6aac5e6cf6b3fca2e315ee4abf3eb9e87b7f30847684f2c828140a8542a15028948851fcd7089bf6813b531d77fdfc89fbc6de34eb6988c7a9aee985572e428fd0c7003e1eb5761fb6f819aee998c93d99e5fbe671efb0857e802a498542a15028140a8512318aff3886ae0f4f17f2cffefc89fb06deb5e015f4aa6a6aaa6af08a05a478e3f19e9438be439555cf762fcf8fdb5fe0c1ccaa21aef49fd110c354892a140a8542a15028948851fcc71050e378ee8a2ba6dd597ddbfc9790f11855d1245ea984146fbe404c4a89942e49ab8e0659e6f2b6677830bbba16580154a9925528140a8542a1502811a3f8e0058c103540f325fffe8bfdcf8533108924d1480cd72d2391ecb98c6c4f7c29019fb899a4517afcb0ed691ecbae0b698866014955c20a8542a15028140a2562141f1896aef795be5cf99dfb6ed3a72d9d8f1e4b10b26cf0fc77751e5ffa0809313341abd0f841db333c9c5b6b0ac41a1dd14b95b442a15028140a85428918c5fb424a49d8b24716cae519df7be49fbdef58340399acc20c4590928a07e65d9e13892605b61ea2118fefb73ec503b9d5bd25bc62097da88a5aa65028140a8542a1502246f19ef0a524120a4d4c15f2f75cf1f8bf47fdf3d5e77023516cd3424a1f29fdf77c6e898f2605613dcc0ee9f0e3d6a7b937bb72b494dc1711c67e4ac828140a8542a15028948851bc6b01531d8e1cb633dd71d3f71ff9e701b7bcfa1c4e38422412437a1ef8fefbbe8644a2a31133136c912ed7b4bfc88de9f99333b27c73581887bc172f8f42a15028140a8542a144ccffa880a98fc48ed9d4d6f4fbcb1fb9e3905b663f8f130a138f2591bec707292e022123485a356c94457ed3f10a7f492d3c342dcbd7c535eb482564140a8542a15028144ac428de5a5448496d2476e4c6d6a6eb7ffad83d53fe35e705f4449264552d9e5b46ca0f5e54f8d207e9526dd5d12c1d7edf399bbfa7171dd2e997ae8b69d6e1aa56140a8542a15028144ac428f62e608078287cd0b6f6965baf7cecaefdef9af7227a4d2d5555b578c5026f1742f9fd091989e795a9b67ad1221d7edb318bbfa7161d98f5cbb798429bac6a47a15028140a8542a1448c62378410189a362695cb4cfbd1b43b47debbe0158caa5aaa12d5f8c5c27f52bff4105112cf774898b5b4ca32bfeb98c56da925638ad27d48c018c17fe536140a8542a15028144ac4283ef20206703d17db30e75ef1e85d7d1f5a321b235145225e85e794f1ff8bf72291203d12661dadb8dc909acd93b98d0385d0667b483cb54746a15028140a8542a144ccff78050a81a51b6c6c696443f38ed482a6edb8b645381c467aee7f640fcc3b113242fa984682264de789e2060ab8a95659a45516f19008e5935128140a8542a150bc470c55041f6f24801044a249a27698442802ba8efc08383c7ce911113a493d82af3c300a8542a15028148a0f08e589f9d88a1789a1e90313a1c82aa45cec4b297ce97be223e6e0108016f85dbc9030b4903096c4356b958ee8ab648d42a15028140a85428998ff117c294986a2fba48bf9477ffee47d633c4dec2fa5c497f223a90b34a19197ae9c9e5bc7e3b9f5fbddd4397f4c5e3a8f4784394ae5915128140a8542a1502811f33f20607a45e3076e696ffac7a5f7fc65e233cb1750f4bcbc260486f868c6ff12488404dbd388f846f1cf1d73b825bd78525e3ab7c5847d8012320a8542a15028140a2562fe7f1630b1c4611bdb9aaebffad1bb0e797af16ce2d5b548cf27902f1fcdcdf2123010f4d7620cd0e2b408c9cd1db3f947fab5c3d27ee9fab8661fa2848c42a15028140a85428998ff3f05cc115bdb9a7e7fcd63f71c71f7dc1709d7f6a2aaaa06bd7b23cc47570848c0c5c7951e71b38a463fcf751daf725bfab523337ef9ba84661fa6848c42a15028140a85428998ff4f9052521d894dd9d0dc70d3cf1ebf67ca5dafcd424b5641348a572a7eec32484ae9a159b534ca22bfef7c95bfa6161cd2e615fe1c15d6c14ac628140a8542a150289488f9ff8088151adf946efff70f1eba6ddf7b17cc24dcab9e584d1d5eb104e2e3976f45221140d2aea74996f945fbcbdcdc397fff9c74eeb2853e4ed5b842a15028140a854289988f3186a60fc8974b2f7dedce1b873eb1f675c2f57d89ea165ebe04dac73361a44020a58ff45daaed7a72bac11f53f3f873e7dc119ef49fd711fd55cd2b140a8542a150289488f97812d234b1f24bb75f57f7dc9a658492b584ac109ee7f2b14f782f404af03c87a49124a319dcd439979b530bfae8425b0e8454f52b140a8542a150289488f938558c1051db305b3f7febefe22f6f584db46f1fa29108d275f8f82b989e48a4ef12d563a4759b9b3ae7f0e7cef95596d09a81b06a090a8542a15028140a25623efa263db661f6d284b6e2337ffb55f4950dabb0aa6a30751bcf71ff3f8cdf2590809092900891d64c6e4ecde3fa8eb9714368ab74b46ab5d95fa15028140a8542a144cc4755c048492214199a2b169e3fefefbf1e3c63fb268cea5a4ccb467a1e52faff1f8b371f0d81ad85e9c4e0cf9d73b9a163ce6089ff5244e80355f8658542a15028140a8512311f317c29a98d25f66de868bbfbf3ffbc61c2d31b576125aab0ac50906445fe2f18f13210327a88b4160899eb3ae7ec9793ce3d71618f554246a15028140a8542a144cc4748c0d4c793076d6a69bcf1870fdf76c88b6b5f2752d50b4b3790be07ff43c67b57f8e5a811a343d3b9b1732e3775ce3facd32ffd39a1850e504246a15028140a8542a144cc4740c0f48a270f5ddfb4e3f73f9d7ed7518f2e9b4fb8773f6cd3aa6ce2ffdf4322f1a547d248d20efca9630e7f4bcd3fa6dd2ffc3ea1850e514246a15028140a85e27f1b4315c18768ac4b494d347ef096d6a61bae79f4ae83a62d998ddd6f2061d3c2733e9e892c3fc8b2f1a543c2aca1c369e10f9d739170f41793075c9f10d6b70bd29dff6ecef50ea9038e7f37f7691a06613b8410e2de8f6b59eb9a86659a152f9830813379e304c77229e5725337888623bb2d6fd484b667bcbcd1c0c41ebf978147d8e5523c0ae8dbe3f306e0e59e655afc88b57d199453d2b6ac53dee49059c0f6f771890870fa9ee794526e377503d334f7baa4b4e49479e09567d9dadc484b6727f5c96a7a57d770db33d37875e942846922a5cf980143f9ccb1a7f2d292f99c7feca97cf9d4b3c8150b6c6dd9c993f35e211e89ecf5a692d1d8844767bf34f69ec7ef47c4126f5e3ee51223060de7cba77e9a3183866edfb873c7ac617d07f0b53f5c836d5a988679caf6d6a664bebd85938f3e99d30f39665d3a9f5d649916a95c96abff792300df39eb22feefd39fa33d93a6b1bd0543d789872343662e5b34e587375c8d882783eb79de23878e9f544a44a218ba3165c596f54336ad5fc5f8f193f8ead4735acbaef3fc7ec3461bbaa69d79ee2fbeaf37b536210c136021b05e3a65860e18c291fb1ec8bf9e7a10cdb2b9f2bc2f3379e4589e5cf02a0fbcfc2c6d1dade0ba8c1e31865f5d7c29271d70183b3bdabadb7a7d550d9fbafa329e7be559705d2e3ee70bfce1eb3fe47b7fbf8ebf4ffb37a2b29771e2a8715cfac9cfb268fd2a5e5bb78a682808baa8695a5dae50387ed6f28520e147e75f426d22f9ace779ede15098e9b35fe4f9592f423842c80e71c83e133869f261dcf5fce3acdeb619d72d23107cf6d853e957578f2e34be70d219941c87c1bdfba16982337ef66da68c9dc0c686ed3cbde0553ad39d80a4574d2fce3be6540e1bb73f2f2c994fbfba7ace38e418fad5d6f3d0cbcfe2f91e9ef4b9ed99692c59b50c61dbdd63e9943113f8ecb1a7b262f37a6a1349460d1c42d979ef136e9aa671e56d37d296eec4d0756518283e760821b00c93d4b4d9aa309488f91f31d2815828bcdf8e8ed67ffce4e1dbc73dbae855ccfa7e44ad309e53fe9f16303dcb484897a4d58bce721b7fec9c0b30e592e401ff880aeb7c09afbfede0a269989685ef79efe492e3817bdee9fdf952d2d0d6c2eb1bd6e0b8aead69da7d40f16355c89a462a97654b5363e0fdf36514b86f2f757143d8b6ffaf239b66feb2d7d08c5d4347be54c4f77df45d06c8b9c0d57b8e359eef7755c28dc0be3d3e5b0c4cea7a1934b6b510322dc487184adcf7fd40fc0a811002db30fb660af9af34b634fd0ca1213d0fb1bbc1f579e05f5d869ee7fb7b69cf12d330c61aba5e076cd6357daba1eb5dcaaed75edade859661ded59c6aa7a1a9118c0f76b8965212b22cfad4d4912de4107b1f732e01bef1f66f718d7ca9c89aad1b109ad89288c63e65e8fa6b13868d6643c33624f24ea0b6c737eed635ed8242a9c4fa6d9b82f1ae8748f3a5ec39f9f0894a9be9491fa0a9f2ff3f014eedf1d90660044188f6fbf7f8de8f80df20259eeffdf7da939454c5e2846c1bd77331740360c25eeafc88b2ebceea174b50154dc0ffc7c15c140a85e27d9b30aa083e14d53ec2d28d11d962feb14beff9cbb84717bd4aa8cf00e2c96a3cc75105b487e1277d9784594327923f75cee36fa985e30bd29b660a6df05b7ed7f7b12c8baa9aea77ea8d29bff11cde5ebf2b348d72b9c80b0b5fe5f777fc996d4d8dffd4853857135a4c540cdf8f0596cdeaad1b7960c6b35d33c43ef0864668685adaf37dee7afe31aebcf672ac703418408460476b0bc572194deb1e4eb27b7cbd1320168ea0090d6001b0bec7cfa26e41542cf0cc82d9e48a859ee7fbefb639298986c2ddb3c265d7a1ec39e72e5ebffa670f3cf9207a2844329e9042888d48b95e08b15e13da4e4dd39052621a06f148b4bbdd18ba8ea669434ddd18b1b3bdf5bef64c7a26f0d5743e4b5b3a851e3ce7de2cea8269983cb7680e2fbefc2c84231fe873963d97faaa1a8e9b781065d77db3c3d27b4e2cec15d3a4a1b589db1ebe8bdfde7bdbe05c21ff5c3c121d7af545df201a0ee3fb7ed39e6d42d334d6efd8c2ddd3fe8dd0f4ddfa7cc8b43074a3ab0c77ecd15ed6efd157dbf738774be55f1758b1c7f7b64adfc7304d92d1f8bbf1d2bebfb276cbec336828e3060fc7324dfce0ba9d7b3e97943265ea3a87eeb31f63070f877249bd04140a854289988f0eaee7ad13b0eef3b7fd7ee00b1b571319349c4834865f2a82daefb1572183f482a56542e3371d73b8ba73ce5081982f20f17606a9efbfc7d94c2989456298869147ca74c5a04b03694d68b9702882302d4434c1cad5afd3dcd9f14f5fca331cd7c5f5bc8f49e14a0cddc0324d0aa5bd1b4c0208d936773fff0457fdf55ae83b6837e34fd734744d7b53e12665500f878f9d443c1c41fade1781913d7ebe2c84c0715d5edfb416d330bac4ce87d53f99b2cf04ea9255e89ac6a6c6ed3c3e67667eedf64d1089110b85f9fc8967940c5d1fa16962a4e3ba238be5d23385529192536664bfc11cbbdf644a8e839492ce6c8642a9b8dcb6ec75d7dcfdb7f10fbcfc0ca96c2ef7f02b2ff0ef67a713b1f79ed3d5b66cb9b5b981e68e7688443ff0088582c0e354765dec60a9d5dba20be1f7ec07405a4a993675bd6c5a162251455b5b33bf7fe08e1a0db1a23d93daab50b00c835436cbbaed5b201a7f43f98fec3f90beb5bdbafaee237bb4979140c73bb8dd028177b5c7f7e4bf75cf659fa1a3987af0d114ff4b22412048e5734c19b32f47ed7b20f95211e0b53d9fabe894971d396132437af727572c288fbc42a1502811f3d1e2b5adeb39ffefbf6641d30ea2b5f5588681e738a80deb6f2d64a4f4a8d6e3e89acd5da9057ca763662f5be89b0558a26294bdd9cf7bba663ecb33bffe2b274e3ae47c994dd711ec99a9934eb96e60efbec75cfba5cb905206f566dbbcbe710d2f2d9eebbef8da5c566ed940d9753e5463fc9d625b165b9b1af9fbe30f60ee65c952c8b259b975a3bf68fd0ab458e20dc6b4e77bf4afeb4d3c14d9eb32aa2e7ce9bf6d1bffb0bc2f7be2559693e9ba4e7b264d7b36ed5b7ab02fc5340cc60d198e2644a86fdf81cc58329f5b9e78883f3e7c17a5b2c30993a6902de4317483542ecbe46f7d96dfde775bee9e979e825c965ec91ae6ac5aeabfb662311806db5b77767963ba715c8791fd06f9fd6aebffa382d8f53c929128530f39bad2cfdeb4f208593683eafbec905276f705a08e42beeea80907dc7ed8d8fd91c502e806aee732f3b579b9575f5f84e33abb095cc775e95353e78f1a30f84d977405fb3afa32b0beef5b7989de7d9f2e1699306602c74f9c423a9ffdafb6295169579eefbde598e4f91ebe5a46a65028146f8bda13f321f097d92fb0b698c18e253001e9ba280fcc3b9332bef031749b8c0f2fe5b7886556935594de5b5a0ea627e88de0bd98059dd90c8f5cf547e7c270c4b9efb1fb11c92a40e07bde82a2531e32a477bfcddb5a76e221e8cc653074836c214f553c41552c81aee96362e1c8f37b8a034d68842c1bcb307f2da5bca9c747f50433b495479644ec1089c023d42d2004c146c258388210621850763d0fdff711f05de0b21ee76ca6b2e7a40737d36323b944cef37cefd36f2c7249d8b2898523df3374fd929e1f998651592226f615d0b1c73e865d552082bd2eb356bc46a6904768fa5dc0d13d0e7941087151d7f22d094443e157c2766868206a769dd3d075c2b6bd7e8fefbfb3d61394e58325d79da26bda6e624c08413414a62a1647083184602912c0f59aae9f53ca65a28dbe87304d3ab2197e78eb0d76c97136e8baeefbbe7f869472a157111b3d84d808219851761cee787e7a6dc97110d128cf2f9e87e77b974bcbfa06f0ac848bf7bc57d330484463ff8884c27fd67adcab56b9cf643446b6901f04bb9ab59412cb303e1d0d47feb8e706695dd308db21745dff8c9472d67b118f524a4cdd90437bf773b6b4ec0c047c673bb7fffc4692b1f857fff4f0dd3b12d5b5d7a4531d78becfce4c2765c7c1977297d12e25baa6130d852ff67cff537bde67c8b24946e398ba714ec9736657be7716f0873d6e67026f5c46b62711601960f7f8db159ad0eea83cef11f4d893629b417fb24d6b97e892125dd38885234443e12d120eeb21409eacdc0748896598c4c3516cd3daadcdeaba4e341ca1e494bf003ce77a1ee540d81d084cdbe39e4f039602bf012ee839f72584383d6287b6ebdaee656699169669fed975dcdfecadce42963ddd32cd493d85a410829065130d85df30364829b14deb7b68e23bbaa6bf61d2c2d07522a130baae7f4a4a395fbd97140a851231ff4358a1309a15829283f425a81503efc210ad6cf8171a526868bae66b6fb1cc468aa078df93974b4a86f51dc02feefe7be70bb35f44c4625d163fbaa655dba6f960637b6bb0beddf718505bcfa0ba3e98a6496d55359aa61db0be61ebbdfffee3b4fe4dd90c5e673b249290cbb065c766fefae83d98a1f0cf2e3bf3fc8b81d9c0b72a7db27ff73d2492fcfadedb28968bbcbe61352216477a1ef94c27cf2f99c7a2752bf8cae9e72e12423b66ffe1635a756d1d1dd94cf56ee780d05e9eae7e8f63faee7539583cc9df9f7a90bf3ef1407cf9c63571a907464d299fe5e5658b58be710d474d9c32cb348c93abe3f16d9eefbde9f2bd42b988941221449f9ed7d634ad4fbe5464dd8e2d0804d5d1f8cb57fef3cf87b775b6d3d0b4235041a522b25464e1fad56c696dead7bbaa66512212255f2e9d28a56c7b27d5d92b59f5c86fefbbfdd4e68e566b476b53d098340d10b434efe4c7fffa33d7de773b179df4c9d742967564d9713a3ddf1ba909d11fcfc3751d846ee0b92e1d0ddb04b144df8a4118ef320cbb8cc00a61a0bfa669143adb2114411806854c0a342d212c3b217d7f9f37dca869327bc5525e5ab2a0a62dd541ba540ceeb35ca22d93e6a7ffba89075f7e96bf5ff6b325c948ec4c4d681b7c29e995acfedccb2b96fc7ac9fd8bfbedc8a4209f83641574b6b3c2975c7fdfed189675677d756d3b4110823f6942747b0b4b4e19d334df34a082163c9fd7d0debaeb195d87b18387ff226c874f48e5b37d72e914683a02b0850e9a5fe97f5d4a21c4ba86ad7cff6fd745b7b7ec8c66cb25d035642e0b9128b73df530cf2c9acd8d5fffd1dd878ddbff8786aedf2fa58cefd15601de49182b010c65f711361178756577fd80404ac963735fe65fcf4c675dc3d66043bdeb80ebb2a1611b5fbff1571cb7df41fdaffbcaf767b5673a8f753daf5cb9a7e0be62099e7d6d0e275c7e092f2f5d80b02abaa95c62f9a6755c79f36ff8c471a7dd7afc7e932f1b3f64e4c38ee7f2ea8a25a1bd3c9755f9b7aee7678661f42e964a8b7f74db9ffa7b5ec553e37a485d67fa2bcf3268c090ef9f77d4c91129e54f2ba235120b475eaa8ac58d5b9e7c7842673a65645a7782618261d0dcb08d5b9f7a88c7e6ceec7fcae4c31668424cee6abbfd6aeb7efc97271ffacef235cb6b776452904d23cb2544220999340bd7ad64f38e2dec337cccbdc74c38f01229e5f3eacda450283e0cd472b20f81b065a309edbfb6a9f4ff3b21030809365af77e8cb7fc798febca4538c257fe700d7f9c76f7f5add9cc740c733a305d18faf4a68eb6e97f79ecbe034be552508f6dcd1c3c665f2e38616a64d4c0214442a1d35b3adbfff1cc2bcf8fd8bc631bd5d104fffef55fb14cf3ac3b7ff997f62b3ef70d0a8e43e3d68dbd1e9d3373d26373668c0a66ac77bf5961879833fb4542768863264e99217399d3fbd4d6fff48c234fa6b3b9914ddb3671cbb4bbc7a7b29969437af73b30168ae0fbfe9eeb6fca7b793ce76d7eaf985416af2d5d486d2cc1d4438e992fd39da757c7ab7e70c294a348b5b5b069db669e7ee5b9b1e95cf6fede55b587856dfb4d97c2f4585ae7ec61693a8eebd296eeac8d85238f4f9f3be38865eb56d1b0710d5f3afdb31c387ed28da71d79e25faefbc12f1042b07dc756b1a5a971d2ad4f3f3ca9502ab6bd93257bf170f4de57572e3d63f1ba95d68e75ab386dcad19c7ecca92fcace8ed307f6ed7fcdd9274c65dbcad759b166397f7ff8ee7df3c5e26393478f9f9888c47ed299cd9cae872337f7aaaa453a0ec9589caf9fff9532a5c2b9aee79e2e60c99b5c76932fe5e97eb170faf1871d97aa8a2790f91c074f3890e10387dd25b3e9d3814bf75c52257483d7572f2364d984ecd03dc5d6a6d3f71bbdef5fcf3bed6cdc748a2ddb37f3d89c192c5cb37cdfc5eb56459b3adaa88ac52f5bb363f3cf5f9a33a3dfd6c6ed4c1e358ebf5f753d9ad03ef9c2df1fe1fce3a7d29a4dd1d0b065c83f9f7b6cd2ccd717d6f9be4f3a9f2395cb522c953878f4be4182ddbd8d4b4250721d76b4b5f429954bd381a02f24aba77feba6df7cf3ab7fb8e6a0753bb60ef2f4406cf95272def1a7d59d75e48958a6b5eb9c86c9966d9b694977d2b7b67e5db6ade5f4643c71c9d73ff34584d0686e6d62f1c2d9bcb26cd190651bd7f66f686dc6344def4d868177c29e9b5e7a9e6bb786fada9ae56c696ee4d75ffc0efb8f187bcde9479d7cff97cfbe88523ac5868debb877c6535c73d75f0edbd2dc5896be8f10a2bb1d0bcb62e3c6352cd9b09acf1c7b6a413aeee942884f9e7dc2e9f8d2676bc3761e7cea91410bd6acb87654ff415f1e50d71bd7f3fcb778aeee3e2c348d5c2e672cdbb26effcf1e730a202ff05b769e3e6ce0d065bd6aea68ef6c67f9caa5354b36acfe56d80efdce973eade9cefc8dd3ee3e68d1ba5593b66d5e6f54c713dcfbebbf72d1e99fb96bf2f849bfbee1ffaea2adb38d951b56f1c8ab2f1c689ae6d3baae47e291c855cf2f997fd9cc39336ab7376ce5980907f2d4df1e5cfcf36f5d315908f1993f5efe2b22a6c5f635cb9935ffe5a1db5b9b1fb14deb6bef650cd7348dea58e0b1d6d4de1f8542a144ccc7c59b203ff04dbaffab72e63f5a8a86c9cbf35e2695ee384884235391722a30154d9b9a2f160e5fb57a7930db9d4e71c1b95fe49071fbffb97fafde2f1f356132428afe8fcd7b79bf96969df4eb3f883f7fe3f2fcccd7179ce979de432f2e9977dce20daba64642e1674291187316cde1ce171edb271e8a5e0e64767bc252897df79dc8b9479df4606da2ea329a1a1e1370dda411a37f3278f070b450980d9bd6f3d2d205874d9f3b63e0f6d6266cd3fce0caa05464ff71fb73d1899f7cbc7f5def4b69daf198ebb97f183d60e8e543878c448f44d9d9d4c882752ba6cc5cba7048635b2ba6f1eeaeef789e8887234c1e392efdf0cbcf9db67acb7af05d8e3ce2042e38fe13b76842fca22a16bfe6b2332fbce78b279f019e4b6baa833f3d7237b952f1054dd38674f52b533788d821c2b64dd8b689d8a1aa9069ddf2ec6b73ce5dbd750314729c76caa7b8f48cf39f1a5cdfe7ff48773e962f15af3d7cfcfe579d70fc27d02251d66fd9c00d0fdf75b82e84fdc9438e5972c088318f45a3b13921d302dfc7344c0e1f3fd1fbe219e7df6feac6631dd94c47a6902795cb20a5241e89120f478885c3d9ea58e2b1a30e3cecb1f18347162dc304c7a13651c571130f7e6de080218f512e2da84fd67645abaa8c0f3ed16894094347fead2a16bf9274eab1be3575d71cb3ffe41b42d158309b2e25cb36afe7d9d7e68871838793ca64263dbb68cea04c5b13871c78283f3cf7e2b533e7be72b89472fa6373679cb4be61ebd4ea587c8d6e583cf9e2133cb3f0d5a9f148f40b5d5e175dd718d2a73fbaa6efbd4f8960af46ae900f0b4d0bfa014cc50a4d9dbf785e72f66b73c8a63aa0a31d3b16e31b9ffcac3fb4dfc0cf1f3c763f0cddd8256c7d8965db8c1e3064c6a03efd2e21977eccd48d5b4e9834e55b7d6b6a1dcdb6413758dfb88d39ab969677b4b76019ff9d05034eb1c8afbff86dbe7ff6e76fae4924af1dd8abcf15977dfac2274e3bfa14f01cd2d90cff78fa6137572cdc2285307b8a71592ed3afef402e38ee132bc70c1a7e3e6dcd8ff9f9ecf47d060cb968e2f0313b4335b5343735f2d2d285c31f9bf7f2c1afad5f5d5976f60e4639df23120a71ec8483d2478e9f7449319dbafbe2732f7eecfaaf7ecf1b336008f812b758607353439527fde37a25aa4365c7f9c7ef1ef897bfb5717b10f5d2f37efedc6b73a7aeddbef90bcd8ddbaf705cf7677ffad695e0796cdcbe996717ce3ea9502ae63385dcd98b37aca9296452102c53e3c80907d47df1a4330f91ae735f436bd3a99f38e4a8a93fb8f4c753c3d1d8e7b73637fcccf3fd1565d7e59dfe949c324665f9e28d8fdec35f1fbbef438d46a850283ebea8e5640ac55be17b81e01402592e83f411968daeebf419349443c6eeef8fee3fe887c74c9a12a98ac66e28964b99d103871c3f7df64b53d7af5c0ad13865b7cc9cd5af6b7fbbfff6be44623fbefdc17fb5a3eb8e9dac8e08cbc6cfa659b37dcbc02d4d0d5f8a8442d7ed76fd629e530f3b8e43f7d9ef59014bc467bf445e6879cdd06f3cfec0c37e7efbb3d3201263d6b245cc5afe5a79bf61a3d867f0f00feef90b794e997214474e3860a6a669f3b29fbf949d859c138f44ae3f79f261bfb9ed9947f0c21116ad5dc9f24debca078c1c479f9aba7725e82dc32c0dedd33f962f147ff6d2a239609950c873de719f60489ffe0f9c75c4f1cdf555b548292f9f3266c2fa9b1c07c282a6a6060c5daf0fdbb6ebb81aa661b2b5b981adcd4ddd010a344d24ca8ef3a5056b57744f1c9c7ee8310f1e307aec557f9e7ecf8a709ffe5cfac9f372c3fb0ebce94ba79d7dd58baf2f82688cf9735fa2e9c4a95f3bede0a30aa3070e5dfae2d2f951b7e231f17d9f42a9284e9a7c58dcd08d4ca69043d7b460399661f0e0cbcf51744a0821705d974923c7e27a9ee6f93e0841ae58a057554de4b0fd26b3241ac7f5dcddbd1faecbc1130fa157bcea817d060cd9e4ed7f306d9954e39c954befe8ddbbef655b1a7704f97df259260edf2775d8b889e7dcf3e253e39bb66e8258826c21cf530b5e35ef7eecde7d455def63ff70fb8d4d84c2329a489ac2b2713adb59bb63ebfe6bb76ff9547367fbed3debc3f5de62d3b9dcab858d8844c12933a0df200e1b358e210306771e3e6ee28f5a3adbff75ef4b4f512815d14565f5975362e488318c1f386c41aa909d71e00187d1562cf2f482597fee5355fbdbd654a759d6344ae5329df92ca6f5dfcb17346ac8702e3ae1f4bfe89a7665be58c8e54ba50dfb0c1afe8353261f5678e2c5c7cf42402a9733b6b7367d69689ffedf163dbc25948a8c1b3e9a0b8e3d6dc3ea6d9b1ef9fc795f666b7b2bbee08e63f73ff8fbdb5a9bfa3464336cd8b1853b9e9d9e8b8442f4ebd5fb9d2589f43caa13557cf6e8937345d7b9e58c634fe587e75dc2a80143fe74e7f38fff1f8e331e4347d77552b96c5b369fb752f9ecc5db9a1b82714b3768e868adfec77db7f5c50e7d1bcf33ae7ff8ce9a738f3a097403615acc5c3487c2055ffb65672efb374d880bd1f5031182796b5670d1b53f1e58134bfc0921928fcd99d1fce5d3ce96e71d7b2a73562dbda5beba8621bdfb92cabef32009a669d2d8d6cc1d4f4fe39585b341d7b0c251e58d5128144ac428141f184e99d34f389d59cb17bfd0deb86ddba061a3a74829c76cdbb201e20922568823c64fe2d233ce5bbfa3ad69daf6962652b90c8ded2de7b4a43b4ec17511a6496b7b2bbffbe3cf43f41b78b3100292d5c8628152210fa605964d269f63c1dae5ce71130f167b1a30fd6aea19de77407c707d5f8e99783033972e00217a8d0b47d1005fd3686c6fc1299518d677c05bce6876e5b011e21d9a869e474dbc8abe35bd6253a71cc594f113796ade4c8410f5fd2b59c2d134363735e0958a0ced3b00537f77c38aae8992e7f9c986f6e6ef05abe904f83e7daaeb48446255179ff4296a13492472abebb93fc5aacc605b361b1ab691ce65713d0fcb3459bb7d33eb766cedf64609213cd77709991645d723565bcfac658b6edad2d4b0a22a1ae7d7975ec9974f3a93a6cef6ba8e4c678f9b322839cee75a339df3b285fcd2bd19f0ed993447ec3b29286f1944795bb96503ff9ef12461cb061994772c1cc1eae11d135d422659cdb821c399b7eaf5dd67e53d8f51fd07535f5d5335a0576f6aaa6a98bb7229af6f5c57d32b51cd96c6ed5031ed470f189c2a96cbdf6c4eb5ef8fef21c25196ad5ccab2b933878a7e03ff82ef23aa6a90c502b9421e740342619a3bdb99f1fa022795dbddf8ac4d54eddd989460e80661cbce65f2d907c41e6d4c964b8ce83f90ef9cf305e2a1d06b8b37aefbeba8fe83b8eec17f511d4f627579e73c97feb5bd18dab77f245f2ed2afb637cf2f9ecbbc55cbc2c9684c740572d0342dc8aff35f316c83c00393c7eccb8b4be6fda457b2b653d73436eddcce1f1ebe73e5fc35cb6f8ad7f63e2b53c860e83a5b9b1a70c74c90a2e72632df231989317ae050bb2e51c531130fe69985af922de4a98e278c78380242d0914dd391eea4776d2f06f5eefb4e6f0fd330e8d7abb796ca65f9c1395f60fa9c196870fbba1d5b0fc5b6c7e3b918ba4ebe541473572f9565d7c5342d1cd7255bc841a9f04d223184658110ecdcb9833fde7a03a2be2ff83e5e2e4bb658b822645af59f3de694518ee71db874c36a3ada9a79f0a13b820981defd7e9e2b157969c97c9a3b5ae948a726ed7be8b1f3c60f1eb1b4239b5efc4e4b3b198df36236c34b339f26d477a05a56ad50289488517ce0eff5caccf5ffeeec982c16b8f6cbffc7a3b35ffac92f6ffaf59c61bdfb7d62ca9809d7ddfdcc23a3b6b5ec645dc3366e79e2016d589ffe8f0cef377068b658d8ecb80e86ae17f2a522183a781ed16882834e39c47d69d19c97300c29f339460c1f53c816f35e534b1312484663f4abab5fe74b69ef791fbeefe3fb9242b94cbe58440881a91b783d42ef3abe8ff4dc60d98e7ce3a4b9eb799846b0dfa1ec3818babedb12a6b7503d94dd32f952916c31473a9b4608117cdf97ddc7149d32b258c0f1dc7795e8530881e379e48b397fb7bc1842502c9728954b78becffc352b68ea68a13d93c68cc4717c0f8460eeaaa5c423317cdf4312444e8a47a27495801002cd13dd8d3a1a0eb366db96e8b24deb387abfc99c30710ae97c0e5dd31142dbd5da85c0f15c8ae552d9f5bdbd3e938020974785a213ec8faa8ac67719ed6f82eb79d4269280245bc813b2ecdd8c39a16b84c236be0f1a92642446c40e05618165100c44131acda976cd34cc9ce3b9a0ebe094e8db7f30430e382435e7b5b9f34438822ce4193f66426e4b7383cce6b24801b5f12483ebfbceecac8898aecdf7c572095ffa6ff47e0491cfe85753d7bcd573bf502897762f1321283b0eada90e7c3f41be58e095658ba84bbe31d1acd004a66d63480faf90276c05d1f7b4ae5c43f2c31af2048bd6ad8e476cbb4dfa92c6742b4fcd9f45269f8b46422132f960a5a7b6b79c48955c489ef4713c8f623e8f5f59dea8f7d8b3e54989f45c5cdf7f171ea64064d9b64dc4f3d0349dabeefc2bb9cdeba1b6574484a3c86caa7bacc8978ab8be170cdf52629826fb8d1a37674b73637b6bcb4e13ddc08c44dd0103871537efdc0e9a46555d3d483fd2914d1b5f3ded9cd53589aa67bf7dd36f90aed37fe8c8b1e34a4e892d4d8d6cd9b88e2deb5631dd732151fdd52dcd8d5f7d75c5e23f66f2b9772062821d7f9aa6337ff572b4648d12300a85428918c5072f5ea445e0252877857ffe1f143342b07aeb267e70ce17ea1a3ada98b762f1e363060d2d7ce5d317de76fd9d7f1dd45e2eb17cc31a2efefd4ff9c441478c3b74fcfe0de3878e2af7adeeb5351e0a3722655fe93af4abedc5dd97ff267bc4773f7fe2861d5b19d4ab37bff8fc37cd475e7d2179dfe3f78365b3cf8021e2b8fd0f961b77eed83d2dbb6eb0a5b981e55bd67b4d9ded6cddb99dc6ce76fad4d4391d997460eff992beb5b5482949549665e8dd91b2827f6ae2491adb5bd8ba7307d5890425a7148886b75b87aeeba472197676b47a3b5a9b58bf6d336b776ca64f759d932b16f0f1c1f718dc6b209a26a8892571bd779ed7c3f77d6cc3d4eb7a5539baa6ad0146572c45dad21db4a63bdc7cb1c055ffbc896797cee79c234eb46cd31ce594020167192621d35aeff95ed19792906511b6ecee2d674213c27183a4930841d3ce067e7cde25233f7dc40955175ff7b3ce13bf7f31f7fef83a745d773ab3e95df6b3a6110f4737f74ed6b446ed109ef430de5140ac375975b5c7efc552491c386a1c43faf4e3a5250bc816f2bb791d8224ad1229c197125ffa951fb99b8a1208b32696581bb1435390b24ae6731c3a763faebee81bcb4efcd6792735968a8c183c9cebbff2bdf8f76fbdde5eba620948d87fd8286dea94a3cb25a7bc9b88b96fe633e44b85bd8a363fc889a40fa8ebcdb6d626babebb2721d3a2a1ad996befbf9dbe35756f385757025a5909c9ddf56c1f669479092c5dbf921f9e7bf184718386363e3afba5d2616327f28fef5e5d75fbd38f8cbcf8573f003b109ac948fc8d1e2243a73d9b66c986357e6baa83a6f616d6366ca3beaa865ca928cb8e03be4f752446221225168ee2faef2eff8fef07e5e4f98100ced5f60a3c2b95fd46524a0c5da7365145c92977efbdb4045c77c9776f9ab562f1ddbfbbfd4f947583a3271ecca46163ea7e79e7cd68a13013468d2793cfb5ce5fb38c86d6e63fafd8b8e6cfa95c86314347eeffd30bbf7afbaaad1b8debeebd9dfafe839d742e3bbe39d56e3ac502ff7ce6511e99f542da7b0709858500533768cfa4e96c6d2694ac522246a150bc2fd44e3ac5ee336568484d528e15d1a255087484eff3bf9ac746d33476b6b772cd855fe38acf7c89b53bb6bc30a0aef739177fea820e5380304d5ada9a705ce7714d689f8887239627fdeb6cd3bac6aeaa01a025ddc13f9e7958bff99b57f4d70d837f5df5a7aa7d878c9cb1adb5a905215a0cc368310db3594af9a880cedd6ec0b699b36209f3562f4bdef1dcf4e80f7ef17d1e7ae579c3d48dde8bbaf679782e078ede97530f3e4a8ce83788aa7094a81d022465d72157caeba74d39a2d7c2752b787ef60ba0e955e95c2edc9eee04ed6d0c73d362e986352c58bb3c71dbd3d3625fbdf26bfcfbc527f552a1d0e7c525f3713d1f3c8f7d060de5e87d0f10bdab6bdf5572424dd3c8958ad10d3bb7b73a8e3bb97f5def402e1b26b3562c666bf3ce9a9ffcebe6d0534f3ec83e03875a96617ec2f7fd6504f93f964542a165d150789f68288c65188c1e308413261ec211e32772c4f8891c397e9277f8d8492dd15038b0a2ca25b6b634ddd0d8d6f2ddde5535d11dab5770f62fbf6f2c5cbfb2f7b3afcd0dcad3f7e83d7028f170e4829674e7b45cb1b8db6cfa5bf720d07b2ed9abfce87b0894a253721bda9aedf1834754df75f9afc9e473efba6dea9acedcd54b7b6d6d69fc76ef44f54366340e86c9928d6b7875f96bd1df5cfae31a4dd39871c31d7542b0359dcfb5002da665b5689ad604dc902f15e9fa29948aefc8a8f4a5cfa05e7db04df38d5e968a67ad582e511b4f7e6cc63d8015ab96b16ec7d647d3f9fc27354d335ccf0b77a453976d6d6dba81720910d8a6250f1f3fb1c5362de94b297af6934d8ddb7972decba1592b16577fe3973fe08ff7df8ee7fb75cb36ac353a7359f03c86f61fc4d4438f11e3868da45c763ed0a7f07c9f44382a8e9d70903c6cecfeada1cad2b17c6b0bb3962fbeebff3e7de115679c746668d2b8fdcd6b2efac605eb1ab6b620448b94b2251e0eb7dcfcd8fda31dd7abbef29f37d65ff3e75ff72ae473bd06d7f6de1c32ac895b9b1af70dd9f6beaffffda1837ffcd92fb55447e32004e9428eedad4d34b4b7bce5cfce8e36b6b536b171e70ef2a5227622a9048c42a178df284f8ca2dbb0c2f3102103dd0ae1cede8a1cba16edc0d1f8cdad502c8329764d5bfe2f493b21c8978a14cb65744da3ec3af3a276e8d8130f3e6af113f35f415836773df92043fa0d7ce8b849533ebb68ddaa7be3b158e8ac634fe3eec7ee2795cd70ebe30fc6c77c75e8764d88b094fe93773c3ffd90c5eb570182b123c772eeb1a73c5d28974e01765b282fec10f316cf6358ff41572763f124e1c8774396352553c8bdf2dcfc5908d304dfe5f0f113d977e848b969e70e1cdfc3b66d40502a15797dd3bade8eebee3074bdae6c986953d71f5bd1b8edf08eceb660c9db5b3d7b24ca33339fa52e59fdbdda64559270f4929069ef57749c4573562e41080d1c87e30f388423c64f92af6f5a4b672ef3ee06215d97ed99142b36af4f7cfdcccff2f3bbfe4ed1f3b8e785273870c43eb7d6c413712cfb0f12ce2a7beeddf95c066187a88ec438f7a893e95353e73915e1a46b3a9dd9341dd93486ae237cbfd197fe80a9538e6a7df095e7e239e9f3bb7b6ec5d68d1f2722d11086f1fdaa58fcf0b674eaa53fdc7f3bc2b4c071f8c1591731a8be6ff4f25b6f60e6eb0ba98e25c814f26f63dc4b42a645af58127dcf248ea685a1e9a06b640b799e98f77233c8f32f39f5acafe78a8503c57bdcfb11b6c272c6eb0b99387aacb9be69072fbefa021b766ce5ce67a74ffcd269672d0046e48a854d373f765faca1b5195c87a30e3b86e3264df96dd9752edf6d0c785706b3c7a05e7dd8dad244b15cdca5b94d938d8ddbb9e5c987a88ac53f5e1d3d12e5fffe7a2dfffcdecfef8bd8a163e291c8a4a716cefae98dd3ee864814d3b4d87ff8e8bceffb832414d995d30561d96cdeb6892717cc3afaccc38e9d4138b29f66d99aa1696b9e7d6d4e4d47671bf83efb0c1cc2678e3e59beba62098fcd9df9814f41953d3794ce65b3b6690e3b6adf035b5f5832cf2a4563fc61da5d8c1c30f897b661761a42dbb072cbc63b1f78f959304c344de3924f9c4d6736b3d336cd7b0ddd38998ae8370c83f50ddb66fdf5de7f1c11afef1b4fe532ad73562fb7b2c502b82e63868e6268df016f1ba0c0362d566dddc8c6c6ed08b5815fa1502811a3f8405f801244c842842cbc0dcd14672e465fbf85d00d9f431b330cd9d88ccc15c0fadf6c32b9628183c7eec791fb1d8804745dd31a5a9b99b77a196d991484c35c77cfad8c1d34ec96738f3eb9366a87fed6d8d6523868ffc97f9dbf781e5b7c9f2f5e7f15aee76dffd4d5dfa92a96cb1453edf4ea37900943473d52729ccfefede52e3d97a14346f0d2e27934b5b57c9d64f5e73636ee307f7bdfed41e4a1429e4b3ffb4506f4ea7362673633f3d0b1fb317ae030dbd4741e7aee31f05c52b92cdffbfb7566b15cde8469faff7e6e7a756d552dc96435a954e75b295be2769848a28a4767cfa0582c7c4e54d59cd9d8d16adef8d8bde0fbc87c96af9cfb0586f71df049d7739f79af1bb1a594b8bedb68e966bfcf1d3fb5e1b667a6e1e632fce48e9bf1a5fca5a8a9bd72cdb6cda1b5db3783ef21a5cfdffeef2a92b1f838cff7d78a8a19f72694a5f4871c3e6ed2da19afcfaf2da553fceec17fa1e9da37454ddde7d7efd8665d7bdfede0794827c74fbffc7f0caaef7b6cd9716649f9cec3787b9e473c1a231689be516cd8a184277dd0745edfb40ecff7fef8c0930f09d33443577ce6cb4f0067bf9ff6592897bf3171f898ecf6e6c6afaf5dbd8cd9ab5f67e996f5437ddf6f39e4db17c4d2f91c6e26c5b011fb30a477ff9f965db73b0a9e2604c57299a717cea2e43868efd0ebe4f93e03ebead9d1d6423e9b41223174839065bfb3fd561f3106d6f725954931f5a7dfa458761e5db0768571c7f38f91c9652a026428b75c765554d775d93df1d3d57e7d8fdaba7af2c502bfbcf3afe331ad1629a5f8e53db7d6e40a79c8a439edc4d339f180437f5b28967e6e1a462540fc076bd077b5d6faaa5af9fbaf7cd7faf65f7ecb730b67d3dad6c297aebf0ad7f7aef57ccf5bb46e25d229a18522fce482af10b6ec111d329dce978a9f3965f2e1f7b674b69fbc69cd0a1e993383a75f9b7b08d1784bae58d0467fe1742b53c853ce077ba92e3c612a171e3735d49e49edb54f474361fad6f6e2a2dffd984d5bd66345e328140a8512318a0f0e5f22a261d03d4aab57515ebb09bf2a82dcd242f17b7710bafc2cb4c3c6415b0774a4c032911fb3d9344d82f7f6b7fc66bbb1edc068f30093881d4208b17260af3e47df72d955332ebcf60ab2f92c8552811b1ebe2bf6d0ace7ebfbd7f52ec4c2e13bc70f1d553ee7a8936f7b7cfecbcc58b21004b59d1d6dd4d5f6e60b277e12d7f7efeac8a4beefb84e3a9dcbbe71b36f3ecf99479cc0e4d1e37860e633a1a716bc1a2a147208213866d2214c9d7224aeef1feb4bff1501ae6998e8ba76fdd4438e11c99ffde187f7bcf8248fcf79918ce782a466cad8899c32f930fad5f5e65fcf4f67d6ec195d57aae9d2b3dde5207d0a4e995f7ff93246f41bc8d577fec59efdda5cdb0b852801874f98cc85c77d827431fb094dd39e5bbb636b7967471b9150684f2bbe6a8fdfab776b7ebe5f1d0985193f78a4bf7afba6465dd3c75cfba5cb966c6e6a08dd37f3699a9a1b235876c4751d46f51fcc459ffb1a5346ef87d0c404a45cd925347ce9130f0533e6d9429e7ca9d8636f906c2fbbe583af3cef921735c9a0bb5e7c82d5eb578544381272cb4522a12abef7c56f73f8b88934b4b51cedf9de2c29a5d7238a5b648f6708ed69814a2909db36baa6077b5c7aec37727d6fc2773e75feec5b9e7ca876cbb6cd60d9b192efe3bb1e423092bd3b42427bfc6ebdd9182ea5cc164ac59f9e32f988fc45c74ffdde03b39e67c9aa6542d8766d7b671b83fa0ee4b39fbe804d3b1b7f502a97ff26a5cc77ddb36118d425ab2994cb7b8b5a17dbe37abd76379aa16f4d1d1b0a39aaa30966af5cc2bd2f3d4532bae7d7d833ee7662cf791420bcc7dfbaca3cbcb72edde3fff75cb7d6b32d87dee49c7b3c05f4a9a9e5e66f5dc9dcd5cbf8c7530f277636ed00df67c890e15cf6e90b3971d2a1e5b01ddacff5dc376e062a14d86fd2217ce7ccf3796ac12cedc1979fab6b4d7792cba4d967d828ce39ef1292c9e44f354dfbf3e28dab73cfbf368fb01d360bc5e29b8d4189bd3c73fd5efeb6d767d785964f446263a5e78baf4e3de7f92d4d8d7d67bebe90422e1b45801db7b9e8d4b33966e2c1b4a43ac64ad850d9a394ca150b177ff9b4b3fe94fcf48567dd3be3195e59f8aa2e22d13a29256dedadd454d770d211c771c1719f60dca0e1d7fa52fe3e11897597a5a669d4c49344ec10537ff22d36efdcc1cece36f45044bd6b150a8512318a0f0e2141c423483c4a6bd7535ab536087e148d210c0377ed4e8a3fbf87d095e7a21d3901a96bc8b60e84692235f1915f5a2624b89aa023ae91c8bdede6d3a5c0097bfbbb209879763c9750b019b928849839bcdf8013f4ae884aba4e53471b99426e9d6d5ac423917cc8b4ff3dbcffc06d55d104baae074248d3095916fdeb7a932de6d734b436ef2c948aec7573acef531d4f32acef80bfd555d53cd8b537c3d075aaa27146f41bc89a1d5b5f92522284083c1a9ed79288c67ebfcfc0a1cfd72692202542d3919e4722126158df81f4aded45d80e756f0a66d75e9c1c707c9781ee4b9f0175bd19377838d5f16490370730349d6424cea8814358bc61d5f3c13e8f328eeb2210ff02e6f4780a97ddb3a37f0da8edf17bab2604915060ab7abeb76648ef7ec7b99e1709dba12e8510842b0e8519da6700e3868c70966d5ebbac6be37b4d2cb0f9fefdd293dc7cdb8d4c9a7214bffee2a5b4a5533475b401e078ee860175bdcfb475a326be87b7c4362d86f4eecb84a1a3686c6f9db9174fc20304fb70ba6ba65256f852120f47a849247964d68b34b6b7f08dd33f4347364d3a97450881effb6bfbd5d69f1ab242bb8c535dc7362ca4949d0499e5f76c7bafeff1fbfcbd1cb3beeb7f1cd76dab8d575d3bb4efc0671291e8aea00dba4ec4b219d8bb2f4d9d1df34bae9bf67d1fcb30a9892769686f66ea4f2ee5ab53cf46088d742e13e48b0904e09f80e93daeb79bd52d84c0364daae255cc5bbd8c0d0ddb28948ad8a65511fddd9c01f42cf4ed7b3c4711386e0f71b2a6f2ef7460c31ec777f4f8ff2b2af7d945975ba0b09773ae7eb3ceaf6b3a078ddef74b1dd9ec16cb34833d544210b66c46f41bc8c8fe83f39b9b1a56ef752e44fa44ed10437af75fd4afaefef2ae3c45681a915098217d07e0f8ee22dff73bf2c5021dd934d5f1c4dec69b15957f7f0edcb6c7677b8ba47039f0873d9f5d82eff9de2acff7e95353777ab690afb20d8bbc084238842c8b3e35758cec3fb0b4b3a375d56e17719cc6faaa9aef0faaebfdb7ea586257c44000c3c0362d7a57d7326ec808aa22b1a5cd9d1d2d4208c296457d751d4dedad9c76e5d7317483592b1653cae730422174c350499e150a8512318af78ff483b09d5a228a8f4b69cd3a8aabd7217d89168e042f9bb005037be1aedf49e1570f10f224c63113f104c8b6ce207a99901f79212305944d81e683ffd62b653a81e7f7fca3e7fb24225142a13061d344af6c866f4d77522c979feff9f8a66110322da2a130d15098d6ce8e52a95c7e7e0f832e0875ec3ae48b4506d5f7e1c051e371de64437cc929110d8597e89af67c3697ee364e3ddfa3582ee3fb3e89480ccb30e85dd38bb06593cfa45b0be5d2f3aee7bde1594a4e9992137c6f2fb8c00bbb1935ae43a15caa18a5a2c7b9820ddc9eef53158d53f63d3a3369a4945b81ad6fa8875d0d65f19e6561e83a894ae42681a0e4946797bba28af5540e32b8ff4229b0a5eb2bc113ae7fe80e96ae59cefc8d6b59bd6a296b0a791a3b5a8887225c7dd13788d86134a151769dd7f0fd373cbb949292e3902f15f17d9f6434465db23ac8f7b2cbe8debee77792d11889488c075e7e968d3bb6b06ee70e32f93c99428e6424c6174e3a83b2eb90cee728bbce7c5ffa6f5626ecd9f67c29895821a2e10886ae23a56cdff3182925915098482842c8b2713cb7a5e4949fdf5310fb95d0daaee711322d460e18ccaaad1bf9e53ffe4087e7f1d2fc57703d17c775f9dc89a7d3a7b68e54268394727d4fa1b4cbe0d7d0348df6741ac773f17c8fce5496ce6c8664244abe54a4369ec097b24b9ccfd9f3be4dc3201e89752526f58117dfa45f36567e76c3324d34a1216139c1cf1bbaee6ee71402ca41dbdfdbd24dd330b8fee13b9fb14c737bc8b2762bbb62b94cb15c7acbc1c3f13c344dec4c4662cfb7a73b7bcc43046dd6c3a7365e45553c896d5a48e45ec79b0aab2a3f6fa0365185ae695d8260b7679752a2eb3abdab6b694db57789db85aee7edd6d6a49438ae4bb15cae9c3349a158c4c7c7362dca8eb3b9582e6df6f61241adebbb8552918869130b47e95b53cbdc55aff3ed1baea1acebcc5c343bc86f138962774d182801a35028948851bc6fa35eca200e593c8cc4a5b47a2dc5d56b913e8858343054a504d743446de490beb8ab1b28feee41c242a21f3d2908b7da9282b0b92b3eeb47942e732513d51868c62b6bfedf78c361cba62d9d0a424c074a8fea58827eb5bdb8eb852798bd641ee1581c216170dffe7ceb93e791ce6582f357c299ea9a463c1c61f5b68d6c6f6d62ffe1a3a98ac67b24330c8ed384463414a6502e918cc61852df8f9d1daddd0269cffa02113972df0359be693dafbcf42462600cdbb4a88ac6a9abaa66daec17e948a778e48527b8e0136773c4f849d4c493842cabc7f3482cc3241189511d4b04b94c7c1f4d082cd3246459d4c49378be5fc9d7119451552c4e5db23a48d8287745aab34c93ea58823ed575dc3bf369366fd9c8c861a33964ec0442960d1543da324d3ccfc7d00d4a38bb4ade0f0ca67eb5bdd8d9d1c65fa6dd437b21cba87e83a98ec5898523954492b2dbdc37749d643446afaa6a3a72697e76c7cd20257f7ff221766e5805c95a42fd06d29e49f1e0930fa3c59358a6c5dcd5cb4844a25445e3982248a4d8b35c84102422517a25aba9afaee1a1592f502c1559ba711d10e4e5d12a65228420118d81848767bd40d9717879d9425a1ab6216271744d63e6bc57b0e349744dc7f55cce3af2446c2bd2c3f80cda41d8b2a94b560711ccba3c275212b143f4a9ae65d6f225cc7d7d019e6630a2df408a4eb9fbfbd150985e55353cb768364d2d4d58a130274c9c42325a1106ddfb792aed3212a5369164e1da95fcea9e5bd8d1d2cce38fdf07f12aec78825716cf03d7c5b62c1296cd21130ee4d0b1fb056da85297baa62125746433082148e773389e8bae69ddd1ca52b92cbaae770f0bc9680c43d7baebdc324d7a5555b36cd33a5e58308bb65c8e910306ef1216be4fc8b28947a224a3316a1355c4c391600f560f41b26ec756c60c1c426dbc62d4fb7e450c4729b90e35f104baa677d79b2c97193c640463060cd96b7868433798f9fac2c4a0fabe8148f6fd4a9fd6a98e258886c274793cdf6c5c05610eeb3b80f38e3b8ddb1eb803c2110cdd2011891209477875f962e62f7b8d8e6281bae4201cc7ad8c1d04131fe13035f12486ae079ec9ee7bd0a84b5461e83a374ebb3b287fc3d8551ed2c7340cfad6d4b166db167efccf1bb9ea735fc7364da2a13021cbead1a7836788d8216ae2554443616e9e7e1f6da94e5cd721194f72f0d80954c7e241d2d8ddf68549b4ca77eb92d5d4c5ab9836fb45662d9cc3ea96469e78e61188c4b0e309f5a25528144ac4283e7005033e68f110088fd29af51457ad43fa3e5abcb274a0e72c6ec941446dc4f07eb82b7650b8f621c242601cb51f9ee323d359b0743eea796484ae21aaa2dcf6c823948aa5bd66b537749dc6f65674cb0abc1d76987b673ccdea6d9bf8e32377b37cfe2b108942a9487cc0106cc3644b5323aeef772f9548e573e89ac6d6969ddd9e95b67427eb1bb606c694a683a1912f1598b57c31a9543b07ecb31fd17098443946369fdfabaf285bc885c70f19c115e77d991b3c9797562f637dc3561e9af53cb9729107663e4ba9b303b229d6b43671c171a7b17ec756566cdd886e569ec730d8d2dcc813f35e26118bb1a5a9013d12a5502eb169e70e765a36ff7a6e7a77424cddb4d084c683af3cc7bc55afb3a97107ba1d062d183636eddcc1bf5f7a92743ec7bd2f3d45716703e33b3b48e7b3acdcb2013d1cc197924d8d3b828dde92dda37685236c68d8cadf9f7c88159b3770dfe3f743344e6ebf206966734707d942be72ffc1f75a529d4c9f3383355b37d392eee0fa7bff01d90c54d510ea3320c83d5249ec29aaebf07c8fbf3df04fb0430ce93f882717bc822605cd9d1de8965d291793b253e6a905afb2a5a991ad2d3bb9fb85272875b4422446329ea03397a1502ea19b1665d7e1f1b92fa309c1832f3f8b9349a145e384aa6bbb3d4746bc0acff778e48527400842964dc40e0506be55791ecb62c9c6b5dcf4e83d949dc05ba3090d61d92c5ab792b674272f2e99cf960d6ba8ead31f5dd3c814f2e846b0d469d6f2c554c7123c357f161d0ddba81b30986828cceb9bd7d1d0da826e9ac1f34941672ecb738be6d29e49b164c31a5e9d33036c9bd08021c84a7fb723518410cc7c6d2ee4b234e7323475b4b272cb46f470b09fa13397c5f77d3a7319a40cf63f183dea540881aeeb48a03d9ba94c22080c430fbc04e1089b1a77f0f4825759be791df317cdc5aaaa0904729727211c66f9e6757466d344436116ae59c9ea6d9b827ba8f45ba169ec686ec0340c3a339920616938425b3ac5d30b5ec5f53d566dd9882604857219dd30f14a45c60e1bcdbe4347d1926a07b9fb1e382925894854cfe673d457d592cde7e84875d0994d73cf4b4fb1a5a9914f1d7e3c9ee791ca65916fdceb45c9751255d138979e7901c57299475e799ea68e569e5c308b5838ca93f35f61ebfad524fb0ec0d40d72c502ba1ef4a7d92b966099260dad2d0cedd39f79ab5e478fc6c0b448e773dcf6cc34f2c522373d72379a696358d6ae000a7698edad4ddcfae4c36c68d8c61dd3efa53a9e606bcb4e5e5db184d6544720360d1390949d32f3d72ca7e094d9d8b89d47663c0d9e0baecbd01163888442d886c986c61dbbfa09800cca73d1da95dc3cfd5efad5d4f3cf671fe5d5171e87ea3a427d0774b7278542a1f88fdb762a56fb7f9f4ba7df25ef59be805cb184a5ebefdafed78446d929e3b8254e183d81dbcfbe24df984ec5127668fd05f7dc3cecd5ad6b89856298bac16ecb5764903c4f0bdb604279cd3a8aabd6e3fb3e221143487617303d66cc89849199226cda813eba2fe11f9d8d7ed47ef83b9b215f406a3a68bb1e4443909565a242e7cbf1095c993868fd92dcced1167aeed3e9a7432d7e81286665b6f69db74181c0c3a7e03bec63d67057ddc99992f4ead8fb7af14a7905d9c4e7beb690effdea6ac8e5f69ee4d1f7417a84aa6a8329644d50ec6c877209e24942e108b2e2a5283b0e7e673b180656b2ba5b14b99e8be7fb41385d21708a05701db0c3d85db3a10491ac9c62010a398e38f458be75fa679042e3a4030fadce16f2b78ffbf219a43269c8a4b9fad22b38ffd8d36e9fbf7af9a32d6dcdec4877f2bbbbfe8ad44d28154068189168604c0a41319b817c3658ee178a100a85baf39516cbe5e03bbe0fe108213b8457594684945009236c25aad0342d5866954981eb422c4ec80e55da910c66b30b79d02ad7374c8ac502944a6059dde5d535eb6d19e6ee91af3441b158845c064c8b503c119cb7540cca5c373042e1dd8ce4b2ebe21772502e83ae6326aa78a711d11cd7c52f1682d9e47004cb08bc548860c94f399705a7048689118d772de10a924dfa3e9a26d035bd726c60a09b9158e09d789b6b977259903e46388a61ec9a3b2a160b90cf6155d5e04b89a16920348a851cb80ec20e635b76a58e1c84a6757bf58ab92cf83e7a3882699838ae8357a95b110a07c755eaddf55cdc422128332b083ef056fd4e0841b150807211ec30a17018e9fbdd4b0a75ed9da718f32a892d0d5d47681ac552118ac5a08d84c24179ba41885edbb482630af9a0cdf97e605c57da07feeec93ecb8e83ef7b1886896118388e8357c807933195739a95e557e57289f1c34631b8be1f61db66707ddffd76b4b65cfdefe71e419836c7ee7f3061cbfe564baa7d9ba1196c6f6b627b4b3320f1521d68c92a6effde35144b654e3af05006f7eef7fb53aef8fa88a7673c09c0a9c77d821bbf71f992f53bb65e357ff532eaaa6ab8f2b63fd19e4e05ed59fa8850a4477dba084decaacf7c2e688f4e191c07a23142d138481fd7f370d39da06958f164f738d21d86411394ca2564260da6891d4b50ea68835802dc3268069665758f53beef532e1682fb324dac70b43ba751c929230b85ca92e230212bb46b2998a8ec0d2c1583beefb9108d138ac6947851fcef1ad242601926a969b35561284f8ce23fe381018940b34d3005e535eb28ac5c8f4422e2d13717301018fc85222266c1d07eb8ab1bc8fdfc1e62ba8e76d858fca656c817016d3721f351c1340c529934dfbbf287c4aa6bd0de244a8e2f2565b7bc6b1f862fb113bb265bbb5ed25debf9a9abdf6d161782cdc13d9784d9e1087bcef60645aa0533dfd138af2c5bc42b339ea6d7f0313cf893eb3ada32a9337c29831c2ca6c9d6e69dacdab6897b673ccdf469f7404d6d603448093dd6ee7765e8b623d1c063b4c73591411e0f4c73b767d2c42ec3985d7b40babf67f7485ad8d350b14d2b104a3d3eb32dbbfb1cdd33fc3d8fe96938fb12dbb2c0aaddfd7a7608ecd01bef1f30753d30ccde633ba047ee12d925f06565837a2c0ec4df585742a0558454d77222bbc73dbc13096ef788d6d5f3797a3eab2e44f732463b14a62b2897947ed05ebacab5ab9c76abe36029951189edb5de754d0f66f5f7560f7b1b2ea4c40e852014daad2ef5b74b8eba177a0a1e595942d8d56ebacb73cf7664872a3101d96bdbeb7aae603f8dd1fdb9a1eb187bc94f23a5c4b26c966d5ac7eb2b973270e050a27668696baae30ca1e9082148e532b8aecbea6d9b49a55318968559f12099b5bd703d8f8b7ef61df05c6ebdea0fec3b74d4f73a73198411f4a7ce4c9ad737ae65c19ae5fcea2fbf8350082b96a8b4716bb7ba0aead3dabd3ebbc78a1ef55ad993a26b1a7a55cd5e86f55d6395659850bd2b5e86ddf5ff3dfb7be55a4288e07a7b199f2cc384b8f9c67e5229734d88a07d86c26f5e370a8542a1448ce2831330a0850201535abb96e28ab5485d438423818091fedb4d3540c981888936ac2ffed656b23ffb37d19f9f8776d03ec8d63644b1144cd87d84c22f77794d76b63413abaef9c8255a933230fc45bf817464d31cf5cdcf8226b0a2f12061a51de21f4f3ec43fa6dd132cff1938984a2854d5ae158a77d5d702035dc4ab686c6fe5f667a6059ead500429258bd7af42ca6059a9dd25de2afd4c56f6a57409892ffdf60af03cb448b47ba263eeaad739f38aaf816e10aaefa3faa842a1502811a378bf2f6ed0d0c33618953d30cb57214d0b61dbbb36a5bf531c0fc216daa07afc1d2d647f7c07f15f7d01edc091f8ad1d884201595912f3512064dbac58b39a0bbffe1512c9e45b1daa7d98fda1db48eab121565636e1eee6dd50869142f1fefa5a25d081be479f32f477defdedbd78bc4cc30023aefaa942f1bf4b59158112318a0f024177d41b2d6c224d9ff29a0d1456ac455a369a6d77bd81dffdb95d0f2c036d606fe48e16b257de49ec9717a21d340abfa50391cd83f1d1f2c608fd6d97c17c12f8976a380a8542a15028de032a2c9f12318a0f02dff791ba86160d217428ad594761c55ad041b32b1b7edf4f5c64df074343f4ad4536b491bdfc36a2bffe3cda21e3905a2ba4b260f8dd51a53e2c827dcd02db3082200a6f4edc97320ed6473cce9a42a15028148a8f0a02decebe502811a3785796bb042d1ac6171ea5b51b282e5f831404892c799f02062aa19a038f8ce8538dbfad99fc4fee227cf5f91887ed1b2c27eb6805ddfc90071781ebba143bda8947a36f75e893028e10422811a35028140a85e21d8b1865372811a3f8c0148c408f4790c2a75cc903e30b811609d39dc8f283ba94ef836da20dea83b76327855fdc43f8721feba8fd109a87eccc7ea8a55176ca0ce8df9f9ffcf82afe72fbadc180b3f7cdfdadc02cd57e140a8542a15028948851fcb7258c14108b22854f69ed468aabd607b94d62d18a80f13fe80b56f209988801bdf1363450b8f63e3480a346e1fbdeeeb91dfecbb8ae4b3291e0e4638fe717d75d4b4d75f55e454c10c5ac4ca6b3230887ea79605a5886896918e89ad6fd3d2965902ba192bb43964ae0fb8413555895ace5ffab082128964b948a05846110b643483fc8c5522c9502ff9feb043940426122a15d9f7bbe4fb9922031588628d1ed10966922104829293a6564310f9a4e2259ad3afc7fb82e5dcfc5f53c744dc7ac646f2fbb0e854cfa4ddb7c576e1d60b71c3fef0a4d235fc8e3140b1876886828fca1f62b21049ee791cda60188c4e298ba5999139264f23964210f964d3291542187ff5bf5a26964f339bc7c2e888a69d9589685a51b68bade3d3beefa1e8eeb522e9582f1c7b24846e32a00c35bb4f7b2e350c8a641d78946e33dc6f7326e311fbc23432192b1c47fb4bd4b2499ca78634763189590e88eeb522ae6839c4aba4eb2aa46d5a712318a8fb782012211447389f2aa4db8ebb7e07b1e5a2256111bffc1176bd909a29d0de987b7623bf95fdc8f2c9f8e7df40464eec373b40a21701c07c771b8f8fc0bb9ebe10728954b883d92f5c9728981fd07f1ad332f6063e3766a6209363537d0d8d64c4b473be9421ed7f38020695f752c4eaf4415bdabeb18336828e150887f3cf508cd0d5b31135544ecf0eef9157adc4f2a9306cfc50a470323ff3dd68b94924c260552128925300de3431bc48510e44b459c5c9651c34773e8d8fdd8d9decacacd1bb02d0bdff7193960309aa6d1bfae3775892a5edfb086e59bd7619a2652423c1ce5f8490723a5245bc863e806cb37af677bcbceee648943faf467e2887d48e7b3fc65fabde07944e3090cdda8e41cd128940a942b493bd13412f1e4bb7e96ae3ab2235142d67bafa38f8b50c965d2bb874697124c8b7eb5bda84d2449e5b234b7b5a01926fd6a7a71cac99f221e8970eb930fd3d2b81d3b5145c8b6713c0f53d74986c278be4f2af7de3cb17eb1c07ea3c7b1dff0d1bcbe691d0b962d420f45888523efaa8d0b2095ee241c89bd416c09112c35cd657b3cbb9484a3f1ee63bb8db95c86683cc197a69e8b943ecf2d9a4373471bf812c330387ee2414c1ebd2fcb37af67faf38fedca7324e56eedf39db63b44e031d72c9bf8fb4c242984462a970e8c3d7857e7144204a2359bd9ad8cdeeb78d33dc9d1253a2aefad583cf18e92c6f6142fe96c0699ee64e2a4299c32f9704ae512eb1bb6b2b5a991c68e36f2851c255f6208a80ac7a8ef5bc7c80183e8575bcfda1d9b79f29517403788c7136f1a7a3fe81f1eb94c0a805822892eb4f7b4187bb767d77592f1e41bca4f681ab9421eb75800b34b68f9efe95a6ff79e914026dd19b4f9583cc80f04c13d66d2f4e93b802f9dfa6952b90c2f2c9a8326345cd761fca0614c1a3996aa7882f96b96f3fc4b4f413c49329ec0973e99746ab773be7dbbd74865d3e03a18a130d17004a40cc6a55c1661987ceec4338886c2bcb26c211dd934aee7d3ab571f0e183d8efe75bd69ea6ce31f0fdd05a6452c91ec4e80dc2d724bc5a03c63f1f7dc977adea7190a13a92473562811a3f8408c110d340dcd2bc19ab5385b1b919a818847771925ffd91b08b2a8db3662d800dc15db10bf9d86e9ebe8870cdc3d53fb7f19dff78944227cffcbdfc12e49f2f93cbabefbfde48a050e1ab32f977dfa73cc5eb9947d070d67dafc19bcbc783ef356bd4e2a9fad64150fc2b3d625aa3870f83e4c19b73f179ffa292048eab862f37a966f5ecfaa75abb0a2312cd3229bcf81004d68f8bec7d4438fa6269e64fe9ae5acdabc1ead62e0988649d8b2f79a88b0cb9828964b812122344296cd05279d81ae693cbde0559a3ada1022f058d89645c8b2bb73ca648b85caf776bdac7d2991be8f659a58a649369fefbe4fb1db7141c67581d89529bccb2b4590cd1ec761fcc8b15447631cbeef243e73f4292c5ab382bf76de4b752249b9ec70ced12761ea06c74f9c429f9a3afefdfce3fce9913692f1389e27195adf9fdf5df25d005a3adb89d821fefce83d3c3bff553cdf23120a73c661c772c9d47328948aa4721984d07962decb7466d3689a865f2eb1cff0d11c347a7c50afa5228fcc7aa122820ccaae43d8b6bb5fae5d337af96201d334f13c0fdff738fdb063a88e2598bb6a196bb66c40330c7cdf47d7f5776d480314caa58a4743abfce8dd75e5f91eaee7e1f93e9a1095048e8109ee7a2e9ee775f73143ef4aa61ab412c775ba739b049f69481978b55ccfc5f37d40120b4777bdd885a0542e076d49fad424ab39ebd44fe3f97e50974260ea3acb376f006064ff416c6cdcc6d66d9b31235106f7eecbefbef25d428689a669acddb685155b36b079e70ee2e1089661501b8d53765d5a3adadefd5002381d6d4c1933814b3f751e4fcc9b85a969f812e6af5dd1eddd715d37e8dba130beef532c97d0340dc33076ebfbe79ff8499e7b6d2ecdad4d84a33104902f15c1f7a9adaae5ac234fc0f583366eea3a2f2e99cfb6e6c6605f9febd0bf777f0e38e01092d1183f3effcb00bcbe610d5b776c03cf251289f2e9c38ee52b533fc3a20dabf09c125589c04b68e83ad3e7cca423d34924147983e1ef57043b009ecb270e3d96da44b222060dd6376ce5d5a50bba136a1a8641d7be3ddff7713dafd212049aa661ea7af7e8e17a6e77df3c6ef2e10ce8d50790ac6fd8c6ab4b17220c035dd789f4482cbb9bb15d2e83efd1b7571fce39f2c4ddcae8a905afd2dcde0a42a0eb7a20d22a09c91ccf454a9f78381adc6bd70487e380eb3074e0508e3c7a128ee7210812793e3a7b06a97c1653d7713d2f180b6dfb8d463e824c21875fc873e4e4c3a88fc638efa43338f3b0e3009836eb799e9cfb32afac5c4c3e93a2e8798484a0a636cae411fb70de09a771f8f80378e6b5d9b89e4f4d3cc943af3c8fe394894622188649b154a4542e07fd13a8492439ebd44f07e77ff545d2f95cb70808595690a85506de9e5c318f202893aeb6dcddaf5c97e1838672f8f889a47239a6cd7eb14babd29dcccd293369ecfeec3b7404db5b9b7961e1ab6886197c1f8847a2e44b453ccf4388a0ceb5ca7d768d677ee57a530f3d869a7882b9ab5e67cda675609820049a10f852629b269f3de1742cc3e0d94573686c6902df63e490118c39e010460d18c2cf3ef775b63537b064cd0a4cdd209fcf71e4d8fdf9f1855f271e8b327fcd0aaa0c830282275e7d815024c679279e8ea91b3cb7680e0dadcd18a689e7fbe89a46341cc1735db2853ca6610465e3389c70d0e1f4abedc5d28d6b59b26639088daa4492338f380181e0cacf7c89faea5abe7ac34f59b97523c5b2cbf841c3f9d1b917337ad0308ae5329dd90c513bccfd339fa1582a22741de9943970ec7e8c1b3c9ced2d4dbcb8680e9a1994a710826828dcdd460ba51265a78c5619a365c56ef22aed1ed7e1842947d1afa68e251bd6b074ed8a5d61da7d9fdab80a4ca6448ce2bd3b617c0f2904c6ba75c8f51bc18e20e2518494c1be95ff8e9282621911b3116307e2afde4ce9770f615d3b093151fb90cbc7c72fe7b9e99b57bce571d9429ef64c8aa6ce3652b92c8572a96208eebe97c6f33d0ae512e97c96a6f6361cdfe3a7177c1501dcf6f4346e7bec5e3acb65b636efe4a4c98721a5a4502ab2b3ad855bffef2aeaab6af9cd3dffe096e9ff6640bf4118ba4153471b6bb76f0eb279573298778917c729d3b7b69e91fd0721a5a4339bc5b64ceefce1af00b8e0b757b078dd2afad4d4621a269b9b1a58bf6d339aae635b1647ee3b2978d17a6e652b931f081dd3667b6b13db5a7672d28187e203a57209c77583a51842609926a66e548cedc028765c1704e842276cdb64f259ce3bee34268f1c4f5ba6934d3bb793ce67713d8fb2ebe2782ee95c16433768ee6ca777752da9dcaecf7d4f06e599cbe2fb3ecd9ded842d9b6c218fe3b978be47d97548e773e48a05f2c50277ffe8b7005c72c3d5cc5dbd8caa688c54473b5f38f52cbef3a90b2a46224cfcea5924a2313ab319fa54d7b26aeb261adb9ad10d03d773e995ace1887d27d1dcd1463c12a5a9bd95dbbe770db5f12a7e79f72dfcf38907e8df6f0021d32295cf326fd5320cc3206cd96feb292b398131346ed030aa62710ac522e9423e30ea5c075dd389472224a27162a13025a74c7b3ad52d3e93b138898ae1ed7a1ea95c966c21d72d82eaaaaa317483742e4b472645ae54441782583842321a0fc48b2698b37229b962014dd3f01c87217d073072c060d2f91c23fa0de49fdfffc51beeffef4f3cc8edcf3e4aa6980bbc909525958eebd2d4d1866599fce482af62eb06dfbff57a6e7af8dff44d56e37a3e4e4594bd97e4b20240d729948a6cded9c8b03efdb9f6cbdf65d3ce1db4def1976ee3b63a9124120ab378fd2aa2a108a3fa0fa6502ed2994e774f0414cb65eebafcd75c71db1f7979d96b6cded900c0e1e327d1994d33aaffe0373cfbd7fef873662e5d40ff5e7d48e5b21cbccfbefcecc2afd19aee60476b33966176970752032148e77314dc32037af5e6b15ffd75b74dbe17fef64a566fdbc8f696269a3ada08db369aa65128958886c21c3ff16010829dad4ddcf6dd6be855b56b99e4b3afcde15b4d0d0c18300480f654279e1f946dc8b6a98a25d0351d297d0aa5129d995430a185a42a9e24120ad1b8733bd77fed074c183a1280a716cce2d2c6ed0c1a3494542ec7b24d6b9140d8b2293b0ea5729151038731a44f3fdad29d1c3c665ffebcc7b879c16f7ec4ca2d1be955554d3a972595cda06b1a9aa6519d48629b16af2c7f0dc775f15d97714347d2afae9ed6f616ce38f2247e7cde97773bdfc93ffa2aed990c9eef511d4fb0a3b589355b3662dba16e4f6eb15cc6f33d0e1db73f7e21cf1fbffe43f61f3ea67b322595cdd099cdec1ab32bc6a91002cff729944bb467d26c696a20168ef0af1ffc823ed5757ceaeaff239dcfb274e31adadb5a193e7818c3fa0ec0715d5a3bdb19d16f50771b39bef512dad329aae371744d67dd8ead15c12b4844631c3eee301ccf255399b8f23c9f782442c8b4686a6de253479fcc4fceff0a997c9ec9dffc0cfd6aebd18440d37534a0b1713b3f38e7f39c7bf4c92c5ebf9a4f6f594fffbe838886428060e6b2854c1ab90f35b1048ee7922f16713c175d0b2630caae432c1ca1a1d296ea92555cffd01ddcf5f423d4d7f50e9641bbc1e486e7b9fcfb47bf01e02b375ccdfcb52bd03c9fb38e3d854bcf3c9fc6f656d6edd81278327c1f213c3ce9932f1569ea6c231e8b72d0e8713cf08b9b68ee6ce7a4a60642e128775f1e9cf34bd7fd8cb96b9611b143c442613a735996ac5e4e3259c549071e466bba8348284c4b73237ffcc6e5ec337028b73ef530d7de7133bd7af763c290915cfdb9af912d1468cfa4f0a5a4e43881f0913e25a74c6baa93d11531f9e04fae03a0e49469ee6cc7973e0d3bb6f1bdb32fe2dca34e66d1da559cb5f9ebf4eb379090655372ca2cdbb48e42a984e73a8c1e3c8c41f57d29948add63a52604b150045dd7d9d9d4c04ddfba8291fd0671eb930f71dddd7fa7a63231609b260b562f5386a812318a7764900b909a08666e2aff3ad9348e94c81d8dc1d44e24fcee13597e1068020a65888460f840483938cf2cc01b77124268ec8afdf5dfbb2f89c4143afb58b56f3983def5c223981d1cae699ad07afc6d6fc776cdda78c88ded99946f089dcf9d30958b4f3e8369b35fe26f8fdfcf53bffa0b003bdb5a59b87645f72cdda411fb70cd972ee394830ea72a96e45fcf3dc64fff7923b17094edad3bbb67d4eaab6bf1ca653e75f871fce68bdf461382d92b96b17ec766caae8365985c70eca97cf5944f73d8f849084d70eb338ff0f35bff482491a4beaa86c7aef913d297b4a63af07c9f5ca9c0b07e034944624c9f3b83db9e7a846957ffb1622875d0d8d186a10506daa0fabe84ed10beef91cae5707d97e6544730c05b1106f6ee03c09c954bd9d0b015cb32095ba19810a28fe8614854fedb0694807a214462d7e7dd2251029b001f18208408ed768ee018474ab9a5b9a30d29257ffbce4f58bc6e357d6b7a912b152939e5ee59ee42a9c4b55ffa0efb8fdc87e9afbec4974f3b8b2b6eff13f73eff04c94492742ecba9071dc18ddffc118fbefa0247ee7b000bd7adecf61c1e3e763fc60e1cc2b19599f8cd4d0d1cffdd2f128dc5d8d8b80dcff7bbd768f7142faee761992623fb0fa6ec3afce4fcaf70e2a429acdab09e5796bfc6d2cdeb68686fa1261667cab8fd39e1c043193f74248d6d2d3cf8d2d378ae8be3389c78f011ec376a9fee73bfb4702e73562da62a1443b34c2e3af90cc27688f9ab5ee791979f67c9a6b5844336878e9ac0f1071dcefe234603f0891f7f930d8ddb095916a98e36be75c667f9cea72e046043e3f66e6f51d971d0749d78284c3a9febf2c025815e6feceadae6f64ccaed555583ad195447a2945db7ab7f58c0a0f73f9c888eb2ebb435b6b7601b06979f792142d3701c97d38f3a8ebebd7af3f51b7fc9a80143f8ce99e7d39eeae489975fa05c5992952f16e8cca6f9d5c5df06e087b7dc40c975f8c3d77e40369f65cd964dc88a67c6f73ce29128a71d7838e71f7d2a87ef7700129f856b57b266fb662a6381060c652fc18804225d769ce69d1dadc4434114c85838c22f2ffa0642175c73e75f7969e902caae4bae5860605d1f06f7eec753bfba1980955b3710b643389e47a154c4b66cfad7f6e686cbaee2d4c98701f0c80b4fd399cb90cee718357818a71c7264f7f5b734ece0f1979fc7b66c3c24a71e760c037bf761f5f6cdd4c6ab283a2574cda077552dbffbc68f987ae831bcba72095ffbd32fd085c6a69d3b1858df07bf90e38af3becce78eff04a572898d3b77747b357dcf231c0a71d1f153d967d03006d4f761f19a15bcb8600eb150844824cc278f3a914434ca51dfbd98b67407b9748a5f7ff1db9c76f091a40b7952f92c20c9e4f341685acbe2ab53cf61ff616358b97503271f78180fbef21c57dcfc5bb448946d4d0d5896cdb821c3c9150b3cfef31b4946bb928afab8be8fa91b114dd3fae915c373cf189382c003a16b1abaae675dcfdbb9b3bd8d881de6e19f5d1f4c86fce16a9e7bfe09feefaccff1d5d3ce0660eeb2c574a652dd5ebd2f9e7c2623fa0de2c051631142f0b33bfec26d8fdf87158e72e0a871dc77e5b520e1d5e54b4048d2f92c878e9b48321aa3b1b395f674aa3209e672fd25dfe3f803a6605526ac003635ed40545e51c9689cabbf7419c74e3888fef5bd83f1e8b28bb8e5ffae629f8143f17d8fa5ebd7d092eaa02a96201e8ab0a3a399c96326f0f29205dd63d2d42947f1b9134ea72e51054067268d0016ae5846c929639b16179d703a3fbbf06b44c211b6b5ec64e5d68d95f2d22d60d0eee378376daee775684250134ff2d4ef6ee5b5d5cb283b652cd3e2eca34ee29b677c965ca1c08461a358bd6d339ffde1979974c021dcffe3dff3ecc257d96fd43eacdab4a1db8b317ed0306ef8d68f39edd0a30198bd6c710fcf348305c2ec7e97ec1a730baee7ede8fae5de2baf052093cf31e3f5850ca9bc9f92d1183fbee85b1cbeff2446f71fc2e6e6062efccd15ec6c6fc5cd67b9fa735fe7ec234fa42dd5c16beb5763db3661d36272c5abbfbe713b75896069f2a4a1a3f9cb65d730a05f3f5ccf65f480214cf9e6679571aa448ce25d58e68111ad1b8199eef948d7c3b14381dbf8c34413e0b86040a92e4ac6b6d005844c134b680821f17d0fa949fe1b018d05a0bfb3a86c3a1001e2b962617da1580c667e3c6f37c925a5c4f33c1cd7e99eb5312cf30060a910c2cb150b48e0f8890773c2c4297466d3c423513ab269d2f96cf7d280b2eb90c9e768cfa4c9974a54c7e2dc79f9afa9495471d6d59791ca66c8e7b27cf7d31772c83efbd1946a6743c3766ae209d2f96cb024a642be54c4733ddad29d60080e1f3b91d97fbd9f68244a2e9ba1a5b30321049dd90c9eef932f1769cfa48884c29c76d0919c3ee5687c5fe2498ff64c9ace5c0643042226168e502b3432f92ce97c0ecff7e8cc66d084c0b15c7ad7d6e24b49b15cc2300c74a1e379de199ee7dde9b96e6573b88b273d84140748295f93709de77917b895cf7d4f56f61c05ef1b29655ac223aee71de8bac1777b2caddad66520773d53673643c8b2bb67d07ad6553a9fa3239326572cb06acb467ef6856ff2ab2f5cba5bc5b7a63ac914f2b467d2a472bbeaa8e49449e7b3b4675224a331fad7d6b3feaea7905232e68b9fa4339ba1ec066d2448301b646e370d83d1038630fdea3fb26afb665a3bda68eeec2055a9b7b2eb747ba1f2a5229db90cb942818e6cba5297818849e5b24819383953d9c0782d944a98c240f35dda3329aa80542e4bb15cc2f15c0c57275f596e972f16f0a5e4f15ffc79b7e74de773e40a790a4e3998357e8bbe2384f83cf0879e02bec210604b9760f477ef5fa380f73d3529a5bc4e08f13d5dd3c895cb642bf5ebb82e1dd93435c96a6efed695c10cb31fb4dd6cb180d325624a85ddcef78373bf404bba831d6dcdb88ed3bdccb227c572a9bbecf2e522c572b967808230b07e6f5e3790f700e7ed39e991cee7684ab5f1ed33cfe796ffbb9a3f4dbb9be716cde5b19fdf48aae2c98dc7627464d2f4afedbd5bd9bb9e4b3a97a13d9b065f9229e4034f64a948a690a32ddd492212a3e494e9c8a6c9958ab8d2c743d2914dd3b7ae171d9914c948ac7bac753d8f742e4b53471b86aef3f20dff246a8799f0e54ff3af1ffc8243f6d98f5ca944b15ca62ddd496e2f65942f05e347fffac05b952f1583a54c1ab4a63a884722ccbceeb6c0c274cae4f279d2b92c6dd9746559eeeee48a41dbcfe473acd8b281738e3a89738e3a8957572ce1e44bcf67f89011bc76f37ddd93527e657f47a5a44d5ffae7154aa55b72c5a06f79d2df6dccf6a447c971c8150b14cba5194288d3807cd0767d0482bf7fe767e4bf7e392da976da7369a417ece9caed31cea67219dad29d640b794e997c289f39e62406f4ea8b8ea03ddd899490ce6741c8caf81e8c1dede91485cab97c19089cb6748ab01d221a0e63ea06ede914b150b8dbdb9fc9e7e8c8a6e95fdf1b5ffaccba61573ee6b6748a542e189385d0f03c8f74e57a3ddf338572093fdd495da28a5c65a5810032855cf7a45e577d169c3285722958a226251239424ab92258be069ee7e1edeae757035775b5a9f6743086767d5a281503cf58a9c8ba1d5b983c7a1ceba7cd0efa9853ea1e9753d94cf7d85f76038f7d67264da86ba956e58c12e679d2eb1ddc8317bc97837b990d1cd675538eeba2695a500eb96cf7c48ae77b640b393ab319dad3295a3adbf9d5e7bf45fffa3ef4ada9434a49be1478ebd2f91cb6e750362c3ab26992d1381d991455d158f7bb3b95cb10cb66c8950a8c1938947937ddabec52256214efc828af18359a69749919085d43e8da472b58b9eb611b92a86de1fb92a2e3e0a3e15547d1530e5a2970f923fe7337ed21890b93f156afbdee35d983830ccd98e17a2edfbefe6ae6af5b41de2923350dd9e33e9db2c3aa4deb59b7713dd366bdc08b4be6f3bbaf7d7feef03e038ff43c6fee2e03241868df69842659f11cb89ecbfc1bff8de70751a1b6b736b171c756a4e01d2dcf118860b95ba988a6eb142bebbbdfbc9abcf72d26354da3b9ad8df1c346e0018fcf9be96edbb983a54be723923548cf65f2c8719886e9b70e1c46be542cafdebe99a54b16a05555e37b2e83fa0fa2582e953dcf97a97c161f595cb2710d7316cf055dc38a4419d67700bee7154ae5f2ae72f32bfb72dec123746dd4f6108474031978dddef1b2275ffadd2fdc257f79005dd738f1875f61e6e2798423510aa90e2ef8c4d9fce3bb57532c95d8d1d244c929f361c7ccf17caf7b16b5502ee3b82ebaf9d6931d21d3241e89501589ba1d76087c1f4d682422510c213010d2476020f0a54fd17729f96e571bf45ddfc313e25d6d4c165d7be77483a253a6a9b3bd3cbcff2006d4d4f1a7fbef60507ddf3778533d2f8814a81b6fdfcfcaae132c957c07f5ed782eb5896a86f671d8d8b86dd78cb0a05872cac14612c3205f2e91cee729160a255d0aea12d5e48b85ddf69f752dc34b67337cfdf4cf70c9296751280742e1439d0bab8c39f96291c57fbd9fb06d53721d5ccf457fbf93615252709d4094fb1ee21d9a1b3da3404ed96702ad4f2d0641b770d9135337beb269e78e1baebfef766e7ff2c160796ae01d07212800eb1ab7b176eb269e9e3f93738e3bedc86f9c71de0bbe2f0f7983382b16bac743f90eeed3f53c8ae51285521153d32bdffbcff5f6ae32f84fec319552120985e8cc65e8cca6d0351d43d7fd743ecbda6d1b91a685cc67d93c7818857211c0e92a87b7bb9f9e752adee138ed499fce4216ab324e095d2fac6fd8ce9a2d1b0149c8b468e96c0728f61c133a332992b1c43b7aa775ed33cd978a98ba81a11befabfc8450d962948851bc7547f125be9098b128be57a263e33aca7b9929fba8a82d1f1fa169f865878e052bb0848e656dc39a3c143f9b87ce3442d341ffcfec99e932e853e94e3cf156ce230dc7f7327396bf667deb373fa2a950c0913ea26bc36ab914042e101a84c248cb0c96eff91e2fcd7b99cf77b699fffce16fa6ef3b74c49752b9ecf4f72bcc6ccb42fa7ef75ae78f43e0484930885736ae6bae2f91d90cd2b4c071d02c13cbb2830de895cde8d23082993d4da33a1243080dc3d0827dae5222a4ac84b07628693a5a65d36cd7923c5dd7797de31a3a735906f5e9f75f7dde906501827baffc1dc5720921822527b17014533791e6c73bdce705c74fa53397e595e5af55e64ab4ae19d1ee3d3b5dc6832e049666606946b711a255bc9f3d8d095ffa41925c49b0a7e40d6da862a8ba6540e2e16b52ca2068c38710212ef0448114b2dbc3a7090dcb30838ddfbe87b04c2cc3c010ba3034fd2d4d2709189a8e666a94dcf247aabe4396553146bd8fcc3de99a866e593d4a6ff7b214889facdfb9fd7b3fbbfd4663da53d3c89b26c230909ebbeb285fe26902615b74e673dcf9cc34ad3d9b9e7cc3d72e9f0f1ca4ac8abdb4f9caf88b0c2688bc740a4221c8a429174b5d87860d5d674b53030bd6ae64ffe1a33fb84917cf23118d31659f092c58b72298101090cde590d934783ec552094dd301127b8a258512318a8fa8804108b47804295c4aeb37937174fceee8451fe59b97f8f912d23471ae7d04e76b47624e9d82300cfce68ee0deb5ffd0e6ffae99a2b7289f68287cfcc2752b6ffcd64dbf667b471b842368ba892f04e432ec3f767f8e9978300dad3b796afeaba453ed887004043886cee245f3b9eb99477a5d7af6456edf9a5ec17221d7edb944aae76cd76dc0bea661fc404af9d25e67dcba22da54f2a3bcd96c956598730043d3b493a5946d1f6e154b3cdffbe9d8c1c38a61d35a902f16993af97074d3c2f35cc60e19816ddb2db95c0eddd0f3c1b209d9ede1b20d83ea785c6e6ad8911935600891905dfec5e7bfc5573f710ebee7615a1643faf4276485a84d1add468ee7f9dd11bc82e849c671c06fb420facc4e60eabb9f910cdf01ec631ac66552cabd2641ed0af8d0a7a6f60d96aaeb7bddcb393edac21334a1c58097c296bd5bb0024d88ef7ce1a4335edd7fe8a8d4ef1ff827948a68e130fdaaeb888423844cbb5b58988659112c3d0ca13ddbb426c09598868556f188bd99d1e1eb065ec965f2b031adc3070e39a1b1a5f96210ef69d1b96d5a2f0317005bf714dd9aa62504bc10ed11a1cbd0f573a4949b007c24c9688c617d06b2ad65277a658cea8a5c85a6211d07a169b8c81dd9522156afd5be9488447b96e35154962e755d776f6d434a49d80efdc3d4f50966e5fb613b74bf2fe5efde6fbf0cdba15fd9a67542e59cf7fa525eb7b7f6acef197a5e4a744d1b003cd2b38cf4f738de5442a54f02f1b7788f3212424c7eb3e30502d7f768cba676375e749db2e3846f7bfcfec4b4271f266f18a009643e1784b64e06412f8a4e8952361378b243110aa512cfce99a95f5f533ff9775ffbc11c8138e46dfa470878450b3cb693df4f3d18ba3119b8391a8e6c94529ebbb7634cc3381ff84ec40e3d27a5bce2bd5e2b5a19c30cddf89e9472e6de85ab3d0388ea9af649296583e7fb24a271fad7d613b24c9050f65c1efbd35d189a8ee394a9afae63507ddfaba5f4ff2644b0b43353c877f765dbb46602115dd33f29a56c7867edd3fe3d7094659ad74a291fe8ea63c9688c034704fb8f4cc3e08e2baf259dcb04813de249460f1afa94e779dfe9aaabce5c2658d62a769ddb36ad8b806f86edd03352ca1fbf9ffa0b59f6f5c0119669fe464af990b24a958851bc0b1120848e9e8ce239790acb57e26cdc0ca3c6a37f0c661fa410f8511bdf32f13a3a717ffb308eae639d7670b0feb6b90da9f3817b6434212895caacdad6f8962229168ed42fdbb876ccb6352b10b5f5152345422ecf05a77e9a4b3ff53986f71f482a9be1c0d1fbf283bffe0e994e83a107d1df5c871ba7dfc7d1071c72f580bade9610625ad7a0ae0921744d7fa42e594dbfda7a662e59789a532a19edd9cc9ffbd7f759575f558384d9be94d7bed5b3f8526219e6985e5535bfa9afaaa1b9a3d59cfef2735384aee34bff917ef57dda6b1355e49ce2dfa5944f76194caee7a109a157c793771a9a1ef17d9f9c53221e896268faa302ed768100413f4d683727a3317c24a6a643250ca5a1ebf7866dfb5e8438d0f7fd1f8bca12ac8819eace2fd0b7ae17db76361ed93b59f7b7617d07141dd76568bf81e804cb996ccbc2d08dbb32915caa502c4d4ce5b2953aa9449272ca6c6f6b31e391e8e33589a4ab6962bff1c346b1cf90e1dd09310ddd401302ab129ed3d075345dc3f77da2a1f0c5f170f4f435db378f7a66feac7d4ac502762442afaa9a69bd92d5e89a76c6db0576e85555fd70bfba7a6dc6e2799f705c472f148a7f1950df77436db029f66529e5f57b7ecfed21a0de6c46504a49552cfebbba44d5c8443446f8ffb177de61565557ffffee536f6fd3876160187aefbd2ba0206041b057ec25d6d8624fecd1a88925d168ec05c586822020bd7718daf45eefdc7e4fddbf3fce9d615051f326effb8b667f9e67e081b973e69cbdf7d97b7df75a7b2dd9065994609764789d6ea47bfd70daed703b9cf0389c30751daa61b4c585bf06a098e3b8df3b643b3c4e17bcb2139c24c221dbe0946d08787c70399c90452bb5b6c7e942bad70f87cdaec61289f92730960664d81d0fb78443dee5db370e2fafab46433008bb4d46af2eddd0bf6bf717f333b24b42917041229900a80942ad71d116c2d7266228fdf15d504a29108de28c29b370d68469564d991f381bd12680629a8ade9dbac0e374cb950db5427543dd029fc369f7b93c300d2b25b5dfed81c0f3d700a8252010397ea6dbe1bcd2eff6424dd582924411db8bf64e18d2bbff2aa7cd7e1901be4dbd4783024ecf83358d8dbecf36ac1a5e555f8b48328e0c5f000221ef0e2cec53973a3cfe1ecff1efd9251b144d3d2e1d31493d17c70b70db1cf0b9dcf32b9beac6befdcd17c3ab1aeb21f12286f4e88d2e59794b6c89e83994d2fa138d3b87247f9097912d6d39bc77666975a558ddd8008e7048f7fbbbf4e9da7d5cc0e581aa6af039dd56362bce4af59d0a857c86e7385d16a5dbbd2e0f6ca2001d142ebb0302cf233f2b079b8b764f395451ea51350d2ebb23bf777ec184348fef48495dd5ed27ea2f5110276405d26f6d0cb7662eddba6e787175055a63116404d291e1f62dce0e64b41058f59d3c0e17dc7607649b0db220360158f8ddb9cb2ec96777cecc3eff605579978fd6ad185c55530d85eac80964c26eb37d9d9b96112fafafbec9a4b4ecfb63c2da88ea18aae571b86e7d7bc592f9af2ffd14714d03ec0e201143e79cceb8faccf3d02faf10b22841a306d6eddd8eb7977d8aea9a0ac0e5413816c547df2cc11993678c1edf67f012c29185006a3bccb3939c4ef7cd396919284b5679966e593b5cd53448a2b42c2b909e48f7faa119fac326a5dbdbd6192b6dbb9946295e4df3f8400885248a70db2db1969b9e89bd2547ba2e5ebb7c10408667a5a5cb01b7178aa69e9e7aaadf76cecc1e5b5c5b35e8704559d7d678b4675e6676df0c5f000034029cdd61f6ba5d16c5717eb7079410781d2ec88278b4b6b5e9b634afffe39cf44c6ed9d675a7d92499f779bd7fe993dfed28808f29a56f083cef0eb8bd6ffa5d1eeed375df4c126d32448eff30373dabd124f4294dd7d7396c76d804097c6a6e1dd57b20789e83a2eb704a36d86df20642486ddb1a238b923bcb9ff6a6d7e5e6976c583d51d15418847cd83bbfa0b1baa9fe29939a3fb81114f0785fcbcbcaf16f3db8ffa47832e18a27e28f75c9ce393fe0f501c07e00f704dc5e4bf4730483bbf7826618d0341db220c2ed70948090c33495754d33747056fffd31c31728cccfcec5e1caf221472bcaf255c3e8d12923ab7f862f009fcba3106041478f9fc80be0387e9e43b65d90e60bc0268990792b0b2547083a67e56057c9c1931b832d4e43d11eef9e9b7fa1d3e95e1549c49e65062a13318c9ff0c01000bccf01534b20b9f700d423c5002f40b2d9fe4f0ec7ffcbce90d4624dc00179e9c0e6fd501efb043029a439a3ad908dda468088ff568f8c95a25847757d0db81f399be2b4d9b5866093f533bc254ca8490143c7ccd1935090dde9455dd396166477725e3c7deed49ae6c685fb4b8ec0ee7080334ce8c4aa5be175b8860318c311ee9354d8895712c597d6eedb3177d1ea6528a92c434d6b732abdaaadafcfe1eafbf5e6b5983274cca44e9959b425147af2449e99745f607843b8f5c957bffa68f29ec34508c7ad438a2628d23cde093e970753868ec1ec71937ba4fb0252281afe44e404e4a465c0a4a6f1e1dae5e7aeddb9158aa1438947317bc2344c1b3eb60e94bc9693960e4a4d6f4255e7beb1e2736c3bb4df5a10380e674f988eb1fd861c2eaa2879ef604571e784aaccdd58b41b022f20cde3c34d675e80fd1525787bd9a7080583386dfcd4962923c7714565c558b4ea2b4876074c6ae2acb1533161e0f0c9efac5c824d45fbb0a7ec3088cdd11ea654d1d8809bfef218e773ba66dd3eff52e465e6e01fcb1663ddde9da00470ca764cec3f04174c9b83b89a6c370e4c93a25346d6c2cd457bef5fb96363dedee28308c7e3d0741d922421d79f36b75b7e5774cdce7b27c317681579e17143d7cb3b34afdfe774ff419664fbfdafbf7046497519aa9a1ba1681a5c92dcdf6777f41f3364142e3f6dde84bc400674c378fa9f1d87d969198fbeb9e2f39bd7efdcc257d4d722988821a6a990050125d5e5d8bc7f27ce9f3e07550df5f870ed0ac455056624049bcd86e17d066c2584c4c3b1e8dcd5bb3763d9d6b590ed4e0014ddf2f2114ac4b078f912ec3e5284162d0991e35051598ead07f7e0bc197371ca88717fe339ee8ab683f79452789deed1add1f0931fadfd64fc971b56a2b2b11ecdd13062490592c023cde144bfeebd079c3b6df680a69666d4b53401a2089352c4952462f118745183494dd84409da8f7855da0c1d241298386018ce9f76da9b8aaa2e324ee0a922b0cea3d86419e1446c8fa99071c178947cb0e6ebb93e871382c301251e4745a409d7cf394f4af7fa1e4ea8cac6a696d6dcafb7ac9ffbfa476f81ba3d80aea1b9a509775f7c1d86f619b05c07ad4bea3a32bc81b14dd1d0132f7cfadeb8753b36a1a6a511adf138145d8543b623c79f362adbe3c3f4b19371deb4d9037c0e97a019c65b3d72f351d5dcf0dd17130e971b65f5d578f1b3f7ba7fb67679f7235515082513e0791e791e1f3aa7654cbe6cde857fef97dfed4693d2e28e6dc2f33cec82f4ca92cd6bce5eb46a290e56145b09201271504a91e5f6660cecda7deece1163d12bbf007fffe65304631128d11886f4ee8f5e5dba4114a4cf42b1b0b6a7ecc8dcd7bffa10bcd305915218846078ac3fdefcfa13acddb10535adcdd00c03e92e4f66f7bc2e73c70d19692c9834430370f777fbcae7744d6b0e871e7b67e592a14bd67c8dba60104dd130e2ba0ab76443e740fa841dc3c762fa88f1f876d7167cb676394451469adb83ccac2c74cacc4a02b81d40c2a414d9feb473f757943cf4e1eaafba6fdeb303e54df5688dc7619a06dc3607f2d2d2a72d5eb31ca3fa0f714e1838fc0880f700ac691b10aaae61ddbe1df0bbbdd638a314e9bec094155bd616d65614036e2fa0aae8d1a5107fbce11e9c3478246441bc87e7f9605c5530a6efc0ebba64e5f47bfcad9751515906385da86e69c4b38bdf42df2e85339d36bb8727a456370d6478fd335a22a1475f59b268c8cacd6badc3f9f12834d344c0e59e9eeef16178ef01386ddcd4cc4c9fffb70955591749c451525d01876c77a88636f7f1f75e81464d2891302e3ced6c0ce9d6135f6c5c8dafd6af447d240c41105090953377cfb043b87af6827f48bc102ba9af39f7e54fdff36ddeb505c1441c94e33c595effdcaf72f3f19b732e459fbcaeaf10e04ec3349a4030f54079c929af7df931caabcbe1f60530b85b4f7354ffc1cea7de7de58c9d07f6a0bcb9c16a2787a3dfbc19a7f7bb62d6bcc12e8773744d7363ce1fdefeebdcdd45fb50d9da0c8e5004ecaeb1437af7c7b9d367e7f5e9dafd2e4555975b894642482493f8fdeb7f01912528c92446f71d840ba7cf79b24b566e184065c0e3bb27928ce7dcf1ca33738f941c455d6b0b34c3409acb3d362b3d1d13878cce5b3071fa16005b00bc0e906c9b28df17f0f8f0c2e2772fd97fe4202a1a6b1151143844b95bb6dfdf6d72d15e5c7cea19a764787c304ce39e0315259065197f5ef406ca1b6a6198260ab23ae1826973a68dec3bf03786613c6b50ebdc5f5620edd1ed870fdcf4eeeaafb8a2e243686a6d4544494216046f9adb3b377b7d06a60f1f8f3103078762f1c4951cc7a1beb5058661c0eff20c5cb377fbdc7f7cf63e78a7133e9707b79e7d310cc3c0eb5f7e841d87f7a3351e874bb215760aa4170e1f3864dc79d3e6f402d04208f91db356998861fc9080211c38b703a61a4772ff41a847cb00410471bbc1130203bf8cd87b6250108e029c0074cb8159da08e5894f004a20ce1909929506dad00288c2bf4dc850003ccf21ddedb3c4c9893d31565ad40ed98c0821a082802f367e0b0e9c6bea9051e92de1d0a63d470fbd7bcd69f39be34af20e9b6c030c038615b28bec40fa57a6697e2e701c249b2db729187ce4bd955f9ef3da171f60d3910340346c796e381ea98a7558b1d58e753bb7f8664f9af687b9e3a725013cffdd5dcc0c7f606c5145e9a39fad5c32f1cb1d9b61c6c280644b05ec9b5641144dc5badd5bb1f3f0debe179c7ae613237af48341cd4f3c4e978752dcb47acf56e59d251fcad054201a86dbe3478f4e5d63b22822c3e7836198463c99c0579bd7e09b4d6b80640ca0045dd2b3d1a74bb7f881b2a3f866e74635128b61d5eaafacaae41e2f9a4241ec2b3d8a8307f7c2e5f1a27b97ae5c5ea7ced87060173efae80dc0eb072845d7f46cf4ebd2036f2fff1c3bd6ad003232416ca95a46008291103e5dfa09a02998336a12327d6958b5730b3e59f2a1f58c1e3f404dcc9f722ae289047cd64ef94d396919cec56bbebee9cbb52bd2b7161701b1a865f9a4c6d04e4200bb03e37af63fd76b7760f6a4e9d9194ef73dd4348b788e1ba81afa6d1bf6efbaf01f9fbe872fb66db0faa82d0c501401d3c4da7d3bd0d2da12b8f3e26b1ec9f60474803ef7dd3efa212f0f47087c2ecfddef7df5d19defac5a8adafa1aabcf04d1cae2679a2851556c3eb01345d5e5d0351dbb4b0e5967421aeb307ee404003401102da12ad85f7e14dbb76f005229491f7fffefa86bacc79e837bad8aec0e0740815225892dfbb6a3a8f4085c36fbc2f1fd8746399e7b1a94563a6df689d5cd8d8fbcf2d907e35e58f43a1aeaab019bc31a939c6520d62909ec2f2ec2aeb2c3f0d9dd688945dbb31e6aa930499ed3adac6486f1f3ceabf01c084700c0298a423a74fd841f15c1032008b8bd997093838da1e03bb9d9d9e72dfbf223c09706e81af6951cc4b0ee7d4f9d3c78e49f2451ecbb65dbee398fbff9220e1ddc03385d406b1093269f82813d7ac12ec9cf244ce350c0e39bb4f5e0dec75efef4ddd15facfb068950109064a07d6ea0a8a82e07e2316cd8bb0dc5d5e5ddae3cfdbcc77be5e653a76c7bbba2b18e50ae433f731c0c4ab164eb3abcb3f24b34969700363b20080021a8af2ec7f64808314d9979f72537185db272ef412a6b9b2c488ea4aa3ef2c1b74b2f7ffec3d7b1b3688ff51ecb724ad89b6869a841d19103585db40b3df20bb06ef73640538170083a01a2c9380cd3501249452bafabc6a64dab80403a408198aee2a3355fe3ebed1b80680470d801c2a1a9b901070fedc3da3ddb785d55efbaf6ccf3a3d144fc69004900b009d28ce2baeac75ffce8ad416f2cf9108d6de32375c03a681aa8283d829de547b17cd716d4b434a2b2ec08a0e970fb033873fa6c00b80ec0fd143491e1f62ed87c68dfe34fbdf76ae7c5abbf82110e5bcf67ea00c7a30114c5a92c9b878e1c38d92549279f3df9d4e16ebbe38eb670dbb602c32bb76d84aa6b208483c7e58a1c2e4b258a330d64fb02b8e1ec8b83b3474d7c01005a23e14708e1108c85919f99537ce9a9673e5adbdc38f4f77f7d0608b5c210047cb4f4135c7dda7c386c76daab531764f902333715ed7decef9fbd3fe0e36f97a1a5a1c69a6739aead7225a0ab58ba751db617ed1973fe29a73f35badfe0bb28b04a12255437d59b9aa1e3e3555f5aefb0aa2162eac8f206b07ae716b4d65600a9cd977d45bbb179df2e785dee8b46f61d841717bf85973f7e1b7a246c7995380e7b55052b7801b58d7578f696fb2fcff6a7dd9e3a7318ad6aacc7171b56a1e6f05e209081ed470ab8433515572f5ab90489608b35ae0901c2211cae2a0740ba8c1d38f49a573e7b1f2f2f7e077a3c668d35d3045405ab77ac47695dd5b03b2ebce6c9e13dfa3e501eadf9a42ed884702c8ac55f7f024812108f21968c63eed8a955c8c21800b7ee3e7a70de5b9fbc8b75fbb603c9a4b5ea7242fbfa76e8e8a161d91edfb0055367a603783d9a88a32ed87ccd6b4b16e1d3f52b1169aab7c634e152f3ad81b53b37a3a1b5597ef092eb6f06704f5d4b13dc0e073e5ebb1cd5c587004a91dfab3fa60c19d5930097027896b7928edcfdfe8a2577befed54758b67393b516b4bddfa609a4ce4a6ddab31d33c74dbd62dea45362b220dd2df05ca2291a46732292d85d7604cbbe5c04f8d3019755a3abb6b9112b37af0114c56a336a625b3c8e8dfbb6a58b84bbe696059725134af2771dc348194cc4300143294038f06e074c534562df01a8c5e5002f80b8ec0035ffcfcbc0fccbee18c09a089c12b81e39308b6b907cfa138000d2ec919607a4258c5425c57fb99c8c494dc8a28c82aedd61fe88c3ca657748c148089eac1c84a311700e2708c701928477567c8ea660f3859aae5d6898e6de7034f2fb71fd8794d864391e49c4ffe6b63b00eb70216f52f3f7ba6e1c9144b14f52556efb62d3b7173ff0b73fa2b626b578c936383d5eb81c4e449309c4a26140d3b07bdf0e1ca9ad141db2fdb933274d0f1242deea1086347ae7e1fd4fbdf8c16b63766edf08a467a5761ead8aeb6dc6145c6e04834d7873f13ba86e6ae8f1d0e5373d3fa2cf803880d586693ce894edb0bbdc48a80a40005996da43b9288e35b543b24374b9a1093c6098b04912788e832c4970d91c9687cae9061c0e108ec3a2159f03ba0180c2e172c26eb343162538249bf539a70ba0261cb20d9228a04b460e8a733a23290a50db77e3090451809c9e01072fc2e3708210c065775acf6ae870385d70c9965787520acdd041409e59b373339efff075b4d4d500761be072c3e7f242966d08c5a348464280a963fd96b528afab82621a675c74d269bc5db6ddade85affc355e517feee8527b07ec32a202d1d427a06f2039990381ea52d0d501231c49b1af0970f5e83ec72cb8f5c72fdd30925f95cc7f75416c554d141dac1bee54038eeba4f37acfcc3b31fbe6e150a757b2c43484d003a2c2383b752596fdfbb0390651051001578c0e6804d923ad42ee2e17638015902972ac0f6f58655402402d8244096005d0344099c3f005353b173df0e3cf0da9ff1fadd8fded42533f76d10e4b7c6224fbffed547c39e79fb2584424190b44c50c3b004bc8163220b04870f1701a208d1e66837f4db2b85733c404d706dd9dde88f7b44a9cd81b5fb7620e0f69e29cbf299fa8f8898b892449fce05c8cfca79411084eb7a772e78e6f1ab6e3baf31d8821d7bb7036e0fc20df5f8c7d2c528c8e93c21339036e8cb4dab671fdabf0bc8cc041249f41f38022fddf6107ae7775b0ca05926fcf82375654f3ff9cedf862efbea63c0e707fc012091b08c1b41b4da8f1380403a1a5b1af1f4db7f452811cbfdfde537bf90e1f6c529a55fb5f5310500c1caa276b4ec28904c58879f45d132ca6c7670be00a8db83e54b3f41ef829eb30777ef23f85cae3b059eaf89abc9db976fdff89b075e7d1615556580cb6dbdc7c9846500739cd5e61c457d7d0deaeb6bc0d91d80e084a969f0b8dc56080c219078013651066c0e10bb131414bb4a0e416b6cb03685ec764b98730071ba00bb03a160131e7bf3454c1936ea0fdd73f31fe3391e0039a5351af9d38b1fbfddebe9375f02a506909105a89a35df70a949d466433c12c6e69d9b005906e70dc08c45e1b43b604fd53dd14d23290bd29c92daaa17fef08f17029f7ff3394078c0e385dde640b78c4ce894a2251a4163732320f0d8be7b0bee6d6c004731e28219a73f23f0fc6d005648a28809fd87e2c9775e45281681c0f390251975a12020ca00a5e85bd813174d9b531f8c457fe77338db33611142108e47bff639ddc682c9a73ed1d81a1c5a5957039bdd81442c0a8e02a6612664413cb9a4b6eab93fbef76ae1474b1659fde84fb39e5b4f6d6a083ce0f421a92a58fcf9fba80b368d7af8aadb9e993a78e40de96edfda86d6662212014e971b313509e291b0edf0016891909518c6e1b0d63651047138d1d0d28007df780183baf7c6379bd7408f84acf912004401c4ed024d2af86cc517c8cbcbc79de75c7e796e5ae68b00145994e075b951e3f68077b850565f8bd2236f5b89336c727b3f11bb03d5b55578e4ed97d16f430f7cbde95b2016b184926900a204e2f6804642f864c947087803837a5d7dfba54ed9fe89c0f39c2808d6f74509e0acd0358e23bf0330614fc9e179bf7fe305ac5bb31cc8ca86dd9f86bc400612566830904c62ffd675785814d02daf4ba7113dfb5d541f6cce79e1b377f1d6a23700b71bc417408e2f00a72ca326d88c58b815e1861abcb0e84d8ce83d2071eac809e7cba2f48e2c48d4e374a3daed0174035ea7bb2ddcb69e522a5342ae5cbf6fe71fee7ae1319455975bede8745bef742ae53a24191004145796e2f9375f826a18375d77c679ca80aedd9fa002df1254e29c2ccb80cb05783d10088ff7562e81116cb1449c2c5befa5ec00e7f2a0a1ae1a4fbcf9227ae4776b08c522b874c6e9cc7065228691b28c0070e09d764bc0ecd90fe56819c0f3e05c8e54961f2badec2f219cec788b8603920ae07283f4ee045a5207e5e94fad3966c608989480b686ac05ef5f3def63c5fe233b2d1d06cc1fd924e62b07f7ecb363e1390b87bef8c6cb48241396b74bb07684bf5eb30ccbb76fc0883e83064c1d3cf2fde5db37a25b6ee7e6703cfad2909e7d01931e04a5201c693366676f3cb0ebb227df7e11b5d515405a3adca28c21bd07605cdf81c8f4a7a1391cc29603bbb1fdf03e3447c288c763b8fb6f4fa367e7ae6fe6a567c5798eff4c1484012d91d697ffb2f8ed813bb76f043a75060c0312cfa37be702b85c1e8000b14818c57555481202f02a56ae5d014110f2fe7ee7a3ef760a649c25f0fc0a511427731c27b4a5b5e6380ea2c883e7b9e38a49b65583b776c62c639580034f3888bc6865064b254b305395b105971b6e41408f9c2e48f305a01b9a352adb52539bd60ebecbeec44533e66248effef87afb46acdbbdc5320c0841b6271df327cd40762003fdbbf5b26a7f189a751f24758f1c0147386a9365a29be6d42f37af09def9d73ffae3a156c0eb4786d787d1fd066374af0170da1c286fa8c1c6a23dd85376047187135515c578eaefcfa34b7ad69c99a3276d6d6c69fc72d9e63558bf663948e72ea0ba8aa13dfbe2da99f391eef6e2e34dabb17ccb5a44dd5ee88904966d588d9bce383f148a86dbc78e6e18e89c9105afd3dd9e6080e338bfa6eb67179515fff9f77f7d069024702e3bcc780c4ebb03ddf2fb212b331b3cc7a1a5b519957535a86baa07b85441d8136802cb804ea5fa4e9d29e9d2a337ba74ea0c9b64474b6b334a6a2a118c47c00912a83f1dabd7ad4051f915c8f2a7d7d844e9a5af36af19f6d2476f22146c02c9cc01555588bc805e3dfb21dd9f069b2821128da0a4b612b52d4d0021d0da3d2dffb35d050202c8367cbe650d966ddf60a5a2fd914b45c3adb8fcb4f9983e625c283f331ba3fb6698030a7a6e7978e16f465ef8f06d68894701af179f6d5885e1bd07fc0e1c8f2fb7ae079c4e40d590eb4fc77d57dd8cdef9dd56023813a08335557be52f1fbdd96bd9374b2c6f85cd0ee83abae71720272d0b4ea7d34a8b5d5f83d2861ae86e0f108de2bd2f16a1537a96e7fe0baf7d031d3221b5378761809764e4e7e4a35ba72e90240975cd0d38505e0ccd30400411d49f8665dbd663d6d8a9a74e1f316ebfa2299f1daa2cfbed1f5eff332aca8bc105d261ea3aa0e928c8ed82ce59b990ed762495046aea6a51d2500b4a0d508e6b2f86d851305358459041b8b6a4fbd01405be9c3c74cbeb8a745f008a9240714d39aa9a9ac00902a8d3055dd7b068e552f381cb6e9803822f003cb968cdd7bddefd721128354102e9a0aa0a8fc3891e3dfa20e00d40310d84c3411caa2a47221907e105cb83740c05c0b78aa6c5048e7bf5c9775f0d7cbdee1b4010217b7ce89edb19a78d9d82a9834642d1141cadadc2171b5663c3fe5d48668aa8a92ec333efff1d5d3be50f9a3c68c4a39aa1afe088558dfe40752982d108449e07c7f10825a2d69a28cac8cfcd87d7e112daea9f088200d3a4eda25b37f46fba6675bafed1cb6f7a28148b41147950c384c7e586c7e9aa5434f5d3a7deff7be1c72b9758c6af4d02314c74ebd4059969990021088583385c5d095d1481f44c6cdcf42d9e4bcb1c34bc479fd724413c978094d38ea39e1068f118ec1e2f0a733ac3e3f620128ba2acb61ad1641cc4ed45795539ca8f1e045c6e14f41b8cec403a344d43457d351a5a9ac1d96c300301bcf0d11bb870daec27f3d2b33e0610edf876993041a9019bd787eef9dde076baa024e228aa2a43425541d232505d5785ea922380c78b82defd91e94f07354c94d654a0251605757b616a1ad6efd98a0d0776bb4e1a3a6a3021247c7c98a8951db235124e8f45a3f48b8dabb06acdd740560e24bb1d63fa0cc475a72d406b328ef7572dc5cec3fb91b4c9a86f6dc1ea5d5bc78ee8d16f6c715539fefed5c780c7030822ba66e6e0bad90bd0ad533ebedcba164b377d8b98db0751e0f1f596f58119c3c7bd4538bc0b0e7afbad1c6f17980635b8eaa6fae7ee7ae92994d55703be00a02a70daed28c8e90eb7db0b455550db548fdaa67a108f173499c0cb6fbf88de5d0aeee891db19009e2640a243003c0c5050554156e7aee89c9307599251d3588beaa646e8d404fc6950a8893f7df80fe886ce440c13318cb615898280b7c900d191d8b5176a692520c9e0ecd6ae133169fb590213bfb054ae96750baa6a20a204f4ca8359d100e5f78bc0275470a78f07d5352096b076fefec59cf80635113514c8e4c4e1648669aec9f2a59d71cf3957ac0c065b0a976f5e8b86702b544db3c26cdc5e50d3c4967d3bb065df76d81c6e8cef3738edb253cf2cf27bbc70daec7308c5329fd3adca0e29ab291cf22f5ebb0207766f03b27261e378cc1e33052fdc7a1fbc7657fbef6d8d45f1e87bafe0c50fdf40c43441781ef7bdfa1c46f61ef09143b6fb799e7bf1952f160ddc76689fb523aa69f0d8ec983d711a6e9c7b1ed2dcde22ca813647c23d5ff8e41de1936f97219c1a0e9bf66ec7dfbf5c14b8ebbc2b9755d4d7ca86690641a9ef7b5af92744605bb150ab96e3f13fc0510aa7c385c9c3c76248616f4c1d320a9423fcc18a52aaa4d2e45a83d444221e832c8a25a74f383979fa849373a3f1986fdda6d5a02e37402972d232f1fb4b6fa476bbfd1000b3a6a5b1ab699a8e8e1a9d828280e8022f708aa6aeb8f7d5e710d7544096e116255c75fa7978f0a26b8eab5b50176cc64dcfff019f6d598b447a164a0feec5171b56e2e461637ca666f4df7a602f909e6e2d8caa8afef985983e723c7202e9183f6838de2cec5579b8ba5c4f77790bdc76a75ed7dcb05bebe045d0741d191e2f1c92adfd90bf240a23ea5b9a5efeeb171f5862d86687a929f04a12ce3a6916ae9b736e73dfaeddeb799e475da8c5b178dd8aae8ffcfdcf6888877f9e5020045035f8fd013c74f96f70d68469754e9ba3a5acaecaffc407afe5bcf8feab808b07211ca8cd86c6e66694d456f1b9e9992d4b37ad45554529e04f07d575b86c364c1f3901f75d7035ba65753a2cc9b2ae1a5ae1dbdf7c213ff7c13f70b0ec288820e25fcdb566d5e8d1a1aada4f3f63228ab8a6c2a026228904a289f80e97dd71cab46163375d33efa29e4fbff9121202078d9a78f0ad17414d4031744094e0946d983fe374edb4b153761bd43c89520a81e317ad3fb0ab70c3f64d9671697740d0550ce8d117bf5ff81b8ce9d9ff802c5a5eb0b5bbb715fee18d17e4cd7bb743f178110b85f0fed24f71e1c973ea788efbce9e11054d26d1b37b6fdc7dfe55ade74e995943a9893de54784075e7dbee7d2adeba06b1ae070a2b4be16354d0da09406ab9a1ae25b8bf660efee6d9637885208d4c4801e7d71ff45d7e0e4c1a3ea25496a564c3db07af7d6ec27de7905eb776db156ec136cec104a539ed9b610531397ce3c0b57ce5e50da3da77382129af7ca971f7b1e7afdcfa86ba8b1441ccfa321d8cc1986b1b8bcaec6ef757b2a3ff86649ff9ada4a20331b544922cb1bc02533cfc435b3cf459ac753444d93d6069b7a3efaee2bc2876b962196488070c799128d94d21902c7f5da72787f6cd9c695e98a960424197df2bae2918537e3d451138ebbf72b679d8573fe7027bedeb0126a201d7b8e16e1d52f3fc2806e3d9bea83cd681331add108c2d128049e0721d6d9297004764942bacb93f224db6058893ea0e81ab4b00e55d3200b22e24a6263536b705a4b240c511460e83a7a599ef4c26ff76cc3cacdeb40751dc4ed84649818d97f286e3bfb1273649f81070dd34459636ddf27df7c19cbb66f4052b084f9b63ddbb168ed8ac24ba6cf7d9323dcc0f634e120a0ba068910cc1d3f0d379d717e737e4676fdd1ba4ac72b4b17777dfbcb8f404d1ed466258b18dcbd37eeb9e06a4c1e3ca2be351a51de5ab124ff89d79e4342532d219cd4515657838105bd0c872c731d17546ae8b08b324e1b3b15779d733932fd6945aaa6f5b8fd6f4f0b5fac5d0e5555416c76104144bf829e78f0d2eb30b86bcf031a4cbcb3e2f3ee2f7ef69ed4d01a044411d1440275cd8d53398e7b81e7f853bf5b03469425343635a282b7a3aeceda7881248107d02bb72b668f3f0922cf6378cfbe58b66d03ea82cd708a3246f5ea1f5235ad71c7c1fddd43c116108703341e437e4616668d9984def9dd30b6df100cead6b3fe605969c8eb74f7ec9e9b87482cb62bb579c37d77ff8010b400a852346df0d75bd763e79eed80c7036218f00a22169c723a2e3de58ce64e818cfa583ce15db56f5ba7a7deff3b8aab2bc0d91c3035152f2f7e0713fa0dbda3735ee7dd50e24ddf5d1c7dbe34dc7eee153875c4f8129fc79bdc707057a7c7df79d5bb6df736c0e184ca7138545dfe4fd5c3623011f3abf6c050c2819365806a88efda6f1de27738c0d9ed56280a4d9992a99786c72f3837baa681f002486e068cea3ac41e7b074e8e073767340c0e20d1548cedffd023c38120494d1c305ad1d774ffa8e914579215d4a4a35ebee5c1c36bf66c0bfce5d377b0edc05e348782d00c1d1ac70182000282a4a660c5967558b16115860e188ac7afbeedb37e5dba9fc171dce700ee3e507ef4c68dfb7658611c3c87acb40c9c3efe2424924918bad1eec1b04b369c35fe241c2c3f8acf967d0aeaf5a3bcae1a1b0fec862cc9d4e37405f7161f86914c00b20c1e1c4e193b457beb8e47430022db0eeeeb1bd7148ceb37f8ebbfdff6f0e45c7f86f8c986551044119c69221c69454b2cdaf4c09b2f82e739c2ffccc29b1de3ff4c50e830bf6fc41202331ec339a79f8f072ebf31941bc8d0006057c9a16852d7786b7396b47bdf740e882613339c76c7518e9017555dbbdaea57eb1c86414d247555d3e2661f876c03a574358049c77bcc382455051b0fec86c0f34675631d0f9e07c2ad98326e2a668f9a84583209455353c38640e0055c3eeb6c6c3d528492ba2ac0e5c2f643fbb0e3c8815b0717f641b7bc7c4051ac301cbb03efadfa0a9dd3b371e6c49351989b8fd17d073d3cbeffd086c1dd7b7f90509595fbcb8e9e2a772814290a229a43ad688d44da77c7edb2a41eaeaac0ea7ddbad1031c3000db5e2ca2b6ec17d175f173535fdbed2daaa17ec76070481ef7ec3dcf3b6647a02fe858fdf899861fcf499306ad52e9a3f713a668d9e14e638eeaae2ea8acfbae5e65d72f6e419affd6dc922e8ba0622c9002740330dec2d3e8cc31565a86aacb5bc5f00444270ca8809c6cbb73e100cb8bca8aaaf1da044436a7e7ae6fb57cf9a3fd56d73386ffdcb63f6fafa1ae0df10ef6de5fc4ba540a5df196ab4c3df9482278043b6a1b8a602aaae61d6a809410e1870f3e9e757afd9b925b0e1c02ecea44052d5da52854100c5d8fe43f0e025d7574562d1117e870bb144025e97bbf9b3352b0a0f37d4005e2f682c8ac26e3df0fc6f7e678ced33e8c891cab27e3649464c53306dd8980fbd0ed79c673f7e4b3a54590a9e179093968edda587497e664e7bbd186bf7c300781e33474fc24943477f5056577d954d966018a67ccf055727bfddb519e1b682961c0f839ae008710b1c97b679ff2e2bac4810602a490cead90f2fdc7c5febe8de03f4d648f8c69afa9a0fd2fd81b9a78d9cf84ad7ac4ec299f7dee83b527e145caaa2fbf78644ca7b4aa9096a1870b83cb8eecc0b200bc2ccf2faea83859df21f3963c2c9bfd9b86f9be3cd0fff61d5bb229c25160d13ab776ea64955238dad568a79282aeca284734e9aa53d76c52d2100d18aba9abe712589def9ddbe7ee9960726abd414dffbe203eb0c50aafb4c4a493411874d92f67fb5f15bbe251ab142b37801fd0a7ba25ba7cea8696e84a669a9a98140e4799c37f55414151f4471793140381cae2cc3a2554b118a46adc292a601cd34ac34caa9023eb42d0324c7434885b1711c87b61e9204110dcd8d88c76330d2d2118c84d1180ea2b6a5d14abfac2818d4a32f28b06ef1dae5d9652d4dd6b347c3183d7c1cfe76dbefb51e79f9db761c393096231cc6f519b477f0bd4ff59dfff0eddcd2f52b60daeca8093661c9a635386df4e4168ee338c3680bf125a091307af51d84ebe69e8381dd7abdb4f3c8fedf791d9e6157ce386bdb37db37a1babec6f2be8a22ce9e3a0b73c64e898663d1ebdd7647eb7927cf5cbe76ef36ac5cbb1cc49f0eca0b08465a2d0fac2c77744400aa86ce597978ecca9b69b7ac4e2d7b4b0ef71dd0ade7d29be65d30b5b8a258dcb57f3760b723e0f5e1a21973f433c69db47fcb813d830d985838ebec231bf66cefbe7cfb46c03461520a45d7a0aa4ad0cac473bc723074034e8f87fab333e10df8acec90d48462009f6d5a85d103066158f7bec8cfc8c6ed675fd2bebc02f8532816f96b566646b5c7e546445501d9860d0776e3f5af3fc55913a7a357a72e3879c8e85786f7e8f7f9e8be83d6514af75537350c699bfe8f5b7ba809dd345e03f05c301a29ff64d32a90d479321a6dc59557dc8c072fba361a4b267eb7abf8d04bddb23a4dba7ad6d99ff6eedccd3bfbee6b11531280d3858387f6605f4509b27372921ce18e352c3521121ed3868dc1d573cf69a9acad9954525b5975c6b869af1457575dbe63ef76989a0693e390d435504a99fdca44cc7fbb7e498590d96550de447ce77e28474a409c4ecb1849099863ce0c6b7e31f04b7e7948bb21c075ca066d6842ec9137e0a4003f77340cae152414b79e95fb1f0a1942a0ab1abed8b2fac4bb988420a92ae0419acf9a7c4ad7a94346358ded37445ab7773b361dda83cdfb776353d11e3437350082004eb601bc00c08e5d077663d69d57e3e3879e5b3c6bd4c4f100aaca6bab511fb40e0d7384209a4ce283b5cbf0c5c6d5300d036d298a2551443411c3c1f252c0e5b536a10d1d7b8b0f411045d86d36348683566cbca2a047f7de3873c2b4cd4de1d08480cbdd7eef094599eeb23bbeb8e3dc85b316ce3cabbd0e8528884873bae8df6f7d0837bef8d8f7ead6fca44b10141c080470e0be375e4dc030306bcc64b81daed374d35c27705caab603cef96e37db2419af7ef991eba421a330a2573f89231dab8950a89a0a0380aaa9ee43556511b7c3c17f5774f11c8f58328ecf36ae822c4aa9b27c04f07871a0aa0c7ffaf075386d76ab101a6fd550e2781e8402b1441c84e3406d761caea9c2eee2c318d377304e1e3a1a8f89124c2509ce66475cd7f0e06bcfe3f94fdec6b88143316de898bf8eee35107b8a0f7e1e8ac7e64c1830ec7be9948b2a4a501b6c8298aaf82cab129aa321c4dbee4355c079033879d858b864db0db5d1c6d7ad6c7d806e1a470930f0e4a1a32a3b6577c291ea4a1c8b1aa327e819cb139bee4f07cff167a99ab6c2e7f680709cdde3706150612f6cdfb7031025802788251348e8d6bd249444ca93a3a0534e1e668f9f7a28148df4f33b3d1d0dd1050030aacfa047a60d1b73d75b1fbf650972f0ffc2ab4e40a8252a459e03a1143a00de30600802785db7fe360cc4450992284116043864198e54fd1a935235a9aa19afdff148e3e9775f93beb7f448fb3b66c6a318dc6f301eb9f256789c4ee232eda86aa8b3ea3b88120e5797438b45acb327ba865e790518db675091a6eb033af665381e3b7b649f016fbe78d3bd17c49289b6e2ad201ca187abcb8fd58a01400d0392dd812c7f1a32bc7ea96d1b373f2bc7639826389bcd3a6b44093443836a8500de9950953b5b2221583e7702aaeb387bcaa970daecd374d3d8d656fd9b52fa29804f1d36dbc08b66ccdd7defcb4f9d3089c2314f8c65c8f7cf2f000f20d31b70358582d034ed6ebb2425fc1eff43106d561d488ea0b1a5099224e2506d251a422d0825e2d6f9a0440cfd0b87e0c2197337c793c909b654d1490220a92ad36db2fcc5490387cf5ab1653d1a9a1bacd0e6d4986e8e866113a5f0e19a0a7f42d700410211256c3db017b7fee5712434054207cfb8c073688d46d0148d5867070d0d75adcd58b17d935548d6ea7bf084875d92dbabc49b860183102435154d2d56eb27354b34f23c8f7da547108c86e1f7788f0b99e588151ecb711cc2b108389e8b5637374235acb33f1e5f1aa60e1f871e79f91b138a32a9cdfda668ea00a7ddb1f3b4511306ef3ab417350d358061a0b6b91e0dad4dc757ae4f89f15c7f3a5c920d7659960775ef83a4aa382b0c1d7e9b03b5bc00d334e0777b91e30d8052dc94eef52f0270956e9ae8dbb91b56aaa954e41c879a96266b83e6b8602a0a481232d23220727c88529a65451718a7a4bbbccb5c0ed7f43691efb43b91ed4bdb05600421043d72bb20cde3e3320319e02409a66920a1a9680905a19ae6f743d509a02a2a3a676491ecb4748cee3d0079b95d505165854c57079b70d9efef40466616660c1b8b53878fc790defd204bf2f31c210fe4a5674d9e30680486f4ea876f37ad05f178a151138fbff557bcf8d97b98346804660c1d7bcfb05efdeea90f366f698d4546e5f8535ef2ef46015899472500b6a65010db8af6828a226068e0bd3e9c3478246c927c5d43a8e50d8e10e886f12d80e9fdf3bb6d3e7fcaa97875c907d005113081a315c518d0a3379c6ed7711b4502c7a157976ed00dbd5752539bfa7629040f8879e95948cfcc45437d354c4982aaa96012868998ff6e01d316bbebb4039c8ec4ae3d9680b1db2d0193aa9edb717efc557862dad075108e0732d361d6d523f6d427701202fef451a0e041836100a983aeffc46cc1f11c94681cd5bb0e5abb773f024f3844e3317cb0f2cb0821c4a56a1a49f3f870c5a9672dbb6cfa19933716edc1b77bb662e9e6b5385a7a049cdb03a21ba00e27d448088fbef532ba64e57ed1bf6b77211809231c8f58a16820688986f0c99a15e078216584501070567231c38466a6c2930c1da66ea2b2b901791959705865e0ad2f9e83cbed0128c5aa5d5b70f6c469e89e970fdd30db8a149e2ff2826493a47611c37102089001421a0078dae39b090135295455076f7de69ff4c45050d304781e36d986866013cdf005e0b13b21f0fcf7c2cef00371fcdffd5db22801662a54f287ee850234b553184ec4201b1a8c36a34db2a1b4ba1265d595203c0f9acab2659d30b1c22dd436e38f02a1d6665436d601c06b437af67be985db7fbff9da876e81998c5bd98844112d9110bedeb816ab37af87dbe9c6ccf153a6df79cec23a00758490c11defcea02654edd86e1c219c9578a0adde9069a2777e3e5c363b4c4aa95db6c12edb20491264510000d3e570a07ba72e28adab866618f8b1eaac8470a905dbc4bb2b96d0898387a36f97426bf7591491e1f5598791dbfbdbda41a52605355221471c07a7d30da76cc7a6a2bd28c8ce43c0e787a6eb904509a5f5d5d04d8366a5655a738f49ffc71a868282c6623875d234cc193519b22842370c10c2c134ad3168983a384e004780482c8241ddfba0575e812da926214b366886950d2de0f5c12ec954b4c2808e85399a06bc4e1772d2333737848313dc360792a60e02408169ede253eb73a2dd81bc8cecf6319997990d55d3e0a4142963fd5a59926fa100f8545d16ddd40d00b6e327180e1a35a0a80a544581a1e9906d72fbb9148e70a91489044815c005ac02828aa1b6b50c20cbc8f4fa71b8a284667afdc8f4a781e379b86c760423211c2c2ba605d99d8e0b73399127a6cdbb210912545583a669a80936e2507529bc4e2f753b5ca983fe3ac0711044ab5069221e47241a816ee8a9c23f80cbed834c04ec2f3982117d07c0eff1c2a53b21595e8ff3b37c69cfa5bbbd173534d41e57e34b3374f03c8f78229eaaf1617def4855298e54951ecb16d561a6318d0ee3d534d01a8be2686da51532969a42ba6564b77f44124414d756a13e1e83a629a80d3621a624d01c6a85c88b28ae2a8349ac8d8fb67e1678fe2ca7cdfea243b6591b0e6d492a280d685aea00b869c2eff6223f33a77dfe2bcceb025dd7db3629a666a7672c72b95c53516f6df4d01f286c0c4a01d13a974353cf4a4d138aa2405155c4340da6c0013aa099d6664b65432d753b9cc8f2a7415535441251eb90b9699e78dd23c4da9c314d842311ec0a06cda3e525283a7a041e87138220591b6e1c011178ec3a5284929a2a2c9c7926544d4352492269e8d6fc4e482a849b9c601e6ee70300b74d1834e2a26bcfbee48d3b9fbe1f66431de076c31044d4079bf1e1375fe2e3555f212fab136e5970e9f5174c9f23c793899bb37c69e3efbbf8fa75671c3d84705d1d60130149463811c7d2cd6bb16af35a64f8d370def4d9436e9e7fd97600c3a841410dfa9da14fdadf05c330104e26dbff3f2f231b3e97e75400cb022e2ffc3ddd70da1c00406db28c82ecbc63251708108dc7a0a80a5cc47dbcdf98f0d014054fbcfb8a79f59c73e14f852cda24098e5466378e2310c80fac790c2662fe2b206d7560ac34ca94aa48ecdc0bb54dc0c872ead024fdbe79f9abf0c41c9b8829b50c752e3b0bb43198f2c898e0ce180b9310a0a5f55826a47f3228cace8be044e1c73e335d17a53f92d4e243018d10425d363bdc76d7fd9178ecf2d17d06dc3b75c8c84bc6f61d8c87de780107cb8e5a1e1900b03bb065ef76145596f8fa77ed6e55e54e05ed120022c783881c40296c9c0c8e70d0a981849a04cf11041c5e5058f56092aa824c8f1fd430a12695f6d03318264cdd404e5a86daa7735784a25108bc009ea3d6cea72c87b61dda876d07f7425155f08443e7ac1ccc9b34bd4914c48cd4ce6e7b188c4d14e175bb2c7d9cdad9e2080127703fcb13d35180539392e6d6566c3fb41f87aa2be094ed3fa4877ea4ef68eafc1101fd41e3dd32aa48cad3a3e89a552d3db54367a68c7789e3db130f20f55caaa98108127cbc088ef0886b0938641bdc360728a59180dbd374f129a7c36eb761ebee1df8b66817f6171f04226128361b149b03915615ef7df991dcd4d498f597db1e44341eebb08b2ca0aaa10ecdad41b4798e2451444b6b6bea79ad768f692a344d83691884a40a77825268ba015ee4399ef088c6a230cd9f0e9fec187f1d4f26882508c8b1fea0c76b209ee7d1dcd282a4a6226118ede972155d83c40bfaf8fe4350dfd20c97d312a1add128fc6e1f4cd3889b86d156cdf25f99e640150503ba74c7f9d366c16d731ee751e8b8cfdad666e168e4995822feb8245ad9f138422088a29f80ac79f8ad9702a5d59500cf1f7b6ec9861dc587f0d267eff77ff0d21b1629aa323727908ef2da1a44a2514b18721cc071d00d035125d96e7023e5f9e001888280da6063e49335df440e5594c16e93e1906c183360083cae54ced5ef60500add34a0c384901ac1c7cdcb940282003e15c6178f27d0128a0092bddd03df1a8fe2a461a35b644140341eb7bcb44a023a3531a0a067f3dabddbadb4c4907fd2134353e19920d67b639806929a06a7a113d2966ca34decc8324c4a118dc7110e472cb12f08809a84ae6970d81d6aa7ec1c042321888208511451565785ecb48c9066188dd68b468ff3aa52dd00e50cc4d4244c6215b4e53802bf2f0d6e59b6de575e0005a053139aa242900448bc080e04aaa123e0f5a32033179aa1b7471aa67bbcedde0ea7dd8e48248cfada2a00c0d1ca52acd9bbdd70daecd8bc6f177ae77583dfeb6d6f8f348fffa2cd457b1e7ff8ad973242b128ec3c8f483c8637ee7d12a37a0d3c96cca4adef529effb6ba3402cfa3aaa10e019f3fc8818445c21d7b6ece9a3bbfbba681d2b62c85edc380a6d2b153507094c024d69c6752038aa612bb61ad29aaa6a23512b1bca93fb545d0f67e72043a35384dd70d55d3da3d981d51350dadb1080cd3806e9a486a2a924a3215cec9fda435c1091c28e003a07b1caee8f5679c8fee9dbae0cbf52bf1c58e0d68a82c033574c46d0e4092505472088fbcfe17a7699a0baf3ced6c11c07d53078fc4f2a75ec547ab96e1eb6debb0ebd05e201a8566b743b3db11adabc65f3f7a4b6c8984873e77c33ddb4d98237498c60fad3d6d1bbc9caec3e439c034601806788e7b1ec0cd222f7ca1682a545d874d920821042ebb1db42d2361cacb47bfebf84e6d5ec41505b16492a3d43c36d750fa6bd83a662286f12f785e520b084d1dd0e75d0e503581445111d42325a0b2cd0a45a0f407434a3a7a62b85fd3eb94aaa142320330abea107fe25d384c13c259e361081c8cfa165091c7cf7d648117501b0ee1e98fde84cd6e3bf1c44cb8344555fa378782563d1942602493c8caccc6f3b979f776cfcdbb229a885feab23b9e1cd97bc0f899a327bd7cf0d03eab568a6525428bc7108959c66d862fcd5a644341004061a77c3c7ef9cd104501d4a4e008b18a49f23ceca20c3e659c031449554561a77cacd9bd158410c892d49e89ae351444736beb908cfe81bf35875aafe038111480a269f0b93d770b823829a9aa882793e00841381105a53422f0fc0c35a97c4c29b57217eb56f6b09cb4cc08a1149aae83275c9d20083074c3aa3992126126288c1f3a13d361979d8040d775b444c208c76348f7787fd013f36366ae28083fe2893976199117d02b3b1f9228806ff350b6b660f68cd371c1f43970db9dd04d0384b63d02812408ed29900dd332f80bb2f39050944e6575d525752d8dfdbaa5e77a4fbb62d2da92da4abe2ad884f29a4a7cb0ea2b6c3ab80f2004512589d5fb76e08f8bded092aad27e4f4955c184fe43d0252bd71262006451426b2c0ad3344178ebe06b6dd95134875b511d6c0c5a62341326a588c5e3280d57d5da4419072b4a2d038a107c4f899c68ecfe80b0ffaec78b500a87dd01d9265bbbc9a609881c9a5a5bb0b3f860b7d96327bf57d550774edbe2acea1a327dfe6b0f56955dbeafec702add2f877f29e7393591e50ba0aeb1e14fab2b4aff46b813f89009a0290af2b3720fa4fbd3208b227c6e3782d108aa1beb83c178b4ffab8bdf416b340c0822cc58c46a2f9b03c150106f2ffdd8d9a75b8f39e74d3ae553dd34cff6b9dc6abadb0baf23555895f0a0c938aa1b6bd11a8b688dad2dc8f6a75b9b089482803ce4b4d9472595241a83cd70ba9c888949b446c2355e97eb8a1fdb88313bb4d0712d655240e0dbc3735c763b9c36bb657c110ea61ac7b6c3fb71f9ccb3deb10be2853145392a083c34c3802cc9f92227bcbb76ff0e6bb627e48733d77530c23990ef1c393a164af55d24c241d33438ed0ef85d1e489c60ad2dbc88aa865aec2a3938e4cc0927bf521f6c5e28a68cbe443209876cbbbbb2b97e415943ad258a53eb1121044ebb1d0ed9eecff6a643e43828c9384c9ec73927cfc41533ce442816059f1ab7022f40337488020fbe4d449856ea6e5994da77b82905f6971d85615a1e9b0c6f007b8b0f028928e0c842696d359efdf8edce7fbcfad68f1a5b5bceea95d70d841098a6892c7fdac2c33565f7bdfcc507d9db766e4e65a6d390dfa90b32bd6929ef716afd916534d4d76057f12100509a82cdf0b9bda09422a12a70d9eccf16d7548caf6b6db13c1c8a02c20970db9c0886c2277268fff89a076b1cb489f5b677586fdb4068f3b8fce0c548bbd0a2a6d92ec84fb4e1470881c0591e42420142539b5b27b035be37ce0cda765df95059c9e2929aca7ef95939fd9fb8ee8ef72f2a3b8a9aa606ec3a7a10ef7ebb14950d358028a2b4e2283e59b7c23573d4c4be2e87a365fba17dfd384ec0ede75db6f6dc936705aa5b1a71b8a2046faf5882ed45bb015144632888cfd67c8d4b4f9d37148440e039dafe386d670f6db62808a9e30881c3e1443419b76a0fd557a331d8d23d1809898aa6c365b723ae2441091a0082a53b36a6527073a0ba86ec4006fc6e0f7ea800af9912886dc29330f9c2440c23b5f3685a0b85d02e600e403d5a062a49e01cf6ef85907ddf1343da8dc85f95ba330c40b0cec818e595883ff7396c068570d6182027037a6d03a8f073db9958bb8c4a02c68f9c951604416f0e07b177cf56c0e5b11664ddc0de2307f0cdf89346f6ee7cce6b3e9767338004c7715deb9a1b536762528626215628983509feb54b56ae51989d774d5dc921987607a2d1287a75ee8a1e795d50d158776d4d63fdd1c185bd6fb2c9f2cccafa5aacd8b1096ebb033a354140d12d270f9a61700e9b2d7dd19aafb16bdf4ec06e474d73035ef9fc7d7f614ea785030b7bb5b782c7e1c4d73b369efeb74fdff31daa28814129248ec3a9634f8241299e5ef4c6bc703caa112165a08812b614ed46595dd5bcd17d067569bbccc12325d871e480953e92b3b21c112bf0ed27a76ecb20e12d41f6cf2ee4b076b23b1ed6fd210cc380cb6ec79cf15321701c1e7fe715eb790c03712589413dfaa06b46ce926d87f63f6bd59210d3fa76e9feeede92233858560cf01c1a832d1858d0035db2733f300cf39b483cfe4a38110fa5494e5b544d7223fb0c44d760cb5503f20b4b87f4e87bdb236fbe387df9b7cb007f004943c7b2cd6b2d432a4553a81553078fc4d01e7d118a5a994f6d9204911790eef1a229dc0ac20b50013cfefeabb875c1a5b79d31f6a4d3c5d46168872ce3485da5e3bef7ff8ca648b8ad20e4bff5ad56740dbdf20b90eef161f9d6f540220ee272231c8be0c3555fba86f7eebf60c690d1093e754f4e9b1db52d4da73cf7d15bd99bf76c07f1fa7eaea63ae16b0d59425179290a32728687e2315333cd138a987834860c5f9a4396a415b2287e248b1242f198108a45de7cf0b5e751de5c6fed5047c3e8d7b31f0082a2ea72981c87d2da2afcf1ad9731acb0cf1cbb24a9e95e3f6cb29c79d2d031d8b46b2b1a83cd80cd8e9d470fe2998fdfec7af31917bce6ee90b440d1d479cf2f7ec7f5f18a2568d535105545a62780b913a6369a941adc0f886c92120e270ced2504d034cb83082cce4e4bdfdfb7a0f0772bd72c05753a4124112bd6afc4eb3d078cbeecd4335e0db83d25006097640463d12eff58ba78ecc72bbf04b1d92cc3eb849e18fa4faf090456baeea9c34681e7791cad2e4365d95110af1fd54df578f1d377fd85b979970f2aecdd1e4c58d8291fcbb76d38fdfd955ffae2d10888dd019a4cb4a500a719de00144d3d7fe2a0114fafdaf46d56a31e068dc7a0aa1a0616f602807ddb0eeebb0500c2f118a60e1df5cefa7d3bd3ab1beb40390ed1580c7dba146058cf7e29616919f599fe3498d41a376e872bb069f048acdfb109494d812ad9b06ac746c7fdaffdf9cc21dd7aff23c3e333d3bc7e64787cf876d7d669af7dbdb8d3375bd75a022665ac5e7fe605469ac777032124d1af4bf7bbd7eedcd223a624a0183a3e5fbb02c37bf61d78dea4535ee352ef85c4f358be6dc3051facfa4a088643000824870303bbf544963f2db3acbefa9f4f51d5c15bfbdda2b91c211d1c5cf404fd7acc134338f2b32215da5272b77d75bc8f9fc238f6dede154b2686b54422519bdd96a5193a260d1caed6b534cdebd1b96bb27fb71e7f7af4cd97fa16151f044050dd548fd2ba9abe030abaff3d188d064541403412b50feede1b05b1bcbb7ae576dd9e9f9173c99f3f7bf7bcd59bd700b28c703c8ecd7b772607f6ec0d8917d19e7b9e58eb3a21e4740083b2d332306de8182cfee673109707aa9ec0931fbe867bcfbffae6c94346ce69bbf7967834fd1f5f2dc6caad6b618a32a8ae0376177ae51720e0f6d81b6311e384f616838918c6f13ba58470e0bd2e984a1cc9a2834896545887c69dce1f1530c73c31c70cf55f1d9a0e8822b82e9d6194d521f1fc12d80048f3c681cbc900df500f62fcf442ad193a026e0fae9b7dce8f8693396d766c3fb8177bd77c0312c804a8012a0188c7f0d227efa2aeb97168ff821e431555c5babd3bf0f5b60d20763bda2bc3875b91999d87ce99d900b0a2675ebe7acac809d7acdfba165449a0a6a511b7bcf8047e7bce651025293f148f9192ba6aefd1ca52fcf5f3f7b1abac18b220404f2670e9ecf94642511ecff007e20e9bfd99a923c7dfb971cff6012d4df5487a047cbd7323cc979fc2d4e1632fc9f5a7c3e43834343760d1b7cbb069df2e2bae3b1c843bb73386f5ea57a719fae31b0feee633fd012b3a9c521097073b8f1cc4236fffb5df1913a7f5b30b12ea5a9ab062e7265436d6a66a3f98edbb73ffb241fd73b206ff1c471d356193648cea3b082635f9d3c64fc1272b97c294656cd8b7138fbdfd57cc9b30dd2bf07c0fdd34a0ea9a6fcd9eed58b46a29ca1aeb81440c0950fc7ee12de8ddb570cbfe8ae26d4525475e5eb6663924af1fb16808d3474dc2a481c3bb74cdce15ec76bbc7ef725bc21a041ca5b08bd2712246160464787cf03a5c70a43c73222f4804c079534ec5736fbc00ea4f07f1f8b065d7563c63d2f1472bcbc7f72fec05599671a4ac04dfeede8245df2eb3c63cb87ffbc6846ee81854d8cbc809a47b87f4ea87359bd7404b2460daedd8577e14f7bcfc47ac1935f192e17d06c0eb74a1acb61a2bb76fc2975bd6209c888373ba41bf7ba0f89fdcb6213627bedab61ea5b595e39d36c778cd304e2862d448042a3510375423dde3fb6848778f9f52f389c5ebbf3967f5d6f556a6b46808591959b8eddccbe1777af0e06b7fc6ce3d5b008f173b0eeec5bdaffc497becea5b1f0170b7699af79f3d69c6134bd67f93b57cc512c0e94273348cbf2c7ec71f8bc72fe997df0d4ebb03d1441c3b0eedc7dbabbf446b63bde5d988c7d065c2340c28e8211dada96cf716fc9047f284fd960a854cf1adcfe5593e69f0c8dfbdfec93b88c693e05c4e348583f8d3077fc7ded24313270f193d312f2d03352d8df876f7562cddb20e0d4d0de05cee13be4bb4a3c1fb4fae09ba6962cae051a6dd26fb3f5bf70d76ecdf01e81a54c261f59eadb8fdc527316dc4b84bfa16f40405c58ec307f0c99aafb1abe430882859619ec75e739f248a0f44e2d107668f99f4c77f2cf9008dcdf500cfe3cb75dfe0c1403ace9c38ddde1c0ef548280954363560edfe1dc2928ddfa2251681dadc8ccc9c5cdc7dc9f500e06ff36e0240a6cfdfbede11425ebe60fadc9cad07f70d58f2c5fb20599da0ea3a3e5af1056a06375c5454510a9b2c43241c3617edc1cea345d6c60ccf01aa8a718347e2c29367f336497a31148fe2fc69b36f5aba7135f6efdf09929e8192da4a3cf0da7359472bcb2fe9dda51b38c2a1a4a6021faf59816dc545a03c07b48690dfab3fce9e3ce330e1c863a669bafee92c556d8b799ba7ac8308392ec4e984e2a4832786e26717c0a6a90d234a8efdfccfdb3aa1e009ff0f00055b0eeebef2f3e59f434acf02a126e68c9d4a260f19d9bd6b568ea2a8aacd2ec956414dd3844d94e075bbb28e56955ffaea27efc0e9f6e295441243faf6c3cc11133a0de8da33ace4770ba4bb7dd61a46adb35a5eb71ba649617ee74c4c6a23b80f80ccac40faa3e79f3cebaec5cb3f03d55410bb032bb76e0031e9849dc50727e465644351156c3eb40f8bd72e475c4982d89d405d0da69f723a06f7e8f32e35e90e4ae934669d3211c3f839703c788f0caa27913870006a7119c00be09c0efc5333d1afd65565ed5c4214c175cd82595e8fe45f3e050c0de2822910d2d3a0077f3ad3966e18f0385d983769fa8fd6d371c836292f9081454b3ec6d19a32c01700c7f3a02e37f61dde877de5c5e8949185a4a6a0b9a10e102470361ba86982466380a6e2e259676358cfbe6b75432f77d91dc6e913a7add97470cfc4254b3e844e387cf1cd1234069b30b8479f3bed921de1482b56edda82d2b2c396b1944862d0a0113863c2345e10847b88a122914cbe336fc2b4d30f171f19f0ca87afc34824a0db9d58ba6125966e5d87bccc5c9884a0a6a6c29af81d2e20aac2e1cfc01573cfc3dc7153c20955f9d325d3e74a76d9e6f960d96788241380cb0355d3f0f9da1558b97b2bd2dc5e34069b9168a803bc5eeb707cea702f3a24033851484a47cf17f9a1cfb5652e4a1d74373a8448587f5ba123a0d4da51eee0dd39b6785b3f6f5270baa65259925fbcff921bae29af28c3f6a23d083537e0d5a59fe06865f9f82185bdc7270d1dd158049f6c5885507383359ea261cc39f3028c1f3874a7a26b7b4dd3cc0fc522f8e4e33780cc6cc0a4d85a7c0887aacaeeee9a958ba2aa52ac3fb80ff0f8816814f640062e9a3117b144a2fd1e238918f2b372ad09f55836b5b274af7fd155b317cc5bba7e150e971d05757bc0b9bdd8b47333361dd8899e5dbbc369b3e1604519124d0d9661aeeb3f2306fe78efd78942468e9be83901c148c813f0783f397fdaecc1db8af6745df5f567406e274094b0ab683776eddf896edd7bc3ef72e3404529122dcd562a66d966854311f283d76efbbfb633551dff7d9c492d08a86ea845755569ca56fa11433bdc029bdf871e5d0a4a644972a9baf6c8b2adeb17fe6dd19b5685714a4113495c38731e164c3975a95d94b3771dd93f78e79ead56220749c687cb3f13c70d1a76d745d3e6c4ed92edf7b9691974c18cb97715951ee95355761448cf4473b0097f7ced79a4e77486c7e54673288850530360b359a97643ad18306008eebcf8da64a637f0fcd19a4ab1bdcd7fdec6f5314411a2b58d90a91b6662749f414b2e3a6dfeac17fef1124c5100e7f6a2bcae1a7ffff0757cba61350ab37250d1d480baaa32801701494a9db7273f68d492effc6989ade3fb80747ca73a64baa494c221c94e8917dfbe64e6595d761e3990bd63db0620900e1d04cb37aec2f21d1b31a05b2f10007b8a0f02b1a8d54eb2bdbd0067aaef5d00ee9725e9f180dbfbe255675d7847797d8da3a1ba1c553515f8c3bb7fc3ae234585f919397f49680a42d1083e5cb71c349900e2714037306bf2748ced37b89252fab6d4219d795b815700e039eee3c29cbcf8b5679cff686d6dd5e01d7bb602be341087131b776dc5466353bb010d494ebd5f1a108f63709f81b8eba26b901d487f4137745b7d534bb257e782b7ce9d3ec7fdc7aaf26ec19666c09f86e2b2623cf8f293e852d0133cc7a1a4ae1a5014c061076231d81c4ecc9d300d13060c2b8fc5e3af118acedf3f1af3fd6dc6b679f2d867da52901c3fa4c871c214e0c9b13360043ffc7b48877981fc40081af7bd39831eef89f98939def2b4d387018c6b0cb74efc72d51240b4016e37b61dda2f5e503de769876cc3e6837b50dc5867452ce83abae77541f7dcced872602f966d5d0b1a0a01361bbedabd11e5f575d70f2cec857dc587b1a1688f955c2599447a761e260c196e2baba949254ea06de913adec72d686c2373651ba7bc2c0e177cd3969263e5bb1c4aabd234af866fd4a7cb3672b0ab23b219e4ca2bebedab2b36c0e98c11664e574c28d675e802ed979af9537d51da404f3be6faa71e079eeb806ff5eff81fc9b7de70c2662fea3ed7302cee180a946a0ed3b00e570b1557fc4ed3c2e8df24fee5aff1ac3c94e206448610ecc2365509e5f6c19fc678f8711e08f33784fb86bc4f170bb5c3ff5dbca06f7eab3e9811bef1afdc42b7fc29eba2a984ac29a806d76c034505d536135bc28011c07331e03740d5e870793279c8c4b669cbe39dde3bf269688ef8f2513e89c917df56df32ffd7b6363fde8ed478b604822366f5d87cd9bd75ade1b43b70cc454f6b909a327e1beab6ec1a0c25e9f18a6e9b44bb618a51401977bebb5679c3f36180e765ab2ea2bc4a211cbc0324d54d5575be385e7adaf5814690e17ce9fb300bf3d6f6144e0f8a54e59c69481230c9b287db0e0e4d3e6bffaf90748868296e09124c42221c45a9b01c3809c9e014194104b260055013415aaaac2344d689a8a583281783209a8aaf50caa02c334605213945a614b0935095995905493d63554c52a76a924adeba40eea26551548c6ad787ad3444b34024a4d98a609c33060980662893890880394425193505415ba61082da1b09997997dedc0aedd1db75d74cd054fbff932bff5f03e18e156ac5cb31c2bbf5d661d4e4e154084284212248c1c3f15f75f7ac3ee1eb9f937253475cd944123a666f9d3b67c36f79c911bb66e0024090df5d578e1ad97ac3035c259fd4f29dc0e27169c341357cc3adb154bc68f79874c136ea7cbda873f16ce739823dcb97dba147a1ebafaf6e90fbdf8040e5496c21445ab52b5a1e3f091224bb44812e0f642162548b284482c6a195eaa02bdc3a1664aa9555b43532daf48aa6f145569cf46075899d2124a12d05498a9cf81106c2eda9366976dff1854d0d3b8faf4731fa8abad2a2c2a3f6a190c0e27008a92d223edef1c4401a2c3059b205ac2574d42150428aa7aec7072ea7993aa82503c0a21e5ed248440374cebf77ff79d966d3ffdeeab3670e030ac7b9f5e7919d9bf5dbd6bf3d58ffeed69c49a1a808c4cd0702bfa0e1b8d734f9ebdd12eca9702e83d77e2f49756eed9de6bcdb7cb005f1ac011dcf1e7c7d02990f1f0acd1937403f4b173279f3230118ff779ea6fcfa0bca5d1aab7e174a129d884a69606ebfeec766b7c1b06faf51d849bcf5bd83a6de8e81792aa722fa5d465526ac5d7ab0a404d50d3846ee89661934aab9b72b743edd0fe545591d05550c0135792a53eb7e7e285b3177cb8b3e4d0948d7b77c08caa8028033619cd2d0d68aeadb4c6b06c0338017e8f07a1780ca6ae03aa0a35d5ef6d6148baae034a025453a18322914c58df0785619ad00cabce8aa2a940326165562304c994a7a3351af6fb5d9ee7c7f71dac5f73c605773f1a6acd2b293f0ac80ec0e902741d7bf7ef4c65a9e32078fdf0badd48ea3ae249a5dd184f8957c36577da82e1d043f3264ee72a6a2a6f78f5a33703d5c1266891303ef9ea23ebdde279cbcb69b303d484d3e9c699a7ccc52de72e2ccbf6051e344cf3f51f1b268de1e0d2613dfb251fb8ead6671f7ef5d9813b8a0fc288c7ac03db927cccf0344d201605c7f318336434ae9d77913e6dc4b837154dbd8e1002b7cd81483cfad4d573cf19a1c462dd5e7ae7af680cb75af72501e51525d6b504019044201286439470d6a967e08a390b1a64415c172380669aa6494dab8d53ef6a3c9948651b44fb993ccdd0104dc4acf7c3a488c6a250d424545d879e7a970db3ed3dd6ac2431aa02c5d0da136268860e4555004d01559288a949e8d44c258c51a1e91a129a82a4a6a4c6a075de329c88c1661a20a6697d518a64db3cad69482613d65c4da935179b666aac534053915055289a721e80c633279db273cbc17d43be58fe29c00ba8ac2ac3a32f3c6119f4a2687d193a060d1c86f95367353b24db8641dd7b7beebcecc6497f7cfd05a8d4849188e38dc56f590293e7ad77c03090959e858573cf415e5ad6c725d555543775a26a9af56e9a26926ab2ed0ca2cba4d49de90d7cfde815b74c0f875ab16ef756e8c938e074028681d28ad2d4da2d5aa9c52361e4a567e1868bafc6c4412336f284444dd304d50dc3d0354ba86a2a144e4032b5eed0b60c38c43a33184f5a73aca12988999465276322e6bf87a4a6822a3124f7ee8379b4d4aae8ed765b079a7fa607e6577bb0ff044286481250d81546492592cf7e048ea32073a65931bd3fd1643a35113755d8c88f0ef7f536519e77ee94533f73c836fecf9fbc3da8a2a612d14402095d836a1aedc6244708245e805394e0b6d93077e20c5c79dafc22a7c3b120a92be56d3b60add1705156207dfecb773eb2f4a17ffca5efee837bd19254903475cbe8e178d8391e3e50f4ef37180f2cbc491fd1bdef0add30ce685bf028a58829c9270776eb117af4aadb1ecc4acfccfeea9b2fd1621a881bba159f4c0804c2c1c1f348cb74e2d429a736de36efc2ca2c6f600505bdc3a414b164c28825130beebfec06219a889ff6edc6d552b3aa224928a8204222408edb878923c7c3340cacdcb1116a2201a269b0cb36981c1504418043b27184025999d9e025194622015994c0a52a008a020f591421f202e7b2d99195990dceed856918b00912049e2776c9069b200a7e971b596999201e2b7cc021db400891384252877e39d125db90ed4b031578c876079cb21d3cc789a228a60c33fd9273269f2264780367fef1ddbfdaf716ed46180449c3680b9d865390e0e1398c1b3e1ef75e74ed914e81f4cb82d1c80e49141189c75676cbc95bf0d2cdf77f79c593f7f6a9a82a4358d3a099264c6a1d2e761082349b13a74c9c1ebfffb2eb0eda24a9a1ad664647be5bbfc3a4a60e60c682c933b6f13c19f6ccbbafe268793182ba068d709610250432c723d3e3c3e4a163608262e5b60d48682a742509bb2481a6624f094760976d70bbfd103c3e505585c8f3e029e93807f08410c8b20c8fd70fdee58129c99005111ea7dbd00d03f5ad2d6f4d1e323afef84df7fde9f1375fec7ca4f40842866155bcb7d900bb1d3c05325d1e4c1a360ea22860c5f60d888743902519f6545d164252fbbca9c3d99224a27dd79c023c4fe1f37841e83f3f3fe9d484dfe68000eeca503c828f562d43e9d1c3f077eb016a9ab049363c72c90dc8cfc8b94e338c3a8e43dde06ebd7e73ebd917bf5476a4a86bab6982f778a0b586f0a70ffe81ee795d1eedd3b9db0659928e5e347dee0e0324e3d5cfdfef5c575f85565d874600500ee078c81c8f345142df5e0371fd824b83270d1ffde79a96a6fb9cb20d6d4708ec363b7c2e2f284c108e874d94410904c259e762acfd738274b71782913a5f964c5a3be900c7731c924ab25912a5192fdff6f0d6bb5f7966d09ea23d688945106dcb1e278a202008d81ce8ddbd3746f7ea8fcfd6ae407324048d9a70c9d6f91810c28350559244787c01f06e1f389810db778fad9ee28875d05b1604f81c2e504984c84b70daece0390e022f9806285a5a9b5f9c3b6e6ad463b73ff4e45b7fed5a52598a56c3804900b8dce0390e018ec3e4d193919b99836fb66fc4be2307ac8d1d42ac8d072b1937150511a5f5350f5c3af32cd3ef0ffce66f9fbd1fa8afaf45ab4383611c2b02ea1244644832669d7c1a6e9f7f59757e56ce3daaa1bf73a2d0bd635e050e35c186d57dba145ef1cadd8fbdfdf03f5eecbeebd05e44920924751d3aa5e039023b2fc02d88183270186e9977717c58af7e1f36049b2f4bf7f84029b552925b8d5576cfa5d7b5484e67e0f50fff81b0a9236a9ad06d8695a299707008227c4e37a69f340b37cfbfb8a1674efee39aae3fade91a449127d424e89c9689a4aec348bae07379da3c06426a6de0789e47babb2dd31a05a71bb08b12245ee0537588789ee7e07779901948072fd940750d92282175444810051199be00a29939e01d6e04acebc902c7439045509e80888298e6f1202b230b449291ed0dc026c9924396214b3698a6015994a44c5f0039691930741d0ea70b769b0de08828703c245e404e461620483095387c4e37388e7f08c0b5fdf20b2ebe6dc1a59f856391ae478e1c402b01345d0752e7233d000a3a77c3ade72e6c9e3b66f2d3ba613ce2b13b9c379e71fe86aafada81ebb66f444b2286b86ea54f17041e4e1064fb0298376dae76cbe9177c9d5094b3789e03e13847ae3f0db18c6c2b59832fd096eadba31b7a44e285197dbb146e7bfed607873dfcfa9fb175ff4e849209c453428c8042e4787804093eaf1fbf997f312e9e71c67e9b289ea5197a2d314dc82678af6447664636b8401a24d90e1b2f83f0201cda132588822020ddeb07327301a703e0788959b64cc4fcd7108b8490d8bc0d466515388703c42677387ff0336dfb54080ef02b49b1fc53424655412409a45b3ecc8a6a988fbf0da21208178ce7841f8dd527d0a88122b50543e5cc9f6aa9ea502c3a4cd114bcffbb3f961655958adfeeda865dc54528abad4622998024c9f0b8dde89a9583f1038763cac011e89edb1965b555e3134ab2c5dbc1e34308413c99a8944569fc2bb73ebc7763d16ebcbd7209f6961e4163b019a2206268f73e3867caa9386ddc14b86d8e3d713539d33ac078bce72e1809ff352f232bfeecf5f73c76ced45978fdcbc5d870703722f1180cd3405e5a06c60d1a8185a79e857822fec891ea8a173aa5677def3aa5b555673d73fd5d1fac1e7bd2d8bf7db908bb8b0f423175f4e8d405974c9f83cb4f390b4555a5e89ed3198aa6c2ce4b9830681832bd81e0f01e7d91e3f2c793ba56dda7a0100e5186924ca230270f01b727690218905f88ce6999b08972ac7b464eb58b9721dbed8829094cec3f143cc7a93d3a7581208a4da78d9c542d7102086f19589d7ce970395d1aa594e6110a49906ae74f3ca5ba6fe742a8d4845d1031b87b6fc8a25849e1402c9980288a6809872e3869c8c8d786f6ec3d6dd19ae5f878d5d738545d0655d76093658ced331873c64dc1b411e3104b244e6b8d460e7b9caef6368926626536499ef8eeef9edaf5f19ae5f87ce34a94d7d743d555386c368cecdd1f57ce9a8fbe5d0abf3c5a5d7965466fffcfaece6c528a849a1c3e6fc2f45da3fb0c4aff7cfdaacc653b3688872acb104b24e0b4d9d1af4b21668f9e44cf9c7072cd818a924efdf20ba1183a82b108c6f61f0642880820e173ba9a678e999296e60bc0ebf64037748ceb3b1876492699fe407b20568e3fade5dc29b302430afbc069774055150ce9de071e878bc41309701c079d9a1ff7efd633f6d9637f7dfba3d54bd3966fdf8483552588c762e045115d3be5e1acf1d35bcf183b3556ddd2e0ee95d7d5134b24210a3c0616f480dbe5aa117841a794021c8769434723c3e36bab57d45e9cb0291ec14f19a23fe4a90e464218d57b00bc1e2f0e579542b6d9f0dbdfdc0381e361e83abae5e461ead0310d6e87c3a1e93a4c130827c2cb7a742eb8f0993b1f59bc71efce74b7d3051082eaba1a044361940ad5e97999592fd73435bc3ca657ff532f983af3cd77bf5d9ab674e36a1caeadb2d209cb32fa15f4c0f461635b4f1b3d39e6b4db5ea86eac7fc42ec9084642e89c910d9ee3f885334e477d4b330cd380c40b18db77708ce348a3d3e680c88ba0841a94d29a6b669f931b49c6ad101cd3c4985efd2394d266991760183a345dd314431bfcc1bd4f17afd9bdb5e0f30dabc8b62307d0d8da0c4a297233b33173c404eddc29b31a6c92c8e7a6656687e2318462110c28e8812c7fa055128488d7e1b20fefd50f575d780d9cb20da66922cf9706bfdb5bc771bc9a979685748f0f76d946260f1a099896e82684439fce0570da1db5b228698422dde370c91c215fcc9f744af6e8de839e7867d597f87adb7a94d5d540104414a46761d6f8a935579d36dfb761ef76c7caadebac9d7e87133a2168686e32005a4329355d0e076ca28892daaa87ce99382379f6b893ef7977c5179ee5db37a2a2a90eaa61c0ef74634cbf41387dfcc98d13060e533990eba289f8a7b2f4f3ec42ce1a2f5bb27c81d9afdff9c88a5dc507b162c746ec2b2e46436b233c6e0f8614f6c1a9232660549f0100c1d29ae6c6855c87ba366d9b4100ee9045a9f9f6f997dc3869f0702cd9b4062bb6ac477da8199aae23d3ebc7d8be4370e6e4e998307018788e7b389288bd4c4d8a582c8ede9d0a74c330aaaf3ded1ce8d444ab12c3e0aebdd1352b07009aed361b04814f4aa2547dcb9917a1b6a5112635e1737a30a2f740e4a46746442b0d7738372db3fae269735098db193e870b9aaa6254ef8170d9ed3a80a65e9d0baacf9f3117550df508d81c28c8cd477e564ed8d075f89c1e18d48443b2d5c59389eac185bd2013cbf01ed4a34f352180dbe904a514b224579e3b79261958d013e17814691e1fa60c190d97cd5e97e9f59b5ea7abfac6332e02380e314d45fffc6ec8f0fa01406e8984f616e6763ef79dfb9f5ef4de8a2578e79b25a86969004738a4b93d983b711a2e3c690e32bcbe3fd6b4343e93e90d4033f498619a83fe7adb43151f7fbb9cfb70d557d87e743f129a8674b71713078fc0a5a79c85c1053db65535d69d9e9d968182ec3c88a25471e1c9b3cdfad620e2aa826e9d3a63608f5e0050c3735676395dd787f7efda7dd7eb773d96be6ae7567cbc6e393616ed46436b0b449e47cfbc029c367202a60d1f8f01dd7b4051d5318661441a43ad0021f07b7cadc3fa0caabef4dc85f04836f0b28c213dfb42370cc3eb72b7659a6fe8dbb95bf59533cf426b38d426a4aa9965cb44cc7f0d333a156243348e3243057504ac94be8afa4fd561f8d515bbfcb9a1659204a479e0686cc2f0dd119a73ae435574fe27db8a270454fe996d4b29c2f16841241e43424942d53518a601c334addcfa860e55d3104f26108a45104d26ac6ad2273464cd60241ecb8b26e250350d46aa60a3994a6d1c4bc4118e45e1b6394e98a4c10acf31de52b4d85b9158148aa6a6ae635d4b370c245505e15804baae7fbf664187eb4413f1f9d1440c5a6af7ab2d95673c99442411435c4922a92a56480467b67f4e370c289af68da2ab794925096252284ab2fd792800dd34ac74cd1cffa9aa6b9f2694244c8e20a92ad67538aeed50fcadaaaedd9a50922002070e04095569f73e99d6b39da1682a124a121ab50a7eaaba962a844d8fc5861302ddd02f0dc7a28827e2a9a288667b3884aa698825e288c463a945e8bb6709084cd36c0a2bf1bc8492846e18dffbf9483c86583271c276fd4931639a83ab9bea71e6c4694b16ce3a7b5a6b3484a4a2409624386d0e088250ded4dad26378af7e2dc37af573b5a5dbe6080f8e109f699a1bdd0ed799674d3c79c5e913a6b63f43ca2362b6a76305de48f3f89b2f9a3e6731a5c74e81711c0702627284a025124665531de2c9f8b2748fefcc2b66cf5f71c18cd39148c6118ec7609764043c7e6c3fbcffba23d515ef0c2cec71d59de75ff1bc15ba04081c9708c7635d4dd3d400ab50dcf841c371d2f0b11dc51d05a09da8bafccf7907798e03cff1e85fd0137fb8e2e6e3da5ee004e8863e41d3f5c3df19dbeb022ecfa94f5e7ddb86f62289a9b14228d1058187619a8826e25fc9a238effad90bbebee4e4398825625034150ed906bfd78f0dfb765e53d354ff5e7e762e28ac94d9591981b68d26e5ead90bda0badf21c8f7832f154341e7f40e085b6b0c266009d6e3afba23a0204dabc069aae3f184dc4ffd85680b1edfe82d170e149c3c6944c193a2a2f964c221a8f82231cfc1e2f42d1e8f2431525b37a752e48bbe1ac0b6adb7e263536ae22048b25b778e3c83e03b561bdfab56d7181231c62c9c4604553eb33fd014882084a4d23db9fa64d1838ac5d640b8433e24ab22747481404eb34551b67a4c693dfe3c155b3e6e1c6d3cf432c99806e189ad3ee004fb8a112cf3fbbeb48d182e2ba6acb83a71b9041d023bf6b8349693e056d4f5191121a4f74cbed1cbff5dccb9fbefaf473915492d0741d4ebb034ebb1ddb0eef3fb925d4bac7eff2fcf3b5c00881619a0723f1589e356f2b50750dba61cd47495541241e45381e854d967feafa4fc493892722b12892ede1b2d67c6d9856a858341e43341187d3666f3fb762dd83516798465e4255a053134945699fabdbfacda47493619a7909258984aac0a4262421093d95dd92520e00de324df3ada4aa22a92a4808223455b54271ad31f85bc3347eaba8568d9704c723990a2f4c79a8619826745e3f4fd1542415052667b4cfeb6d35c3525f63dbe6d9a4aab4b75d5b98a299ba57f07ceae7352bedf0b17569532299c84b2413ed6d85540863524922128fc2e3701cd7e6945244e2b1fc58320e4dd7dad721c334a1a82a22f12862c944fbcf18a609de344727d5d47d6a56bb7cafc0a8c5e0483c8668ea9d363a865c1a3a124a12e178140925d9bede76486bfd67ddd0ff9c54921041c013abae8e6e181de7b69b0cd3b8c96aabe4b1f39d0c2662fe5b9837613a0ab3f270fdbdd76167e911d0ec4ee024c98af5fc9993f77f9527a60d4986d9da022118c4dc1973f0d83d8f352a9ada0380ca4615e3978049e9d9a6690a46cad8304cb34db099a945b4ebb134abb42da355dbf85e6f529a6e1edb356efb7efc3bbf669949cd746a9ac7ced3589f8ffdc0fcd27ecdb67b6913c794d244ea9e5e334df3dd3611635ad7d0be2b3adace67a4380420fd5f11316dc527dbaeddf1de4d620240f4049b163b2835d3cd0e8623f7c3edb4d634cdf667efd81f6dcffe03d78e03e894ea33cbe364a5c7554e205e7b7056398ed4597a9afc91671e649a26693f8740d03636f4d4475a4cd34c6f7b26abc022df769f2f514a5fb79e99745824103976ef1414788a52fabc994a936b520a932310383ebaa3f820049e375ffd6211b61d2982dfe3413c1e437e660e6e3dfb120cef3d20f2f7258bb2e2c9a47ac929677cb3edd0feb11fae5d8e783804e2728346c370483246f6e88f92aa8a76f11253931d8b04fed534cd377ea8cd4fd49f0c0683c144cc7f10b228f6202078e6a16757feeeb17b3aafdbb11966e72ee064d9f236304fccf7bd30a2083314041f8be192b90b70cf8d77979a269dc2016136a218bf20e26d09003a56eeee40f8b877fc780c00e19f51ae456ffbdc09aef303d7fcce3d1dbfbba80250ffc9ad1213ffc2bbf92f6ecb98f4c7dbf1c79ffdc77f3bc5cfbb761b11fa4f7eb6e37d7ca71fda7ff70f5cabbd8f7e626c28a9afe3aed19a8821372d0399fe745f75631d766e5d0b213307304dec3c7c00fb2b4a71d3e9e73b798edfe975bae99b2bbfe8fefad24f84dd87f680b85ca0b1286422e0940953919d969eaeb487f812e4711c0e5694b4796053f7f9dd366730180c26627e1198941e5575154eb77bf643b73ff4f683cf3cd4efdbf5ab60762d04e7705899317ec223d3d11363fe9a97004200598659570bc4a2b8e2ac0b71e7b5bfdd67b7d9cf8f44a3e56c0033180cc6bf866668e079014955b9f0dab32e7caab4bcf8e4a29d9b812e05d041b0bff430ee7fed59cee1f4f42200a2b108eac2ada0bc00045b012589e933cfc45de75e112684cc903aa4096f0b0ba430594333180c26627e15b6390862f1d8eeeccc9ccbefbcee8ee778c28d5cb9663968614f10bb0350923f2a642c4f0c6dbfd6af8fd49ea2dd06b3b2122412c1d5e75d8edf5e71cba6345fda6f1a834d7b08617574190c06e35f25cded6d5b4b764f1f3a2621ddfa001e7ce559acdfb4da4ac16db7a3a6be1a402d00d32a05400044a3f0e674c695a7cdc779b3ceaccef0062e3129ddf4ddc417ccd7c260309888f9b5091942100c073777c9eb7af32d57def21880092bd7ad00edde0b9cdd06244e2c6448fb1fbfc60522958fdd6e83595f071209e3aa0597e2d62b6f5e9d93957b77634be396b6a2890c0683c1f8d770caf663732fc8cb837af45d73ddb90b4f193b70f849072a4a70b8b60ae1641cbaa183273cecb28c4efe74f4cacac5f861633073d4c4c3018ff7b6702cbac2e774b1066530184cc4fc37c0110e4d2d4d1b0a0bbadf76c7b5bf7d02c0a4955bd6c2ec52004e12014dff6f5477d61998e626d8e3095c72dee5b8edaa5b57e564e5dcdedcd2bcddcaad6fb0c1c3603018ff063a2660e0085952d7dcb8a47fe7821533868cbe78d1daaff1d9fa55a86caa83a26b907811018f17237bf6c7dcf127636cbf41304c7355536bcbe79224b3c66430184cc4fc5709198e436373e39682fc6e373c7ceb032fd327ef1db36ad75698399dc0098255d1f83bd0f63f7e65e1641c074a08683402672c8ecbcebe10775ff3dbf51e8feffa96d696033cc71d579d9cc1f8af9ec0f91f99c24f90f33be0f620e0f61cf77f2e9b1d2e9b1d99feb4f6ff1bd36fd0719f113b5ccfe772ff1f3e230f81fffec3a48a021ebb27a71b237af46dffb72cfe709d917e5d0bd1af6b61fbbfbd4e17bcdff11e4c4ca520068e855a01c7d2730b8270dce2e97638e176387ff2594441006019fa0e9b0d691edff1df8700bb2423ddeb3beeda9dd2337ff2da3ce1d13175f3b1df87e3ee9fe339083f9e951e03bbf502805d00765d39eb6c5c39ebec1fef238e437620fd84df1f50d0e3b87f7b9d6e789dc78fa151bd071eebbb133d23777c9fa6b9bdc7f50f009c92968153464ef8d1fbfda9f6f4bbbd98397222668e9cf8b3c769c7febff7b2eb4fd8ffa220c069b3e3867917fee8f57c6e0fce9a3203674d99f183dfef9d5f80def9053ff8bd0c5f7bdd285c9e3bef27ef7ddee4199837f9fbbfa75b6e6700c08357de7cc276f2a7daff77175d83df5d74cdcf7a9ff3d2acf6bf62d63c5c31ebc4f797967a0f5c760700e086f9179f605c70c78df74c7f1ae64f3905f3a79cf2b3fa2ebbc3bc973d6c0ca60f1bf313ef474f0cecd6932d40ff0926236b82ff1c21d3126ad99b919175fe93bf7b72cff87e83411a1a606a1ac071df0b2b231d16d45fcdc17e8eb36a8044c2704563b8f88cf3f0e06feedded71b9cf0d45420738c2862b83c16030180c06838998ff2808218846a3a576bbf3e4e77effe7f2313d7a430c062d2143c87142c64ac5f92b4ab19cda49a19108fcd1182e9c73361ebdedc1725114a7c4e2f14a76889fc16030180c0683c144cc7fb0905135b5d1a066bf3f3ff1526c78976e108241988601f07c878c6400f93515bbe438989130bc9128ce39e35c3c7aeb83115dd7fb689a16640286c16030180c0683c144cc2f004a694c55d5f4e71e7f3132a2a010686c80a9eb802401a9e260bf7c4f4c4a7c0902cc781cb2a6e18c5366e3c19bef6d5554351340828d040683c16030180c061331bf2c92a669f67deaa1679bc6f5ec0bd454c15414401441e8afc1134300bb1d66b00552b005979d360f8fdcf9489d6e18fd012459f733180c0683c160309888f90562184695dd669ff287bb1e299d347838505602339904b5c9a0a691eac45f982786528010108703665505f8d6565c39ef42dc7bed1d4765d976b26118d5ace7190c0683c16030184cc4fc82492413fbd2d232cffbdd8df7ec3d75f20ca0ba128846416cf6546db2f6aa97bf0c0801ec32ccb212b87413b75c7c2d6e5f78f32eafc777412299d8cf7a9cc16030180c0683c144cc2f1c42084291d0a62e9dbb5d77d775776c3afda45940750568340a4e14417f618e1822494045393c14f8cd45d7e0e685376ecc4ecfbc3e128d6c6687f8190c0683c16030184cc4fc8a844c534bd3da6e5d0a6fbbebdadfae9d336d3650598e687323788e4b652bfb0fbe7f1088bc0051109168a8879b72b8ee92eb70fda5d7aec908a4dfda1a09ad670286c16030180c0683f173105813fc821427c7a1b1b9717d41d7c25beebbf19ee762d1c89883a547d01a0c8223e47bd59aff93d04d1d958d759045092e45c105175d8ddf5c76fdfa348fff966028b89d10f26b29d9c96030180c0683c1f8dfb68b5913fcf2844c4bb0795b6e4ea7cbfff0dbdfef9c3a7a22c2a19003202084c37fa2378310026a5244123184e211db45f32ec46f2fbf6987dfe3bb2c140d6fe7980786c16030180c0683f14fc03c31bf40082108854345015f60ee53f7fff1eb642c9e6c0ab742a706f94ff46698a609bbcd4ee64c38199aa1ef2ee8d445e6094e8bc6a2b5cc03c36030180c0683c16022e6bf48c8e8865e190a87fa88e0402905a594a7f43f4f1298a6098ee3f880d76756d6d70e0e4743f0385c9687863209c36030180c0683c16022e6bf4bcc0000a5882663201c4134910428fdff1f564608c00bd034039148049aa943d135d6610c0683c16030188c7f197626e6d7a04425115db33ba120b7b3b74f4636b8781c34910078feff4fca32c281f23c106c813b91c0c082ee70db5d5ebfcb831e9dbb42e405e6816130180c0683c1603011f35f0d211078018aaa8cbeefc67b6a4f1e391ea8ad81190903920498ff5782810284804a226855059c26c565675f8c0b4e9b5fa9a8c9b11c211005e6fc6330180c0683c1603011c300402985aeeb07bd6eefe9bfbffdf747664e3d05a82883196c011c76e0ffc4f341005906ad2887c3a0b8e1c2ab71f325d71db4c9f259a6691e6cbb4f0683c16030180c0683891886252108412416d9d2b953e7850fdc7cdfaeb34f9b0f3437c10c870159fedf15328400763bccea4a3828f09b8bafc14d975eb72dcd9f76453c91d8ca7a87c16030180c0683c1440ce38442a639d8bca64741cf5beebefece4df34f391d68a887190c5a42e67f4bc04812ccca726488326e5978036ebef4fa8d59818c5b5ba3917584d5816130180c0683c1603011c3f8d14ee538343637aecacfef7adb1d57dfba71fed499405323cc700810c57fef617f4240390e666d0d32098f9b2ebe06772cbc69434620fdd6702cba8615b26430180c0683c1603011c3f8d942a629d8b43e2fb7f375f7df7cdff6b3a7cf861c0cc28cc7fe7d59cb080125006d694216e170e3c21b71e325d76d75d99dd7c692898dcc03c36030180c0683c1602286f1cf752ee1d01a6add99919e79ee93f73e71f88c9367c1d61284a926ad14c8ff8ac8e03850424163516498c0cd57df86eb2ebce6904db62d4868ca6e2660180c0683c16030184cc430fe471042104bc48e3864c7e4a7ef7bb27eeee4e9703405ad3a32ff53a141082835412351a49b04b75f7b3bae3de7b27a9ee326288a524ac0040c83c16030180c06838918c6bf88aaabb584707d9fbdff6963dac8f1905b9a61b615c4fc67050cc781865a91965470d38557e1aaf9976a14e8651846236b690683c16030180c0613318c7f1b94d21600997f7af84fca8cd193c03535c24cc4adc3fe9402f8b114cc56214b8822685323d20c8adbafbd1dbfb9e8da24356926a534c45a98c16030180c0683c1440ce37f45c8083cdfef99fbff183c7de274a0b616663402389d3fa26152dfb0d960d654c16b98b865e18db8ee9ccb9b399eeb47415b59cb32180c0683c16030988861fcafa1eb7ab1dbe59efed8dd8f549e3feb2ca0b11e665323e070fc70414cc201b21d66451902b21dbfbdf2665c73cee5650ebb6386611825ac45190c0683c16030184cc430fed789c563db72b2732f78f096fb0e5c7cdad9561d99c606c0663bfec03fcf838a12cc8a5264b93cf8ede537e2ea7317eef5ba3d172535753b6b490683c16030180c0613318cff1308210886836bba76eaf29bbbafbb73c7856d42a6a11e906d6d1fb20ef1971623dbe9c6cd175f87ab165cbad5eff1de148dc7d7b21c640c0683c16030180c266218ffb79d4f3834865a5614e677bbedeeebeed87ae1ecf9e05a9a2d8f8c2483f21c686539729d2edc7ce90db86ac1259b7c2ecf6de1686425ab03c36030180c0683c1602286f1ff4fc8b434adea9a5f70f3bdb7dcb7fddcd9f3610bb5c28c86415b9a916373e0c62b6fc695e75cb6ddebf2dc148e45d73001c36030180c0683c1602286f1ff7710701c5a822deb73b3722e7de2ee470fcc9f331ff6e666a451829bafbd1d572db8ec80d3eeb838128b6e660286c16030180c0683f1ff1b81350103b0cec88423e1bd6e97e7b43fdcfae01a3599c8ebd7bb1fae9a777195244a33e34ab29c630286c16030180c0683c1440ce33f4dc828aa522a08c284fb6ebeaf34e0f280103246d5b52a265f180c0683c1603018ff31762ba594b50283c16030180c0683c1f8c5c0cec430180c0683c16030180c2662180c0683c16030180c068389180683c16030180c0683c1602286c16030180c0683c1603011c36030180c0683c16030184cc430180c0683c16030180c0613310c0683c16030180c068389180683c16030180c0683c1602286c16030180c0683c1603098886130180c0683c16030184cc430180c0683c16030180c0613310c0683c16030180c0683c1440c83c16030180c0683c1602286c16030180c0683c1603098886130180c0683c16030180c2662180c0683c16030180c0613310c0683c16030180c0683f17fc4ff1b006242cc0e62e1760e0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

CREATE TABLE `ost_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2022-06-28 22:46:30', '2022-06-28 22:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_action`
--

CREATE TABLE `ost_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

CREATE TABLE `ost_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

CREATE TABLE `ost_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(2, NULL, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

CREATE TABLE `ost_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(2, 3, NULL, 'C', 1, NULL, '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(6, 1, 3, 'U', 1, NULL, '2022-06-28 23:08:16', '2022-06-28 23:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

CREATE TABLE `ost_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(1, 28, '1120 5th Street\nAlexandria, LA 71301', NULL),
(1, 29, '3182903674', NULL),
(1, 30, 'https://osticket.com', NULL),
(1, 31, 'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.', NULL),
(2, 23, 'Securities and Exchange Commission', NULL),
(2, 24, 'www.sec.gov.ph', NULL),
(2, 25, '88180921', NULL),
(2, 26, 'Secretariat Building, PICC Complex, Roxas Boulevard, Pasay City, 1307', NULL),
(6, 3, NULL, NULL),
(6, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

CREATE TABLE `ost_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(20, 2, 489265, 'text', 'Issue Summary', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group`
--

CREATE TABLE `ost_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 1, 0, 0, 0, 0, 0, 1, 'E-Fast (ICTD)', NULL, '<p>Questions about products or services</p>', '2022-06-28 22:46:30', '2022-06-29 14:27:08'),
(2, 0, 1, 0, 2, 0, 1, 4, 0, 0, 0, 0, 0, 2, 'Job (HRAD)', NULL, '<p>Tickets that primarily concern the sales and billing departments</p>', '2022-06-28 22:46:30', '2022-06-29 14:26:37'),
(10, 0, 1, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 3, 'SEConomics (ERTD)', NULL, '<p>Product, service, or equipment related issues</p>', '2022-06-28 22:46:30', '2022-06-29 14:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic_form`
--

CREATE TABLE `ost_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_help_topic_form`
--

INSERT INTO `ost_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

CREATE TABLE `ost_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2022-06-28 22:46:30', '2022-06-28 22:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

CREATE TABLE `ost_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_lock`
--

CREATE TABLE `ost_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_note`
--

CREATE TABLE `ost_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization`
--

CREATE TABLE `ost_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2022-06-28 14:46:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization__cdata`
--

CREATE TABLE `ost_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL,
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_organization__cdata`
--

INSERT INTO `ost_organization__cdata` (`org_id`, `name`, `address`, `phone`, `website`, `notes`) VALUES
(1, NULL, '1120 5th Street\nAlexandria, LA 71301', '3182903674', 'https://osticket.com', 'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.');

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

CREATE TABLE `ost_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue`
--

CREATE TABLE `ost_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_queue`
--

INSERT INTO `ost_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:31', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:31', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:31', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:31', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:31', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-06-28 22:46:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_column`
--

CREATE TABLE `ost_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_queue_column`
--

INSERT INTO `ost_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_columns`
--

CREATE TABLE `ost_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_queue_columns`
--

INSERT INTO `ost_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_config`
--

CREATE TABLE `ost_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_export`
--

CREATE TABLE `ost_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sort`
--

CREATE TABLE `ost_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_queue_sort`
--

INSERT INTO `ost_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2022-06-28 22:46:30'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2022-06-28 22:46:30'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2022-06-28 22:46:30'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2022-06-28 22:46:30'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2022-06-28 22:46:30'),
(6, NULL, 'Create Date', '[\"-created\"]', '2022-06-28 22:46:30'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2022-06-28 22:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sorts`
--

CREATE TABLE `ost_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_queue_sorts`
--

INSERT INTO `ost_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ost_role`
--

CREATE TABLE `ost_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_role`
--

INSERT INTO `ost_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2022-06-28 22:46:30', '2022-06-28 22:46:30'),
(5, 1, 'Department User', '{\"ticket.close\":1,\"ticket.markanswered\":1,\"ticket.reply\":1,\"ticket.edit\":1,\"canned.manage\":1}', NULL, '2022-06-29 14:31:25', '2022-06-29 14:32:21'),
(6, 1, 'Department Head', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"ticket.markanswered\":1,\"ticket.reply\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"canned.manage\":1}', NULL, '2022-06-29 14:34:45', '2022-06-29 14:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule`
--

CREATE TABLE `ost_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_schedule`
--

INSERT INTO `ost_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(2, 1, '24/7', NULL, '', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(3, 1, '24/5', NULL, '', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(4, 0, 'U.S. Holidays', NULL, '', '2022-06-28 22:46:31', '2022-06-28 22:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule_entry`
--

CREATE TABLE `ost_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_schedule_entry`
--

INSERT INTO `ost_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2022-06-28 22:46:31'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2022-06-28 22:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sequence`
--

CREATE TABLE `ost_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_sequence`
--

INSERT INTO `ost_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('001afkk51ghsveftm0a1d93cl4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239656561653231656132646533396636396262623666353263626664666532613262616461393465223b733a343a2274696d65223b693a313635363437383339363b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2230656632396331366461366264663565613334386463623435623238393664363a313635363437383339363a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437383435363b, '2022-06-30 12:53:16', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('0kmrfmjga79m0f20662oc4lssp', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264376533356365656633626632626236333063313738313133333833356538626565663431343063223b733a343a2274696d65223b693a313635363436323639313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32353a222f696d6573736167656d6f2f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2233666266393464343464316332376663363336663235353863623537366637393a313635363436323639313a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363436323639313b7d7d6c61737463726f6e63616c6c7c693a313635363436323639313b, '2022-06-30 08:31:31', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('12v79j9uhi7b3hijebk1udl1lv', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238313065656236303065363066653265343065346630353930323031333238373763313033323038223b733a343a2274696d65223b693a313635363432393930363b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232613831366266643931626563646661663665623265393566303237343461373a313635363432393930363a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393936363b, '2022-06-29 23:25:06', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('1jtaa6kr3hs2rbjalfof2q6eet', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238613666663731386661393230393134343532356234663361616362343832316362353939343238223b733a343a2274696d65223b693a313635363436323138383b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262623639363639393862623339663534633364643830386230616538356332313a313635363436323138383a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363436323234383b, '2022-06-30 08:23:08', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('1tvs6hn70s9uss61eqm412eqhm', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232633163633234336331326335323632303164323437376665633734323130613739666536636139223b733a343a2274696d65223b693a313635363433303234343b7d5f617574687c613a313a7b733a343a2275736572223b613a303a7b7d7d3a746f6b656e7c613a303a7b7d636c69656e743a517c4e3b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d, '2022-06-29 23:30:44', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('294d77hcev8pe091qpcgb4h47l', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233396264643761356536393130343664343937333065666466363732633337636637363735393565223b733a343a2274696d65223b693a313635363438323037313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a303a7b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2235353036363335396333623133653362303334366466383933326534623637353a313635363438323031323a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d, '2022-06-30 13:54:31', NULL, '0', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('2aqjkmlrdoa05krmuae3ek6p8v', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231346565633033323565613764343664316439616531346433646435363366653033376663623830223b733a343a2274696d65223b693a313635363437343634333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234663830396430663766613265303633613262643563346138333361633966373a313635363437343634333a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a333b733a323a227132223b643a333b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437343531373b7d7d6c61737463726f6e63616c6c7c693a313635363437343634333b, '2022-06-30 11:50:43', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('2hlr9em2c1lu1bb7d09e0lclt8', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265626561636139643061313566336362333139316234373133363964306635393264626432343137223b733a343a2274696d65223b693a313635363437373039343b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265643538666430343633626665366161623831633566363133653362636562623a313635363437373039343a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437373135343b, '2022-06-30 12:31:34', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('30s0iq8or3fr7dr8056qe46531', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236363761313837313061363962613762383130643262306362623239313735646334666436633138223b733a343a2274696d65223b693a313635363436343237303b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262663763666237383030653466616234666363356630633236303135363935663a313635363436343237303a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363436343333303b, '2022-06-30 08:57:50', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('30v79a1llgumlnkdcgd0sm1rm1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264653962363961383735646532636339336130613165643139663233666531363732633631376164223b733a343a2274696d65223b693a313635363437393434383b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-06-30 13:10:48', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('37a9joope55c0j6maghtlkro20', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234323135356236623033323136383266383731373631316330383663363564666532393463626365223b733a343a2274696d65223b693a313635363432393039343b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237396233373035353930666638383061373131303437373838633463306332373a313635363432393039343a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393135343b, '2022-06-29 23:11:34', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('37vkm334sf9ig148t7jhe5ugh7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266613239376331633561623338306361616465623233383639366338313337643162373664366166223b733a343a2274696d65223b693a313635363433303236373b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d, '2022-06-29 23:31:07', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('3dkbqauccuhvgdmqet0qjk6jg7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231363162623538393435633331663437363539346433303236303436386430353337303734653033223b733a343a2274696d65223b693a313635363437363933383b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237393265343435353865616337313433323831366233303439303638666666393a313635363437363933383a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437363939383b, '2022-06-30 12:28:58', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('3h0128n11flvpsuamm0rca2o6v', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239323335306233643139326432623663333964636535313332333561316135323033653561653161223b733a343a2274696d65223b693a313635363437333339303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230643731623233623030313830653166316530636162616266623561666638383a313635363437333339303a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a333b733a323a227132223b643a333b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437333338333b7d7d6c61737463726f6e63616c6c7c693a313635363437333338333b, '2022-06-30 11:29:50', NULL, '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('3idfg1p449rgihbkbfmkhctiq6', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237313736353231353765306263633033346164393039656537613662313634323231653933633762223b733a343a2274696d65223b693a313635363432393830373b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2261373465616535623264323730386666656431623130646532636635346331313a313635363432393830373a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393836373b, '2022-06-29 23:23:27', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('4ell2gol1bvf06lsf3a1r8jd94', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262663961313063633437343431393530393237366361626462633766386637323633626134353836223b733a343a2274696d65223b693a313635363437383532393b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265313537633765363938366132376463303234393036306236616263663432353a313635363437383532393a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437383538393b, '2022-06-30 12:55:29', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('5206n8ghqnoab8mpk1ggqfaorg', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262343136363636333933643631616439376131663566393630303264653734623930353632376336223b733a343a2274696d65223b693a313635363437313337373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-06-30 10:56:17', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('5imb45u598i9h752o00bm0mci4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232353934386135343465663664623731333464666661623335313231323462343739626233323835223b733a343a2274696d65223b693a313635363437323431373b7d5f617574687c613a313a7b733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a313b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2237626336323261346463373730633531346332623462333463323036333633303a313635363437323431373a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437323437373b, '2022-06-30 11:13:37', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('6blnj3iphrsbc3kodpqqqqs5ho', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262656562303166373661353165323066323563393036393766383663393261323035316265356130223b733a343a2274696d65223b693a313635363432393730373b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2239303065653734653235666638353962316433373266353135356636316636343a313635363432393730373a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393736373b, '2022-06-29 23:21:47', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('6eq67ecu1glfls3h14n6tkgp0n', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264386532613137363633353331623964613437666430313838616437616638623730653431356333223b733a343a2274696d65223b693a313635363437393238303b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a323a7b733a363a22636c69656e74223b733a37363a2233386338373633383936313465363365383235323738643333633231333132663a313635363437393234343a3833376563353735346635303363666161656530393239666434383937346537223b733a353a227374616666223b733a37363a2234613839373963383533343136663139613339646431346463656664333263393a313635363437393238303a3833376563353735346635303363666161656530393239666434383937346537223b7d5f73746166667c613a313a7b733a343a2261757468223b613a313a7b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d4b415055547c693a313635363437393334303b, '2022-06-30 13:08:00', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('6pumnjj71td2nfg091hljit1sc', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237653963373439633531383861666462613033336634666338363563633562613835353536353465223b733a343a2274696d65223b693a313635363437383138323b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2232613331333733653763663935386431313335383032306430613833663432613a313635363437383138323a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437383234323b, '2022-06-30 12:49:42', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('6u10gfknv9786q2jif256rlv27', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238653134323365663533353962316339353362633030373336643261373331666363653466366235223b733a343a2274696d65223b693a313635363438303839303b7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2238333033316339366463343631616637613766653162333838373332633033373a313635363438303239303a3833376563353735346635303363666161656530393239666434383937346537223b733a363a22636c69656e74223b733a37363a2262636535643962613561663036396139373933643564363330323862663137343a313635363438303839303a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363438303239303b7d7d6c61737463726f6e63616c6c7c693a313635363438303239303b, '2022-06-30 13:34:50', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('6vk4r91p10u503dvknsmkq5feh', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264386532613137363633353331623964613437666430313838616437616638623730653431356333223b733a343a2274696d65223b693a313635363437393234343b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2233386338373633383936313465363365383235323738643333633231333132663a313635363437393234343a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437393330343b, '2022-06-30 13:07:24', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('79kh0oee38fskrj5eontclivfe', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233313537326131396539356139656266373564323239623264323435643866316636643163633064223b733a343a2274696d65223b693a313635363438323132373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2235353036363335396333623133653362303334366466383933326534623637353a313635363438323031323a6266336438306636373039306261643234626535383536326166336232656336223b733a363a22636c69656e74223b733a37363a2230636332393362656439613438353533613563306439356535353765323365353a313635363438323132373a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d4b415055547c693a313635363438323138383b, '2022-06-30 13:55:28', NULL, '0', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('7bon2p946ddm4nkve2jrm8jt1j', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264303066643136386239373230613232646365333731333665363238633765326230346161646230223b733a343a2274696d65223b693a313635363437333636363b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231636465623238663164393965336132353863616533636135373263653839343a313635363437333636363a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437333732363b, '2022-06-30 11:34:26', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('7ib94cnsg04eg5a361dqsk6130', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263336532663234623835303639396335303139376666303332666164373761383332326330633362223b733a343a2274696d65223b693a313635363437323538323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262613838383933383333353937616561333931663765366634393337616532663a313635363437323538323a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437323634323b, '2022-06-30 11:16:22', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('7qpgs8mlvgu8suoi8gkieujp7e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264303333663031363363386362323239346661333436393665366162323839356636336336326538223b733a343a2274696d65223b693a313635363432393333363b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a323b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2266393231636566313362366139613637303063626534653432383465346364663a313635363432393333363a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393339363b, '2022-06-29 23:15:36', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('89q2av5v8eqkg0qhj16s6v67aj', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264376533356365656633626632626236333063313738313133333833356538626565663431343063223b733a343a2274696d65223b693a313635363436323232303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32353a222f696d6573736167656d6f2f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232653239336436623534656634396538353766623436616530643861336237313a313635363436323232303a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363436323238303b, '2022-06-30 08:23:40', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('8gkigltdf1dhlp6vqepcko6796', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616262376365663239363765366232343337396337646631626131663232313263646564653936223b733a343a2274696d65223b693a313635363438323338313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2235353036363335396333623133653362303334366466383933326534623637353a313635363438323031323a6266336438306636373039306261643234626535383536326166336232656336223b733a363a22636c69656e74223b733a37363a2235613336333765663762656438353238383730666431343163386366323863613a313635363438323338313a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d4b415055547c693a313635363438323434333b, '2022-06-30 13:59:43', NULL, '0', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('8gpt22ga72hsb2jk1nrpeunb84', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239363661616530323334666161316331623934643435653436373165643461343831353762643564223b733a343a2274696d65223b693a313635363438353533373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-06-30 14:52:17', NULL, '0', '10.237.2.160', 'Viber'),
('8kt0qv0mlppqbd5ipsju1fcnl3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616262376365663239363765366232343337396337646631626131663232313263646564653936223b733a343a2274696d65223b693a313635363438353539303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d733a343a2275736572223b4e3b7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2238376365353339383065653439626233663633343534356265623565326263623a313635363438353539303a6266336438306636373039306261643234626535383536326166336232656336223b733a363a22636c69656e74223b733a37363a2239383131376265303037626131323461373235333336326634356439393733383a313635363438323335303a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363438353538353b7d7d6c61737463726f6e63616c6c7c693a313635363438353538363b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c433a383a225175657279536574223a323535393a7b613a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b433a313a2251223a3130363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a35373a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d7d7d693a313b433a313a2251223a3338333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a3333333a7b613a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b433a313a2251223a37363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d7d693a313b433a313a2251223a3130303a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d7d693a323b433a313a2251223a37333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a323a7b693a303b693a313b693a313b693a333b7d7d7d7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b433a313a2251223a37343a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d, '2022-06-30 14:53:10', NULL, '1', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('915u85etgv7bjpk481etr05uoe', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233656133356566326533316633346336643535393837633532613165656333373634633464353035223b733a343a2274696d65223b693a313635363437333638373b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237323332663365353665636230366431363938346337353262366333663934383a313635363437333638373a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437333734373b, '2022-06-30 11:34:47', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('9ot49jv20nkem4b1hol9f9450a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234393062393130343063646262326539643035326566373465633739396137373638633037653530223b733a343a2274696d65223b693a313635363437333331393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2264636464636162303139313261323431306430626464613866306564653239633a313635363437333331393a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437333337393b, '2022-06-30 11:28:39', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('9smejiv6bbl9iu2dhj328itoa7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265626561636139643061313566336362333139316234373133363964306635393264626432343137223b733a343a2274696d65223b693a313635363437373235303b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2238383063646234346463646265626661373235353732393539623063636134623a313635363437373235303a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437373039343b7d7d6c61737463726f6e63616c6c7c693a313635363437373039353b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d, '2022-06-30 12:34:10', NULL, '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('9tl4k32lb4ivvi75o4f5bin1p3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266353763613630326264303139303066303162633464373732366331393934383733636162626530223b733a343a2274696d65223b693a313635363432393832373b7d5f617574687c613a323a7b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2230343437356134346233656365633163353964323939623236633665616561373a313635363432393832373a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d4b415055547c693a313635363432393839303b, '2022-06-29 23:23:50', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36');
INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('akf4ve67tdfq65oappmr80dqnj', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234393062393130343063646262326539643035326566373465633739396137373638633037653530223b733a343a2274696d65223b693a313635363437333332323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234326433373638636661343030353965393663346334623931616566643536373a313635363437333332323a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d6c61737463726f6e63616c6c7c693a313635363437333332303b, '2022-06-30 11:28:42', NULL, '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('asjnbjsn07fusu42mvcun01e7s', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239656561653231656132646533396636396262623666353263626664666532613262616461393465223b733a343a2274696d65223b693a313635363437383431313b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d5f617574687c613a323a7b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2236376635326665353637333632313737303862666263313830386535343639313a313635363437383431313a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d4b415055547c693a313635363437383437333b, '2022-06-30 12:53:33', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('b0vvvs149udb9l5gu2i2d6tp3r', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232353934386135343465663664623731333464666661623335313231323462343739626233323835223b733a343a2274696d65223b693a313635363437323532363b7d5f617574687c613a313a7b733a343a2275736572223b613a303a7b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a303a7b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d636c69656e743a517c4e3b, '2022-06-30 11:15:26', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('c1lr0163hcju9sj3j0ujpfvlst', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236366538613164333862366263363263666665343630633631393534393731656430396334303262223b733a343a2274696d65223b693a313635363437393831343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2263346334323065616232343538646361653737386464653162373662306336313a313635363437393831343a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437393837343b, '2022-06-30 13:16:54', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('c6tu83viinimop5ib52iomq45g', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266333933653763626461303031323666333736353534336462376666393238643362366230346538223b733a343a2274696d65223b693a313635363437343637313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2239393935663731376465306434646565333735396337653733396462336335323a313635363437343637313a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437343733313b, '2022-06-30 11:51:11', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('d56jlnuqpa1a89i7u27534qedm', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616262376365663239363765366232343337396337646631626131663232313263646564653936223b733a343a2274696d65223b693a313635363438323338373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a303a7b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2235353036363335396333623133653362303334366466383933326534623637353a313635363438323031323a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2022-06-30 13:59:47', NULL, '0', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('dlallojuq3clr4r5gtkpvnioat', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235613634633633346462376337633433626662663438626561303330303737663364656462626364223b733a343a2274696d65223b693a313635363432393735353b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2238353530623366316165343061373931613731323137666664343033343662383a313635363432393735353a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393831353b, '2022-06-29 23:22:35', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('dq2tapdcuj8h3jl0iqr7vopjif', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237386138663836343931623035336162663637636238306162303930393237396532646430666562223b733a343a2274696d65223b693a313635363437313838373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d, '2022-06-30 11:04:47', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('e0fcjhld73c0vmmudb55vmg9qi', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234336132633231323737343331393138663437303437663061393830313937336461613462636462223b733a343a2274696d65223b693a313635363437363837323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32373a222f696d6573736167656d6f2f7363702f7469636b6574732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234653934373830383334633065376231616238363539346139616337326261353a313635363437363837323a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437363830313b7d7d6c61737463726f6e63616c6c7c693a313635363437363830313b, '2022-06-30 12:27:52', NULL, '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('edv5jeanmbb2h6a6bs0afh70ja', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239616434643364383439643136326235396335633763633938663032613035646261363232393234223b733a343a2274696d65223b693a313635363437393935373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32353a222f696d6573736167656d6f2f7363702f75736572732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2238313262623265663262323364303030366438393037353265653562616432313a313635363437393935373a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363438303031373b, '2022-06-30 13:19:17', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('eik15jkv54v3fg72nv130meu8p', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266333933653763626461303031323666333736353534336462376666393238643362366230346538223b733a343a2274696d65223b693a313635363437343831363b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230653565633534313566653333356335336236323261623534336238653364383a313635363437343831363a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a333b733a323a227132223b643a333b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437343637313b7d7d6c61737463726f6e63616c6c7c693a313635363437343637313b3a3a513a547c693a383b736f72747c613a323a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d693a383b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a313a7b733a363a22636c6f736564223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a353b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a31313a22436c6f7365642044617465223b733a373a22636f6c756d6e73223b733a31313a225b222d636c6f736564225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c433a383a225175657279536574223a323535393a7b613a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b433a313a2251223a3130363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a35373a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d7d7d693a313b433a313a2251223a3338333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a3333333a7b613a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b433a313a2251223a37363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d7d693a313b433a313a2251223a3130303a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d7d693a323b433a313a2251223a37333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a323a7b693a303b693a313b693a313b693a333b7d7d7d7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b433a313a2251223a37343a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a513a6f7267737c433a383a225175657279536574223a3633303a7b613a31363a7b733a353a226d6f64656c223b733a31323a224f7267616e697a6174696f6e223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a343a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31303a22757365725f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a353a227573657273223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31303a22757365725f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d, '2022-06-30 11:53:36', NULL, '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('emh2cdpf7dggm11s05t9asbr97', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237343862323633376632633132333533393262306539306632623638353665363965643138613138223b733a343a2274696d65223b693a313635363437393634333b7d, '2022-06-30 13:14:03', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('fr51f0iuvopvcgl70pd2anoc51', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230636266396231313039656262333765656532613963343237633964323530633539316136303562223b733a343a2274696d65223b693a313635363437303935303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265363966643165343830643639636338386531343935323337353638316561623a313635363437303730393a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437303730353b7d7d6c61737463726f6e63616c6c7c693a313635363437303730353b, '2022-06-30 10:49:10', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('g44vileon2blcfu9metjc614ht', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231643161623230376539626435653334393463386236386431356666633133393331633838393664223b733a343a2274696d65223b693a313635363437373931353b7d5f617574687c613a323a7b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d733a353a227374616666223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a323a7b733a363a22636c69656e74223b733a37363a2265633134333935326431363533623036663435376230303039353366336266373a313635363437373839393a3833376563353735346635303363666161656530393239666434383937346537223b733a353a227374616666223b733a37363a2265396361346466666239653032323261666362626333333331393930393232333a313635363437373931353a3833376563353735346635303363666161656530393239666434383937346537223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d4b415055547c693a313635363437373937353b, '2022-06-30 12:45:15', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('gduvrlhmmvd6a8blb0jcrfcef4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236363761313837313061363962613762383130643262306362623239313735646334666436633138223b733a343a2274696d65223b693a313635363436353731313b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2233386336623139383932653639623338613335623863633365386632623831643a313635363436353731313a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363436353037393b7d7d6c61737463726f6e63616c6c7c693a313635363436353236313b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c433a383a225175657279536574223a323535393a7b613a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b433a313a2251223a3130363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a35373a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d7d7d693a313b433a313a2251223a3338333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a3333333a7b613a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b433a313a2251223a37363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d7d693a313b433a313a2251223a3130303a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d7d693a323b433a313a2251223a37333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a323a7b693a303b693a313b693a313b693a333b7d7d7d7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b433a313a2251223a37343a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d, '2022-06-30 09:21:51', NULL, '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('ghdu56h2et3lbke3fa4r9a1q75', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616262376365663239363765366232343337396337646631626131663232313263646564653936223b733a343a2274696d65223b693a313635363438353538353b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2232636232366561663063323863666365633362356335643731386134313739623a313635363438353538353a6266336438306636373039306261643234626535383536326166336232656336223b733a363a22636c69656e74223b733a37363a2239383131376265303037626131323461373235333336326634356439393733383a313635363438323335303a6266336438306636373039306261643234626535383536326166336232656336223b7d4b415055547c693a313635363438353634353b5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d, '2022-06-30 14:53:05', NULL, '0', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('hfd8v94p9logc2cvortfl3gtg1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238653134323365663533353962316339353362633030373336643261373331666363653466366235223b733a343a2274696d65223b693a313635363438303839303b7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d733a343a2275736572223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2238333033316339366463343631616637613766653162333838373332633033373a313635363438303239303a3833376563353735346635303363666161656530393239666434383937346537223b733a363a22636c69656e74223b733a37363a2262636535643962613561663036396139373933643564363330323862663137343a313635363438303839303a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363438303239303b7d7d6c61737463726f6e63616c6c7c693a313635363438303239303b4b415055547c693a313635363438303935303b, '2022-06-30 13:34:50', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('hntjlvtk7o45rjckqau20qspsl', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233306464366631646465393661333165353761303466346562383534636162646637623737653863223b733a343a2274696d65223b693a313635363436393635393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33313a222f696d6573736167656d6f2f7363702f656d61696c732e7068703f69643d32223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a323b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234373163636633363735383337393731616432313763366636653330313830393a313635363436393635393a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363436393731393b, '2022-06-30 10:27:39', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('hrokf7hdf2g12bvjhnssu4c2hb', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234666430316534623931633064313537343732643734326635326162666533623330373633363661223b733a343a2274696d65223b693a313635363437313739373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-06-30 11:03:17', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('hu68ug0c7phaf9vscgd8jarb7d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231643161623230376539626435653334393463386236386431356666633133393331633838393664223b733a343a2274696d65223b693a313635363437373838303b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2264633361663238333135306565366438363662393437363836326435646664343a313635363437373838303a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437373934303b, '2022-06-30 12:44:40', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('i2b9d79ccbqghb2ukeck52scef', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237343838613666373934323232363538663261353234393338386435646538366231303639656535223b733a343a2274696d65223b693a313635363437383436313b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a313a7b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236623538346433313365663638653032346561306537363363653762653130363a313635363437383436313a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437383532313b, '2022-06-30 12:54:21', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('iolv5lvdfajio8ivo81nf2nqv2', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231346565633033323565613764343664316439616531346433646435363366653033376663623830223b733a343a2274696d65223b693a313635363437343230393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236643737383638366234323966656430316565356131636264343263353633393a313635363437343230393a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437343236393b, '2022-06-30 11:43:29', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('jlv03c0jvq380ihq58lirtnfe7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236366538613164333862366263363263666665343630633631393534393731656430396334303262223b733a343a2274696d65223b693a313635363437393933343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d3a746f6b656e7c613a323a7b733a363a22636c69656e74223b733a37363a2235353832316332616561396434323833626365333933373436373863343065643a313635363437393933343a3833376563353735346635303363666161656530393239666434383937346537223b733a353a227374616666223b733a37363a2261616332303762396361636134306463666239613039393335366162373331623a313635363437393932373a3833376563353735346635303363666161656530393239666434383937346537223b7d636c69656e743a517c4e3b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437393932373b7d7d6c61737463726f6e63616c6c7c693a313635363437393932373b, '2022-06-30 13:18:54', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('jqo4rudoqca4dk10r7uvjn3uud', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266353763613630326264303139303066303162633464373732366331393934383733636162626530223b733a343a2274696d65223b693a313635363432393034323b7d5f617574687c613a323a7b733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a333b7d733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2230336136373836346435616635323033653662306537636532323938623733633a313635363432393034323a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393130323b, '2022-06-29 23:10:42', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('kb38tnb12d8irm9c5ogq2ndg1k', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231383738663234356133313132356638613138353938633239663438356336356563616135383531223b733a343a2274696d65223b693a313635363436343230333b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2264326162626637356230363131373531313035323535333838656135666339623a313635363436343230333a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363436343236333b, '2022-06-30 08:56:43', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36');
INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('kb700jsjlovlnd3m59bprfkf6b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266353763613630326264303139303066303162633464373732366331393934383733636162626530223b733a343a2274696d65223b693a313635363433303138363b7d5f617574687c613a323a7b733a343a2275736572223b613a303a7b7d733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a303a7b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d, '2022-06-29 23:29:46', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('l3pvpvn2ek9ndqeturjnd181s5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266323636336433333865646136613734646430636438383033363533653836353835343030626532223b733a343a2274696d65223b693a313635363432373839353b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32353a222f696d6573736167656d6f2f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a323b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231666337373761376430303038616534363835636234613030396662656563643a313635363432373839353a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432373935353b, '2022-06-29 22:51:35', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('l7g0stjnrtoim839166o5ss3np', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232633163633234336331326335323632303164323437376665633734323130613739666536636139223b733a343a2274696d65223b693a313635363433303232343b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2230346165376462313364623434643337663062633861323233313531306665663a313635363433303232343a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363433303238343b, '2022-06-29 23:30:24', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('lcvl8opuceh96dkfacppuljmsa', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232346333626664316332386535303631653438363837313436656464623532393161373965313163223b733a343a2274696d65223b693a313635363438303238393b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2266633438623433303633313234336335613333616561636138396266343932393a313635363438303238393a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363438303334393b, '2022-06-30 13:24:49', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('m8ierva9c2kqqre0uoet55jjo0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236366538613164333862366263363263666665343630633631393534393731656430396334303262223b733a343a2274696d65223b693a313635363437393932373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d3a746f6b656e7c613a323a7b733a363a22636c69656e74223b733a37363a2231353764613739323063336438316530653830373039343936623465313563383a313635363437393833343a3833376563353735346635303363666161656530393239666434383937346537223b733a353a227374616666223b733a37363a2261616332303762396361636134306463666239613039393335366162373331623a313635363437393932373a3833376563353735346635303363666161656530393239666434383937346537223b7d636c69656e743a517c4e3b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d4b415055547c693a313635363437393938373b, '2022-06-30 13:18:47', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('narc6ra0jfb07k7qtbg36otmhj', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233306464366631646465393661333165353761303466346562383534636162646637623737653863223b733a343a2274696d65223b693a313635363437303131323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33313a222f696d6573736167656d6f2f7363702f656d61696c732e7068703f69643d32223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262626633313931313632383963626333643763343330376662393034303833383a313635363437303131323a3833376563353735346635303363666161656530393239666434383937346537223b7d6c61737463726f6e63616c6c7c693a313635363437303032383b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d, '2022-06-30 10:35:12', NULL, '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('nr3isk3hpltaj8kbnfee51gt9h', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239336532636461313531613636373939623432373738363538633964383333653535363837323038223b733a343a2274696d65223b693a313635363432393836373b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263636535316338623761303039303932623837353661313831623432353639393a313635363432393836373a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363432393932373b, '2022-06-29 23:24:27', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('nv0m65igmscesvic3ok317pnk7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261373530643735303337313731613436663064613039363161653464373334633662343331393764223b733a343a2274696d65223b693a313635363436323831333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230323437363166343330633666386461396562353737616632363930393135313a313635363436323831333a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363436323837333b, '2022-06-30 08:33:33', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('oq5uogtpdljuidmis18hgssdgv', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239653634306538383732373563643263393033633261613331613539616361303638353162356532223b733a343a2274696d65223b693a313635363437373532333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2264636630306236316361626132376238636438663036343537383131353863653a313635363437373531363a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437373337353b7d7d6c61737463726f6e63616c6c7c693a313635363437373337353b5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d, '2022-06-30 12:38:43', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('ou3fso34381kvt49lu7331s716', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233313537326131396539356139656266373564323239623264323435643866316636643163633064223b733a343a2274696d65223b693a313635363438323136343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2233373037636631633461646237306135333464613361303138313535303737633a313635363438323136343a6266336438306636373039306261643234626535383536326166336232656336223b733a363a22636c69656e74223b733a37363a2264333238353465396666303631643733383038376132343035653166333535633a313635363438323132393a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d4b415055547c693a313635363438323232343b, '2022-06-30 13:56:04', NULL, '0', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('p89ts49hqik59shumrhsdfvsjj', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232353934386135343465663664623731333464666661623335313231323462343739626233323835223b733a343a2274696d65223b693a313635363437323434373b7d5f617574687c613a313a7b733a343a2275736572223b613a323a7b733a323a226964223b693a333b733a333a226b6579223b733a383a22636c69656e743a33223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d3a746f6b656e7c613a313a7b733a363a22636c69656e74223b733a37363a2235383632333033323636333235343237643961616230373334316436663063623a313635363437323434373a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d4b415055547c693a313635363437323531303b, '2022-06-30 11:14:10', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('pr7h3upe1kqi57ttugpcj1g9al', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238313065656236303065363066653265343065346630353930323031333238373763313033323038223b733a343a2274696d65223b693a313635363432393934373b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2233363535633763336231386534613966313032303233623334646339613136633a313635363432393934373a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363432393930363b7d7d6c61737463726f6e63616c6c7c693a313635363432393930363b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c433a383a225175657279536574223a323436393a7b613a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b433a313a2251223a3130363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a35373a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d7d7d693a313b433a313a2251223a3239333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a3234333a7b613a333a7b693a303b693a303b693a313b693a323b693a323b613a323a7b693a303b433a313a2251223a37363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a323b7d7d7d693a313b433a313a2251223a3130303a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a323b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b433a313a2251223a37343a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a6d7367737c613a303a7b7d, '2022-06-29 23:25:47', NULL, '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('qa9eid1kcecnbstefr64e5goug', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263336532663234623835303639396335303139376666303332666164373761383332326330633362223b733a343a2274696d65223b693a313635363437333232363b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231613064353263336166343031323331623831346435363036663435646130303a313635363437323538393a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a333b733a323a227132223b643a333b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437323538333b7d7d6c61737463726f6e63616c6c7c693a313635363437323538333b, '2022-06-30 11:27:06', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('r8rpl9i7t3k0im21gsk4hibrqe', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230636266396231313039656262333765656532613963343237633964323530633539316136303562223b733a343a2274696d65223b693a313635363437303730343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232383631353261346466316139383636326266336434646166643835353238343a313635363437303730343a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437303736343b, '2022-06-30 10:45:04', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('ridndfp0k48e9844dnrlfg5evm', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238613666663731386661393230393134343532356234663361616362343832316362353939343238223b733a343a2274696d65223b693a313635363436323432363b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262376566316364623636363964393665353566383836383437653834306439333a313635363436323431383a3833376563353735346635303363666161656530393239666434383937346537223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d6c61737463726f6e63616c6c7c693a313635363436323431383b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363436323431383b7d7d, '2022-06-30 08:27:06', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('rk1l3lshsqfcu996akv90dpp7p', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239353733333338636232316530663035386334396232386638373530333631363966616264356265223b733a343a2274696d65223b693a313635363437303633373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-06-30 10:43:57', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('rmlq7jfhe719c53brm9msde5kn', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236323831343363653837343864396533663632643138303835313036636430383432383136313931223b733a343a2274696d65223b693a313635363437343137343b7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a32333a226c6f63616c3a73616e6761627269656c2e72616e676572223b733a333a22326661223b4e3b7d733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2264346238303132666231336562653134396263313766386632643237616165353a313635363437343137343a3833376563353735346635303363666161656530393239666434383937346537223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363437343137343b7d7d6c61737463726f6e63616c6c7c693a313635363437343137343b, '2022-06-30 11:42:54', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('rmlv7hjdk6o4gjn9j8o1j2s478', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230376665656235366431333730356664396333333630336664373632336537313163343634383363223b733a343a2274696d65223b693a313635363437383331333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-06-30 12:51:53', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('rrndf28ups2taf5o0ctosi268j', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237653963373439633531383861666462613033336634666338363563633562613835353536353465223b733a343a2274696d65223b693a313635363437383139373b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a303a7b7d7d3a746f6b656e7c613a303a7b7d636c69656e743a517c4e3b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d, '2022-06-30 12:49:57', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('s8e98339l6vdfm1jco76liaq0a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239323335306233643139326432623663333964636535313332333561316135323033653561653161223b733a343a2274696d65223b693a313635363437333338323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2266623437653031356331646135356563316334646337643735656136663763663a313635363437333338323a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437333434323b, '2022-06-30 11:29:42', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('sc7e7m45m55m66ff21ttk6a51b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239656561653231656132646533396636396262623666353263626664666532613262616461393465223b733a343a2274696d65223b693a313635363437383433343b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a32303a222f696d6573736167656d6f2f6f70656e2e706870223b7d7d5f617574687c613a323a7b733a343a2275736572223b613a303a7b7d733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f696d6573736167656d6f2f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a303a7b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d636c69656e743a517c4e3b, '2022-06-30 12:53:54', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('sqqbg2bl9ojdqc56gejhec03id', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239653634306538383732373563643263393033633261613331613539616361303638353162356532223b733a343a2274696d65223b693a313635363437373337353b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f696d6573736167656d6f2f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262623331316534336333616639326135353031363832386137326132303536303a313635363437373337353a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437373433353b, '2022-06-30 12:36:15', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('t51govi57so7an3gh0katefq35', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236323831343363653837343864396533663632643138303835313036636430383432383136313931223b733a343a2274696d65223b693a313635363437333931323b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232656234643461363632303263633061333636343865643238616435653064613a313635363437333931323a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437333937323b, '2022-06-30 11:38:32', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('tdrbq4nj6dj8b6ttrcs68rufff', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616262376365663239363765366232343337396337646631626131663232313263646564653936223b733a343a2274696d65223b693a313635363438353235383b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f7469636b6574696e672f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6a6d706c69726163223b733a333a22326661223b4e3b7d733a343a2275736572223b4e3b7d3a746f6b656e7c613a323a7b733a353a227374616666223b733a37363a2266663132343132303564333365316333636239303335626565343437613666353a313635363438353235383a6266336438306636373039306261643234626535383536326166336232656336223b733a363a22636c69656e74223b733a37363a2239383131376265303037626131323461373235333336326634356439393733383a313635363438323335303a6266336438306636373039306261643234626535383536326166336232656336223b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a31393a222f7469636b6574696e672f6f70656e2e706870223b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30362d32382032323a34363a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6b6449796e626e72735236776249524e705775475536414c5774353378675651223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313635363438353136373b7d7d6c61737463726f6e63616c6c7c693a313635363438353136373b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d, '2022-06-30 14:47:38', NULL, '1', '10.237.2.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('ubehp7a3mh73hii7d16745ouko', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234336132633231323737343331393138663437303437663061393830313937336461613462636462223b733a343a2274696d65223b693a313635363437363830303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32373a222f696d6573736167656d6f2f7363702f7469636b6574732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263373465626263643665396166373132313166623337663537326331373563303a313635363437363830303a3833376563353735346635303363666161656530393239666434383937346537223b7d4b415055547c693a313635363437363836303b, '2022-06-30 12:26:40', NULL, '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

CREATE TABLE `ost_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2022-06-28 22:46:30', '2022-06-28 22:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

CREATE TABLE `ost_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'jmplirac', 'JM', 'Lirac', '$2a$08$brk4.4G1QirL/npVz8DO..V8Efpb2pyVJwkyQc1DS1rrWbkarQEQ.', NULL, 'jmplirac@sec.gov.ph', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\",\"def_assn_role\":true}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2022-06-28 22:46:31', '2022-06-29 14:53:05', '2022-06-28 22:46:31', '2022-06-29 14:53:05'),
(2, 3, 5, 'sangabriel.ranger', 'Sangabriel', 'Ranger', '$2a$08$xSsJ.D/03B9gSUfDsJoWVuXI5F68EBupucV5GlRtkL7BF41SM3XRm', NULL, 'sangabriel.ranger@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 'none', 'Letter', '{\"def_assn_role\":true,\"browser_lang\":\"en_US\"}', '{\"faq.manage\":1,\"visibility.agents\":1,\"visibility.departments\":1,\"stats.agents\":1}', '2022-06-28 23:14:37', '2022-06-29 14:01:16', '2022-06-28 23:23:14', '2022-06-29 14:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff_dept_access`
--

CREATE TABLE `ost_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_staff_dept_access`
--

INSERT INTO `ost_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

CREATE TABLE `ost_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '::1', '2022-06-28 22:46:31', '2022-06-28 22:46:31'),
(2, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 22:51:38', '2022-06-28 22:51:38'),
(3, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 22:51:38', '2022-06-28 22:51:38'),
(4, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 22:56:27', '2022-06-28 22:56:27'),
(5, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 22:56:27', '2022-06-28 22:56:27'),
(6, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:03:27', '2022-06-28 23:03:27'),
(7, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:03:27', '2022-06-28 23:03:27'),
(8, 'Error', 'Mailer Error', 'Unable to email via php mail function:\"Sangabriel Ranger\" mail() returned failure ', '', '::1', '2022-06-28 23:06:32', '2022-06-28 23:06:32'),
(9, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:06:34', '2022-06-28 23:06:34'),
(10, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:06:34', '2022-06-28 23:06:34'),
(11, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:07:29', '2022-06-28 23:07:29'),
(12, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'U\' AND object_id=2] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(User))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(User), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(User))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.user.php(665): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\ajax.users.php(266): User-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.dispatcher.php(145): UsersAjaxAPI-&gt;delete(\'2\')<br /> #8 C:\\xampp\\htdocs\\imessagemo\\include\\class.dispatcher.php(38): UrlMatcher-&gt;dispatch(\'/2/delete\', Array)<br /> #9 C:\\xampp\\htdocs\\imessagemo\\include\\class.dispatcher.php(120): Dispatcher-&gt;resolve(\'/2/delete\', Array)<br /> #10 C:\\xampp\\htdocs\\imessagemo\\include\\class.dispatcher.php(38): UrlMatcher-&gt;dispatch(\'/users/2/delete\', NULL)<br /> #11 C:\\xampp\\htdocs\\imessagemo\\scp\\ajax.php(316): Dispatcher-&gt;resolve(\'/users/2/delete\')<br /> #12 {main}', '', '::1', '2022-06-28 23:07:29', '2022-06-28 23:07:29'),
(13, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [2163e61c08cc21ab9d6b054af8722c5405ac9318] on http://localhost/imessagemo/login.php', '', '::1', '2022-06-28 23:07:44', '2022-06-28 23:07:44'),
(14, 'Error', 'Mailer Error', 'Unable to email via php mail function:\"Sangabriel Ranger\" mail() returned failure ', '', '::1', '2022-06-28 23:08:18', '2022-06-28 23:08:18'),
(15, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:09:34', '2022-06-28 23:09:34'),
(16, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:09:34', '2022-06-28 23:09:34'),
(17, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [3958109feda3a3a9689fbb0e508f9caf952bfad2] on http://localhost/imessagemo/login.php', '', '::1', '2022-06-28 23:09:36', '2022-06-28 23:09:36'),
(18, 'Warning', 'Failed login attempt (user)', 'Username: sangabriel.ranger@gmail.com IP: ::1 Time: Jun 28, 2022, 3:09 pm UTC Attempts: 3', '', '::1', '2022-06-28 23:09:49', '2022-06-28 23:09:49'),
(19, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [9f1e34b3e2e12253787f78499362af6ae4570b2b] on http://localhost/imessagemo/login.php', '', '::1', '2022-06-28 23:10:25', '2022-06-28 23:10:25'),
(20, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:11:36', '2022-06-28 23:11:36'),
(21, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:11:36', '2022-06-28 23:11:36'),
(22, 'Error', 'Mailer Error', 'Unable to email via php mail function:sangabriel.ranger@gmail.com mail() returned failure ', '', '::1', '2022-06-28 23:14:39', '2022-06-28 23:14:39'),
(23, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:14:42', '2022-06-28 23:14:42'),
(24, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:14:42', '2022-06-28 23:14:42'),
(25, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:15:39', '2022-06-28 23:15:39'),
(26, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:15:39', '2022-06-28 23:15:39'),
(27, 'Warning', 'Agent Password Reset', 'Password reset was attempted for agent: Sangabriel Ranger<br /><br /> Requested-User-Id: <br /> Source-Ip: ::1<br /> Email-Sent-To: sangabriel.ranger@gmail.com<br /> Email-Sent-Via: alerts@gmail.com', '', '::1', '2022-06-28 23:16:13', '2022-06-28 23:16:13'),
(28, 'Error', 'Mailer Error', 'Unable to email via php mail function:sangabriel.ranger@gmail.com mail() returned failure ', '', '::1', '2022-06-28 23:16:15', '2022-06-28 23:16:15'),
(29, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:19:08', '2022-06-28 23:19:08'),
(30, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:19:08', '2022-06-28 23:19:08'),
(31, 'Error', 'Mailer Error', 'Unable to email via php mail function:john16f877a@gmail.com mail() returned failure ', '', '::1', '2022-06-28 23:19:11', '2022-06-28 23:19:11'),
(32, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:22:38', '2022-06-28 23:22:38'),
(33, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:22:38', '2022-06-28 23:22:38'),
(34, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:23:29', '2022-06-28 23:23:29'),
(35, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:23:29', '2022-06-28 23:23:29'),
(36, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:23:50', '2022-06-28 23:23:50'),
(37, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:24:30', '2022-06-28 23:24:30'),
(38, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:24:30', '2022-06-28 23:24:30'),
(39, 'Error', 'Mailer Error', 'Unable to email via php mail function:\"Sangabriel Ranger\" mail() returned failure ', '', '::1', '2022-06-28 23:24:57', '2022-06-28 23:24:57'),
(40, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-28 23:25:08', '2022-06-28 23:25:08'),
(41, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-28 23:25:08', '2022-06-28 23:25:08'),
(42, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:23:11', '2022-06-29 08:23:11'),
(43, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:23:11', '2022-06-29 08:23:11'),
(44, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:23:43', '2022-06-29 08:23:43'),
(45, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:23:43', '2022-06-29 08:23:43'),
(46, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:26:03', '2022-06-29 08:26:03'),
(47, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'F\' AND object_id=3] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(AttachmentFile))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(AttachmentFile), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(AttachmentFile))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.file.php(147): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1651): AttachmentFile-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1234): OsticketConfig-&gt;updatePagesSettings(Array, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\settings.php(42): OsticketConfig-&gt;updateSettings(Array, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:26:03', '2022-06-29 08:26:03'),
(48, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:26:05', '2022-06-29 08:26:05'),
(49, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'F\' AND object_id=4] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(AttachmentFile))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(AttachmentFile), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(AttachmentFile))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.file.php(147): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1651): AttachmentFile-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1234): OsticketConfig-&gt;updatePagesSettings(Array, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\settings.php(42): OsticketConfig-&gt;updateSettings(Array, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:26:05', '2022-06-29 08:26:05'),
(50, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:27:01', '2022-06-29 08:27:01'),
(51, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:27:01', '2022-06-29 08:27:01'),
(52, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:28:23', '2022-06-29 08:28:23'),
(53, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'F\' AND object_id=5] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(AttachmentFile))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(AttachmentFile), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(AttachmentFile))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.file.php(147): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1651): AttachmentFile-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1234): OsticketConfig-&gt;updatePagesSettings(Array, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\settings.php(42): OsticketConfig-&gt;updateSettings(Array, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:28:23', '2022-06-29 08:28:23'),
(54, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:28:26', '2022-06-29 08:28:26'),
(55, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:28:26', '2022-06-29 08:28:26'),
(56, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:28:35', '2022-06-29 08:28:35'),
(57, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'F\' AND object_id=6] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(AttachmentFile))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(AttachmentFile), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(AttachmentFile))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.file.php(147): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1651): AttachmentFile-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1234): OsticketConfig-&gt;updatePagesSettings(Array, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\settings.php(42): OsticketConfig-&gt;updateSettings(Array, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:28:35', '2022-06-29 08:28:35'),
(58, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:31:33', '2022-06-29 08:31:33'),
(59, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:31:33', '2022-06-29 08:31:33'),
(60, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:33:36', '2022-06-29 08:33:36'),
(61, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:33:36', '2022-06-29 08:33:36'),
(62, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:48:04', '2022-06-29 08:48:04'),
(63, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:48:04', '2022-06-29 08:48:04'),
(64, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:53:03', '2022-06-29 08:53:03'),
(65, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:53:03', '2022-06-29 08:53:03'),
(66, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:56:46', '2022-06-29 08:56:46'),
(67, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:56:46', '2022-06-29 08:56:46'),
(68, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 08:57:53', '2022-06-29 08:57:53');
INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(69, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 08:57:53', '2022-06-29 08:57:53'),
(70, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 09:04:29', '2022-06-29 09:04:29'),
(71, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 09:04:29', '2022-06-29 09:04:29'),
(72, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 09:08:01', '2022-06-29 09:08:01'),
(73, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 09:08:01', '2022-06-29 09:08:01'),
(74, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 09:11:21', '2022-06-29 09:11:21'),
(75, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 09:11:21', '2022-06-29 09:11:21'),
(76, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 09:14:24', '2022-06-29 09:14:24'),
(77, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 09:14:24', '2022-06-29 09:14:24'),
(78, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 10:27:41', '2022-06-29 10:27:41'),
(79, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 10:27:41', '2022-06-29 10:27:41'),
(80, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 10:33:50', '2022-06-29 10:33:50'),
(81, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 10:33:50', '2022-06-29 10:33:50'),
(82, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 10:45:07', '2022-06-29 10:45:07'),
(83, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 10:45:07', '2022-06-29 10:45:07'),
(84, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:14:10', '2022-06-29 11:14:10'),
(85, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:16:25', '2022-06-29 11:16:25'),
(86, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:16:25', '2022-06-29 11:16:25'),
(87, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:28:42', '2022-06-29 11:28:42'),
(88, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:28:42', '2022-06-29 11:28:42'),
(89, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:29:45', '2022-06-29 11:29:45'),
(90, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:29:45', '2022-06-29 11:29:45'),
(91, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:34:29', '2022-06-29 11:34:29'),
(92, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:34:29', '2022-06-29 11:34:29'),
(93, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:34:50', '2022-06-29 11:34:50'),
(94, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:34:50', '2022-06-29 11:34:50'),
(95, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:37:36', '2022-06-29 11:37:36'),
(96, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'F\' AND object_id=7] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(AttachmentFile))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(AttachmentFile), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(AttachmentFile))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.file.php(147): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1651): AttachmentFile-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1234): OsticketConfig-&gt;updatePagesSettings(Array, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\settings.php(42): OsticketConfig-&gt;updateSettings(Array, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:37:36', '2022-06-29 11:37:36'),
(97, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:37:48', '2022-06-29 11:37:48'),
(98, 'Error', 'DB Error #1146', '[DELETE FROM ost__search WHERE object_type=\'F\' AND object_id=8] Table \'imessagemo.ost__search\' doesn\'t exist<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1146\', \'[DELETE FROM os...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(305): db_query(\'DELETE FROM ost...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(98): MysqlSearchBackend-&gt;delete(Object(AttachmentFile))<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): SearchInterface-&gt;deleteModel(Object(AttachmentFile), NULL)<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\class.orm.php(621): Signal::send(\'model.deleted\', Object(AttachmentFile))<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\class.file.php(147): VerySimpleModel-&gt;delete()<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1651): AttachmentFile-&gt;delete()<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.config.php(1234): OsticketConfig-&gt;updatePagesSettings(Array, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\settings.php(42): OsticketConfig-&gt;updateSettings(Array, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:37:48', '2022-06-29 11:37:48'),
(99, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:37:50', '2022-06-29 11:37:50'),
(100, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:37:50', '2022-06-29 11:37:50'),
(101, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:38:34', '2022-06-29 11:38:34'),
(102, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:38:34', '2022-06-29 11:38:34'),
(103, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:42:56', '2022-06-29 11:42:56'),
(104, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:42:56', '2022-06-29 11:42:56'),
(105, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:43:32', '2022-06-29 11:43:32'),
(106, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:43:32', '2022-06-29 11:43:32'),
(107, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:47:23', '2022-06-29 11:47:23'),
(108, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:47:23', '2022-06-29 11:47:23'),
(109, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:50:45', '2022-06-29 11:50:45'),
(110, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:50:45', '2022-06-29 11:50:45'),
(111, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 11:51:13', '2022-06-29 11:51:13'),
(112, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 11:51:13', '2022-06-29 11:51:13'),
(113, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:26:43', '2022-06-29 12:26:43'),
(114, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:26:43', '2022-06-29 12:26:43'),
(115, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:29:00', '2022-06-29 12:29:00'),
(116, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:29:00', '2022-06-29 12:29:00'),
(117, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:31:37', '2022-06-29 12:31:37'),
(118, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:31:37', '2022-06-29 12:31:37'),
(119, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:36:17', '2022-06-29 12:36:17'),
(120, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:36:17', '2022-06-29 12:36:17'),
(121, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:45:17', '2022-06-29 12:45:17'),
(122, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:45:17', '2022-06-29 12:45:17'),
(123, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:48:49', '2022-06-29 12:48:49'),
(124, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:48:49', '2022-06-29 12:48:49'),
(125, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:53:33', '2022-06-29 12:53:33'),
(126, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [1b01e0532fafd7beca31abb8e9877e30f4192c09] on http://localhost/imessagemo/scp/login.php', '', '::1', '2022-06-29 12:54:11', '2022-06-29 12:54:11'),
(127, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:54:24', '2022-06-29 12:54:24');
INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(128, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:54:24', '2022-06-29 12:54:24'),
(129, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:55:32', '2022-06-29 12:55:32'),
(130, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:55:32', '2022-06-29 12:55:32'),
(131, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 12:58:31', '2022-06-29 12:58:31'),
(132, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 12:58:31', '2022-06-29 12:58:31'),
(133, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [bf9a10cc474419509276cabdbc7f8f7263ba4586] on http://localhost/imessagemo/scp/dashboard.php', '', '::1', '2022-06-29 12:58:47', '2022-06-29 12:58:47'),
(134, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [32c629589c9eda2ad3a9aa56c06d2c32bb7b9ee8] on http://localhost/imessagemo/scp/login.php', '', '::1', '2022-06-29 13:07:44', '2022-06-29 13:07:44'),
(135, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 13:08:02', '2022-06-29 13:08:02'),
(136, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 13:08:02', '2022-06-29 13:08:02'),
(137, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [5054eb7722968bfe20a7680208657233879eab8c] on http://localhost/imessagemo/scp/login.php', '', '::1', '2022-06-29 13:18:37', '2022-06-29 13:18:37'),
(138, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 13:18:49', '2022-06-29 13:18:49'),
(139, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 13:18:49', '2022-06-29 13:18:49'),
(140, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 13:19:19', '2022-06-29 13:19:19'),
(141, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 13:19:19', '2022-06-29 13:19:19'),
(142, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '::1', '2022-06-29 13:24:52', '2022-06-29 13:24:52'),
(143, 'Error', 'DB Error #1813', '[CREATE TABLE IF NOT EXISTS ost__search ( `object_type` varchar(8) not null, `object_id` int(11) unsigned not null, `title` text collate utf8_general_ci, `content` text collate utf8_general_ci, primary key `object` (`object_type`, `object_id`), fulltext key `search` (`title`, `content`) ) CHARSET=utf8] Tablespace for table \'`imessagemo`.`ost__search`\' exists. Please DISCARD the tablespace before IMPORT<br /> <br /> ---- Backtrace ----<br /> #0 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(201): osTicket-&gt;logDBError(\'DB Error #1813\', \'[CREATE TABLE I...\')<br /> #1 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(455): db_query(\'CREATE TABLE IF...\')<br /> #2 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(636): MysqlSearchBackend::createSearchTable()<br /> #3 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(477): MysqlSearchBackend::__init()<br /> #4 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(197): MysqlSearchBackend-&gt;{closure}(1146)<br /> #5 C:\\xampp\\htdocs\\imessagemo\\include\\mysqli.php(209): db_query(\'SELECT A1.`id`,...\', Object(Closure), true)<br /> #6 C:\\xampp\\htdocs\\imessagemo\\include\\class.search.php(487): db_query_unbuffered(\'SELECT A1.`id`,...\', Object(Closure))<br /> #7 C:\\xampp\\htdocs\\imessagemo\\include\\class.signal.php(98): MysqlSearchBackend-&gt;IndexOldStuff(NULL, Array)<br /> #8 C:\\xampp\\htdocs\\imessagemo\\scp\\autocron.php(66): Signal::send(\'cron\', NULL, Array)<br /> #9 {main}', '', '::1', '2022-06-29 13:24:52', '2022-06-29 13:24:52'),
(144, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '10.237.2.160', '2022-06-29 13:55:28', '2022-06-29 13:55:28'),
(145, 'Error', 'Mailer Error', 'Unable to email via php mail function:jmplirac@sec.gov.ph mail() returned failure ', '', '10.237.2.160', '2022-06-29 13:59:43', '2022-06-29 13:59:43'),
(146, 'Error', 'Mailer Error', 'Unable to email via php mail function:\"Sangabriel Ranger\" mail() returned failure ', '', '10.237.2.160', '2022-06-29 14:01:05', '2022-06-29 14:01:05');

-- --------------------------------------------------------

--
-- Table structure for table `ost_task`
--

CREATE TABLE `ost_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_task__cdata`
--

CREATE TABLE `ost_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

CREATE TABLE `ost_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 0, 'Level I Support', '<p>Tier 1 support, responsible for the initial iteraction with customers</p>', '2022-06-28 22:46:30', '2022-06-29 14:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

CREATE TABLE `ost_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread`
--

CREATE TABLE `ost_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_collaborator`
--

CREATE TABLE `ost_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry`
--

CREATE TABLE `ost_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_email`
--

CREATE TABLE `ost_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_merge`
--

CREATE TABLE `ost_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_event`
--

CREATE TABLE `ost_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_thread_event`
--

INSERT INTO `ost_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 0, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2022-06-28 22:46:31'),
(2, 0, 'T', 1, 0, 0, 1, 2, NULL, 'Sangabriel Ranger', 3, 'U', 0, '2022-06-28 23:23:47'),
(3, 0, 'T', 4, 2, 0, 1, 2, '{\"staff\":[2,\"Sangabriel Ranger\"]}', 'jmplirac', 1, 'S', 0, '2022-06-28 23:24:55'),
(4, 0, 'T', 1, 0, 0, 1, 1, NULL, 'Sangabriel Ranger', 3, 'U', 0, '2022-06-29 11:14:08'),
(5, 0, 'T', 1, 0, 0, 1, 2, NULL, 'Sangabriel Ranger', 3, 'U', 0, '2022-06-29 12:53:31'),
(6, 0, 'T', 1, 0, 0, 1, 11, NULL, 'Sangabriel Ranger', 3, 'U', 0, '2022-06-29 13:55:27'),
(7, 1, 'T', 14, 1, 0, 1, 1, NULL, 'jmplirac', 1, 'S', 0, '2022-06-29 13:56:54'),
(8, 0, 'T', 1, 0, 0, 1, 11, NULL, 'Sangabriel Ranger', 3, 'U', 0, '2022-06-29 13:59:42'),
(9, 0, 'T', 4, 2, 0, 1, 11, '{\"staff\":[2,\"Sangabriel Ranger\"]}', 'jmplirac', 1, 'S', 0, '2022-06-29 14:01:05'),
(10, 6, 'T', 14, 2, 0, 1, 11, NULL, 'jmplirac', 1, 'S', 0, '2022-06-29 14:06:21'),
(11, 5, 'T', 14, 1, 0, 1, 11, NULL, 'jmplirac', 1, 'S', 0, '2022-06-29 14:06:22'),
(12, 3, 'T', 14, 1, 0, 1, 1, NULL, 'jmplirac', 1, 'S', 0, '2022-06-29 14:06:23'),
(13, 4, 'T', 14, 1, 0, 1, 2, NULL, 'jmplirac', 1, 'S', 0, '2022-06-29 14:06:24'),
(14, 2, 'T', 14, 2, 0, 1, 2, NULL, 'jmplirac', 1, 'S', 0, '2022-06-29 14:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_referral`
--

CREATE TABLE `ost_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_status`
--

CREATE TABLE `ost_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2022-06-28 22:46:30', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2022-06-28 22:46:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

CREATE TABLE `ost_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_translation`
--

CREATE TABLE `ost_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

CREATE TABLE `ost_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(3, 0, 3, 0, 'Sangabriel Ranger', '2022-06-28 23:08:16', '2022-06-28 23:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_account`
--

CREATE TABLE `ost_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_user_account`
--

INSERT INTO `ost_user_account` (`id`, `user_id`, `status`, `timezone`, `lang`, `username`, `passwd`, `backend`, `extra`, `registered`) VALUES
(2, 3, 1, 'Asia/Shanghai', NULL, 'sangabriel.ranger', '$2a$08$hmJFLCUn2fATQ3F79DCuo.VNm.tb4nQZakmRVQe6OWSdCEmmrHH9a', NULL, '{\"browser_lang\":\"en_US\"}', '2022-06-28 15:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

CREATE TABLE `ost_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(3, 3, 0, 'sangabriel.ranger@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user__cdata`
--

CREATE TABLE `ost_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_user__cdata`
--

INSERT INTO `ost_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, NULL, NULL, '', '<p>user under ICTD</p>'),
(3, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ost__search`
--

CREATE TABLE `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('O', 1, 'osTicket', '1120 5th Street Alexandria, LA 71301\n(318) 290-3674\nhttps://osticket.com\nNot only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.'),
('U', 3, 'Sangabriel Ranger', 'sangabriel.ranger@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indexes for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indexes for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indexes for table `ost_config`
--
ALTER TABLE `ost_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indexes for table `ost_content`
--
ALTER TABLE `ost_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_department`
--
ALTER TABLE `ost_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_draft`
--
ALTER TABLE `ost_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Indexes for table `ost_email`
--
ALTER TABLE `ost_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indexes for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indexes for table `ost_event`
--
ALTER TABLE `ost_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_faq`
--
ALTER TABLE `ost_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indexes for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_faq_topic`
--
ALTER TABLE `ost_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indexes for table `ost_file`
--
ALTER TABLE `ost_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Indexes for table `ost_file_chunk`
--
ALTER TABLE `ost_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indexes for table `ost_filter`
--
ALTER TABLE `ost_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_form`
--
ALTER TABLE `ost_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indexes for table `ost_form_entry_values`
--
ALTER TABLE `ost_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indexes for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `ost_group`
--
ALTER TABLE `ost_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indexes for table `ost_list`
--
ALTER TABLE `ost_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indexes for table `ost_lock`
--
ALTER TABLE `ost_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_note`
--
ALTER TABLE `ost_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indexes for table `ost_organization`
--
ALTER TABLE `ost_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_organization__cdata`
--
ALTER TABLE `ost_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue`
--
ALTER TABLE `ost_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_columns`
--
ALTER TABLE `ost_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indexes for table `ost_queue_config`
--
ALTER TABLE `ost_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indexes for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indexes for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_sorts`
--
ALTER TABLE `ost_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indexes for table `ost_role`
--
ALTER TABLE `ost_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indexes for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_session`
--
ALTER TABLE `ost_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_sla`
--
ALTER TABLE `ost_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_staff`
--
ALTER TABLE `ost_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Indexes for table `ost_staff_dept_access`
--
ALTER TABLE `ost_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indexes for table `ost_task`
--
ALTER TABLE `ost_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_task__cdata`
--
ALTER TABLE `ost_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `ost_team`
--
ALTER TABLE `ost_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `ost_team_member`
--
ALTER TABLE `ost_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_thread`
--
ALTER TABLE `ost_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indexes for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indexes for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indexes for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Indexes for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `ost_ticket__cdata`
--
ALTER TABLE `ost_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ost_translation`
--
ALTER TABLE `ost_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indexes for table `ost_user`
--
ALTER TABLE `ost_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indexes for table `ost_user__cdata`
--
ALTER TABLE `ost_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ost__search`
--
ALTER TABLE `ost__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `ost__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ost_config`
--
ALTER TABLE `ost_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `ost_content`
--
ALTER TABLE `ost_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `ost_department`
--
ALTER TABLE `ost_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ost_draft`
--
ALTER TABLE `ost_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_email`
--
ALTER TABLE `ost_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ost_event`
--
ALTER TABLE `ost_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `ost_faq`
--
ALTER TABLE `ost_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_file`
--
ALTER TABLE `ost_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ost_filter`
--
ALTER TABLE `ost_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_form`
--
ALTER TABLE `ost_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `ost_group`
--
ALTER TABLE `ost_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ost_list`
--
ALTER TABLE `ost_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_lock`
--
ALTER TABLE `ost_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ost_note`
--
ALTER TABLE `ost_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_organization`
--
ALTER TABLE `ost_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_queue`
--
ALTER TABLE `ost_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ost_role`
--
ALTER TABLE `ost_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ost_sla`
--
ALTER TABLE `ost_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ost_staff`
--
ALTER TABLE `ost_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `ost_task`
--
ALTER TABLE `ost_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_team`
--
ALTER TABLE `ost_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ost_thread`
--
ALTER TABLE `ost_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ost_translation`
--
ALTER TABLE `ost_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ost_user`
--
ALTER TABLE `ost_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
