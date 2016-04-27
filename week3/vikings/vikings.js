function Viking(name, health, strength) {
	this.name = name;
	this.health = health;
	this.strength = strength;
}

function dukeItOut(viking1, viking2) {
	i = 5;
	while (viking1.health > 0 && viking2.health > 0 && i > 0) {
		viking1.health -= viking2.strength;
		viking2.health -= viking1.strength;
		i -= 1;
	}
	console.log(viking1.name + " health: " + viking1.health);
	console.log(viking2.name + " health: " + viking2.health);
}

thor = new Viking("Thor", 50, 3);
olga = new Viking("Olga", 40, 4);

dukeItOut(olga, thor);