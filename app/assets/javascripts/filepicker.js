
function pick_file() {
}

function init_filepicker() {
  filepicker.setKey("A72w2fT5gSjyl21akhnRxz");
 
  //$(".filepicker_button").click(pick_file); 

  filepicker.pick(
    function(FPFile){
      $("#fp_url").val(FPFile.url);
      $("form").submit(); 
    },
    function(FPError) {
      console.log(FPError.toString());
    }
  );

}

