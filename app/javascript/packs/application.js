//= require jquery
//= require jquery_ujs

import "bootstrap";

import { player } from '../plugins/init_plyr';

import Mercury from '@postlight/mercury-parser';
const cors = 'https://cors-anywhere.herokuapp.com/'
const targetSite = 'https://www.lemonde.fr/societe/article/2020/02/12/la-cour-d-appel-de-paris-ordonne-la-liberation-de-patrick-balkany_6029338_3224.html'
const url = `${cors}${targetSite}`;

const sendData = (data) => {
  // const site_url = window.location.href;
  const url = 'http://127.0.0.1:3000/api/v1/audios';
    fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json",
               "Accept": "application/json"
     },
    body: JSON.stringify({ "audio": { "title": `${data.title}`,
                                      "content": `${data.content}`
    } } )
  })
}


// Mercury.parse(url).then(result => sendData(result);
