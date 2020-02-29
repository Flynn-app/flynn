

const showSideBoxOnScroll = () => {

  const page = document.querySelector('.audios_show');

  if (page) {

    let scrollPos = 80;
    const sideBox = document.querySelector('.side-box');
    let container = document.querySelector('.content-container');

    container.addEventListener("scroll", (event) => {
      let scrollingP = container.scrollTop;

      if (scrollingP < scrollPos ) {
      // Scrolling UP
      sideBox.classList.remove('is-visible');
      sideBox.classList.add('is-hidden');
    }
    else {
      sideBox.classList.add('is-visible');
      sideBox.classList.remove('is-hidden');
    }

  });

  // function checkPosition() {
  //   let windowY = window.scrollY
  //   console.log(windowY);
  //   if (windowY < scrollPos) {
  //     // Scrolling UP
  //     sideBox.classList.add('is-visible');
  //     sideBox.classList.remove('is-hidden');
  //   } else {
  //     // Scrolling DOWN
  //     sideBox.classList.add('is-hidden');
  //     sideBox.classList.remove('is-visible');
  //   }
  //   scrollPos = windowY;
  // }
  }

}

export { showSideBoxOnScroll }
