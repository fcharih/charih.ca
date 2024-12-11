// Example 1
var circleCenters = [];
var OFFSET = 25;
for(var i = 0; i < 12; i++){
	circleCenters.push(i*50 + OFFSET);
}

d3.select('[id="#12circles"]').selectAll(".circles")
	.data(circleCenters)
	.enter()
	.append('circle')
	.attr('r', 25)
	.attr('cy', 25)
	.attr('cx', function(pos) { return pos })
	.style('fill', 'blue');

// Example 2
var circleCenters = [];
var OFFSET = 25;
for(var i = 0; i < 12; i++){
	circleCenters.push(i*50 + OFFSET);
}

d3.select('[id="#12circles2"]').selectAll(".circles")
	.data(circleCenters)
	.enter()
	.append('circle')
	.attr('r', 25)
	.attr('cy', 25)
	.attr('cx', function(pos) { return pos })
	.style('fill', function(pos, i) { return i % 2 == 0 ? 'blue' : 'red' });

// Exercise 1
var circleRadiuses = [10, 30, 40, 55];

d3.select('[id="exercise1"]').selectAll(".circles2")
	.data(circleRadiuses)
	.enter()
	.append('circle')
	.attr('r', 20)//.attr('r', function(size, i) { return size; })
	.attr('cy', 50)
	.attr('cx', function(size, i) { return i * 100 + 40 })
	.style('fill', 'black');//.style('fill', function(size, i) { return size <= 30 ? 'blue' : 'red' });

d3.select('[id="exercise1_complete"]').selectAll(".circles2")
	.data(circleRadiuses)
	.enter()
	.append('circle')
	.attr('r', function(size, i) { return size; })
	.attr('cy', 50)
	.attr('cx', function(size, i) { return i * 100 + 40 })
	.style('fill', function(size, i) { return size <= 30 ? 'blue' : 'red' });

// Handling 1

d3.select('[id="handling1"]').selectAll(".circles-handling")
	.data(circleRadiuses)
	.enter()
	.append('circle')
	.attr('r', function(size, i) { return size; })
	.attr('cy', 50)
	.attr('cx', function(size, i) { return i * 100 + 40 })
	.style('fill', function(size, i) { return size <= 30 ? 'blue' : 'red' })
	.on('mouseover', function (data, index) {
		d3.select('[id="handling1"]')
			.append('text')
			.attr('id', 'label')
			.text("This circle's radius is: " + data)
			.attr('x', 20)
			.attr('y', 120);
	 })
	.on('mouseout', function (data, index) {
		d3.select('#label')
			.remove();
	 })
	 
// Handling exercise

d3.select('[id="handling_exercise"]').selectAll(".circles-handling")
	.data(circleRadiuses)
	.enter()
	.append('circle')
	.attr('r', function(size, i) { return size; })
	.attr('cy', 50)
	.attr('cx', function(size, i) { return i * 100 + 40 })
	.style('fill', function(size, i) { return size <= 30 ? 'blue' : 'red' })
	.on('mouseover', function (data, index, node) {
		d3.select(this).attr('r', function(rad, index) {return 1.2*rad});
	 })
	.on('mouseout', function (data, index, node) {
		d3.select(this).attr('r', function(rad, index) {return rad/1.2});
	 })
	

