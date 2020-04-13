<?php 
/**
 * SKT Condimentum functions and definitions
 *
 * @package SKT Condimentum
 */

// Set the word limit of post content 
function skt_condimentum_content($limit) {
$content = explode(' ', get_the_excerpt(), $limit);
if (count($content)>=$limit) {
array_pop($content);
$content = implode(" ",$content).'...';
} else {
$content = implode(" ",$content);
}	
$content = preg_replace('/\[.+\]/','', $content);
$content = apply_filters('skt_condimentum_content', $content);
$content = str_replace(']]>', ']]&gt;', $content);
return $content;
}


function skt_condimentum_excerpt_length($length) {
    return 80;
}
add_filter('excerpt_length', 'skt_condimentum_excerpt_length'); 

/**
 * Set the content width based on the theme's design and stylesheet.
 */

if ( ! function_exists( 'skt_condimentum_setup' ) ) : 
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which runs
 * before the init hook. The init hook is too late for some features, such as indicating
 * support post thumbnails.
 */
function skt_condimentum_setup() {
	if ( ! isset( $content_width ) )
		$content_width = 640; /* pixels */

	load_theme_textdomain( 'skt-condimentum', get_template_directory() . '/languages' );
	add_theme_support( 'automatic-feed-links' );
	add_theme_support('woocommerce');
	add_theme_support( 'post-thumbnails' );
	add_theme_support( 'custom-header' );
	add_theme_support( 'title-tag' );
	add_theme_support( 'custom-logo', array(
		'height'      => 100,
		'width'       => 350,
		'flex-height' => true,
	) );	
	add_theme_support( 'custom-header', array( 'header-text' => false ) );
	add_image_size('homepage-thumb',570,570,true);
	register_nav_menus( array(
		'primary' => esc_html__( 'Primary Menu', 'skt-condimentum' ),
		'footer' => esc_html__( 'Footer Menu', 'skt-condimentum' ),		
	) );
	add_theme_support( 'custom-background', array(
		'default-color' => 'ffffff'
	) );
	add_editor_style( 'editor-style.css' );
} 
endif; // skt_condimentum_setup
add_action( 'after_setup_theme', 'skt_condimentum_setup' );


function skt_condimentum_widgets_init() { 	
	
	register_sidebar( array(
		'name'          => esc_html__( 'Blog Sidebar', 'skt-condimentum' ),
		'description'   => esc_html__( 'Appears on blog page sidebar', 'skt-condimentum' ),
		'id'            => 'sidebar-1',
		'before_widget' => '',		
		'before_title'  => '<h3 class="widget-title">',
		'after_title'   => '</h3><aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
	) );
	
	register_sidebar( array(
		'name'          => esc_html__( 'Header Left Widget', 'skt-condimentum' ),
		'description'   => esc_html__( 'Appears on top of the header', 'skt-condimentum' ),
		'id'            => 'header-left-widget',
		'before_widget' => '',		
		'before_title'  => '<h3 class="widget-title" style="display:none">',
		'after_title'   => '</h3>',
		'after_widget'  => '',
	) );		
	
}
add_action( 'widgets_init', 'skt_condimentum_widgets_init' );


function skt_condimentum_font_url(){
		$font_url = '';		
		
		/* Translators: If there are any character that are not
		* supported by Roboto, trsnalate this to off, do not
		* translate into your own language.
		*/
		$roboto = _x('on','roboto:on or off','skt-condimentum');		
		
		
		/* Translators: If there has any character that are not supported 
		*  by Scada, translate this to off, do not translate
		*  into your own language.
		*/
 		
		if('off' !== $roboto ){
			$font_family = array();
			
			if('off' !== $roboto){
				$font_family[] = 'Roboto:300,400,600,700,800,900';
			}
					
						
			$query_args = array(
				'family'	=> urlencode(implode('|',$font_family)),
			);
			
			$font_url = add_query_arg($query_args,'//fonts.googleapis.com/css');
		}
		
	return $font_url;
	}


function skt_condimentum_scripts() {
	wp_enqueue_style('skt-condimentum-font', skt_condimentum_font_url(), array());
	wp_enqueue_style( 'skt-condimentum-basic-style', get_stylesheet_uri() );
	wp_enqueue_style( 'skt-condimentum-editor-style', get_template_directory_uri()."/editor-style.css" );
	wp_enqueue_style( 'nivo-slider', get_template_directory_uri()."/css/nivo-slider.css" );
	wp_enqueue_style( 'skt-condimentum-main-style', get_template_directory_uri()."/css/responsive.css" );		
	wp_enqueue_style( 'skt-condimentum-base-style', get_template_directory_uri()."/css/style_base.css" );
	wp_enqueue_script( 'jquery-nivo', get_template_directory_uri() . '/js/jquery.nivo.slider.js', array('jquery') );
	wp_enqueue_script( 'skt-condimentum-custom-js', get_template_directory_uri() . '/js/custom.js' );	
		

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'skt_condimentum_scripts' );

function skt_condimentum_ie_stylesheet(){
	global $wp_styles;
	
	/** Load our IE-only stylesheet for all versions of IE.
	*   <!--[if lt IE 9]> ... <![endif]-->
	*
	*  Note: It is also possible to just check and see if the $is_IE global in WordPress is set to true before
	*  calling the wp_enqueue_style() function. If you are trying to load a stylesheet for all browsers
	*  EXCEPT for IE, then you would HAVE to check the $is_IE global since WordPress doesn't have a way to
	*  properly handle non-IE conditional comments.
	*/
	wp_enqueue_style('skt_condimentum_ie', get_template_directory_uri().'/css/ie.css', array('skt_condimentum_style'));
	$wp_styles->add_data('skt_condimentum_ie','conditional','IE');
	}
add_action('wp_enqueue_scripts','skt_condimentum_ie_stylesheet');


define('SKT_URL','https://www.sktthemes.org','skt-condimentum');
define('SKT_CONDIMENTUM_PRO_THEME_URL','https://www.sktthemes.org/shop/condimentum/','skt-condimentum');
define('SKT_CONDIMENTUM_THEME_DOC','http://sktthemesdemo.net/documentation/condimentum_documentation/','skt-condimentum');
define('SKT_CONDIMENTUM_LIVE_DEMO','http://sktthemesdemo.net/condimentum/','skt-condimentum');
define('SKT_THEMES','https://www.sktthemes.org/themes/','skt-condimentum');
define('SKT_CONDIMENTUM_FREE_THEME_URL','https://www.sktthemes.org/shop/free-multipurpose-wordpress-theme/
','skt-condimentum');

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template for about theme.
 */
require get_template_directory() . '/inc/about-themes.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

// get slug by id
function skt_condimentum_get_slug_by_id($id) {
	$post_data = get_post($id, ARRAY_A);
	$slug = $post_data['post_name'];
	return $slug; 
}

if ( ! function_exists( 'skt_condimentum_the_custom_logo' ) ) :
/**
 * Displays the optional custom logo.
 *
 * Does nothing if the custom logo is not available.
 *
 */
function skt_condimentum_the_custom_logo() {
	if ( function_exists( 'the_custom_logo' ) ) {
		the_custom_logo();
	}
}
endif;

require_once get_template_directory() . '/customize-pro/example-1/class-customize.php';