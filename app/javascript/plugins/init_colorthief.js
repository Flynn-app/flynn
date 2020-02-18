
import ColorThief from 'colorthief/dist/color-thief.mjs'

const color_detect = () => {


  // let imgObj = img.src;
  // imgObj = new Image();

  // imgObj.crossOrigin = "Anonymous";

  window.addEventListener("DOMContentLoaded", (event) => {
    const colorThief = new ColorThief();
    const img = document.querySelector('.avatar');
    let imgObj = img.src;
    imgObj = new Image();

    imgObj.crossOrigin = "Anonymous";
    console.log("DOM entièrement chargé et analysé");

    const color = colorThief.getColor(imgObj);
    console.log(color);

    // if (img.complete) {
    //   const color = colorThief.getColor(img);
    //   console.log(color);
    // } else {
    //   img.addEventListener('load', function() {
    //     colorThief.getColor(img);
    //     console.log('caca');
    //   });
    // };

  });
}

export { color_detect }
