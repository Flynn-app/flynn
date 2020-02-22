const part_text = () => {
  const all_text = document.querySelectorAll('.record');
  all_text.forEach((part_text) => {
     part_text.addEventListener("click", (event) => {
      player.currentTime = part_text.dataset.start
      var playing = document.querySelector('.plyr--playing');
      if ( !playing ) {
        document.querySelector('.plyr__control').click();
      }
     })
  })
}


export { part_text };
