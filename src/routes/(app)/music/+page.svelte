<script>
  import { locale } from "../i18n";
  import { loadTextChunks } from "$lib/contentful.ts";
  import { marked } from "marked";

  let textChunks = $state({});
  loadTextChunks().then((_textChunks) => (textChunks = _textChunks));
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Music" : "Musique"}</title>
</svelte:head>

<h1>{$locale === "en" ? "Music" : "Musique"}</h1>
{#if $locale === "en"}
  {@html textChunks["Music"] && marked(textChunks["Music"].content)}
{:else}
  {@html textChunks["Music"] && marked(textChunks["Music"].contenu)}
{/if}

<!--
<div>
  <iframe
    style="border: 0; width: 300px; height: 470px; display: block; margin: 20px auto;"
    src="https://bandcamp.com/EmbeddedPlayer/album=1272590194/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/transparent=true/"
    seamless
    ><a href="https://itsfrancois31.bandcamp.com/album/half-moon-eyes-single"
      >Half Moon Eyes (Single) by Francois 31</a
    ></iframe
  >
</div>
-->
