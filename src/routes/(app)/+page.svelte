<script>
  import * as contentful from "contentful";
  import { documentToHtmlString } from "@contentful/rich-text-html-renderer";

  import { locale } from "./i18n";
  import yaml from "js-yaml";
  import { marked } from "marked";
  import {
    PUBLIC_CONTENTFUL_SPACE_ID,
    PUBLIC_CONTENTFUL_ACCESS_TOKEN,
  } from "$env/static/public";

  import newsyaml from "$lib/content/news.yaml?raw";
  import { text } from "@sveltejs/kit";

  let { data } = $props();

  function titleCase(str) {
    return str.toLowerCase().replace(/(?:^|\s)\w/g, function (match) {
      return match.toUpperCase();
    });
  }
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Home" : "Accueil"}</title>
</svelte:head>

<div id="who-i-am">
  <img alt="francois" id="headshot" src="/img/charih.png" />
  <h1>François Charih ({$locale === "en" ? "he/him/they/them" : "il/lui"})</h1>
  <div>
    ({$locale === "en"
      ? "pronunciation: Fran-swa Sha-ree"
      : "prononciation: Fran-soi Cha-ri"})
  </div>
  <div>
    {@html $locale === "en"
      ? "Co-founder and Research scientist @ "
      : "Co-fondateur et chercheur @ "}
    <a href="https://nuvobio.com"
      ><span class="orange">Nuvo</span><span class="green">B</span><span
        class="orange">i</span
      ><span class="green">o</span></a
    >
  </div>
  <div id="socials">
    <a href="mailto:francois@charih.ca"><i class="fa-solid fa-envelope"></i></a>
    <div>|</div>
    <a href="https://bsky.app/profile/charih.ca"
      ><i class="fa-brands fa-bluesky"></i></a
    >
    <div>|</div>
    <a href="https://app.thestorygraph.com/profile/fcharih">
      <i class="fa-solid fa-book"></i>
    </a>
    <div>|</div>
    <a href="https://scholar.google.ca/citations?user=6Ist2oUAAAAJ&hl=en"
      ><i class="fa-brands fa-google-scholar"></i></a
    >
    <div>|</div>
    <a href="https://orcid.org/0000-0002-7931-8921">
      <i class="fa-brands fa-orcid"></i>
    </a>
    <div>|</div>
    <a href="https://github.com/fcharih"><i class="fa-brands fa-github"></i></a>
  </div>
  <div id="intro">
    <h2>{$locale === "en" ? "About me" : "Bio"}</h2>
    {#if $locale == "en"}
      {@html marked(data.textChunks["About"].content)}
    {:else}
      {@html marked(data.textChunks["About"].contenu)}
    {/if}
  </div>
</div>

<div id="news-container">
  <h2>{$locale === "en" ? "News" : "Nouvelles"}</h2>
  {#each data.news.toSorted((a, b) => {
    return new Date(b.date) - new Date(a.date);
  }) as newsPiece}
    <div class="news-title">
      {$locale === "en" ? newsPiece.title : newsPiece.titre}
    </div>
    <div class="news-date">
      {$locale === "en"
        ? new Intl.DateTimeFormat("en-US", { month: "long" }).format(
            new Date(newsPiece.date)
          ) +
          " " +
          new Date(newsPiece.date).getFullYear()
        : titleCase(
            new Intl.DateTimeFormat("fr-CA", { month: "long" }).format(
              new Date(newsPiece.date)
            )
          ) +
          " " +
          new Date(newsPiece.date).getFullYear()}
    </div>
    <div class="news-content">
      {@html $locale === "en"
        ? marked(newsPiece.contentMarkdown)
        : marked(newsPiece.contenuMarkdown)}
    </div>
  {/each}
</div>

<style>
  #headshot {
    width: 150px;
    border-radius: 50%;
  }

  #who-i-am {
    text-align: center;
  }

  #news-container {
    padding: 10px;
  }

  #socials {
    display: flex;
    justify-content: space-between;
    width: 50%;
    max-width: 250px;
    margin: 5px auto;
    height: 20px;
  }

  h1 {
    margin: 0 auto;
  }

  h2 {
    text-align: center;
  }

  .news-title {
    font-weight: bold;
  }

  .topic {
    font-weight: bold;
  }

  #intro {
    margin: 20px auto;
    max-width: 80%;
    text-align: left;
    background-color: #f3f3f3;
    color: black;
    border: 1px solid black;
    padding: 10px;
  }

  .orange {
    color: #ff661b;
  }

  .green {
    color: #5ebe18;
  }

  #socials i:hover {
    font-size: 1.2rem;
  }
</style>
