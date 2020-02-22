
import "bootstrap";

import { mercuryToAudio } from '../plugins/init_mercury.js';
import { player } from '../plugins/init_plyr.js';
import { slick_carousel } from '../components/init_slick.js';
import { favorites } from '../components/favorites.js';
import { part_text } from '../plugins/init_part_text.js';

if (document.getElementById("mercuryButton")) {
  mercuryToAudio();
}

const getFileName = () => {
  if (document.querySelector('#playlist_new')) {
    $('#inputGroupFile02').change(function() {
    var i = $(this).prev('label').clone();
    var file = $('#inputGroupFile02')[0].files[0].name;
    $(this).prev('label').text(file);
  });
  }
}

slick_carousel();
favorites();
getFileName();


