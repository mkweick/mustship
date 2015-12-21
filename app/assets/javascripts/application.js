// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery.turbolinks

setTimeout(function () {
  location.reload();
}, 1000 * 60 * 5);

$.fn.infiniteScrollUp=function(){
    var self=this,kids=self.children()
    setInterval(function(){
    	kids.slice(21).hide()
      kids.filter(':hidden').eq(0).slideDown()
      kids.eq(0).slideUp(800, "linear",function(){
        $(this).appendTo(self)
        kids=self.children()
      })
    },0)
		return this;
}

$(function(){
	$('section').infiniteScrollUp()
})
