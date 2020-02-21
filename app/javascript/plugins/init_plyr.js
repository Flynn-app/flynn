import 'plyr/dist/plyr.css';
import Plyr from 'plyr';

const player = new Plyr(document.getElementById('player'), {
  autoplay: false,
  invertTime: true,
  toggleInvert: true,
  keyboard: { focused: true, global: false },
  clickToPlay: true,
  // "debug": true,
});

export { player };
