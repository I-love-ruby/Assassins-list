$(document).ready(function() {
 $("#login_button").on("click",function(event){
  event.preventDefault();
  $.ajax({
    type:'get',
    url:'/login'
  }).success(function(response){
    $("#login_button").after('<div class="response">' + response + '</div>');
    $("#login_button").hide();
  });
 });

 $("#signup_button").on("click",function(event){
  event.preventDefault();
  $.ajax({
    type:'get',
    responseType:'document',
    url:'/signup',
  }).success(function(response){
    $('.ajaxbottom').append(response)
  });
 });

 $(".delete").on("click",function(event){
   event.preventDefault();
   var target = $(event.target);
   var url = target.attr('href');
   var target_id = target.attr('href').split('/')[1];
   $.ajax({
    type:'delete',
    url: url
   }).success(function(){
    $('#' + target_id).remove();
   });
 });

 $(".update_button").on("click",function(event){
  event.preventDefault();
   var target = $(event.target);
   var url = target.attr('href');
   var target_id = target.attr('href').split('/')[1];
  $.ajax({
    type:'get',
    url: url
  }).success(function(response){
    $('.posts').append(response)
  });
 });


// window.setInterval( function(){
//    $("#head").fadeOut( 'slow' ).delay( 1000 ).fadeIn( 1000 )
// }, 7000 );



});