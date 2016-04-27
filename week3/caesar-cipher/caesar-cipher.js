function caesarCipher(message, n) {
  if (n === undefined) {
  	n = -3;
  }
  newArray = []
  for (var i = 0; i < message.length; i++) {
	newArray.push(message.charCodeAt(i));
	}
	var shifted = newArray.map(function (num) {
		if (num >= 97 && num <= 122) {
			if (num + n < 97 || num + n > 122) {
				while (num + n < 97) {
					num = num + 26;
				}
				while (num + n > 122) {
					num = num - 26;
				}
			}
			return num + n
		} else if (num >= 65 && num <= 90) {
			if (num + n < 65 || num + n > 90) {
				while (num + n < 65) {
					num = num + 26;
				}
				while (num + n > 90) {
					num = num - 26;
				}
			}
			return num + n
		} else {
			return num
		}
	});
	var to_char = shifted.map(function(num) {
		return String.fromCharCode(num); 
	});
	return to_char.join("");
}



var encrypted = caesarCipher("bru, Atus");

console.log(encrypted);

