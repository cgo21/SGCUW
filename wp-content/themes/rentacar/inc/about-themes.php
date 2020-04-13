<?php
//about theme info
add_action( 'admin_menu', 'skt_condimentum_abouttheme' );
function skt_condimentum_abouttheme() {    	
	add_theme_page( esc_html__('About Theme', 'skt-condimentum'), esc_attr__('About Theme', 'skt-condimentum'), 'edit_theme_options', 'skt_condimentum_guide', 'skt_condimentum_mostrar_guide');   
} 

//guidline for about theme
function skt_condimentum_mostrar_guide() { 
	//custom function about theme customizer
	$return = add_query_arg( array()) ;
?>

<style type="text/css">
@media screen and (min-width: 800px) {
.col-left {float:left; width: 65%; padding: 1%;}
.col-right {float:right; width: 30%; padding:1%; border-left:1px solid #DDDDDD; }
}
</style>

<div class="wrapper-info">
	<div class="col-left">
   		   <div style="font-size:16px; font-weight:bold; padding-bottom:5px; border-bottom:1px solid #ccc;">
			  <?php esc_attr_e('About Theme Info', 'skt-condimentum'); ?>
		   </div>
          <p><?php esc_html_e('SKT Condimentum is a truly multipurpose WordPress theme that can fit any business, commercial, corporate, fitness, restaurant, consulting, construction, photography and portfolio type of websites. It is simple, easy to use and scalable as well as flexible. It supports a number of plugins like NextGen Gallery, contact form 7, multilingual plugins and is translation ready.','skt-condimentum'); ?></p>
		  <a href="<?php echo SKT_CONDIMENTUM_PRO_THEME_URL; ?>"><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/free-vs-pro.png" alt="" /></a>
	</div><!-- .col-left -->
	
	<div class="col-right">			
			<div style="text-align:center; font-weight:bold;">
				<hr />
				<a href="<?php echo SKT_CONDIMENTUM_LIVE_DEMO; ?>" target="_blank"><?php esc_html_e('Live Demo', 'skt-condimentum'); ?></a> | 
				<a href="<?php echo SKT_CONDIMENTUM_PRO_THEME_URL; ?>"><?php esc_html_e('Buy Pro', 'skt-condimentum'); ?></a> | 
				<a href="<?php echo SKT_CONDIMENTUM_THEME_DOC; ?>" target="_blank"><?php esc_html_e('Documentation', 'skt-condimentum'); ?></a>
                <div style="height:5px"></div>
				<hr />                
                <a href="<?php echo SKT_THEMES; ?>" target="_blank"><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/sktskill.jpg" alt="" /></a>
			</div>		
	</div><!-- .col-right -->
</div><!-- .wrapper-info -->
<?php } ?>