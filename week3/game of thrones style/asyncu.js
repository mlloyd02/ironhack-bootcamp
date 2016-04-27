var fs = require('fs');

function fileActions(err, file) {
  if (err) {
    throw err;
  } else {
    var episodes = JSON.parse(file);

    var sortedEpisodes = episodes.sort(function(a, b) {
      if (a.episode_number < b.episode_number) {
        return -1;
      } else if (a.episode_number > b.episode_number) {
        return 1;
      }
      return 0;
    });


    // var sortedEpisodes = episodes.sort(function(a, b) {
    //    return a.episode_number - b.episode_number
    // });



    sortedEpisodes.forEach(function(episode, i) {
      console.log("Title: " + sortedEpisodes[i].title + "  Episode #:" + sortedEpisodes[i].episode_number + "\n" + sortedEpisodes[i].description);
      var a = "";
      for (var j = 0; j < Math.floor(sortedEpisodes[i].rating); j++) {
        a += "*";
      }
      console.log("Rating: " + sortedEpisodes[i].rating + " " + a);
    });
  }
}

function filteredEpisodes(err, file) {
  if (err) {
    throw err;
  } else {
    var episodes = JSON.parse(file);
    var filteredEpi = episodes.filter(function(episode) {
    return episode.rating < 8.5;
  });
  filteredEpi.forEach(function(episode, i) {
      console.log("Title: " + filteredEpi[i].title + "  Episode #:" + filteredEpi[i].episode_number + "\n" + filteredEpi[i].description);
      var a = "";
      for (var j = 0; j < Math.floor(filteredEpi[i].rating); j++) {
        a += "*";
      }
      console.log("Rating: " + filteredEpi[i].rating + " " + a);
    });
  console.log(filteredEpi)
  }
}


// fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);
fs.readFile("./GoTEpisodes.json", 'utf8', filteredEpisodes);
