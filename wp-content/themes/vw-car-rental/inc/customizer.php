<?php
/**
 * VW Car Rental Theme Customizer
 *
 * @package VW Car Rental
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function vw_car_rental_custom_controls() {

    load_template( trailingslashit( get_template_directory() ) . '/inc/custom-controls.php' );
}
add_action( 'customize_register', 'vw_car_rental_custom_controls' );

function vw_car_rental_customize_register( $wp_customize ) {

	load_template( trailingslashit( get_template_directory() ) . 'inc/content-creation/class-customizer-content-creation.php' );

	load_template( trailingslashit( get_template_directory() ) . '/inc/icon-picker.php' );

	//add home page setting pannel
	$VWCarRentalParentPanel = new VW_Car_Rental_WP_Customize_Panel( $wp_customize, 'vw_car_rental_panel_id', array(
		'capability' => 'edit_theme_options',
		'theme_supports' => '',
		'title' => 'VW Settings',
		'priority' => 10,
	));

	$wp_customize->add_section( 'vw_car_rental_left_right', array(
    	'title'      => __( 'General Settings', 'vw-car-rental' ),
		'panel' => 'vw_car_rental_panel_id'
	) );

	$wp_customize->add_setting('vw_car_rental_width_option',array(
        'default' => __('Full Width','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));
	$wp_customize->add_control(new VW_Car_Rental_Image_Radio_Control($wp_customize, 'vw_car_rental_width_option', array(
        'type' => 'select',
        'label' => __('Width Layouts','vw-car-rental'),
        'description' => __('Here you can change the width layout of Website.','vw-car-rental'),
        'section' => 'vw_car_rental_left_right',
        'choices' => array(
            'Full Width' => get_template_directory_uri().'/assets/images/full-width.png',
            'Wide Width' => get_template_directory_uri().'/assets/images/wide-width.png',
            'Boxed' => get_template_directory_uri().'/assets/images/boxed-width.png',
    ))));

	// Add Settings and Controls for Layout
	$wp_customize->add_setting('vw_car_rental_theme_options',array(
        'default' => __('Right Sidebar','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'	        
	) );
	$wp_customize->add_control('vw_car_rental_theme_options', array(
        'type' => 'select',
        'label' => __('Post Sidebar Layout','vw-car-rental'),
        'description' => __('Here you can change the sidebar layout for posts. ','vw-car-rental'),
        'section' => 'vw_car_rental_left_right',
        'choices' => array(
            'Left Sidebar' => __('Left Sidebar','vw-car-rental'),
            'Right Sidebar' => __('Right Sidebar','vw-car-rental'),
            'One Column' => __('One Column','vw-car-rental'),
            'Three Columns' => __('Three Columns','vw-car-rental'),
            'Four Columns' => __('Four Columns','vw-car-rental'),
            'Grid Layout' => __('Grid Layout','vw-car-rental')
        ),
	));

	$wp_customize->add_setting('vw_car_rental_page_layout',array(
        'default' => __('One Column','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));
	$wp_customize->add_control('vw_car_rental_page_layout',array(
        'type' => 'select',
        'label' => __('Page Sidebar Layout','vw-car-rental'),
        'description' => __('Here you can change the sidebar layout for pages. ','vw-car-rental'),
        'section' => 'vw_car_rental_left_right',
        'choices' => array(
            'Left Sidebar' => __('Left Sidebar','vw-car-rental'),
            'Right Sidebar' => __('Right Sidebar','vw-car-rental'),
            'One Column' => __('One Column','vw-car-rental')
        ),
	) );

	//Woocommerce Shop Page Sidebar
	$wp_customize->add_setting( 'vw_car_rental_woocommerce_shop_page_sidebar',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_woocommerce_shop_page_sidebar',array(
		'label' => esc_html__( 'Shop Page Sidebar','vw-car-rental' ),
		'section' => 'vw_car_rental_left_right'
    )));

    //Woocommerce Single Product page Sidebar
	$wp_customize->add_setting( 'vw_car_rental_woocommerce_single_product_page_sidebar',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_woocommerce_single_product_page_sidebar',array(
		'label' => esc_html__( 'Single Product Sidebar','vw-car-rental' ),
		'section' => 'vw_car_rental_left_right'
    )));

	//Pre-Loader
	$wp_customize->add_setting( 'vw_car_rental_loader_enable',array(
        'default' => 1,
        'transport' => 'refresh',
        'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_loader_enable',array(
        'label' => esc_html__( 'Pre-Loader','vw-car-rental' ),
        'section' => 'vw_car_rental_left_right'
    )));

	$wp_customize->add_setting('vw_car_rental_loader_icon',array(
        'default' => __('Two Way','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));
	$wp_customize->add_control('vw_car_rental_loader_icon',array(
        'type' => 'select',
        'label' => __('Pre-Loader Type','vw-car-rental'),
        'section' => 'vw_car_rental_left_right',
        'choices' => array(
            'Two Way' => __('Two Way','vw-car-rental'),
            'Dots' => __('Dots','vw-car-rental'),
            'Rotate' => __('Rotate','vw-car-rental')
        ),
	) );

	//Topbar
	$wp_customize->add_section( 'vw_car_rental_topbar', array(
    	'title'      => __( 'Topbar Settings', 'vw-car-rental' ),
		'priority'   => 30,
		'panel' => 'vw_car_rental_panel_id'
	) );

	//Sticky Header
	$wp_customize->add_setting( 'vw_car_rental_sticky_header',array(
        'default' => 1,
        'transport' => 'refresh',
        'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_sticky_header',array(
        'label' => esc_html__( 'Sticky Header','vw-car-rental' ),
        'section' => 'vw_car_rental_topbar'
    )));

    $wp_customize->add_setting( 'vw_car_rental_search_hide_show',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_search_hide_show',array(
		'label' => esc_html__( 'Show / Hide Search','vw-car-rental' ),
		'section' => 'vw_car_rental_topbar'
    )));

    $wp_customize->add_setting('vw_car_rental_search_font_size',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_search_font_size',array(
		'label'	=> __('Search Font Size','vw-car-rental'),
		'description'	=> __('Enter a value in pixels. Example:20px','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '10px', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_topbar',
		'type'=> 'text'
	));

    $wp_customize->add_setting('vw_car_rental_phone_icon',array(
		'default'	=> 'fas fa-phone',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_phone_icon',array(
		'label'	=> __('Add Phone Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_topbar',
		'setting'	=> 'vw_car_rental_phone_icon',
		'type'		=> 'icon'
	)));

	$wp_customize->add_setting('vw_car_rental_phone',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control('vw_car_rental_phone',array(
		'label'	=> __('Add Phone no.','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '+00 123 456 7890', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_topbar',
		'type'=> 'text'
	));
    
	//Slider
	$wp_customize->add_section( 'vw_car_rental_slidersettings' , array(
    	'title'      => __( 'Slider Section', 'vw-car-rental' ),
		'priority'   => null,
		'panel' => 'vw_car_rental_panel_id'
	) );

	$wp_customize->add_setting( 'vw_car_rental_slider_hide_show',array(
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_slider_hide_show', array(
		'label' => esc_html__( 'Show / Hide Slider','vw-car-rental' ),
		'section' => 'vw_car_rental_slidersettings'
    )));

	for ( $count = 1; $count <= 4; $count++ ) {

		$wp_customize->add_setting( 'vw_car_rental_slider_page' . $count, array(
			'default'           => '',
			'sanitize_callback' => 'vw_car_rental_sanitize_dropdown_pages'
		) );
		$wp_customize->add_control( 'vw_car_rental_slider_page' . $count, array(
			'label'    => __( 'Select Slide Image Page', 'vw-car-rental' ),
			'description' => __('Slider image size (1500 x 590)','vw-car-rental'),
			'section'  => 'vw_car_rental_slidersettings',
			'type'     => 'dropdown-pages'
		) );
	}

	$wp_customize->add_setting('vw_car_rental_slider_button_icon',array(
		'default'	=> 'fa fa-angle-right',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_slider_button_icon',array(
		'label'	=> __('Add Slider Button Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_slidersettings',
		'setting'	=> 'vw_car_rental_slider_button_icon',
		'type'		=> 'icon'
	)));

	//content layout
	$wp_customize->add_setting('vw_car_rental_slider_content_option',array(
        'default' => __('Left','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));
	$wp_customize->add_control(new VW_Car_Rental_Image_Radio_Control($wp_customize, 'vw_car_rental_slider_content_option', array(
        'type' => 'select',
        'label' => __('Slider Content Layouts','vw-car-rental'),
        'section' => 'vw_car_rental_slidersettings',
        'choices' => array(
            'Left' => get_template_directory_uri().'/assets/images/slider-content1.png',
            'Center' => get_template_directory_uri().'/assets/images/slider-content2.png',
            'Right' => get_template_directory_uri().'/assets/images/slider-content3.png',
    ))));

    //Slider excerpt
	$wp_customize->add_setting( 'vw_car_rental_slider_excerpt_number', array(
		'default'              => 30,
		'type'                 => 'theme_mod',
		'transport' 		   => 'refresh',
		'sanitize_callback'    => 'absint',
		'sanitize_js_callback' => 'absint',
	) );
	$wp_customize->add_control( 'vw_car_rental_slider_excerpt_number', array(
		'label'       => esc_html__( 'Slider Excerpt length','vw-car-rental' ),
		'section'     => 'vw_car_rental_slidersettings',
		'type'        => 'range',
		'settings'    => 'vw_car_rental_slider_excerpt_number',
		'input_attrs' => array(
			'step'             => 5,
			'min'              => 0,
			'max'              => 50,
		),
	) );

	//Opacity
	$wp_customize->add_setting('vw_car_rental_slider_opacity_color',array(
		'default'              => 0.5,
		'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));

	$wp_customize->add_control( 'vw_car_rental_slider_opacity_color', array(
	'label'       => esc_html__( 'Slider Image Opacity','vw-car-rental' ),
	'section'     => 'vw_car_rental_slidersettings',
	'type'        => 'select',
	'settings'    => 'vw_car_rental_slider_opacity_color',
	'choices' => array(
      '0' =>  esc_attr('0','vw-car-rental'),
      '0.1' =>  esc_attr('0.1','vw-car-rental'),
      '0.2' =>  esc_attr('0.2','vw-car-rental'),
      '0.3' =>  esc_attr('0.3','vw-car-rental'),
      '0.4' =>  esc_attr('0.4','vw-car-rental'),
      '0.5' =>  esc_attr('0.5','vw-car-rental'),
      '0.6' =>  esc_attr('0.6','vw-car-rental'),
      '0.7' =>  esc_attr('0.7','vw-car-rental'),
      '0.8' =>  esc_attr('0.8','vw-car-rental'),
      '0.9' =>  esc_attr('0.9','vw-car-rental')
	),
	));

	//Category
	$wp_customize->add_section( 'vw_car_rental_category_section' , array(
    	'title'      => __( 'Category Section', 'vw-car-rental' ),
		'priority'   => null,
		'panel' => 'vw_car_rental_panel_id'
	) );

	$categories = get_categories();
	$cat_post = array();
	$cat_post[]= 'select';
	$i = 0;	
	foreach($categories as $category){
		if($i==0){
			$default = $category->slug;
			$i++;
		}
		$cat_post[$category->slug] = $category->name;
	}

	$wp_customize->add_setting('vw_car_rental_category',array(
		'default'	=> 'select',
		'sanitize_callback' => 'vw_car_rental_sanitize_choices',
	));
	$wp_customize->add_control('vw_car_rental_category',array(
		'type'    => 'select',
		'choices' => $cat_post,
		'label' => __('Select Category to display post','vw-car-rental'),
		'description' => __('Image Size (50 x 45)','vw-car-rental'),
		'section' => 'vw_car_rental_category_section',
	));

	//Category excerpt
	$wp_customize->add_setting( 'vw_car_rental_category_excerpt_number', array(
		'default'              => 30,
		'type'                 => 'theme_mod',
		'transport' 		   => 'refresh',
		'sanitize_callback'    => 'absint',
		'sanitize_js_callback' => 'absint',
	) );
	$wp_customize->add_control( 'vw_car_rental_category_excerpt_number', array(
		'label'       => esc_html__( 'Category Excerpt length','vw-car-rental' ),
		'section'     => 'vw_car_rental_category_section',
		'type'        => 'range',
		'settings'    => 'vw_car_rental_category_excerpt_number',
		'input_attrs' => array(
			'step'             => 5,
			'min'              => 0,
			'max'              => 50,
		),
	) );

	$wp_customize->add_setting('vw_car_rental_category_btn_icon',array(
		'default'	=> 'fa fa-angle-right',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_category_btn_icon',array(
		'label'	=> __('Add Category Button Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_category_section',
		'setting'	=> 'vw_car_rental_category_btn_icon',
		'type'		=> 'icon'
	)));

	//Services
	$wp_customize->add_section( 'vw_car_rental_service_section' , array(
    	'title'      => __( 'Services Section', 'vw-car-rental' ),
		'priority'   => null,
		'panel' => 'vw_car_rental_panel_id'
	) );

	$wp_customize->add_setting('vw_car_rental_section_title',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control('vw_car_rental_section_title',array(
		'label'	=> __('Section Title','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( 'Our Services', 'vw-car-rental' ),
        ),
		'section' => 'vw_car_rental_service_section',
		'setting' => 'vw_car_rental_section_title',
		'type' => 'text'
	));
	
	$categories = get_categories();
	$cat_post = array();
	$cat_post[]= 'select';
	$i = 0;	
	foreach($categories as $category){
		if($i==0){
			$default = $category->slug;
			$i++;
		}
		$cat_post[$category->slug] = $category->name;
	}

	$wp_customize->add_setting('vw_car_rental_services',array(
		'default'	=> 'select',
		'sanitize_callback' => 'vw_car_rental_sanitize_choices',
	));
	$wp_customize->add_control('vw_car_rental_services',array(
		'type'    => 'select',
		'choices' => $cat_post,
		'label' => __('Select Category to display services','vw-car-rental'),
		'description' => __('Image Size (50 x 45)','vw-car-rental'),
		'section' => 'vw_car_rental_service_section',
	));

	//Services excerpt
	$wp_customize->add_setting( 'vw_car_rental_services_excerpt_number', array(
		'default'              => 30,
		'type'                 => 'theme_mod',
		'transport' 		   => 'refresh',
		'sanitize_callback'    => 'absint',
		'sanitize_js_callback' => 'absint',
	) );
	$wp_customize->add_control( 'vw_car_rental_services_excerpt_number', array(
		'label'       => esc_html__( 'Service Excerpt length','vw-car-rental' ),
		'section'     => 'vw_car_rental_service_section',
		'type'        => 'range',
		'settings'    => 'vw_car_rental_services_excerpt_number',
		'input_attrs' => array(
			'step'             => 5,
			'min'              => 0,
			'max'              => 50,
		),
	) );

	//Blog Post
	$wp_customize->add_panel( $VWCarRentalParentPanel );

	$BlogPostParentPanel = new VW_Car_Rental_WP_Customize_Panel( $wp_customize, 'blog_post_parent_panel', array(
		'title' => __( 'Blog Post Settings', 'vw-car-rental' ),
		'panel' => 'vw_car_rental_panel_id',
	));

	$wp_customize->add_panel( $BlogPostParentPanel );

	// Add example section and controls to the middle (second) panel
	$wp_customize->add_section( 'vw_car_rental_post_settings', array(
		'title' => __( 'Post Settings', 'vw-car-rental' ),
		'panel' => 'blog_post_parent_panel',
	));

	$wp_customize->add_setting( 'vw_car_rental_toggle_postdate',array(
        'default' => 1,
        'transport' => 'refresh',
        'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_toggle_postdate',array(
        'label' => esc_html__( 'Post Date','vw-car-rental' ),
        'section' => 'vw_car_rental_post_settings'
    )));

    $wp_customize->add_setting( 'vw_car_rental_toggle_author',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_toggle_author',array(
		'label' => esc_html__( 'Author','vw-car-rental' ),
		'section' => 'vw_car_rental_post_settings'
    )));

    $wp_customize->add_setting( 'vw_car_rental_toggle_comments',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_toggle_comments',array(
		'label' => esc_html__( 'Comments','vw-car-rental' ),
		'section' => 'vw_car_rental_post_settings'
    )));

    $wp_customize->add_setting( 'vw_car_rental_toggle_tags',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
	));
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_toggle_tags', array(
		'label' => esc_html__( 'Tags','vw-car-rental' ),
		'section' => 'vw_car_rental_post_settings'
    )));

    $wp_customize->add_setting( 'vw_car_rental_excerpt_number', array(
		'default'              => 30,
		'type'                 => 'theme_mod',
		'transport' 		   => 'refresh',
		'sanitize_callback'    => 'absint',
		'sanitize_js_callback' => 'absint',
	) );
	$wp_customize->add_control( 'vw_car_rental_excerpt_number', array(
		'label'       => esc_html__( 'Excerpt length','vw-car-rental' ),
		'section'     => 'vw_car_rental_post_settings',
		'type'        => 'range',
		'settings'    => 'vw_car_rental_excerpt_number',
		'input_attrs' => array(
			'step'             => 5,
			'min'              => 0,
			'max'              => 50,
		),
	) );

	//Blog layout
    $wp_customize->add_setting('vw_car_rental_blog_layout_option',array(
        'default' => __('Default','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
    ));
    $wp_customize->add_control(new VW_Car_Rental_Image_Radio_Control($wp_customize, 'vw_car_rental_blog_layout_option', array(
        'type' => 'select',
        'label' => __('Blog Layouts','vw-car-rental'),
        'section' => 'vw_car_rental_post_settings',
        'choices' => array(
            'Default' => get_template_directory_uri().'/assets/images/blog-layout1.png',
            'Center' => get_template_directory_uri().'/assets/images/blog-layout2.png',
            'Left' => get_template_directory_uri().'/assets/images/blog-layout3.png',
    ))));

    // Button Settings
	$wp_customize->add_section( 'vw_car_rental_button_settings', array(
		'title' => __( 'Button Settings', 'vw-car-rental' ),
		'panel' => 'blog_post_parent_panel',
	));

	$wp_customize->add_setting('vw_car_rental_button_padding_top_bottom',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_button_padding_top_bottom',array(
		'label'	=> __('Padding Top Bottom','vw-car-rental'),
		'description'	=> __('Enter a value in pixels. Example:20px','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '10px', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_button_settings',
		'type'=> 'text'
	));

	$wp_customize->add_setting('vw_car_rental_button_padding_left_right',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_button_padding_left_right',array(
		'label'	=> __('Padding Left Right','vw-car-rental'),
		'description'	=> __('Enter a value in pixels. Example:20px','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '10px', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_button_settings',
		'type'=> 'text'
	));

	$wp_customize->add_setting( 'vw_car_rental_button_border_radius', array(
		'default'              => '',
		'type'                 => 'theme_mod',
		'transport' 		   => 'refresh',
		'sanitize_callback'    => 'absint',
		'sanitize_js_callback' => 'absint',
	) );
	$wp_customize->add_control( 'vw_car_rental_button_border_radius', array(
		'label'       => esc_html__( 'Button Border Radius','vw-car-rental' ),
		'section'     => 'vw_car_rental_button_settings',
		'type'        => 'range',
		'input_attrs' => array(
			'step'             => 1,
			'min'              => 1,
			'max'              => 50,
		),
	) );

    $wp_customize->add_setting('vw_car_rental_button_text',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_button_text',array(
		'label'	=> __('Add Button Text','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( 'READ MORE', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_button_settings',
		'type'=> 'text'
	));

	$wp_customize->add_setting('vw_car_rental_blog_button_icon',array(
		'default'	=> 'fa fa-angle-right',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_blog_button_icon',array(
		'label'	=> __('Add Blog Button Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_button_settings',
		'setting'	=> 'vw_car_rental_blog_button_icon',
		'type'		=> 'icon'
	)));

	// Related Post Settings
	$wp_customize->add_section( 'vw_car_rental_related_posts_settings', array(
		'title' => __( 'Related Posts Settings', 'vw-car-rental' ),
		'panel' => 'blog_post_parent_panel',
	));

    $wp_customize->add_setting( 'vw_car_rental_related_post',array(
		'default' => 1,
		'transport' => 'refresh',
		'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ) );
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_related_post',array(
		'label' => esc_html__( 'Related Post','vw-car-rental' ),
		'section' => 'vw_car_rental_related_posts_settings'
    )));

    $wp_customize->add_setting('vw_car_rental_related_post_title',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_related_post_title',array(
		'label'	=> __('Add Related Post Title','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( 'Related Post', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_related_posts_settings',
		'type'=> 'text'
	));

   	$wp_customize->add_setting('vw_car_rental_related_posts_count',array(
		'default'=> '3',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_related_posts_count',array(
		'label'	=> __('Add Related Post Count','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '3', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_related_posts_settings',
		'type'=> 'number'
	));

    //404 Page Setting
	$wp_customize->add_section('vw_car_rental_404_page',array(
		'title'	=> __('404 Page Settings','vw-car-rental'),
		'panel' => 'vw_car_rental_panel_id',
	));	

	$wp_customize->add_setting('vw_car_rental_404_page_title',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));

	$wp_customize->add_control('vw_car_rental_404_page_title',array(
		'label'	=> __('Add Title','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '404 Not Found', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_404_page',
		'type'=> 'text'
	));

	$wp_customize->add_setting('vw_car_rental_404_page_content',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));

	$wp_customize->add_control('vw_car_rental_404_page_content',array(
		'label'	=> __('Add Text','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( 'Looks like you have taken a wrong turn, Dont worry, it happens to the best of us.', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_404_page',
		'type'=> 'text'
	));

	$wp_customize->add_setting('vw_car_rental_404_page_button_text',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_404_page_button_text',array(
		'label'	=> __('Add Button Text','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( 'Return to the home page', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_404_page',
		'type'=> 'text'
	));

	//Responsive Media Settings
	$wp_customize->add_section('vw_car_rental_responsive_media',array(
		'title'	=> __('Responsive Media','vw-car-rental'),
		'panel' => 'vw_car_rental_panel_id',
	));

    $wp_customize->add_setting( 'vw_car_rental_stickyheader_hide_show',array(
          'default' => 1,
          'transport' => 'refresh',
          'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_stickyheader_hide_show',array(
          'label' => esc_html__( 'Sticky Header','vw-car-rental' ),
          'section' => 'vw_car_rental_responsive_media'
    )));

    $wp_customize->add_setting( 'vw_car_rental_resp_slider_hide_show',array(
          'default' => 1,
          'transport' => 'refresh',
          'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_resp_slider_hide_show',array(
          'label' => esc_html__( 'Show / Hide Slider','vw-car-rental' ),
          'section' => 'vw_car_rental_responsive_media'
    )));

	$wp_customize->add_setting( 'vw_car_rental_metabox_hide_show',array(
          'default' => 1,
          'transport' => 'refresh',
          'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_metabox_hide_show',array(
          'label' => esc_html__( 'Show / Hide Metabox','vw-car-rental' ),
          'section' => 'vw_car_rental_responsive_media'
    )));

    $wp_customize->add_setting( 'vw_car_rental_sidebar_hide_show',array(
          'default' => 1,
          'transport' => 'refresh',
          'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_sidebar_hide_show',array(
          'label' => esc_html__( 'Show / Hide Sidebar','vw-car-rental' ),
          'section' => 'vw_car_rental_responsive_media'
    )));

    $wp_customize->add_setting('vw_car_rental_res_menu_open_icon',array(
		'default'	=> 'fas fa-bars',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_res_menu_open_icon',array(
		'label'	=> __('Add Open Menu Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_responsive_media',
		'setting'	=> 'vw_car_rental_res_menu_open_icon',
		'type'		=> 'icon'
	)));

	$wp_customize->add_setting('vw_car_rental_res_close_menus_icon',array(
		'default'	=> 'fas fa-times',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_res_close_menus_icon',array(
		'label'	=> __('Add Close Menu Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_responsive_media',
		'setting'	=> 'vw_car_rental_res_close_menus_icon',
		'type'		=> 'icon'
	)));

	//Content Craetion
	$wp_customize->add_section( 'vw_car_rental_content_section' , array(
    	'title' => __( 'Customize Home Page', 'vw-car-rental' ),
		'priority' => null,
		'panel' => 'vw_car_rental_panel_id'
	) );

	$wp_customize->add_setting('vw_car_rental_content_creation_main_control', array(
		'sanitize_callback' => 'esc_html',
	) );

	$homepage= get_option( 'page_on_front' );

	$wp_customize->add_control(	new VW_Car_Rental_Content_Creation( $wp_customize, 'vw_car_rental_content_creation_main_control', array(
		'options' => array(
			esc_html__( 'The edit button enables you to create homepage in a matter of minutes in just a few clicks. Just click on the edit option, add whatever elements you want to include in the homepage, save the changes and you are good to go', 'vw-car-rental' ),
		),
		'section' => 'vw_car_rental_content_section',
		'button_url'  => admin_url( 'post.php?post='.$homepage.'&action=edit'),
		'button_text' => esc_html__( 'Edit', 'vw-car-rental' ),
	) ) );

	//Footer Text
	$wp_customize->add_section('vw_car_rental_footer',array(
		'title'	=> __('Footer','vw-car-rental'),
		'panel' => 'vw_car_rental_panel_id',
	));	
	
	$wp_customize->add_setting('vw_car_rental_footer_text',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control('vw_car_rental_footer_text',array(
		'label'	=> __('Copyright Text','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( 'Copyright 2018, .....', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_footer',
		'setting'=> 'vw_car_rental_footer_text',
		'type'=> 'text'
	));	

	$wp_customize->add_setting('vw_car_rental_copyright_alingment',array(
        'default' => __('center','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));
	$wp_customize->add_control(new VW_Car_Rental_Image_Radio_Control($wp_customize, 'vw_car_rental_copyright_alingment', array(
        'type' => 'select',
        'label' => __('Copyright Alignment','vw-car-rental'),
        'section' => 'vw_car_rental_footer',
        'settings' => 'vw_car_rental_copyright_alingment',
        'choices' => array(
            'left' => get_template_directory_uri().'/assets/images/copyright1.png',
            'center' => get_template_directory_uri().'/assets/images/copyright2.png',
            'right' => get_template_directory_uri().'/assets/images/copyright3.png'
    ))));

    $wp_customize->add_setting('vw_car_rental_copyright_padding_top_bottom',array(
		'default'=> '',
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	$wp_customize->add_control('vw_car_rental_copyright_padding_top_bottom',array(
		'label'	=> __('Copyright Padding Top Bottom','vw-car-rental'),
		'description'	=> __('Enter a value in pixels. Example:20px','vw-car-rental'),
		'input_attrs' => array(
            'placeholder' => __( '10px', 'vw-car-rental' ),
        ),
		'section'=> 'vw_car_rental_footer',
		'type'=> 'text'
	));

	$wp_customize->add_setting( 'vw_car_rental_hide_show_scroll',array(
    	'default' => 1,
      	'transport' => 'refresh',
      	'sanitize_callback' => 'vw_car_rental_switch_sanitization'
    ));  
    $wp_customize->add_control( new VW_Car_Rental_Toggle_Switch_Custom_Control( $wp_customize, 'vw_car_rental_hide_show_scroll',array(
      	'label' => esc_html__( 'Show / Hide Scroll To Top','vw-car-rental' ),
      	'section' => 'vw_car_rental_footer'
    )));

    $wp_customize->add_setting('vw_car_rental_scroll_to_top_icon',array(
		'default'	=> 'fas fa-long-arrow-alt-up',
		'sanitize_callback'	=> 'sanitize_text_field'
	));	
	$wp_customize->add_control(new VW_Car_Rental_Fontawesome_Icon_Chooser(
        $wp_customize,'vw_car_rental_scroll_to_top_icon',array(
		'label'	=> __('Add Scroll to Top Icon','vw-car-rental'),
		'transport' => 'refresh',
		'section'	=> 'vw_car_rental_footer',
		'setting'	=> 'vw_car_rental_scroll_to_top_icon',
		'type'		=> 'icon'
	)));

	$wp_customize->add_setting('vw_car_rental_scroll_top_alignment',array(
        'default' => __('Right','vw-car-rental'),
        'sanitize_callback' => 'vw_car_rental_sanitize_choices'
	));
	$wp_customize->add_control(new VW_Car_Rental_Image_Radio_Control($wp_customize, 'vw_car_rental_scroll_top_alignment', array(
        'type' => 'select',
        'label' => __('Scroll To Top','vw-car-rental'),
        'section' => 'vw_car_rental_footer',
        'settings' => 'vw_car_rental_scroll_top_alignment',
        'choices' => array(
            'Left' => get_template_directory_uri().'/assets/images/layout1.png',
            'Center' => get_template_directory_uri().'/assets/images/layout2.png',
            'Right' => get_template_directory_uri().'/assets/images/layout3.png'
    ))));

    // Has to be at the top
	$wp_customize->register_panel_type( 'VW_Car_Rental_WP_Customize_Panel' );
	$wp_customize->register_section_type( 'VW_Car_Rental_WP_Customize_Section' );
}

add_action( 'customize_register', 'vw_car_rental_customize_register' );

load_template( trailingslashit( get_template_directory() ) . '/inc/logo/logo-resizer.php' );

if ( class_exists( 'WP_Customize_Panel' ) ) {

  class VW_Car_Rental_WP_Customize_Panel extends WP_Customize_Panel {

    public $panel;
    public $type = 'vw_car_rental_panel';
    public function json() {

      $array = wp_array_slice_assoc( (array) $this, array( 'id', 'description', 'priority', 'type', 'panel', ) );
      $array['title'] = html_entity_decode( $this->title, ENT_QUOTES, get_bloginfo( 'charset' ) );
      $array['content'] = $this->get_content();
      $array['active'] = $this->active();
      $array['instanceNumber'] = $this->instance_number;
      return $array;
    }
  }
}

if ( class_exists( 'WP_Customize_Section' ) ) {
  class VW_Car_Rental_WP_Customize_Section extends WP_Customize_Section {
  	
    public $section;
    public $type = 'vw_car_rental_section';
    public function json() {

      $array = wp_array_slice_assoc( (array) $this, array( 'id', 'description', 'priority', 'panel', 'type', 'description_hidden', 'section', ) );
      $array['title'] = html_entity_decode( $this->title, ENT_QUOTES, get_bloginfo( 'charset' ) );
      $array['content'] = $this->get_content();
      $array['active'] = $this->active();
      $array['instanceNumber'] = $this->instance_number;

      if ( $this->panel ) {
        $array['customizeAction'] = sprintf( 'Customizing &#9656; %s', esc_html( $this->manager->get_panel( $this->panel )->title ) );
      } else {
        $array['customizeAction'] = 'Customizing';
      }
      return $array;
    }
  }
}

// Enqueue our scripts and styles
function vw_car_rental_customize_controls_scripts() {
  wp_enqueue_script( 'customizer-controls', get_theme_file_uri( '/assets/js/customizer-controls.js' ), array(), '1.0', true );
}
add_action( 'customize_controls_enqueue_scripts', 'vw_car_rental_customize_controls_scripts' );

/**
 * Singleton class for handling the theme's customizer integration.
 *
 * @since  1.0.0
 * @access public
 */
final class VW_Car_Rental_Customize {

	/**
	 * Returns the instance.
	 *
	 * @since  1.0.0
	 * @access public
	 * @return object
	 */
	public static function get_instance() {

		static $instance = null;

		if ( is_null( $instance ) ) {
			$instance = new self;
			$instance->setup_actions();
		}

		return $instance;
	}

	/**
	 * Constructor method.
	 *
	 * @since  1.0.0
	 * @access private
	 * @return void
	 */
	private function __construct() {}

	/**
	 * Sets up initial actions.
	 *
	 * @since  1.0.0
	 * @access private
	 * @return void
	 */
	private function setup_actions() {

		// Register panels, sections, settings, controls, and partials.
		add_action( 'customize_register', array( $this, 'sections' ) );

		// Register scripts and styles for the controls.
		add_action( 'customize_controls_enqueue_scripts', array( $this, 'enqueue_control_scripts' ), 0 );
	}

	/**
	 * Sets up the customizer sections.
	 *
	 * @since  1.0.0
	 * @access public
	 * @param  object  $manager
	 * @return void
	 */
	public function sections( $manager ) {

		// Load custom sections.
		load_template( trailingslashit( get_template_directory() ) . '/inc/section-pro.php' );

		// Register custom section types.
		$manager->register_section_type( 'VW_Car_Rental_Customize_Section_Pro' );

		// Register sections.
		$manager->add_section(new VW_Car_Rental_Customize_Section_Pro($manager,'example_1',array(
			'priority'   => 1,
			'title'    => esc_html__( 'VW CAR RENTAL', 'vw-car-rental' ),
			'pro_text' => esc_html__( 'UPGRADE PRO', 'vw-car-rental' ),
			'pro_url'  => esc_url('https://www.vwthemes.com/themes/car-rental-wordpress-theme/'),
		)));

		// Register sections.
		$manager->add_section(new VW_Car_Rental_Customize_Section_Pro($manager,'example_2',array(
			'priority'   => 1,
			'title'    => esc_html__( 'DOCUMENATATION', 'vw-car-rental' ),
			'pro_text' => esc_html__( 'DOCS', 'vw-car-rental' ),
			'pro_url'  => admin_url('themes.php?page=vw_car_rental_guide'),
		)));
	}

	/**
	 * Loads theme customizer CSS.
	 *
	 * @since  1.0.0
	 * @access public
	 * @return void
	 */
	public function enqueue_control_scripts() {

		wp_enqueue_script( 'vw-car-rental-customize-controls', trailingslashit( get_template_directory_uri() ) . '/assets/js/customize-controls.js', array( 'customize-controls' ) );

		wp_enqueue_style( 'vw-car-rental-customize-controls', trailingslashit( get_template_directory_uri() ) . '/assets/css/customize-controls.css' );
	}
}

// Doing this customizer thang!
VW_Car_Rental_Customize::get_instance();