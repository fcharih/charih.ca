<script lang="ts">
  import { locale } from "../i18n";
  import { marked } from "marked";

  let { data } = $props();
</script>

<svelte:head>
  <title>Charih | CV</title>
</svelte:head>

<h1>CV</h1>

<p>
  {#if $locale === "en"}
    Feel free to consult a PDF version of <a href="/charih_cv.pdf">my CV</a>.
  {:else}
    Vous pouvez consulter ici la version PDF de <a href="/charih_cv.pdf"
      >mon CV</a
    > (en anglais).
  {/if}
</p>

<h2>Publications</h2>
<h3>
  {$locale === "en" ? "Peer-reviewed journals" : "Articles de revue savante"} ({data
    .journalPublications.length})
</h3>
{#each data.journalPublications.toSorted((a, b) => b.year - a.year) as pub, i}
  <div class="journal-pub">
    <b>[J{data.journalPublications.length - i}]</b>
    {pub.authors.join(", ")}. {#if pub.url}<a href={pub.url}>{pub.title}</a
      >{:else}{pub.title}{/if} ({pub.year}).
    <i>{pub.publisher}</i>{#if pub.volume}
      {" "}{pub.volume}{/if}{#if pub.issue}({pub.issue}){/if}{#if pub.pages},
      pp. {pub.pages}{/if}{#if pub.status !== "Published"}{" "}({pub.status}){/if}.
  </div>
{/each}

<h3>
  {$locale === "en"
    ? "Conference proceedings"
    : "Comptes-rendus de conférences"} ({data.conferencePublications.length})
</h3>
{#each data.conferencePublications.toSorted((a, b) => b.year - a.year) as pub, i}
  <div class="conference-pub">
    <b>[C{data.conferencePublications.length - i}]</b>
    {pub.authors.join(", ")}. {#if pub.url}<a href={pub.url}>{pub.title}</a
      >{:else}{pub.title}{/if}.
    <i>{pub.conference}</i>, {pub.location}, {pub.conferenceDate}.
  </div>
{/each}

<h3>
  {$locale === "en" ? "Pre-prints" : "Prépublications"} ({data.preprints
    .length})
</h3>

{#if data.preprints.length === 0}No pre-prints at this time...{/if}
{#each data.preprints.toSorted((a, b) => parseInt(b.year) - parseInt(a.year)) as pub, i}
  <div class="preprint">
    <b>[PP{data.preprints.length - i}]</b>
    {pub.authors.join(", ")}. {#if pub.url}<a href={pub.url}>{pub.title}</a
      >{:else}{pub.title}{/if},
    <i>{pub.publisher}</i>, {pub.year}.{#if pub.comment}{" "}({pub.comment}).{/if}
  </div>
{/each}

<h2>
  {$locale === "en"
    ? "Workshops and presentations"
    : "Ateliers et présentations"} ({data.presentations.length})
</h2>
{#each data.presentations.toSorted((a, b) => new Date(b.date) - new Date(a.date)) as presentation, i}
  <div class="presentation">
    <div><b>[W{data.presentations.length - i}]</b> {presentation.title}</div>
    <div>{presentation.event}</div>
    <div>{presentation.location}</div>
    <div>{presentation.date}</div>
    {#if presentation.url}<a href={presentation.url}>[Link]</a>{/if}
  </div>
{/each}

<h2>Posters ({data.posters.length})</h2>
{#each data.posters.toSorted((a, b) => new Date(b.date) - new Date(a.date)) as poster, i}
  <div class="poster">
    <div><b>[P{data.posters.length - i}]</b> {poster.title}</div>
    <div>{poster.event}</div>
    <div>{poster.location}</div>
    <div>{poster.date}</div>
    {#if poster.url}<a href={poster.url}>[Link]</a>{/if}
  </div>
{/each}

<h2>
  {$locale === "en" ? "Web tools" : "Outils web"} ({data.webtools.length})
</h2>
{#each data.webtools as wt, i}
  <div class="webtool">
    <div>
      <b>[WT{data.webtools.length - i}]</b>
      <a href={wt.url}>{wt.name}</a>
    </div>
    <div>{wt.description}</div>
  </div>
{/each}

<style>
  .journal-pub,
  .conference-pub,
  .preprint,
  .presentation,
  .poster,
  .webtool {
    margin-top: 1rem;
    margin-bottom: 1rem;
  }
</style>
