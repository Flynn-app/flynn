//= require jquery
//= require jquery_ujs

import "bootstrap";

// import { player } from '../plugins/init_plyr';

import 'plyr/dist/plyr.css';
import Plyr from 'plyr';

const player = new Plyr(document.getElementById('player'), {
  autoplay: false,
  invertTime: true,
  toggleInvert: true,
  tooltips: { controls: false, seek: false },
  control: 'settings',
});

// export { player };
