// word frequencies of first two chapters of Oliver Twist
/*var words = [
  d3.csv("nyt_sorted.csv", function(d) {
    return { // for each csv row return an object with text and size
      text: d.word,
      size: +d.count // cast this to a number with +
    }
  });
];*/
d3.csv("https://gist.githubusercontent.com/d3noob/fa0f16e271cb191ae85f/raw/bf896176236341f56a55b36c8fc40e32c73051ad/treedata.csv", function(d) {
	alert(d);
	console.log(d);
});

