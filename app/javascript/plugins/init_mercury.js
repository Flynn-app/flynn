import Mercury from '@postlight/mercury-parser';

const buttonMercury = document.getElementById("mercuryButton");


const cors = 'https://cors-anywhere.herokuapp.com/';
let targetSite = document.getElementById("mercuryInput").value;
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
