/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('.btnFollow').click(function() {
  $(this).text(function(_, text) {
    return text === "Follow" ? "Unfollow" : "Follow";
  });
  if($(this).text() == "Follow") {
    $(this).removeClass('unfollow');
  } else if($(this).text() == "Unfollow") {
    $(this).addClass('unfollow');
  }
});


