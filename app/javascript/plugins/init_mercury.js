import Mercury from '@postlight/mercury-parser';

const buttonMercury = document.getElementById("mercuryButton");

const mercuryExtract = buttonMercury.addEventListener("click", (event) => {

  const cors = 'https://cors-anywhere.herokuapp.com/';
  let targetSite = document.getElementById("mercuryInput").value;
  const urlTarget = `${cors}${targetSite}`;

  const sendData = (data) => {
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
  Mercury.parse(urlTarget).then(result => sendData(result));
})

export { mercuryExtract };
