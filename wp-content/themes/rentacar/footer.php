<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package SKT Condimentum
 */
?>
<div id="footer-wrapper">
    	<div class="container footer">
        
        	<div class="cols-4 widget-column-1">             
              <?php 
			  	$footermenu_title = get_theme_mod('footermenu_title');
				if (!empty($footermenu_title)) { ?>
                <h5><?php echo esc_attr($footermenu_title);?></h5>             
			   <?php } ?>               
              <?php wp_nav_menu( array('theme_location' => 'footer', 'depth' => 1) ); ?>         
            </div><!--end .widget-column-1--> 
        
             <div class="cols-4 widget-column-2">             
              <?php 
			  	$about_title = get_theme_mod('about_title');
				if (!empty($about_title)) { ?>
                <h5><?php echo esc_attr($about_title);?></h5>             
			  <?php } ?>
			  <?php
			  	$about_description = get_theme_mod('about_description');
			   if (!empty($about_description)) { ?>
                <p><?php echo esc_attr($about_description);?></p>
			   <?php } ?>         
            </div><!--end .widget-column-2-->                  
            <div class="cols-4 widget-column-3">                 
                <?php
				$newsfeed_title = get_theme_mod('newsfeed_title');
				 if (!empty($newsfeed_title)) { ?>
                <h5><?php echo esc_attr($newsfeed_title);?></h5>            
			  <?php } ?>  
              <?php $args = array( 'posts_per_page' => 2, 'post__not_in' => get_option('sticky_posts'), 'orderby' => 'date', 'order' => 'desc' );
					$postquery = new WP_Query( $args );
					?>
                    <?php while( $postquery->have_posts() ) : $postquery->the_post(); ?>
                        <div class="recent-post">
                            <a href="<?php echo esc_url( get_permalink() ); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>                           	
                            <p><?php echo skt_condimentum_content(10); ?></p> 
                            <a class="morebtn" href="<?php echo esc_url( get_permalink() ); ?>"><?php esc_html_e('Read More &rarr;','skt-condimentum'); ?></a>                                              
                        </div>
                    <?php endwhile; ?>
                    <?php wp_reset_postdata(); ?>                    
				
              </div><!--end .widget-column-3-->
                
             <div class="cols-4 widget-column-4">                              
               <?php
			    $contact_title = get_theme_mod( 'contact_title');
			    if (!empty($contact_title)){  ?>
                <h5><?php echo esc_attr($contact_title); ?></h5>              
			   <?php } ?>
                <div class="phone-no">	                
               <?php
			   $contact_add = get_theme_mod('contact_add');
			    if (!empty($contact_add)) { ?>
                <p><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/location-icon.png" alt="" /><?php echo esc_attr($contact_add);?></p>             
			   <?php } ?>                
              
              <?php 
			  	$contact_no = get_theme_mod('contact_no');
			  if (!empty($contact_no)) { ?>
                <p> <img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/footer-icon-phone.png" alt="" /> <?php echo esc_attr($contact_no); ?></p>              
			   <?php } ?>  
			<?php  
			$contact_mail = get_theme_mod('contact_mail');
			if( !empty($contact_mail) ){ ?>
              <img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/footer-icon-email.png" alt="" /><a href="mailto:<?php echo antispambot( sanitize_email( $contact_mail ) ); ?>"><?php echo antispambot( sanitize_email( $contact_mail ) ); ?></a>			
			  <?php } ?>                             
               </div>
               
               <div class="social-icons">
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
               
          </div><!--end .widget-column-4-->
                
                
            <div class="clear"></div>
        </div><!--end .container--> 
        
         <div class="copyright-wrapper">
        	<div class="container">
           		 <div class="copyright-txt">&nbsp;</div>
            	 <div class="design-by"><?php echo esc_html('SKT Condimentum');?></div>
                 <div class="clear"></div>
            </div>           
        </div>
               
    </div><!--end .footer-wrapper-->
<?php wp_footer(); ?>
</body>
</html>