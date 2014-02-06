// set vars
var diameter = 960,
    // format a number as a string, and allow for use of comma for a thousands separator
    format = d3.format(",d"),
    // construct an ordinal scale with twenty categorical colors
    color = d3.scale.category20c();

// produce hierarchical layout using recursive circle-packing
var bubble = d3.layout.pack()
    .sort(null) // sort elements in the document based on data
    .size([diameter, diameter]) // returns num of elements in selection
    .padding(1.5); // give padding

// select element from doc, append svg, give it width heigh and class of bubble
var svg = d3.select("body").append("svg")
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");

// request a json blob
d3.json("industries.json", function(error, root) {
  var node = svg.selectAll(".node")
      .data(bubble.nodes(classes(root))
      .filter(function(d) { return !d.children; }))
    // enter data, append a g element to the svg. g element is used to group svg shapes together
    .enter().append("g")
      .attr("class", "node") // give class node
      // give the elements space in the svg! otherwise they'd be on top of each other
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

  // this is for us <3
  console.log(bubble.nodes(classes(root)));

  // add title element and insert into the name.. don't think we need this
  // node.append("title")
  //     .text(function(d) { return d.name + ": " + format(d.value); });

  node.append("circle")
      .attr("r", function(d) { return d.r; })
      // .style("opacity", "0.8")
      .style("fill", function(d) {
        return color(d.id); });

  // give elements a title!
  // node.append("text")
  //     //  don't know if we need this?
  //     .attr("dy", ".3em")
  //     .style("text-anchor", "middle") // verticaly center the text
  //     .text(function(d) { return d.name; });
  node.append("line")
      .attr("x1", function(d){return d;})
      .attr("y1", function(d){return d;})
      .attr("x2", 100)
      .attr("y2", 600)
      .style("stroke", function(d) {
        return color(d.id); })
      .style("stroke-width", "10px");
});

// returns an object of the data... 
function classes(root) {
  return {children: root};
}

// Returns a flattened hierarchy containing all leaf nodes under the root.
// function classes(root) {
//   var classes = [];

//   function recurse(name, node) {
//     if (node.children) node.children.forEach(function(child) { recurse(node.name, child); });
//     else classes.push({packageName: name, className: node.name, value: node.size});
//   }

//   recurse(null, root);
//   return {totalcompanies: classes}; //{children: classes}
// }

// sets the frame element to the height of diameter...
d3.select(self.frameElement).style("height", diameter + "px");