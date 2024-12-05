<script>
  import { onMount } from "svelte";
  import { parse } from "svgson";
  import Logo from "./Logo.svelte";

  let innerWidth = $state(0);
  let innerHeight = $state(0);

  let collide = (elem1, elem2) => {
    let argminx = [elem1.x, elem2.x].indexOf(Math.min(elem1.x, elem2.x));
    let argminy = [elem1.y, elem2.y].indexOf(Math.min(elem1.y, elem2.y));
    let elem = [elem1, elem2][argminx];
    let other = [elem1, elem2][!argminx];
    if (elem.x + elem.width < other.x) {
      return false;
    }
    elem = [elem1, elem2][argminy];
    other = [elem1, elem2][!argminy];
    if (elem.y + height < other.y) {
      return false;
    }
    return true;
  };

  let logoWidth = 0.25 * 1418;
  let logoHeight = 0.25 * 482;

  let positions = $state([
    { x: 0, y: 0 },
    { x: 0, y: 0 },
    { x: 0, y: 0 },
    { x: 0, y: 0 },
    { x: 0, y: 0 },
    { x: 0, y: 0 },
    { x: 0, y: 0 },
    { x: 0, y: 0 },
  ]);
</script>

<svelte:head></svelte:head>
<svelte:window bind:innerWidth bind:innerHeight />

<div id="container">
  {#each positions as position, i}
    <Logo
      bind:positions
      index={i}
      step={0.1}
      interval={10}
      waitTime={3000}
      scale={0.2}
      dimensions={{ width: logoWidth, height: logoHeight }}
      windowSize={{ width: innerWidth, height: innerHeight }}
    />
  {/each}
</div>

<style>
  #container {
    height: 100%;
    width: 100%;
    background-color: white;
  }
</style>
