//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery.turbolinks

function updateData() {
  $.ajax({
    url: "update-data"
  });
};

function updateDataDesktop() {
  $.ajax({
    url: "update-data-desktop"
  });
};

function scrollOrders() {
  kids.slice(21).hide();
  kids.filter(':hidden').eq(0).slideDown();
  kids.eq(0).slideUp(800, "linear",function() {
    $(this).appendTo(self);
    kids = self.children();
  })
  return this;
};