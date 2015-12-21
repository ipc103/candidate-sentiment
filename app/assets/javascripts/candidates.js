// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change', function(){
  var id = $('p#cand_id').text();
  if ( id !== "") {
    loadDataGraph(id);
  };

})

function loadDataGraph(id){
    $.getJSON('/data/' + id, function(data){

    var margin = {top: 20, right: 20, bottom: 30, left: 50},
    width = 920 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%y-%m-%d").parse;
    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var line = d3.svg.line()
        .x(function(d) { return x(d.createdAt); })
        .y(function(d) { return y(d.probability); });

    var svg = d3.select("div.graph").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

      for (i = 0; i < data.length; i++) {
        data[i].createdAt = parseDate(data[i].createdAt);
      }

      x.domain(d3.extent(data, function(d) { return d.createdAt; }));
      y.domain(d3.extent(data, function(d) { return d.probability; }));

      svg.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0," + height + ")")
          .call(xAxis);

      svg.append("g")
          .attr("class", "y axis")
          .call(yAxis)
        .append("text")
          .attr("transform", "rotate(-90)")
          .attr("y", 6)
          .attr("dy", ".71em")
          .style("text-anchor", "end")
          .text("Sentiment Probability");

      svg.append("path")
          .datum(data)
          .attr("class", "line")
          .attr("d", line);
    });
}
