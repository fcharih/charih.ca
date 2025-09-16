<script>
  import { locale } from "../i18n";
  import { marked } from "marked";

  let { data } = $props();
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Research" : "Recherche"}</title>
</svelte:head>

{#if $locale === "en"}
  {@html marked(data.textChunks["Research"].content)}
{:else}
  {@html marked(data.textChunks["Research"].contenu)}
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
