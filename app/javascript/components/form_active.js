const formActive = () => {
  const wishForm = document.querySelectorAll(".wish_track");
  wishForm.forEach((wish) => {
    wish.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle("active");
    });
  });




  // $(document).ready(function(){
  //   $(".wish_track").click(function(){
  //     $(this).toggleClass("active");
  //   });
  // });
}

export { formActive }
