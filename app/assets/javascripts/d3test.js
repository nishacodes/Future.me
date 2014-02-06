console.log("ready!");

// var data;
var w = 960,
    h = 600;
    // padding = 10;

var linearScale = d3.scale.linear()
    .range([0, w]);

var svg = d3.select("body").append("svg")
    .attr("width", w)
    .attr("height", h);

// when i add type to the function below, data is no longer logged to the console
d3.json("/industries.json", function(error, data) {
  if (error) return console.warn(error);
  console.log(data);

  
});

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