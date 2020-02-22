const part_text = () => {
  const all_text = document.querySelectorAll('.record');
  all_text.forEach((part_text) => {
     part_text.addEventListener("click", (event) => {
      console.log(part_text);
     })
  })
}


export { part_text };
