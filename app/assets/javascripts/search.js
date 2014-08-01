$(document).on('page:change', function(){
	var $searchResults = $( '#search-results' );
	
	$searchResults.on('click', '.close-search-results', function( e ){
		console.log("clicked!")
		$searchResults.slideUp(function(){
			$(this).empty();
		});
	});
});
