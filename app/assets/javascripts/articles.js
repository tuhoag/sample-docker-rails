$(document).on('turbolinks:load', function() {
	// document attached events can be applied to future tag, which can be loaded after running these statements.
	$(document).on('mouseenter', '[highlight]', function() {
    $(this).addClass("article-highlight");
	}).on('mouseleave', '[highlight]', function() {
		$(this).removeClass("article-highlight");
	});

  if ($(".articles.show").length > 0) {
    // $("[highlight]").hover(function() {
    //   $(this).addClass("article-highlight");
    // }, function() {
    //   $(this).removeClass("article-highlight");
    // });

    let articleId1 = $("#articleId").val();

    $.get('/articles/' + articleId1 + '/comments').done(function(){

    }).fail(function() {
    	console.log('errors');
    });
  }
});
