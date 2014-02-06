// Set width of container
var diameter = 960,
    format = d3.format(",d"), // formats a number a string and the commas is thousands separator
    color = d3.scale.category20c(); // Constructs a new ordinal scale with a range of twenty categorical colors: #3182bd #6baed6 #9ecae1 #c6dbef #e6550d #fd8d3c #fdae6b #fdd0a2 #31a354 #74c476 #a1d99b #c7e9c0 #756bb1 #9e9ac8 #bcbddc #dadaeb #636363 #969696 #bdbdbd #d9d9d9.

// Designate size and packed layout for the larger bubble
var bubble = d3.layout.pack()
    .sort(null) // sort elements in the document based on data
    .size([diameter,  diameter])
    .padding(1.5);

// Create an SVG container that is a large bubble with the dimensions defined above
var svg = d3.select("body").append("svg")
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble"); 

(function showMeDaMoney(route){
  // Bind data to the nodes
  console.log(route);
  d3.json(route, function(error, root) { // root is the data object
    
    var node = svg.selectAll(".node") // selects all g's with the class "node"
        .data(bubble.nodes(classes(root)) // ????
        .filter(function(d) { return !d.children; })) 
      
      // ENTER - create nodes for datapoints
      .enter().append("g") 
        .attr("class", "node") // each group will have class "node"
        .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

    //  UPDATE
    node.append("circle")
        .attr("r", function(d) { return d.r; }) // how does it know d.r?
        .style("fill", function(d) { 
          return color(d.id); })
        .on("click", function(){
          showMeDaMoney("industries/1/companies.json");
        }); // fills circle with color given by category 20c

    node.append("text")
        .attr("dy", ".3em")
        .style("text-anchor", "middle")
        .text(function(d) { return d.name; }); // This is the label as a text element
  });

  function classes(root) {
    return {children: root};
  }


  d3.select(self.frameElement).style("height", diameter + "px");

})("industries/8/companies.json");




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