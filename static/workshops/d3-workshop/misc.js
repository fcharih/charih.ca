var position = 10;
var sign = 1;
var speed = 10;
var i = 0;

setInterval(function() {
  i += 1;

  if(position < -300 || position > 300) {
    sign *= -1;
  }

  position += sign*speed;
  d3.select('#d3-pitch')
  .style('left', position + 'px')
  .style('color', function(d) { return position <= 0 ? 'purple' : 'orange' })
}, 100)
