var phrases = [
	"What in the Sam hell?",
	"Hot diggity doggie!",
	"Darn tootin!",
	"Well Ill be!",
	"Oh my stars and garders!"
]

$('.refresh').click(function() {
	var randoFloat = Math.random() * (phrases.length - 1);
	var rando = Math.round(randoFloat);
	var randoPhrase = phrases[rando]
	$('p').text(randoPhrase);
});

$('form').on('submit', function() {
	phrases.push($('.js-phrase').val());
});

$('.show').click(function() {
	phrases.forEach(function(phrase) {
		$('ul').append("<li>" + phrase + "</li>");
	});
})


