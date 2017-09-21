$(document).on('turbolinks:load', function() {
	$("[highlight]").hover(function() {
      $(this).addClass("article-highlight");
    }, function() {
      $(this).removeClass("article-highlight");
    });
	
  if ($(".articles.index").length > 0) {
    // $("[highlight]").hover(function() {
    //   $(this).addClass("article-highlight");
    // }, function() {
    //   $(this).removeClass("article-highlight");
    // });
  }
});