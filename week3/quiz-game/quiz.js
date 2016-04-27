var read = require('read');


function Question(question, answer, id) {
	this.question = question;
	this.answer = answer;
	this.id = id;
}

questionArray = [new Question("What year was JavaScript invented?", "1995", 0), 
								 new Question("What keyword is used to declare a variable?", "var", 1), 
								 new Question("what number is ascribed to the first indice in an array?", "0", 2)]

// function takeQuiz(questions) {
// 	i = 0;
// 	while (i < questions.length) {
// 		options = {prompt: questions[i].question};
// 		read(options, getAnswer);
// 		function getAnswer (err, answer) {				
// 			if (answer === questions.answer) {
// 				console.log("You're right!")
// 				i += 1;
// 			} else {
// 				console.log("Nope. Try again.")
// 			}
// 		}
// 	}
// }


function runQuestions(questions) {

	var questionCounter = 0;

	function checkAnswer(err, answer) {
		if (answer === questions[questionCounter].answer) {
			console.log('yeah!');
			questionCounter++;
			
			readQuestion();
		} else {
			console.log('Nope! Try again!')
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
