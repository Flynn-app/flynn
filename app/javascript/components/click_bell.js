
const bellClick = () => {

  const bell = document.querySelector(".fa-bell");

  bell.addEventListener("click", (evt) => {

    document.addEventListener("click", (evt) => {
      const blueBell = document.querySelector(".fas.new-notif");
      let targetElement = evt.target; // clicked element

      do {
        if (targetElement == blueBell) {
              // This is a click inside. Do nothing, just return.
              return;
            }
          // Go up the DOM
          targetElement = targetElement.parentNode;
        } while (targetElement);

      // This is a click outside.
      blueBell.classList.remove('fas','new-notif');
      blueBell.style.color = 'rgba(0, 0, 0, 0.5)';
      blueBell.classList.add('far');
    });
  });

}


export { bellClick }

