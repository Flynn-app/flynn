import Mercury from '@postlight/mercury-parser';

const mercuryToAudio = () => {
  const buttonMercury = document.getElementById("mercuryButton");
  buttonMercury.addEventListener("click", (event) => {

    buttonMercury.innerHTML = '<div class="spinner-border text-light" role="status"><span class="sr-only">Loading...</span></div>';
    buttonMercury.style.opacity = '0.5';

    const cors = 'https://cors-anywhere.herokuapp.com/';
    let targetSite = document.getElementById("mercuryInput").value;
    const urlTarget = `${cors}${targetSite}`;

    const extractContent = (html) => {
      return (new DOMParser).parseFromString(html, "text/html") .
          documentElement . textContent;
    }

    const sendData = (data) => {
      const test = data ;
      const url = `${ENV['SERVER_ADDRESS']}/api/v1/audios`;
        fetch(url, {
          method: 'POST',
          headers: { "Content-Type": "application/json",
                     "Accept": "application/json"
           },
          body: JSON.stringify({ "audio": { "title": `${data.title}`,
                                            // "text_to_transcript": `${extractContent(data.content)}`,
                                            "text_html": `${data.content}`,
                                            "text_url": `${document.getElementById("mercuryInput").value}`
          }})
        }).then(response => response.json())
          .then(rep => redirect(rep.id))
    }
  Mercury.parse(urlTarget).then(result => sendData(result));
  })
}

const redirect = (id) => {
  window.location= `/audios/${id}` ;
}

export { mercuryToAudio };
