console.log("ready!");

// var data;
var w = 960,
    barHeight = 600;
    // padding = 10;

var linearScale = d3.scale.linear()
    .range([0, w]);

var chart = d3.select(".chart")
    .attr("width", w);
    // .attr("height", h);

// when i add type to the function below, data is no longer logged to the console
d3.json("/industries.json", function(error, data) {
  if (error) return console.warn(error);
  console.log(data);
  linearScale.domain([0, d3.max(data, function(d){return d.totalcompanies})]);
  chart.attr("height", data.length * barHeight);

  var bar = chart.selectAll("g")
    .data(data)
    .enter()
    .append("g")
    // tells bars to stack on one another
    .attr("transform", function(d,i){
      return "translate(0," + i * barHeight + ")";
    })
    // add rect and text
    bar.append("rect")
      .attr("width", function(d){return linearScale(d.totalcompanies)})
      .attr("height", barHeight - 1); // -1 so you can see space b/t
    bar.append("text")
      .attr("x", function(d){return linearScale(d.totalcompanies)})
      .attr("y", barHeight / 2)
      .attr("dy", ".35em")
      .text(function(d) {return d.totalcompanies});

});

function type(d) {
  d.totalcompanies = +d.totalcompanies;
  return d;
}

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