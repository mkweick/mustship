//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery.turbolinks

$(function() {
  var self = $('section'),
      kids = self.children();

  if (kids.size() > 21) {
    setInterval(function() {
      kids.slice(21).hide();
      kids.filter(':hidden').eq(0).slideDown();
      kids.eq(0).slideUp(800, "linear",function() {
        $(this).appendTo(self);
        kids = self.children();
      })
    }, 0)
    return this;
  };
});