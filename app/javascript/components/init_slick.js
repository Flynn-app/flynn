import slick from 'slick-carousel';
import 'slick-carousel/slick/slick.css';


const slick_carousel = () => {

  $(document).ready(function(){
    $('.playlists-cards-carousel').slick({
      infinite: false,
      slidesToShow: 6,
      slidesToScroll: 1,
      responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 4,
        infinite: true,
      }
    },
    {
      breakpoint: 930,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3
      }
    },
    {
      breakpoint: 700,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
    });
  });

}

export { slick_carousel };
