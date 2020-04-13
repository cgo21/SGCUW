# WordPress MySQL database migration
#
# Generated: Monday 13. April 2020 17:26 UTC
# Hostname: localhost
# Database: `canarycars`
# URL: //localhost/canarycars
# Path: C:\\xampp\\htdocs\\canarycars
# Tables: wp_commentmeta, wp_comments, wp_duplicator_packages, wp_links, wp_options, wp_postmeta, wp_posts, wp_revisr, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users
# Table Prefix: wp_
# Post Types: revision, attachment, customize_changeset, page, post
# Protocol: http
# Multisite: false
# Subsite Export: false
# --------------------------------------------------------

/*!40101 SET NAMES utf8mb4 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_commentmeta`
#

DROP TABLE IF EXISTS `wp_commentmeta`;


#
# Table structure of table `wp_commentmeta`
#

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_commentmeta`
#

#
# End of data contents of table `wp_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_comments`
#

DROP TABLE IF EXISTS `wp_comments`;


#
# Table structure of table `wp_comments`
#

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-04-13 15:29:40', '2020-04-13 15:29:40', 'Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visita la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_duplicator_packages`
#

DROP TABLE IF EXISTS `wp_duplicator_packages`;


#
# Table structure of table `wp_duplicator_packages`
#

CREATE TABLE `wp_duplicator_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


#
# Data contents of table `wp_duplicator_packages`
#

#
# End of data contents of table `wp_duplicator_packages`
# --------------------------------------------------------



#
# Delete any existing table `wp_links`
#

DROP TABLE IF EXISTS `wp_links`;


#
# Table structure of table `wp_links`
#

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_links`
#

#
# End of data contents of table `wp_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_options`
#

DROP TABLE IF EXISTS `wp_options`;


#
# Table structure of table `wp_options`
#

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/canarycars', 'yes'),
(2, 'home', 'http://localhost/canarycars', 'yes'),
(3, 'blogname', 'canarycars', 'yes'),
(4, 'blogdescription', 'Otro sitio realizado con WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'imm106@alu.ua.es', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:89:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:19:"akismet/akismet.php";i:1;s:25:"duplicator/duplicator.php";i:2;s:17:"revisr/revisr.php";i:3;s:33:"wp-github-sync/wp-github-sync.php";i:4;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'vw-car-rental', 'yes'),
(41, 'stylesheet', 'vw-car-rental', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '47018', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:17:"gitium/gitium.php";s:21:"gitium_uninstall_hook";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1602343769', 'yes'),
(94, 'initial_db_version', '47018', 'yes'),
(95, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'WPLANG', 'es_ES', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:11:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:8:"footer-1";a:0:{}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}s:8:"footer-4";a:0:{}s:24:"woocommerce-shop-sidebar";a:0:{}s:26:"woocommerce-single-sidebar";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(104, 'cron', 'a:9:{i:1586798984;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1586799159;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c9059feef497c200e69cb9956a81f005";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:5;}}}}i:1586799265;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"686c8315be36c96dc00d0d7ed3656b43";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:6;}}}}i:1586800223;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"25117f4b9fd9bb6384d0eb8ea708c8b9";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:12;}}}}i:1586834984;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1586878182;a:2:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1586878198;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1586878200;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(115, 'recovery_keys', 'a:1:{s:22:"yLb7uNFsQJn2ll9hVv2atb";a:2:{s:10:"hashed_key";s:34:"$P$BPDabVSFanpZV7Uv9JXssrAkWk0FWj1";s:10:"created_at";i:1586793560;}}', 'yes'),
(117, 'theme_mods_twentytwenty', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1586792241;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}}}}', 'yes'),
(132, 'can_compress_scripts', '1', 'no'),
(150, 'recently_activated', 'a:1:{s:17:"gitium/gitium.php";i:1586793639;}', 'yes'),
(155, 'widget_akismet_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(158, 'current_theme', 'VW Car Rental', 'yes'),
(159, 'theme_mods_rentacar', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1586792434;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:18:"header-left-widget";a:0:{}}}}', 'yes'),
(160, 'theme_switched', '', 'yes'),
(163, 'theme_mods_vw-car-rental', 'a:9:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:11:"custom_logo";i:14;s:16:"background_color";s:6:"ffffff";s:12:"header_image";s:21:"random-uploaded-image";s:31:"vw_car_rental_tagline_hide_show";i:1;s:9:"logo_size";i:50;s:16:"background_image";s:0:"";}', 'yes'),
(164, 'widget_vw_car_rental_social_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(168, 'recovery_mode_email_last_sent', '1586793560', 'yes'),
(169, 'duplicator_settings', 'a:15:{s:7:"version";s:6:"1.3.28";s:18:"uninstall_settings";b:1;s:15:"uninstall_files";b:1;s:16:"uninstall_tables";b:1;s:13:"package_debug";b:0;s:17:"package_mysqldump";b:1;s:22:"package_mysqldump_path";s:0:"";s:24:"package_phpdump_qrylimit";s:3:"100";s:17:"package_zip_flush";b:0;s:20:"storage_htaccess_off";b:0;s:18:"archive_build_mode";i:2;s:17:"skip_archive_scan";b:0;s:21:"unhook_third_party_js";b:0;s:22:"unhook_third_party_css";b:0;s:17:"active_package_id";i:1;}', 'yes'),
(170, 'duplicator_version_plugin', '1.3.28', 'yes'),
(171, 'wpghs_host', 'https://github.com/cgo21/SGCUW.git', 'yes'),
(172, 'wpghs_repository', 'cgo21/SGCUW', 'yes'),
(173, 'wpghs_oauth_token', '0268a7287d3c3e942df77c16e66d5201a44dbcf8', 'yes'),
(174, 'wpghs_secret', '', 'yes'),
(175, 'wpghs_default_user', '1', 'yes'),
(211, '_wpghs_fully_exported', 'yes', 'yes'),
(212, 'duplicator_ui_view_state', 'a:3:{s:22:"dup-pack-storage-panel";s:1:"1";s:22:"dup-pack-archive-panel";s:1:"0";s:24:"dup-pack-installer-panel";s:1:"0";}', 'yes'),
(213, 'duplicator_package_active', 'O:11:"DUP_Package":25:{s:7:"Created";s:19:"2020-04-13 16:14:10";s:7:"Version";s:6:"1.3.28";s:9:"VersionWP";s:3:"5.4";s:9:"VersionDB";s:7:"10.4.11";s:10:"VersionPHP";s:5:"7.4.3";s:9:"VersionOS";s:5:"WINNT";s:2:"ID";N;s:4:"Name";s:19:"20200413_canarycars";s:4:"Hash";s:35:"700ce364f157edf28619_20200413161410";s:8:"NameHash";s:55:"20200413_canarycars_700ce364f157edf28619_20200413161410";s:4:"Type";i:0;s:5:"Notes";s:0:"";s:9:"StorePath";s:43:"C:/xampp/htdocs/canarycars/wp-snapshots/tmp";s:8:"StoreURL";s:41:"http://localhost/canarycars/wp-snapshots/";s:8:"ScanFile";s:65:"20200413_canarycars_700ce364f157edf28619_20200413161410_scan.json";s:10:"TimerStart";i:-1;s:7:"Runtime";N;s:7:"ExeSize";N;s:7:"ZipSize";N;s:6:"Status";i:0;s:6:"WPUser";N;s:7:"Archive";O:11:"DUP_Archive":21:{s:10:"FilterDirs";s:0:"";s:11:"FilterFiles";s:0:"";s:10:"FilterExts";s:0:"";s:13:"FilterDirsAll";a:0:{}s:14:"FilterFilesAll";a:0:{}s:13:"FilterExtsAll";a:0:{}s:8:"FilterOn";i:0;s:12:"ExportOnlyDB";i:0;s:4:"File";N;s:6:"Format";s:3:"ZIP";s:7:"PackDir";s:26:"C:/xampp/htdocs/canarycars";s:4:"Size";i:0;s:4:"Dirs";a:0:{}s:5:"Files";a:0:{}s:10:"FilterInfo";O:23:"DUP_Archive_Filter_Info":8:{s:4:"Dirs";O:34:"DUP_Archive_Filter_Scope_Directory":5:{s:7:"Warning";a:0:{}s:10:"Unreadable";a:0:{}s:4:"Core";a:0:{}s:6:"Global";a:0:{}s:8:"Instance";a:0:{}}s:5:"Files";O:29:"DUP_Archive_Filter_Scope_File":6:{s:4:"Size";a:0:{}s:7:"Warning";a:0:{}s:10:"Unreadable";a:0:{}s:4:"Core";a:0:{}s:6:"Global";a:0:{}s:8:"Instance";a:0:{}}s:4:"Exts";O:29:"DUP_Archive_Filter_Scope_Base":3:{s:4:"Core";a:0:{}s:6:"Global";a:0:{}s:8:"Instance";a:0:{}}s:9:"UDirCount";i:0;s:10:"UFileCount";i:0;s:9:"UExtCount";i:0;s:8:"TreeSize";a:0:{}s:11:"TreeWarning";a:0:{}}s:14:"RecursiveLinks";a:0:{}s:10:"file_count";i:-1;s:10:"\0*\0Package";O:11:"DUP_Package":25:{s:7:"Created";s:19:"2020-04-13 16:14:10";s:7:"Version";s:6:"1.3.28";s:9:"VersionWP";s:3:"5.4";s:9:"VersionDB";s:7:"10.4.11";s:10:"VersionPHP";s:5:"7.4.3";s:9:"VersionOS";s:5:"WINNT";s:2:"ID";N;s:4:"Name";s:19:"20200413_canarycars";s:4:"Hash";s:35:"700ce364f157edf28619_20200413161410";s:8:"NameHash";s:55:"20200413_canarycars_700ce364f157edf28619_20200413161410";s:4:"Type";i:0;s:5:"Notes";s:0:"";s:9:"StorePath";s:43:"C:/xampp/htdocs/canarycars/wp-snapshots/tmp";s:8:"StoreURL";s:41:"http://localhost/canarycars/wp-snapshots/";s:8:"ScanFile";N;s:10:"TimerStart";i:-1;s:7:"Runtime";N;s:7:"ExeSize";N;s:7:"ZipSize";N;s:6:"Status";i:0;s:6:"WPUser";N;s:7:"Archive";r:23;s:9:"Installer";O:13:"DUP_Installer":11:{s:4:"File";N;s:4:"Size";i:0;s:10:"OptsDBHost";s:0:"";s:10:"OptsDBPort";s:0:"";s:10:"OptsDBName";s:0:"";s:10:"OptsDBUser";s:0:"";s:12:"OptsSecureOn";i:0;s:14:"OptsSecurePass";s:0:"";s:13:"numFilesAdded";i:0;s:12:"numDirsAdded";i:0;s:10:"\0*\0Package";r:63;}s:8:"Database";O:12:"DUP_Database":14:{s:4:"Type";s:5:"MySQL";s:4:"Size";N;s:4:"File";N;s:4:"Path";N;s:12:"FilterTables";s:0:"";s:8:"FilterOn";i:0;s:4:"Name";N;s:10:"Compatible";s:0:"";s:8:"Comments";s:31:"mariadb.org binary distribution";s:4:"info";O:16:"DUP_DatabaseInfo":15:{s:9:"buildMode";N;s:13:"collationList";a:0:{}s:17:"isTablesUpperCase";N;s:15:"isNameUpperCase";N;s:4:"name";N;s:15:"tablesBaseCount";N;s:16:"tablesFinalCount";N;s:14:"tablesRowCount";N;s:16:"tablesSizeOnDisk";N;s:18:"varLowerCaseTables";i:1;s:7:"version";N;s:14:"versionComment";N;s:18:"tableWiseRowCounts";a:0:{}s:33:"\0DUP_DatabaseInfo\0intFieldsStruct";a:0:{}s:42:"\0DUP_DatabaseInfo\0indexProcessedSchemaSize";a:0:{}}s:10:"\0*\0Package";r:63;s:25:"\0DUP_Database\0dbStorePath";N;s:23:"\0DUP_Database\0EOFMarker";s:0:"";s:26:"\0DUP_Database\0networkFlush";b:0;}s:13:"BuildProgress";O:18:"DUP_Build_Progress":12:{s:17:"thread_start_time";N;s:11:"initialized";b:0;s:15:"installer_built";b:0;s:15:"archive_started";b:0;s:20:"archive_has_database";b:0;s:13:"archive_built";b:0;s:21:"database_script_built";b:0;s:6:"failed";b:0;s:7:"retries";i:0;s:14:"build_failures";a:0:{}s:19:"validation_failures";a:0:{}s:27:"\0DUP_Build_Progress\0package";r:63;}}s:29:"\0DUP_Archive\0tmpFilterDirsAll";a:0:{}s:24:"\0DUP_Archive\0wpCorePaths";a:5:{i:0;s:35:"C:/xampp/htdocs/canarycars/wp-admin";i:1;s:45:"C:/xampp/htdocs/canarycars/wp-content/uploads";i:2;s:47:"C:/xampp/htdocs/canarycars/wp-content/languages";i:3;s:44:"C:/xampp/htdocs/canarycars/wp-content/themes";i:4;s:38:"C:/xampp/htdocs/canarycars/wp-includes";}s:29:"\0DUP_Archive\0wpCoreExactPaths";a:2:{i:0;s:26:"C:/xampp/htdocs/canarycars";i:1;s:37:"C:/xampp/htdocs/canarycars/wp-content";}}s:9:"Installer";r:86;s:8:"Database";r:98;s:13:"BuildProgress";r:128;}', 'yes'),
(214, 'duplicator_exe_safe_mode', '', 'yes'),
(223, '_wpghs_export_user_id', '1', 'yes'),
(266, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1586798776;}', 'no'),
(294, 'revisr_db_version', '2.0', 'yes'),
(295, 'revisr_database_settings', 'a:5:{s:11:"db_tracking";s:10:"all_tables";s:14:"tracked_tables";a:14:{i:0;s:14:"wp_commentmeta";i:1;s:11:"wp_comments";i:2;s:22:"wp_duplicator_packages";i:3;s:8:"wp_links";i:4;s:10:"wp_options";i:5;s:11:"wp_postmeta";i:6;s:8:"wp_posts";i:7;s:9:"wp_revisr";i:8;s:21:"wp_term_relationships";i:9;s:16:"wp_term_taxonomy";i:10;s:11:"wp_termmeta";i:11;s:8:"wp_terms";i:12;s:11:"wp_usermeta";i:13;s:8:"wp_users";}s:15:"development_url";s:67:"http://localhost/phpmyadmin/db_structure.php?server=1&db=canarycars";s:9:"db_driver";s:4:"wpdb";s:10:"mysql_path";s:0:"";}', 'yes'),
(298, 'revisr_remote_settings', 'a:5:{s:11:"remote_name";s:0:"";s:10:"remote_url";s:40:"https://github.com/imm106/canarycars.git";s:11:"webhook_url";s:0:"";s:9:"auto_push";s:2:"on";s:9:"auto_pull";s:2:"on";}', 'yes'),
(299, 'revisr_general_settings', 'a:5:{s:8:"username";s:19:"Carlos García Orts";s:5:"email";s:15:"cgo21@alu.ua.es";s:8:"git_path";s:0:"";s:9:"gitignore";s:24:".htaccess\r\nwp-config.php";s:17:"automatic_backups";s:4:"none";}', 'yes') ;

#
# End of data contents of table `wp_options`
# --------------------------------------------------------



#
# Delete any existing table `wp_postmeta`
#

DROP TABLE IF EXISTS `wp_postmeta`;


#
# Table structure of table `wp_postmeta`
#

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_attached_file', '2020/04/versionpress-master.zip'),
(4, 5, '_wp_attachment_context', 'upgrader'),
(5, 6, '_wp_attached_file', '2020/04/package.json'),
(6, 6, '_wp_attachment_context', 'upgrader'),
(7, 7, '_wp_attached_file', '2020/04/8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png'),
(8, 7, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:200;s:6:"height";i:200;s:4:"file";s:56:"2020/04/8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:56:"8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:28:"vw-car-rental-homepage-thumb";a:4:{s:4:"file";s:56:"8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-200x145.png";s:5:"width";i:200;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(9, 8, '_wp_attached_file', '2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png'),
(10, 8, '_wp_attachment_context', 'custom-logo'),
(11, 8, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:240;s:6:"height";i:240;s:4:"file";s:64:"2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:64:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:28:"vw-car-rental-homepage-thumb";a:4:{s:4:"file";s:64:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(12, 9, '_edit_lock', '1586792716:1'),
(13, 10, '_wp_attached_file', '2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1.png'),
(14, 10, '_wp_attachment_context', 'custom-header'),
(15, 10, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1600;s:6:"height";i:92;s:4:"file";s:66:"2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1.png";s:5:"sizes";a:6:{s:6:"medium";a:4:{s:4:"file";s:65:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-300x17.png";s:5:"width";i:300;s:6:"height";i:17;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:66:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-1024x59.png";s:5:"width";i:1024;s:6:"height";i:59;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:65:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-150x92.png";s:5:"width";i:150;s:6:"height";i:92;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:65:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-768x44.png";s:5:"width";i:768;s:6:"height";i:44;s:9:"mime-type";s:9:"image/png";}s:9:"1536x1536";a:4:{s:4:"file";s:66:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-1536x88.png";s:5:"width";i:1536;s:6:"height";i:88;s:9:"mime-type";s:9:"image/png";}s:28:"vw-car-rental-homepage-thumb";a:4:{s:4:"file";s:65:"cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-240x92.png";s:5:"width";i:240;s:6:"height";i:92;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:7;}'),
(16, 10, '_wp_attachment_custom_header_last_used_vw-car-rental', '1586792684'),
(17, 10, '_wp_attachment_is_custom_header', 'vw-car-rental'),
(18, 9, '_wp_trash_meta_status', 'publish'),
(19, 9, '_wp_trash_meta_time', '1586792734'),
(20, 7, '_wp_attachment_is_custom_background', 'vw-car-rental'),
(21, 11, '_edit_lock', '1586792956:1'),
(22, 11, '_wp_trash_meta_status', 'publish'),
(23, 11, '_wp_trash_meta_time', '1586792998'),
(24, 12, '_wp_attached_file', '2020/04/versionpress-master-1.zip'),
(25, 12, '_wp_attachment_context', 'upgrader'),
(26, 13, '_wp_attached_file', '2020/04/e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png'),
(27, 13, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:200;s:6:"height";i:200;s:4:"file";s:56:"2020/04/e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:56:"e6012510-8759-4628-b5bd-b853d4b1aadc_200x200-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:28:"vw-car-rental-homepage-thumb";a:4:{s:4:"file";s:56:"e6012510-8759-4628-b5bd-b853d4b1aadc_200x200-200x145.png";s:5:"width";i:200;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(28, 14, '_wp_attached_file', '2020/04/cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png'),
(29, 14, '_wp_attachment_context', 'custom-logo'),
(30, 14, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:240;s:6:"height";i:240;s:4:"file";s:64:"2020/04/cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:64:"cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:28:"vw-car-rental-homepage-thumb";a:4:{s:4:"file";s:64:"cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(31, 15, '_wp_trash_meta_status', 'publish'),
(32, 15, '_wp_trash_meta_time', '1586793761'),
(33, 2, '_wpghs_github_path', '_pages/pagina-ejemplo.md'),
(34, 1, '_wpghs_github_path', '_posts/2020-04-13-hola-mundo.md'),
(35, 2, '_sha', '9566bd2ff865b8123afe706d6b0f91de5c5a94af'),
(36, 1, '_sha', '02c7b0a0e5dccf4acf72c7dafaed51eb81a95b19'),
(37, 16, '_edit_lock', '1586798223:1') ;

#
# End of data contents of table `wp_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_posts`
#

DROP TABLE IF EXISTS `wp_posts`;


#
# Table structure of table `wp_posts`
#

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-04-13 15:29:40', '2020-04-13 15:29:40', '<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Edítala o bórrala, ¡luego empieza a escribir!</p>\n<!-- /wp:paragraph -->', '¡Hola, mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2020-04-13 15:29:40', '2020-04-13 15:29:40', '', 0, 'http://localhost/canarycars/?p=1', 0, 'post', '', 1),
(2, 1, '2020-04-13 15:29:40', '2020-04-13 15:29:40', '<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo. Es diferente a una entrada del blog porque permanecerá en un solo lugar y aparecerá en la navegación de tu sitio (en la mayoría de los temas). La mayoría de las personas comienzan con una página «Acerca de» que les presenta a los visitantes potenciales del sitio. Podrías decir algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>¡Bienvenido! Soy camarero de día, aspirante a actor de noche y esta es mi web. Vivo en Mairena del Alcor, tengo un perro que se llama Firulais y me gusta el rebujito. (Y las tardes largas con café).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>…o algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>La empresa «Mariscos Recio» fue fundada por Antonio Recio Mata. Empezó siendo una pequeña empresa que suministraba marisco a hoteles y restaurantes, pero poco a poco se ha ido transformando en un gran imperio. Mariscos Recio, el mar al mejor precio.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, deberías ir a <a href="http://localhost/canarycars/wp-admin/">tu escritorio</a> para borrar esta página y crear nuevas páginas para tu contenido. ¡Pásalo bien!</p>\n<!-- /wp:paragraph -->', 'Página de ejemplo', '', 'publish', 'closed', 'open', '', 'pagina-ejemplo', '', '', '2020-04-13 15:29:40', '2020-04-13 15:29:40', '', 0, 'http://localhost/canarycars/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-04-13 15:29:40', '2020-04-13 15:29:40', '<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>La dirección de nuestra web es: http://localhost/canarycars.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué datos personales recogemos y por qué los recogemos</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comentarios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Cuando los visitantes dejan comentarios en la web, recopilamos los datos que se muestran en el formulario de comentarios, así como la dirección IP del visitante y la cadena de agentes de usuario del navegador para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Una cadena anónima creada a partir de tu dirección de correo electrónico (también llamada hash) puede ser proporcionada al servicio de Gravatar para ver si la estás usando. La política de privacidad del servicio Gravatar está disponible aquí: https://automattic.com/privacy/. Después de la aprobación de tu comentario, la imagen de tu perfil es visible para el público en el contexto de tu comentario.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Medios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si subes imágenes a la web, deberías evitar subir imágenes con datos de ubicación (GPS EXIF) incluidos. Los visitantes de la web pueden descargar y extraer cualquier dato de ubicación de las imágenes de la web.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Formularios de contacto</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario en nuestro sitio puedes elegir guardar tu nombre, dirección de correo electrónico y web en cookies. Esto es para tu comodidad, para que no tengas que volver a rellenar tus datos cuando dejes otro comentario. Estas cookies tendrán una duración de un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tienes una cuenta y te conectas a este sitio, instalaremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se elimina al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando accedas, también instalaremos varias cookies para guardar tu información de acceso y tus opciones de visualización de pantalla. Las cookies de acceso duran dos días, y las cookies de opciones de pantalla duran un año. Si seleccionas «Recuérdarme», tu acceso perdurará durante dos semanas. Si sales de tu cuenta, las cookies de acceso se eliminarán.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editas o publicas un artículo se guardará una cookie adicional en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID del artículo que acabas de editar. Caduca después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contenido incrustado de otros sitios web</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Los artículos de este sitio pueden incluir contenido incrustado (por ejemplo, vídeos, imágenes, artículos, etc.). El contenido incrustado de otras webs se comporta exactamente de la misma manera que si el visitante hubiera visitado la otra web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estas web pueden recopilar datos sobre ti, utilizar cookies, incrustar un seguimiento adicional de terceros, y supervisar tu interacción con ese contenido incrustado, incluido el seguimiento de tu interacción con el contenido incrustado si tienes una cuenta y estás conectado a esa web.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analítica</h3><!-- /wp:heading --><!-- wp:heading --><h2>Con quién compartimos tus datos</h2><!-- /wp:heading --><!-- wp:heading --><h2>Cuánto tiempo conservamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar comentarios sucesivos automáticamente, en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>De los usuarios que se registran en nuestra web (si los hay), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o eliminar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores de la web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tienes sobre tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si tienes una cuenta o has dejado comentarios en esta web, puedes solicitar recibir un archivo de exportación de los datos personales que tenemos sobre ti, incluyendo cualquier dato que nos hayas proporcionado. También puedes solicitar que eliminemos cualquier dato personal que tengamos sobre ti. Esto no incluye ningún dato que estemos obligados a conservar con fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Los comentarios de los visitantes puede que los revise un servicio de detección automática de spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Tu información de contacto</h2><!-- /wp:heading --><!-- wp:heading --><h2>Información adicional</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cómo protegemos tus datos</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Qué procedimientos utilizamos contra las brechas de datos</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>De qué terceros recibimos datos</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Qué tipo de toma de decisiones automatizada y/o perfilado hacemos con los datos del usuario</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Requerimientos regulatorios de revelación de información del sector</h3><!-- /wp:heading -->', 'Política de privacidad', '', 'draft', 'closed', 'open', '', 'politica-privacidad', '', '', '2020-04-13 15:29:40', '2020-04-13 15:29:40', '', 0, 'http://localhost/canarycars/?page_id=3', 0, 'page', '', 0),
(4, 1, '2020-04-13 15:29:59', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-04-13 15:29:59', '0000-00-00 00:00:00', '', 0, 'http://localhost/canarycars/?p=4', 0, 'post', '', 0),
(5, 1, '2020-04-13 15:32:38', '2020-04-13 15:32:38', 'http://localhost/canarycars/wp-content/uploads/2020/04/versionpress-master.zip', 'versionpress-master.zip', '', 'private', 'open', 'closed', '', 'versionpress-master-zip', '', '', '2020-04-13 15:32:38', '2020-04-13 15:32:38', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/versionpress-master.zip', 0, 'attachment', '', 0),
(6, 1, '2020-04-13 15:34:25', '2020-04-13 15:34:25', 'http://localhost/canarycars/wp-content/uploads/2020/04/package.json', 'package.json', '', 'private', 'open', 'closed', '', 'package-json', '', '', '2020-04-13 15:34:25', '2020-04-13 15:34:25', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/package.json', 0, 'attachment', '', 0),
(7, 1, '2020-04-13 15:44:01', '2020-04-13 15:44:01', '', '8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200', '', 'inherit', 'open', 'closed', '', '8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200', '', '', '2020-04-13 15:44:01', '2020-04-13 15:44:01', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png', 0, 'attachment', 'image/png', 0),
(8, 1, '2020-04-13 15:44:12', '2020-04-13 15:44:12', 'http://localhost/canarycars/wp-content/uploads/2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png', 'cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png', '', 'inherit', 'open', 'closed', '', 'cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-png', '', '', '2020-04-13 15:44:12', '2020-04-13 15:44:12', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200.png', 0, 'attachment', 'image/png', 0),
(9, 1, '2020-04-13 15:45:34', '2020-04-13 15:45:34', '{"vw-car-rental::custom_logo":{"value":8,"type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:44:16"},"vw-car-rental::background_color":{"value":"#fcfcfc","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:45:16"},"vw-car-rental::header_image":{"value":"remove-header","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:45:16"},"vw-car-rental::header_image_data":{"value":"remove-header","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:45:16"},"vw-car-rental::vw_car_rental_tagline_hide_show":{"value":true,"type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:45:16"},"vw-car-rental::logo_size":{"value":"25","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:45:34"}}', '', '', 'trash', 'closed', 'closed', '', 'abcaec23-e215-4765-bf70-5e2d24cb6e00', '', '', '2020-04-13 15:45:34', '2020-04-13 15:45:34', '', 0, 'http://localhost/canarycars/?p=9', 0, 'customize_changeset', '', 0),
(10, 1, '2020-04-13 15:44:42', '2020-04-13 15:44:42', '', 'cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1-png', '', '', '2020-04-13 15:44:42', '2020-04-13 15:44:42', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/cropped-8ae16609-b9ba-4a8f-b2ec-35138c18c9ee_200x200-1.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2020-04-13 15:49:57', '2020-04-13 15:49:57', '{"vw-car-rental::background_color":{"value":"#ffffff","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:48:47"},"vw-car-rental::header_image":{"value":"random-uploaded-image","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:48:47"},"vw-car-rental::header_image_data":{"value":"random-uploaded-image","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:48:47"},"vw-car-rental::background_image":{"value":"","type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 15:48:47"}}', '', '', 'trash', 'closed', 'closed', '', '1c82cdb6-2a7b-4f9a-8f1e-a298ffda7aff', '', '', '2020-04-13 15:49:57', '2020-04-13 15:49:57', '', 0, 'http://localhost/canarycars/?p=11', 0, 'customize_changeset', '', 0),
(12, 1, '2020-04-13 15:50:23', '2020-04-13 15:50:23', 'http://localhost/canarycars/wp-content/uploads/2020/04/versionpress-master-1.zip', 'versionpress-master.zip', '', 'private', 'open', 'closed', '', 'versionpress-master-zip-2', '', '', '2020-04-13 15:50:23', '2020-04-13 15:50:23', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/versionpress-master-1.zip', 0, 'attachment', '', 0),
(13, 1, '2020-04-13 16:01:55', '2020-04-13 16:01:55', '', 'e6012510-8759-4628-b5bd-b853d4b1aadc_200x200', '', 'inherit', 'open', 'closed', '', 'e6012510-8759-4628-b5bd-b853d4b1aadc_200x200', '', '', '2020-04-13 16:01:55', '2020-04-13 16:01:55', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2020-04-13 16:01:59', '2020-04-13 16:01:59', 'http://localhost/canarycars/wp-content/uploads/2020/04/cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png', 'cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png', '', 'inherit', 'open', 'closed', '', 'cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200-png', '', '', '2020-04-13 16:01:59', '2020-04-13 16:01:59', '', 0, 'http://localhost/canarycars/wp-content/uploads/2020/04/cropped-e6012510-8759-4628-b5bd-b853d4b1aadc_200x200.png', 0, 'attachment', 'image/png', 0),
(15, 1, '2020-04-13 16:02:41', '2020-04-13 16:02:41', '{"vw-car-rental::custom_logo":{"value":14,"type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 16:02:41"},"vw-car-rental::logo_size":{"value":50,"type":"theme_mod","user_id":1,"date_modified_gmt":"2020-04-13 16:02:41"}}', '', '', 'trash', 'closed', 'closed', '', 'dc2740e7-84ab-4b5a-bc1a-94eb250b61f6', '', '', '2020-04-13 16:02:41', '2020-04-13 16:02:41', '', 0, 'http://localhost/canarycars/2020/04/13/dc2740e7-84ab-4b5a-bc1a-94eb250b61f6/', 0, 'customize_changeset', '', 0),
(16, 1, '2020-04-13 17:18:18', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-04-13 17:18:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/canarycars/?p=16', 0, 'post', '', 0) ;

#
# End of data contents of table `wp_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_revisr`
#

DROP TABLE IF EXISTS `wp_revisr`;


#
# Table structure of table `wp_revisr`
#

CREATE TABLE `wp_revisr` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` text DEFAULT NULL,
  `event` varchar(42) NOT NULL,
  `user` varchar(60) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;


#
# Data contents of table `wp_revisr`
#
INSERT INTO `wp_revisr` ( `id`, `time`, `message`, `event`, `user`) VALUES
(1, '2020-04-13 17:16:37', 'Error pushing changes to the remote repository.', 'error', 'admin'),
(2, '2020-04-13 17:21:01', 'Pulled <a href="http://localhost/canarycars/wp-admin/admin.php?page=revisr_view_commit&commit=b2666c8">#b2666c8</a> from origin/master.', 'pull', 'admin'),
(3, '2020-04-13 17:21:47', 'Successfully backed up the database.', 'backup', 'admin'),
(4, '2020-04-13 17:21:49', 'Error pushing changes to the remote repository.', 'error', 'admin'),
(5, '2020-04-13 17:22:33', 'Successfully backed up the database.', 'backup', 'admin'),
(6, '2020-04-13 17:22:36', 'Error pushing changes to the remote repository.', 'error', 'admin'),
(7, '2020-04-13 17:22:45', 'Error pushing changes to the remote repository.', 'error', 'admin'),
(8, '2020-04-13 17:22:59', 'Error pushing changes to the remote repository.', 'error', 'admin') ;

#
# End of data contents of table `wp_revisr`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_relationships`
#

DROP TABLE IF EXISTS `wp_term_relationships`;


#
# Table structure of table `wp_term_relationships`
#

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_term_relationships`
#
INSERT INTO `wp_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0) ;

#
# End of data contents of table `wp_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_taxonomy`
#

DROP TABLE IF EXISTS `wp_term_taxonomy`;


#
# Table structure of table `wp_term_taxonomy`
#

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1) ;

#
# End of data contents of table `wp_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `wp_termmeta`
#

DROP TABLE IF EXISTS `wp_termmeta`;


#
# Table structure of table `wp_termmeta`
#

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_termmeta`
#

#
# End of data contents of table `wp_termmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_terms`
#

DROP TABLE IF EXISTS `wp_terms`;


#
# Table structure of table `wp_terms`
#

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0) ;

#
# End of data contents of table `wp_terms`
# --------------------------------------------------------



#
# Delete any existing table `wp_usermeta`
#

DROP TABLE IF EXISTS `wp_usermeta`;


#
# Table structure of table `wp_usermeta`
#

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_usermeta`
#
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:3:{s:64:"6c2d7cc2fec13c2e55152205926ca2a1c6522a1d074a863df4a81271f663534d";a:4:{s:10:"expiration";i:1586964598;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36";s:5:"login";i:1586791798;}s:64:"2e7bbb5ae7d76dc6ff6f4c757fbac89f276d53b708c8d5aaf4611bdb081aaabb";a:4:{s:10:"expiration";i:1586969004;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36";s:5:"login";i:1586796204;}s:64:"478d1a29866ed98af1e0b5dba541f67fc5a4fa4d6facc75540b51a19215bd126";a:4:{s:10:"expiration";i:1586970715;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36";s:5:"login";i:1586797915;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'wp_user-settings', 'libraryContent=browse'),
(19, 1, 'wp_user-settings-time', '1586792733') ;

#
# End of data contents of table `wp_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_users`
#

DROP TABLE IF EXISTS `wp_users`;


#
# Table structure of table `wp_users`
#

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BFDgyj6BGWzapnaOM5oVmon0JiHurj0', 'admin', 'imm106@alu.ua.es', 'http://localhost/canarycars', '2020-04-13 15:29:39', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

