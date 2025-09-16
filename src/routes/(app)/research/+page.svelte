<script>
  import { locale } from "../i18n";
  import { loadTextChunks } from "$lib/contentful.ts";
  import { marked } from "marked";

  let textChunks = $state({});
  loadTextChunks().then((_textChunks) => (textChunks = _textChunks));
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Research" : "Recherche"}</title>
</svelte:head>

{#if $locale === "en"}
  {@html textChunks["Research"] && marked(textChunks["Research"].content)}
{:else}
  {@html textChunks["Research"] && marked(textChunks["Research"].contenu)}
{/if}

<style>
  li {
    margin-top: 1rem;
    margin-bottom: 1rem;
  }

  #thesis-themes {
    display: block;
    margin: 10px auto;
    width: 30%;
  }

  .yt {
    width: 90%;
    margin: auto;
  }
  .yt iframe {
    width: 100%;
    border: 0;
    overflow: hidden;
  }
</style>
