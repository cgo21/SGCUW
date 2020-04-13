<?php
/**
 * The template part for displaying post
 *
 * @package VW Car Rental 
 * @subpackage vw_car_rental
 * @since VW Car Rental 1.0
 */
?>
<?php 
  $archive_year  = get_the_time('Y'); 
  $archive_month = get_the_time('m'); 
  $archive_day   = get_the_time('d'); 
?>
<article id="post-<?php the_ID(); ?>" <?php post_class('inner-service'); ?>>
  <div class="post-main-box">
    <div class="box-image">
      <?php
        if ( ! is_single() ) {
          // If not a single post, highlight the gallery.
          if ( get_post_gallery() ) {
            echo '<div class="entry-gallery">';
              echo ( get_post_gallery() );
            echo '</div>';
          };
        };
      ?>
    </div>
    <div class="new-text">
      <h2 class="section-title"><a href="<?php echo esc_url( get_permalink() ); ?>" title="<?php the_title_attribute(); ?>"><?php the_title();?><span class="screen-reader-text"><?php the_title(); ?></span></a></h2>
      <div class="post-info">
        <?php if(get_theme_mod('vw_car_rental_toggle_postdate',true)==1){ ?>
          <i class="fas fa-calendar-alt"></i><span class="entry-date"><a href="<?php echo esc_url( get_day_link( $archive_year, $archive_month, $archive_day)); ?>"><?php echo esc_html( get_the_date() ); ?><span class="screen-reader-text"><?php echo esc_html( get_the_date() ); ?></span></a></span><span>|</span>
        <?php } ?>

        <?php if(get_theme_mod('vw_car_rental_toggle_author',true)==1){ ?>
          <i class="far fa-user"></i><span class="entry-author"><a href="<?php echo esc_url( get_author_posts_url( get_the_author_meta( 'ID' )) ); ?>"><?php the_author(); ?><span class="screen-reader-text"><?php the_author(); ?></span></a></span><span>|</span>
        <?php } ?>

        <?php if(get_theme_mod('vw_car_rental_toggle_comments',true)==1){ ?>
          <i class="fa fa-comments" aria-hidden="true"></i><span class="entry-comments"><?php comments_number( __('0 Comment', 'vw-car-rental'), __('0 Comments', 'vw-car-rental'), __('% Comments', 'vw-car-rental') ); ?> </span>
        <?php } ?>
        <hr>
      </div>
      <div class="entry-content"><p><?php $excerpt = get_the_excerpt(); echo esc_html( vw_car_rental_string_limit_words( $excerpt, esc_attr(get_theme_mod('vw_car_rental_excerpt_number','30')))); ?></p></div>
      <?php if( get_theme_mod('vw_car_rental_button_text','READ MORE') != ''){ ?>
        <div class="content-bttn">
          <a class="view-more" href="<?php echo esc_url(get_permalink()); ?>"><?php echo esc_html(get_theme_mod('vw_car_rental_button_text','READ MORE'));?><i class="<?php echo esc_html(get_theme_mod('vw_car_rental_blog_button_icon','fa fa-angle-right')); ?>"></i><span class="screen-reader-text"><?php esc_html_e( 'READ MORE','vw-car-rental' );?></span></a>
        </div>
      <?php } ?>
    </div>
  </div>
</article>