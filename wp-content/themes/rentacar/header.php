<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div class="container">
 *
 * @package SKT Condimentum
 */
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php
$contact_no = get_theme_mod('contact_no');
$contact_mail = get_theme_mod('contact_mail');
if(!empty ($contact_no) || !empty ($contact_mail)){
?>

<div class="header-top">
			<div class="container">
            	<div class="header-left">                
                	<?php if ( ! dynamic_sidebar( 'header-left-widget' ) ) : ?>       
                        <?php 
						if(!empty ($contact_no) ){
						?>      
                          <span><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/icon-phone.png" alt="" /> 
                        <?php echo esc_attr($contact_no); ?></span>
                    <?php } ?>  
			<?php  
			if( !empty($contact_mail) ){ ?>
              <span><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/icon-email.png" alt="" style="margin-bottom:-2px" /><a href="mailto:<?php echo antispambot( sanitize_email( $contact_mail ) ); ?>"><?php echo antispambot( sanitize_email( $contact_mail ) ); ?></a></span>		
			  <?php } ?> 
			  <?php endif; // end sidebar widget area ?>					
            </div>
            
            	<div class="header-right">   
                    <div class="header-social-icons">                       
                        <?php
						$fb_link = get_theme_mod('fb_link');
						if (!empty($fb_link)){ ?>
                        <a title="facebook" class="fb" target="_blank" href="<?php echo esc_url($fb_link); ?>"></a> 
                        <?php } ?>       
                        
                        <?php 
						$twitt_link = get_theme_mod('twitt_link');
						if (!empty($twitt_link)) { ?>
                        <a title="twitter" class="tw" target="_blank" href="<?php echo esc_url($twitt_link); ?>"></a>
                        <?php } ?>     
                        <?php 
						$gplus_link = get_theme_mod('gplus_link');
						if ( !empty($gplus_link)) { ?>
                        <a title="google-plus" class="gp" target="_blank" href="<?php echo esc_url($gplus_link); ?>"></a>
                        <?php } ?>        
                        <?php
						$linked_link = get_theme_mod('linked_link');
						 if (!empty($linked_link)) { ?> 
                        <a title="linkedin" class="in" target="_blank" href="<?php echo esc_url($linked_link); ?>"></a>
                        <?php } ?>                   
                    </div>  
                </div>
                <div class="clear"></div>
            </div>
</div><!--.headertop-->  
<?php } ?>
	<?php 
  		$hideslide = get_theme_mod('hide_slider', '1');
	?>  
  <div class="header <?php if ( is_home() || !is_front_page() ) { ?>innerheader<?php } ?>">
  <div class="container">
   <div class="logo">  
      <?php skt_condimentum_the_custom_logo(); ?>  
      <div class="clear"></div>
      <a href="<?php echo home_url('/'); ?>">
		<h1><?php bloginfo('name'); ?></h1>
        <p><?php bloginfo('description'); ?></p>      
      </a>    
   </div><!-- logo -->
<div class="widget-right">
	<div class="toggle"><a class="toggleMenu" href="<?php echo esc_url('#');?>" style="display:none;"><?php esc_html_e('Menu','skt-condimentum'); ?></a></div> 
        <div class="sitenav">
          <?php wp_nav_menu( array('theme_location' => 'primary') ); ?>         
        </div><!-- .sitenav--> 
        <div class="clear"></div> 
</div><!--.widget-right-->
 <div class="clear"></div>
         
  </div> <!-- container -->
</div><!--.header -->
<?php if (is_front_page() && !is_home()) { ?> 
<?php if( get_theme_mod( 'hide_slides' ) == '') { ?>
<!-- Slider Section -->
<?php for($sld=7; $sld<10; $sld++) { ?>
	<?php if( get_theme_mod('page-setting'.$sld)) { ?>
     <?php $slidequery = new WP_query('page_id='.get_theme_mod('page-setting'.$sld,true)); ?>
		<?php while( $slidequery->have_posts() ) : $slidequery->the_post();
        $image = wp_get_attachment_url( get_post_thumbnail_id($post->ID));
        $img_arr[] = $image;
        $id_arr[] = $post->ID;
        endwhile;
  	  }
    }
?>
<?php if(!empty($id_arr)){ ?>
<section id="home_slider">
  <div class="slider-wrapper theme-default">
    <div id="slider" class="nivoSlider">
      <?php 
	$i=1;
	foreach($img_arr as $url){ ?>
      <img src="<?php echo $url; ?>" title="#slidecaption<?php echo $i; ?>" />
      <?php $i++; }  ?>
    </div>
		<?php 
        $i=1;
        foreach($id_arr as $id){ 
        $title = get_the_title( $id ); 
        $post = get_post($id); 
        $content = apply_filters('the_content', substr(strip_tags($post->post_content), 0, 100)); 
        ?>
    <div id="slidecaption<?php echo $i; ?>" class="nivo-html-caption">
      <div class="slide_info">
        <h2><?php echo $title; ?></h2>
        <p><?php echo $content; ?></p>
        <div class="clear"></div>
        <a class="slide_more" href="<?php the_permalink(); ?>">
          <?php esc_html_e('Read More', 'skt-condimentum');?>
          </a>
      </div>
    </div>
    <?php $i++; } ?>
  </div>
  <div class="clear"></div>
</section>
<?php } else { ?>
<?php if ( current_user_can( 'edit_theme_options' ) ) { ?>
<section id="pagearea"><div class="nullslide"><img src="<?php echo esc_url(get_template_directory_uri());?>/images/slide-info.jpg" /></div></section>
<?php } ?>
<?php } }   ?>
<?php if( get_theme_mod( 'hide_pagefourboxes' ) == '') { ?>
<section id="pagearea">
  <div class="container"> 
  
     <div class="pageleft">
       <?php if( get_theme_mod('page-setting1')) { ?>
      <?php $queryvar = new WP_query('page_id='.get_theme_mod('page-setting1' ,true)); ?>
      <?php while( $queryvar->have_posts() ) : $queryvar->the_post();?>
     
      <h2 class="section-title">
        <?php the_title(); ?>
      </h2>      
      <p><?php echo skt_condimentum_content(60); ?></p> 
       <a href="<?php echo esc_url( get_permalink() ); ?>" class="ReadMore">
        <?php esc_html_e('Read More','skt-condimentum'); ?>
      </a>       
      <div class="clear"></div>
      <?php endwhile; } else { ?>     
      <?php if ( current_user_can( 'edit_theme_options' ) ) { ?>
      <p><img src="<?php echo esc_url(get_template_directory_uri());?>/images/whoweare-box.jpg" /></p> 
      <?php } ?>
      <?php } ?>
    </div><!--.end page left--> 
    
    <div class="pageright">       
 <?php
$pages = array();
for ( $count = 1; $count<5; $count++ ) {
	$mod = get_theme_mod( 'page-column' . $count );
	if ( 'page-none-selected' != $mod ) {
		$pages[] = $mod;
	}
}
$filterArray = array_filter($pages);
if(count($filterArray) == 0){ ?>
<?php if ( current_user_can( 'edit_theme_options' ) ) { ?>
<p><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/home-boxes.jpg" /></p>
<?php } ?>
<?php 	
}else{

$filled_array=array_filter($pages);
	
$args = array(
	'posts_per_page' => 4,
	'post_type' => 'page',
	'post__in' => $pages,
	'orderby' => 'post__in'
);
$query = new WP_Query( $args );
if ( $query->have_posts() ) :
	$count = 1;
	while ( $query->have_posts() ) : $query->the_post();
	?>
      <div class="fourbox <?php if($count % 4 == 0) { echo "last_column"; } ?>">     	
		 <?php if( has_post_thumbnail() ) { ?>
			<div class="thumbbx"><a href="<?php echo esc_url( get_permalink() ); ?>"><?php the_post_thumbnail();?></a> </div>            
          <?php } ?> 
          <div class="pagebx-dec"> 
           <h3><a href="<?php echo esc_url( get_permalink() ); ?>"><?php the_title(); ?></a></h3>        
		   <?php echo skt_condimentum_content(15); ?>
           <a class="plusicon" href="<?php echo esc_url( get_permalink() ); ?>"></a>
          </div>
      </div>
              <?php if($count == 0) { ?>
        <div class="clear"></div>
        <?php } ?>
      
<?php
	$count++;
	endwhile;
 endif;
}
 
?>
  <div class="clear"></div> 
  </div><!-- .end page right-->
  <div class="clear"></div> 
  </div><!-- container -->
</section><!-- #pagearea -->
<?php } } ?>