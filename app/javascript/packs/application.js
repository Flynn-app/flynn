
import "bootstrap";

import { mercuryToAudio } from '../plugins/init_mercury.js';
import { player } from '../plugins/init_plyr.js';
import { slick_carousel } from '../components/init_slick.js';
import { favorites } from '../components/favorites.js';
import { part_text } from '../plugins/init_part_text.js';
import { getFileName } from '../components/custom_file_upload.js';
import { playPodcasts } from '../components/play_playlist.js';
import { bellClick } from '../components/click_bell.js';
import { showSideBoxOnScroll } from '../components/side-box-on-scroll.js';

if (document.getElementById("mercuryButton")) {
  mercuryToAudio();
}

if (document.querySelector(".record")) {
  part_text();
}

slick_carousel();
favorites();
getFileName();
playPodcasts();
bellClick();
showSideBoxOnScroll();


