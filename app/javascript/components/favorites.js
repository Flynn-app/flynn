const favorites = () => {

  const audioFav = document.querySelectorAll('.podcast-favorites').forEach((audioFav) => {
    audioFav.addEventListener("click", (event) => {
      // event.currentTarget.classList.toggle("img-circle");
      const audio = audioFav.dataset.audioId;
      console.log(audio);
      sendData(audio);
      audioFav.querySelector('i').classList.toggle('far');
      audioFav.querySelector('i').classList.toggle('fas');
      const playlistShowPage = document.querySelector('.playlists_show');
      if (playlistShowPage) {
      // event.currentTarget.parentElement.style.cssText = "visibility: hidden; opacity: 0; transition: visibility 0s linear 0.33s, opacity 0.33s linear;" ;
      const cardAnimate = event.currentTarget.parentElement.parentElement

      cardAnimate.classList.add('card-transition');
      cardAnimate.classList.add('card-hidden');

      cardAnimate.addEventListener('transitionend', () => {
          cardAnimate.classList.remove('card-transition');
        }, false);
      }
    });
  });

  const sendData = (data) => {
    const audio_id = data ;
    const url = `${ENV['SERVER_ADDRESS']}/api/v1/audios_playlists/`;
    fetch(url, {
      method: 'POST',
      headers: { "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify({ "audio_id": audio_id})
    }).then(response => response)
  };
};

// const reloadPlaylistPage = () => {
//   const playlistShowPage = document.querySelector('.playlists_show .playlist-favorites')
//   if (playlistShowPage) {
//     playlistShowPage.addEventListener("click", (event) => {
//     // document.location.reload(true);
//     console.log(event)
//   });
//   }
// }

const redirect = (user) => {
  window.location= `/users/${user}` ;
};

export { favorites };
