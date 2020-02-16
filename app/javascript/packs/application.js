//= require jquery
//= require jquery_ujs

import "bootstrap";

// import { player } from '../plugins/init_plyr';

import 'plyr/dist/plyr.css';
import Plyr from 'plyr';
import { mercuryToAudio } from '../plugins/init_mercury.js';
import { carousel } from '../components/carousel.js';


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
