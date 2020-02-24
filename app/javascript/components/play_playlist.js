
const playPodcasts = () => {
  if (document.querySelector('.playlists_show')) {
    const button = document.querySelector('.playlist-play-button');
    button.addEventListener("click", (event) => {
      const playButton = document.querySelector('.podcast-play-button i');
      playButton.click();
    });

  }
}

export { playPodcasts }

