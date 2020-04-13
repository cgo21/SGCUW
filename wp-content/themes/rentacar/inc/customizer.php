<?php
/**
 * SKT Condimentum Theme Customizer
 *
 * @package SKT Condimentum
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function skt_condimentum_customize_register( $wp_customize ) {
	
	//Add a class for titles
    class skt_condimentum_Info extends WP_Customize_Control {
        public $type = 'info';
        public $label = '';
        public function render_content() {
        ?>
			<h3 style="text-decoration: underline; color: #DA4141; text-transform: uppercase;"><?php echo esc_html( $this->label ); ?></h3>
        <?php
        }
    }	

	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->remove_control('header_textcolor');
	$wp_customize->remove_control('display_header_text');	
	
	// Color Scheme
	$wp_customize->add_setting('color_scheme',array(
			'default'	=> '#ffe401',
			'sanitize_callback'	=> 'sanitize_hex_color'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Color_Control($wp_customize,'color_scheme',array(
			'label' => esc_html__('Color Scheme','skt-condimentum'),			
			 'description'	=> esc_html__('More color options in PRO Version','skt-condimentum'),	
			'section' => 'colors',
			'settings' => 'color_scheme'
		))
	);
	
	
	// Slider Section		
	$wp_customize->add_section( 'slider_section', array(
            'title' => esc_html__('Slider Settings', 'skt-condimentum'),
            'priority' => null,
            'description'	=> esc_html__('Featured Image Size Should be ( 1400x638 ) More slider settings available in PRO Version','skt-condimentum'),		
        )
    );	
	
	$wp_customize->add_setting('page-setting7',array(
			'default' => '0',
			'capability' => 'edit_theme_options',			
			'sanitize_callback'	=> 'skt_condimentum_sanitize_integer'
	));
	
	$wp_customize->add_control('page-setting7',array(
			'type'	=> 'dropdown-pages',
			'label'	=> esc_html__('Select page for slide one:','skt-condimentum'),
			'section'	=> 'slider_section'
	));	
	
	$wp_customize->add_setting('page-setting8',array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback'	=> 'skt_condimentum_sanitize_integer'
	));
	
	$wp_customize->add_control('page-setting8',array(
			'type'	=> 'dropdown-pages',
			'label'	=> esc_html__('Select page for slide two:','skt-condimentum'),
			'section'	=> 'slider_section'
	));	
	
	$wp_customize->add_setting('page-setting9',array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback'	=> 'skt_condimentum_sanitize_integer'
	));
	
	$wp_customize->add_control('page-setting9',array(
			'type'	=> 'dropdown-pages',
			'label'	=> esc_html__('Select page for slide three:','skt-condimentum'),
			'section'	=> 'slider_section'
	));	
	
	//Slider hide
	$wp_customize->add_setting('hide_slides',array(
			'sanitize_callback' => 'sanitize_text_field',
	));	 

	$wp_customize->add_control( 'hide_slides', array(
    	   'section'   => 'slider_section',    	 
		   'label'	=> esc_html__('Hide slider Section','skt-condimentum'),
    	   'type'      => 'checkbox'
     )); // Slider Section		 
	
	
	
	// Home Three Boxes Section 	
	$wp_customize->add_section('section_second', array(
		'title'	=> esc_html__('Homepage Services Section','skt-condimentum'),
		'priority'	=> null
	));	
	
	
	$wp_customize->add_setting('page-setting1',	array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback' => 'skt_condimentum_sanitize_integer',
		));
 
	$wp_customize->add_control(	'page-setting1',array('type' => 'dropdown-pages',
			'label' => esc_html__('Select page for who we are box','skt-condimentum'),
			'section' => 'section_second',
	));
	
	
	$wp_customize->add_setting('page-column1',	array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback' => 'skt_condimentum_sanitize_integer',
		));
 
	$wp_customize->add_control(	'page-column1',array('type' => 'dropdown-pages',
			'label' => esc_html__('Select Pages from the dropdown for homepage four boxes section','skt-condimentum'),
			'section' => 'section_second',
	));	
	
	
	$wp_customize->add_setting('page-column2',	array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback' => 'skt_condimentum_sanitize_integer',
		));
 
	$wp_customize->add_control(	'page-column2',array('type' => 'dropdown-pages',
			'section' => 'section_second',
	));
	
	$wp_customize->add_setting('page-column3',	array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback' => 'skt_condimentum_sanitize_integer',
		));
 
	$wp_customize->add_control(	'page-column3',array('type' => 'dropdown-pages',
			'section' => 'section_second',
	));
	
	$wp_customize->add_setting('page-column4',	array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback' => 'skt_condimentum_sanitize_integer',
		));
 
	$wp_customize->add_control(	'page-column4',array('type' => 'dropdown-pages',
			'section' => 'section_second',
	));	//end three column part
	
	//Hide Page Boxes Column Section
	$wp_customize->add_setting('hide_pagefourboxes',array(
			'sanitize_callback' => 'sanitize_text_field',
	));	 

	$wp_customize->add_control( 'hide_pagefourboxes', array(
    	   'section'   => 'section_second',    	 
		   'label'	=> esc_html__('Hide four column page boxes','skt-condimentum'),
    	   'type'      => 'checkbox'
     )); // Hide Page Boxes Column Section
	
	$wp_customize->add_section('social_sec',array(
			'title'	=> esc_html__('Social Settings','skt-condimentum'),				
			'description'	=> esc_html__('More social icon available in PRO Version','skt-condimentum'),		
			'priority'		=> null
	));
	
	
	$wp_customize->add_setting('fb_link',array(
			'default'	=> null,
			'sanitize_callback'	=> 'esc_url_raw'	
	));
	
	$wp_customize->add_control('fb_link',array(
			'label'	=> esc_html__('Add facebook link here','skt-condimentum'),
			'section'	=> 'social_sec',
			'setting'	=> 'fb_link'
	));	
	$wp_customize->add_setting('twitt_link',array(
			'default'	=> null,
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('twitt_link',array(
			'label'	=> esc_html__('Add twitter link here','skt-condimentum'),
			'section'	=> 'social_sec',
			'setting'	=> 'twitt_link'
	));
	$wp_customize->add_setting('gplus_link',array(
			'default'	=> null,
			'sanitize_callback'	=> 'esc_url_raw'
	));
	$wp_customize->add_control('gplus_link',array(
			'label'	=> esc_html__('Add google plus link here','skt-condimentum'),
			'section'	=> 'social_sec',
			'setting'	=> 'gplus_link'
	));
	$wp_customize->add_setting('linked_link',array(
			'default'	=> null,
			'sanitize_callback'	=> 'esc_url_raw'
	));
	$wp_customize->add_control('linked_link',array(
			'label'	=> esc_html__('Add linkedin link here','skt-condimentum'),
			'section'	=> 'social_sec',
			'setting'	=> 'linked_link'
	));
	
	$wp_customize->add_section('footer_area',array(
			'title'	=> esc_html__('Footer Area','skt-condimentum'),
			'priority'	=> null
	));	
	
	$wp_customize->add_setting('footermenu_title',array(
			'default'	=> null,
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('footermenu_title',array(
			'label'	=> esc_html__('Add title for footer menu','skt-condimentum'),
			'section'	=> 'footer_area',
			'setting'	=> 'footermenu_title'
	));	
	
	$wp_customize->add_setting('about_title',array(
			'default'	=> null,
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('about_title',array(
			'label'	=> esc_html__('Add title for about us','skt-condimentum'),
			'section'	=> 'footer_area',
			'setting'	=> 'about_title'
	));	
		
	$wp_customize->add_setting( 'about_description', array(
			'default'	=> null,				
			'sanitize_callback' => 'esc_textarea',
	) );

	$wp_customize->add_control( 'about_description', array(
			'type' => 'textarea',
			'label' => esc_html__( 'About Description', 'skt-condimentum' ),   
			'section' => 'footer_area',   
			'setting'	=> 'about_description',
	) );
	
	$wp_customize->add_setting('newsfeed_title',array(
			'default'	=> null,
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('newsfeed_title',array(
			'label'	=> esc_html__('Add title for latest news feed','skt-condimentum'),
			'section'	=> 'footer_area',
			'setting'	=> 'newsfeed_title'
	));	
	
	$wp_customize->add_setting('contact_title',array(
			'default'	=> null,
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('contact_title',array(
			'label'	=> esc_html__('Add title for footer contact info','skt-condimentum'),
			'section'	=> 'footer_area',
			'setting'	=> 'contact_title'
	));
	
	$wp_customize->add_section('contact_sec',array(
			'title'	=> esc_html__('Contact Details','skt-condimentum'),
			'description'	=> esc_html__('Add you contact details here','skt-condimentum'),
			'priority'	=> null
	));	
	
	
	$wp_customize->add_setting('contact_add',array(
			'default'	=> null,
			'sanitize_callback'	=> 'esc_textarea',
	));
	
	$wp_customize->add_control(	'contact_add', array(
				'type' => 'textarea',
				'label'	=> esc_html__('Add contact address here','skt-condimentum'),
				'section'	=> 'contact_sec',
				'setting'	=> 'contact_add'
	));
	$wp_customize->add_setting('contact_no',array(
			'default'	=> null,
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('contact_no',array(
			'label'	=> esc_html__('Add contact number here.','skt-condimentum'),
			'section'	=> 'contact_sec',
			'setting'	=> 'contact_no'
	));
	$wp_customize->add_setting('contact_mail',array(
			'default'	=> null,
			'sanitize_callback'	=> 'sanitize_email'
	));
	
	$wp_customize->add_control('contact_mail',array(
			'label'	=> esc_html__('Add you email here','skt-condimentum'),
			'section'	=> 'contact_sec',
			'setting'	=> 'contact_mail'
	));	
	 
    $wp_customize->add_setting('skt_condimentum_options[layout-info]', array(
            'type' => 'info_control',
            'capability' => 'edit_theme_options',
			'sanitize_callback' => 'sanitize_text_field'
        )
    );
    $wp_customize->add_control( new skt_condimentum_Info( $wp_customize, 'layout_section', array(
        'section' => 'theme_layout_sec',
        'settings' => 'skt_condimentum_options[layout-info]',
        'priority' => null
        ) )
    );
	
	
	  
    $wp_customize->add_setting('skt_condimentum_options[font-info]', array(
            'type' => 'info_control',
            'capability' => 'edit_theme_options',
			'sanitize_callback' => 'sanitize_text_field'
        )
    );
    $wp_customize->add_control( new skt_condimentum_Info( $wp_customize, 'font_section', array(
        'section' => 'theme_font_sec',
        'settings' => 'skt_condimentum_options[font-info]',
        'priority' => null
        ) )
    );	
	  
    $wp_customize->add_setting('skt_condimentum_options[info]', array(
            'type' => 'info_control',
            'capability' => 'edit_theme_options',
			'sanitize_callback' => 'sanitize_text_field'
        )
    );
    $wp_customize->add_control( new skt_condimentum_Info( $wp_customize, 'doc_section', array(
        'section' => 'theme_doc_sec',
        'settings' => 'skt_condimentum_options[info]',
        'priority' => 10
        ) )
    );		
}
add_action( 'customize_register', 'skt_condimentum_customize_register' );

//Integer
function skt_condimentum_sanitize_integer( $input ) {
    if( is_numeric( $input ) ) {
        return intval( $input );
    }
}

function skt_condimentum_custom_css(){
		?>
        	<style type="text/css"> 
					
					a, .blog_lists h2 a:hover,
					#sidebar ul li a:hover,
					.fourbox:hover h3,
					.cols-4 ul li a:hover, .cols-4 ul li.current_page_item a,					
					.phone-no strong,					
					.left a:hover,
					.blog_lists h4 a:hover,
					.recent-post h6 a:hover,
					.postmeta a:hover,
					.recent-post .morebtn:hover,
					.recent-post .morebtn,
					.sitenav ul li a:hover, .sitenav ul li.current_page_item a, .sitenav ul li.menu-item-has-children.hover, .sitenav ul li.current-menu-parent a.parent
					{ color:<?php echo esc_attr(get_theme_mod('color_scheme','#ffe401')); ?>;}
					 
					
					.pagination .nav-links span.current, .pagination .nav-links a:hover,
					#commentform input#submit:hover,										
					.nivo-controlNav a.active,				
					h3.widget-title,				
					.wpcf7 input[type='submit'],					
					.social-icons a:hover,
					a.ReadMore:hover,
					input.search-submit	,
					.header-right::after,
					.slide_info .slide_more	,
					.header-right				
					{ background-color:<?php echo esc_attr(get_theme_mod('color_scheme','#ffe401')); ?> !important;}
					
						
					
					.header-right::before
					{ border-bottom-color:<?php echo esc_attr(get_theme_mod('color_scheme','#ffe401')); ?> !important;}
					
			</style> 
<?php         
} 
         
add_action('wp_head','skt_condimentum_custom_css');	

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function skt_condimentum_customize_preview_js() {
	wp_enqueue_script( 'skt_condimentum_customizer', get_template_directory_uri() . '/js/customize-preview.js', array( 'customize-preview' ), '20130508', true );
}
add_action( 'customize_preview_init', 'skt_condimentum_customize_preview_js' );