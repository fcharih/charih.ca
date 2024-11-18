<script lang="ts">
  import yamlCV from "$lib/content/cv.yaml?raw";
  import yaml from "js-yaml";

  let cv = yaml.load(yamlCV);
  let journalPubs = cv.publications.filter((x) => x.type === "journal");
  let conferencePubs = cv.publications.filter((x) => x.type === "conference");
  let preprints = cv.publications.filter((x) => x.type === "preprint");
  let presentations = cv.presentations;
  let posters = cv.posters;
  let webtools = cv.webtools;
</script>

<svelte:head>
  <title>Charih | CV</title>
</svelte:head>

<h1>CV</h1>

<p>
  Feel free to consult a PDF version of <a href="/charih_cv.pdf">my CV</a>.
</p>

<h2>Publications</h2>
<h3>Peer-reviewed journals ({journalPubs.length})</h3>
{#each journalPubs as pub, i}
  <div class="journal-pub">
    <b>[J{journalPubs.length - i}]</b>
    {pub.authors}. {#if pub.url}<a href={pub.url}>{pub.title}</a
      >{:else}{pub.title}{/if} ({pub.year}).
    <i>{pub.publisher}</i>{#if pub.volume !== ""}
      {" "}{pub.volume}{/if}{#if pub.issue !== ""}({pub.issue}){/if}{#if pub.pages !== ""},
      pp. {pub.pages}{/if}.
  </div>
{/each}

<h3>Conference proceedings ({conferencePubs.length})</h3>
{#each conferencePubs as pub, i}
  <div class="conference-pub">
    <b>[C{conferencePubs.length - i}]</b>
    {pub.authors}. {#if pub.url}<a href={pub.url}>{pub.title}</a
      >{:else}{pub.title}{/if}.
    <i>{pub.conference}</i>, {pub.location}, {pub.date}.
  </div>
{/each}

<h3>Pre-prints ({preprints.length})</h3>

{#if preprints.length === 0}No pre-prints at this time...{/if}
{#each preprints as pub, i}
  <div class="preprint">
    <b>[PP{preprints.length - i}]</b>
    {pub.authors}. {#if pub.url}<a href={pub.url}>{pub.title}</a
      >{:else}{pub.title}{/if} ({pub.date}).
    <i>{pub.server}</i>.{#if pub.comment}{" "}({pub.comment}).{/if}
  </div>
{/each}

<h2>Workshops and presentations</h2>
{#each presentations as presentation, i}
  <div class="presentation">
    <div><b>[W{presentations.length - i}]</b> {presentation.title}</div>
    <div>{presentation.event}</div>
    <div>{presentation.location}</div>
    <div>{presentation.date}</div>
    {#if presentation.url}<a href={presentation.url}>[Link]</a>{/if}
  </div>
{/each}

<h2>Posters</h2>
{#each posters as poster, i}
  <div class="poster">
    <div><b>[P{posters.length - i}]</b> {poster.title}</div>
    <div>{poster.event}</div>
    <div>{poster.location}</div>
    <div>{poster.date}</div>
    {#if poster.url}<a href={poster.url}>[Link]</a>{/if}
  </div>
{/each}

<h2>Web tools</h2>
{#each webtools as wt, i}
  <div class="webtool">
    <div>
      <b>[WT{webtools.length - i}]</b> <a href={wt.url}>{wt.title}</a>
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
