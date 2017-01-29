$(document).ready(function() {
var stickyNavTop = $('table.program-table').offset().top;
var mainNavPosition = $('table.nav-trigger').offset().top;
 
var stickyNav = function(){
var scrollTop = $(window).scrollTop();
      
if (scrollTop > mainNavPosition) { 
    $('table.program-table').addClass('stick');
    $('div.stick-placeholder').addClass('hold');
} else {
    $('table.program-table').removeClass('stick'); 
    $('div.stick-placeholder').removeClass('hold');
}
};
 
stickyNav();
 
$(window).scroll(function() {
  stickyNav();
});
});

$(document).ready(function() {
  var programIds = [];
  var idPositions = [$('table.program-table').offset().top];
  console.log(idPositions[0]);


  $("table.program-table tbody tr td").each(function() {
    programIds.push($(this).attr("class"));
});

 for(var i = 0; i < programIds.length; i++){
    idPositions.push($('#' + programIds[i]).offset().top);
    console.log(idPositions[i + 1]);
    $()
 } 
  
  headerExtra = $(window).height() * 0.39; 

$('td.' + programIds[0]).click(function() {
   //optionally remove the 500 (which is time in milliseconds) of the
   //scrolling animation to remove the animation and make it instant
   $.scrollTo(idPositions[1] - headerExtra, 500);//'#'+programIds[0]), 500);
   $('td.' + programIds[0]).addClass("program-highlight");
   $('td.' + programIds[1]).removeClass("program-highlight");
   $('td.' + programIds[2]).removeClass("program-highlight");
});

$('td.' + programIds[1]).click(function() {
   //optionally remove the 500 (which is time in milliseconds) of the
   //scrolling animation to remove the animation and make it instant
   $.scrollTo(idPositions[2] - headerExtra, 500);
   $('td.' + programIds[0]).removeClass("program-highlight");
   $('td.' + programIds[1]).addClass("program-highlight");
   $('td.' + programIds[2]).removeClass("program-highlight");


});

$('td.' + programIds[2]).click(function() {
   //optionally remove the 500 (which is time in milliseconds) of the
   //scrolling animation to remove the animation and make it instant
   $('td.' + programIds[0]).removeClass("program-highlight");
   $('td.' + programIds[1]).removeClass("program-highlight");
   $('td.' + programIds[2]).addClass("program-highlight");

   $.scrollTo(idPositions[3] - headerExtra, 500);
});



});

