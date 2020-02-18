
import "bootstrap";

import 'plyr/dist/plyr.css';
import Plyr from 'plyr';
import { mercuryToAudio } from '../plugins/init_mercury.js';
import { carousel } from '../components/carousel.js';
import { slick_carousel } from '../components/init_slick.js';
import { favorites } from '../components/favorites.js';


const player = new Plyr(document.getElementById('player'), {
  autoplay: false,
  invertTime: true,
  toggleInvert: true,
  tooltips: { controls: false, seek: false },
  control: 'settings',
});

if (document.getElementById("mercuryButton")) {
  mercuryToAudio();
}

carousel();
slick_carousel();
favorites();
