const formActive = () => {
  $(document).ready(function(){
    $(".wish_track").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { formActive }
