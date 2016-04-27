var read = require('read');


function Question(question, answer, id) {
	this.question = question;
	this.answer = answer;
	this.id = id;
}

questionArray = [new Question("What year was JavaScript invented?", "1995", 0), 
								 new Question("What keyword is used to declare a variable?", "var", 1), 
								 new Question("what number is ascribed to the first indice in an array?", "0", 2)]


function runQuestions(questions) {

	var questionCounter = 0;

	function checkAnswer(err, answer) {
		if (answer === questions[questionCounter].answer ) {
			console.log('yeah!');
			questionCounter++;

			readQuestion();

		}
	}

	function readQuestion() {

		var options = {prompt: questions[questionCounter].question};

		read(options, checkAnswer);
	}

	readQuestion();
}

runQuestions(questionArray);
