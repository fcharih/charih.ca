<script lang="ts">
  import { locale } from "../i18n";
  import yaml from "js-yaml";
  import * as contentful from "contentful";
  import { marked } from "marked";
  import {
    PUBLIC_CONTENTFUL_SPACE_ID,
    PUBLIC_CONTENTFUL_ACCESS_TOKEN,
  } from "$env/static/public";

  const client = contentful.createClient({
    space: PUBLIC_CONTENTFUL_SPACE_ID,
    accessToken: PUBLIC_CONTENTFUL_ACCESS_TOKEN,
  });

  let journalPublications = $state([]);
  let conferencePublications = $state([]);
  let presentations = $state([]);
  let webtools = $state([]);
  let preprints = $state([]);
  let posters = $state([]);

  client
    .getEntries()
    .then((response) => {
      journalPublications = response.items.filter(
        (x) =>
          x.sys.contentType.sys.id == "publication" &&
          x.fields.publicationType == "Journal"
      );
      conferencePublications = response.items.filter(
        (x) =>
          x.sys.contentType.sys.id == "publication" &&
          x.fields.publicationType == "Conference"
      );
      preprints = response.items.filter(
        (x) =>
          x.sys.contentType.sys.id == "publication" &&
          x.fields.publicationType == "Preprint"
      );
      presentations = response.items.filter(
        (x) => x.sys.contentType.sys.id == "presentation"
      );
      posters = response.items.filter(
        (x) => x.sys.contentType.sys.id == "poster"
      );
      webtools = response.items.filter(
        (x) => x.sys.contentType.sys.id == "softwareAndWebTools"
      );
    })
    .catch(console.error);
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
  {$locale === "en" ? "Peer-reviewed journals" : "Articles de revue savante"} ({journalPublications.length})
</h3>
{#each journalPublications.toSorted((a, b) => b.fields.year - a.fields.year) as pub, i}
  <div class="journal-pub">
    <b>[J{journalPublications.length - i}]</b>
    {pub.fields.authors.join(", ")}. {#if pub.fields.url}<a
        href={pub.fields.url}>{pub.fields.title}</a
      >{:else}{pub.fields.title}{/if} ({pub.fields.year}).
    <i>{pub.fields.publisher}</i>{#if pub.fields.volume}
      {" "}{pub.fields.volume}{/if}{#if pub.fields.issue}({pub.fields
        .issue}){/if}{#if pub.fields.pages}, pp. {pub.fields
        .pages}{/if}{#if pub.fields.status !== "Published"}{" "}({pub.fields
        .status}){/if}.
  </div>
{/each}

<h3>
  {$locale === "en"
    ? "Conference proceedings"
    : "Comptes-rendus de conférences"} ({conferencePublications.length})
</h3>
{#each conferencePublications.toSorted((a, b) => b.fields.year - a.fields.year) as pub, i}
  <div class="conference-pub">
    <b>[C{conferencePublications.length - i}]</b>
    {pub.fields.authors.join(", ")}. {#if pub.fields.url}<a
        href={pub.fields.url}>{pub.fields.title}</a
      >{:else}{pub.fields.title}{/if}.
    <i>{pub.fields.conference}</i>, {pub.fields.location}, {pub.fields
      .conferenceDate}.
  </div>
{/each}

<h3>
  {$locale === "en" ? "Pre-prints" : "Prépublications"} ({preprints.length})
</h3>

{#if preprints.length === 0}No pre-prints at this time...{/if}
{#each preprints.toSorted((a, b) => parseInt(b.fields.year) - parseInt(a.fields.year)) as pub, i}
  <div class="preprint">
    <b>[PP{preprints.length - i}]</b>
    {pub.fields.authors.join(", ")}. {#if pub.fields.url}<a
        href={pub.fields.url}>{pub.fields.title}</a
      >{:else}{pub.fields.title}{/if},
    <i>{pub.fields.publisher}</i>, {pub.fields
      .year}.{#if pub.fields.comment}{" "}({pub.fields.comment}).{/if}
  </div>
{/each}

<h2>
  {$locale === "en"
    ? "Workshops and presentations"
    : "Ateliers et présentations"} ({presentations.length})
</h2>
{#each presentations.toSorted((a, b) => new Date(b.fields.date) - new Date(a.fields.date)) as presentation, i}
  <div class="presentation">
    <div><b>[W{presentations.length - i}]</b> {presentation.fields.title}</div>
    <div>{presentation.fields.event}</div>
    <div>{presentation.fields.location}</div>
    <div>{presentation.fields.date}</div>
    {#if presentation.fields.url}<a href={presentation.fields.url}>[Link]</a
      >{/if}
  </div>
{/each}

<h2>Posters ({posters.length})</h2>
{#each posters.toSorted((a, b) => new Date(b.fields.date) - new Date(a.fields.date)) as poster, i}
  <div class="poster">
    <div><b>[P{posters.length - i}]</b> {poster.fields.title}</div>
    <div>{poster.fields.event}</div>
    <div>{poster.fields.location}</div>
    <div>{poster.fields.date}</div>
    {#if poster.fields.url}<a href={poster.fields.url}>[Link]</a>{/if}
  </div>
{/each}

<h2>
  {$locale === "en" ? "Web tools" : "Outils web"} ({webtools.length})
</h2>
{#each webtools as wt, i}
  <div class="webtool">
    <div>
      <b>[WT{webtools.length - i}]</b>
      <a href={wt.fields.url}>{wt.fields.name}</a>
    </div>
    <div>{wt.fields.description}</div>
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
