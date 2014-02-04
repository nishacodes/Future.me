$(document).ready(function(){
  console.log("ready!");

  var data;
  var w = 960;
  var h = 600;
  var padding = 10;
  d3.json("/industries.json", function(error, json) {
    if (error) return console.warn(error);
    data = json;
    console.log(data);
  });

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

});