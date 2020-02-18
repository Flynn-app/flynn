const favorites = () => {

  const audioFav = document.querySelectorAll('.podcast-favorites').forEach((audioFav) => {
    audioFav.addEventListener("click", (event) => {
      // event.currentTarget.classList.toggle("img-circle");
      const audio = audioFav.dataset.audioId;
      console.log(audio);
      sendData(audio);
    });
  });



  const sendData = (data) => {
    const audio_id = data ;
    const url = `${ENV['SERVER_ADDRESS']}/api/v1/audios_playlists`;
    fetch(url, {
      method: 'POST',
      headers: { "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify({ "audio_id": audio_id})
  }).then(response => console.log(response))

  }
}

export { favorites };
