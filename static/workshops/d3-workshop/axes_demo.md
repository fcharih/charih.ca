```javascript
var data = [
  { name: 'Francois' , time: 120, color: 'blue' }, // height in inches
  { name: 'Kevin' , time: 110, color: 'purple' },
  { name: 'Yasmina' , time: 70, color: 'pink' },
  { name: 'Roger' , time: 90, color: 'orange' }
];

/* Create the scale */
var scale = d3.scaleLinear()
              .domain([10, 130])
              .range([0, 500]);


/* Create the axis object */
var axis = d3.axisBottom(scale);

/* Add the axis to the plot */
d3.select('#playground')
  .append('g')
  .call(axis)
  .attr('transform', 'translate(0, 100)')

/* Add the circles to the plot */
d3.select('#playground')
  .selectAll('circles')
  .data(data)
  .enter()
  .append('circle')
  .attr('r', 10)
  .attr('cx', function(data) { return scale(data.time) })
  .attr('cy', 20)
  .style('fill', function(data) { return data.color })
  .style('stroke', 'black')
  .on('mouseover', function(data, index) {
  
    // Show name
    d3.select('#playground')
      .append('text')
      .text(data.name)
      .attr('class', 'label')
      .attr('x', scale(data.time))
      .attr('y', 50)
    d3.select(this).style('stroke-width', '4px')
  })
  .on('mouseout', function(data, index) {
    d3.selectAll('.label').remove()
    d3.select(this).style('stroke-width', '1px')
  })

```
