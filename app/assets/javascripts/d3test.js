// var data = [{"id":1,"name":"Internet","totalcompanies":1028},{"id":2,"name":null,"totalcompanies":736},{"id":3,"name":"Retail","totalcompanies":36},{"id":4,"name":"Marketing and Advertising","totalcompanies":257},{"id":5,"name":"Logistics and Supply Chain","totalcompanies":3},{"id":6,"name":"Computer Hardware","totalcompanies":6},{"id":7,"name":"Online Media","totalcompanies":52},{"id":8,"name":"Leisure, Travel & Tourism","totalcompanies":3},{"id":9,"name":"Telecommunications","totalcompanies":39},{"id":10,"name":"Professional Training & Coaching","totalcompanies":5},{"id":11,"name":"Publishing","totalcompanies":46},{"id":12,"name":"Entertainment","totalcompanies":56},{"id":13,"name":"Electrical/Electronic Manufacturing","totalcompanies":16},{"id":14,"name":"Management Consulting","totalcompanies":36},{"id":15,"name":"Medical Devices","totalcompanies":3},{"id":16,"name":"Accounting","totalcompanies":4},{"id":17,"name":"Automotive","totalcompanies":15},{"id":18,"name":"Wholesale","totalcompanies":3},{"id":19,"name":"Food & Beverages","totalcompanies":11},{"id":20,"name":"Computer Software","totalcompanies":158},{"id":21,"name":"Staffing and Recruiting","totalcompanies":75},{"id":22,"name":"Packaging and Containers","totalcompanies":3},{"id":23,"name":"Insurance","totalcompanies":3},{"id":24,"name":"Research","totalcompanies":8},{"id":25,"name":"Computer Networking","totalcompanies":17},{"id":26,"name":"Higher Education","totalcompanies":139},{"id":27,"name":"Consumer Electronics","totalcompanies":26},{"id":28,"name":"Information Technology and Services","totalcompanies":105},{"id":29,"name":"Oil & Energy","totalcompanies":6},{"id":30,"name":"Venture Capital & Private Equity","totalcompanies":9},{"id":31,"name":"Think Tanks","totalcompanies":8},{"id":32,"name":"Financial Services","totalcompanies":82},{"id":33,"name":"Newspapers","totalcompanies":14},{"id":34,"name":"Broadcast Media","totalcompanies":68},{"id":35,"name":"Media Production","totalcompanies":13},{"id":36,"name":"Apparel & Fashion","totalcompanies":9},{"id":37,"name":"Wireless","totalcompanies":10},{"id":38,"name":"Primary/Secondary Education","totalcompanies":3},{"id":39,"name":"Nonprofit Organization Management","totalcompanies":35},{"id":40,"name":"Banking","totalcompanies":6},{"id":41,"name":"Hospital & Health Care","totalcompanies":20},{"id":42,"name":"Investment Management","totalcompanies":3},{"id":43,"name":"Public Relations and Communications","totalcompanies":12},{"id":44,"name":"Gambling & Casinos","totalcompanies":3},{"id":45,"name":"Pharmaceuticals","totalcompanies":10},{"id":46,"name":"Music","totalcompanies":11},{"id":47,"name":"Consumer Goods","totalcompanies":10},{"id":48,"name":"Government Administration","totalcompanies":3},{"id":49,"name":"International Affairs","totalcompanies":7},{"id":50,"name":"Semiconductors","totalcompanies":6},{"id":51,"name":"Mining & Metals","totalcompanies":3},{"id":52,"name":"Market Research","totalcompanies":8},{"id":53,"name":"Utilities","totalcompanies":3},{"id":54,"name":"Law Practice","totalcompanies":7},{"id":55,"name":"Political Organization","totalcompanies":6},{"id":56,"name":"Legislative Office","totalcompanies":5},{"id":57,"name":"Hospitality","totalcompanies":11},{"id":58,"name":"Real Estate","totalcompanies":7},{"id":59,"name":"Education Management","totalcompanies":13},{"id":60,"name":"Writing and Editing","totalcompanies":6},{"id":61,"name":"Biotechnology","totalcompanies":14},{"id":62,"name":"Computer Games","totalcompanies":12},{"id":63,"name":"Defense & Space","totalcompanies":3},{"id":64,"name":"Events Services","totalcompanies":6},{"id":65,"name":"Health, Wellness and Fitness","totalcompanies":3},{"id":66,"name":"Renewables & Environment","totalcompanies":4},{"id":67,"name":"Outsourcing/Offshoring","totalcompanies":2},{"id":68,"name":"Judiciary","totalcompanies":2},{"id":69,"name":"Airlines/Aviation","totalcompanies":4},{"id":70,"name":"Military","totalcompanies":6},{"id":71,"name":"Sports","totalcompanies":2},{"id":72,"name":"Information Services","totalcompanies":2},{"id":73,"name":"Sporting Goods","totalcompanies":3},{"id":74,"name":"Executive Office","totalcompanies":2},{"id":75,"name":"Performing Arts","totalcompanies":2},{"id":76,"name":"Luxury Goods & Jewelry","totalcompanies":2},{"id":77,"name":"Investment Banking","totalcompanies":3},{"id":78,"name":"Arts and Crafts","totalcompanies":2},{"id":79,"name":"Architecture & Planning","totalcompanies":1},{"id":80,"name":"Commercial Real Estate","totalcompanies":1},{"id":81,"name":"Aviation & Aerospace","totalcompanies":3},{"id":82,"name":"Photography","totalcompanies":1}]

var diameter = 960,
    format = d3.format(",d"),
    color = d3.scale.category20c();

var bubble = d3.layout.pack()
    .sort(null)
    .size([diameter, diameter])
    .padding(1.5);

var svg = d3.select("body").append("svg")
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");

d3.json("industries.json", function(error, root) {
  var node = svg.selectAll(".node")
      .data(bubble.nodes(classes(root))
      .filter(function(d) { return d; })) //!d.children
    .enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

  node.append("title")
      .text(function(d) { return d.className + ": " + format(d.value); });

  node.append("circle")
      .attr("r", function(d) { return d.r; })
      .style("fill", function(d) { return color(d.packageName); });

  node.append("text")
      .attr("dy", ".3em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.className.substring(0, d.r / 3); });
});

// Returns a flattened hierarchy containing all leaf nodes under the root.
function classes(root) {
  var classes = [];

  function recurse(name, node) {
    if (node.children) node.children.forEach(function(child) { recurse(node.name, child); });
    else classes.push({packageName: name, className: node.name, value: node.size});
  }

  recurse(null, root);
  return {totalcompanies: classes}; //{children: classes}
}

d3.select(self.frameElement).style("height", diameter + "px");


// ** SECOND ATTEMPT **
// // var data;
// var w = 960,
//     h = 600;
//     // padding = 10;

// var linearScale = d3.scale.linear()
//     .range([0, w]);

// var svg = d3.select("body").append("svg")
//     .attr("width", w)
//     .attr("height", h);
//     // .attr("height", h);

// function update(data) {
//   var text = svg.selectAll("text")
//     .data(data, function(d) {return d;});

//   // text.attr("class", "update")
//   //   .transition()
//   //     .duration(750)
//   //     .attr("x", function(d, i){return i * 32;});

//   text.enter().append("text")
//       // initial states of the elements
//       // .attr("class", "enter")
//       // .attr("dy", ".35em")
//       // .attr("y", -60)
//       // .attr("x", function(d, i){return i * 32;})
//       // .style("fill-opacity", 1e-6)
//       .text(function(d){return d.totalcompanies;});
//     // .transition()
//     //   .duration(800)
//     //   .attr("y", 0)
//     //   .style("fill-opacity", 1);

//   // 6. EXIT
//   text.exit()
//     .transition()
//       .duration(300)
//       .attr("y", 60)
//       .style("fill-opacity", 1e-6)
//       .remove();
// }

// update(data);


// ** FIRST ATTEMPT **

// when i add type to the function below, data is no longer logged to the console
// d3.json("/industries.json", function(error, data) {
//   if (error) return console.warn(error);
//   console.log(data);
//   linearScale.domain([0, d3.max(data, function(d){return d.totalcompanies})]);
//   chart.attr("height", data.length * barHeight);

//   var bar = chart.selectAll("g")
//     .data(data)
//     .enter()
//     .append("g")
//     // tells bars to stack on one another
//     .attr("transform", function(d,i){
//       return "translate(0," + i * barHeight + ")";
//     })
//     // add rect and text
//     bar.append("rect")
//       .attr("width", function(d){return linearScale(d.totalcompanies)})
//       .attr("height", barHeight - 1); // -1 so you can see space b/t
//     bar.append("text")
//       .attr("x", function(d){return linearScale(d.totalcompanies)})
//       .attr("y", barHeight / 2)
//       .attr("dy", ".35em")
//       .text(function(d) {return d.totalcompanies});

// });

// function type(d) {
//   d.totalcompanies = +d.totalcompanies;
//   return d;
// }

// var xScale = d3.scale.linear()
//   .domain([0, d3.max(data, function(d) {return d;})])
//   .range([padding, w - padding * 2]);
// var yScale = d3.scale.linear()
//   .domain([0, d3.max(data, function(d) {return d; })])
//   .range([h - padding, padding]); //.range([h, 0]);
// var rScale = d3.scale.linear()
//   .domain([0, d3.max(data, function(d) { return d; })])
//   .range([2, 5]);
// // create svg
// var svg = d3.select("body")
//   .append("svg")
//   .attr("width", w)
//   .attr("height", h);
// // create circles
// svg.selectAll("circle")
//   .data(data)
//   .enter()
//   .append("circle")
//   .attr("cx", function(d) {
//     return xScale(d);
//   })
//   .attr("cy", function(d) {
//     return yScale(d);
//   })
//   .attr("r", function(d) {
//     return rScale(d);
//   });