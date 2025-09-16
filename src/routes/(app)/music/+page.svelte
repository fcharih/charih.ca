<script>
  import { locale } from "../i18n";
  import { marked } from "marked";
  let { data } = $props();
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Music" : "Musique"}</title>
</svelte:head>

<h1>{$locale === "en" ? "Music" : "Musique"}</h1>
{#if $locale === "en"}
  {@html marked(data.textChunks["Music"].content)}
{:else}
  {@html marked(data.textChunks["Music"].contenu)}
{/if}
