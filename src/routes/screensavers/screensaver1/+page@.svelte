<script>
  let STEP = 0.05;
  let innerWidth = $state(0);
  let innerHeight = $state(0);
  let position = $state({ x: 200, y: 200 });
  let opacity = $state(0);
  let opacityIncreasing = $state(true);
  let logoWidth = $state(300);
  let logoHeight = $state(300);

  function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  const generateRandomPosition = () => {
    const random1 = getRandomInt(logoWidth, innerWidth - logoWidth);
    const random2 = getRandomInt(logoHeight, innerHeight - logoHeight);

    return {
      x: random1,
      y: random2,
    };
  };

  setInterval(() => {
    const newOpacity = opacityIncreasing ? opacity + STEP : opacity - STEP;
    if (newOpacity > 1 || newOpacity < 0) {
      opacityIncreasing = !opacityIncreasing;
      return;
    }
    opacity = newOpacity;
  }, 100);

  setInterval(function () {
    position = generateRandomPosition();
  }, 1000);
</script>

<svelte:window bind:innerWidth bind:innerHeight />
<svelte:head></svelte:head>

<div>
  <img
    id="logo"
    bind:clientWidth={logoWidth}
    bind:clientHeight={logoHeight}
    src="/img/nuvo_n.png"
    style={`position: absolute; left: ${position.x}px; top: ${position.y}px; opacity: ${opacity};`}
  />
</div>
