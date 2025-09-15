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

  function titleCase(str) {
    return str.toLowerCase().replace(/(?:^|\s)\w/g, function (match) {
      return match.toUpperCase();
    });
  }

  const client = contentful.createClient({
    space: PUBLIC_CONTENTFUL_SPACE_ID,
    accessToken: PUBLIC_CONTENTFUL_ACCESS_TOKEN,
  });

  let news = $state([]);

  client
    .getEntries()
    .then((response) => {
      news = response.items.filter((x) => x.sys.contentType.sys.id == "news");
    })
    .catch(console.error);

  //const news = yaml.load(newsyaml);
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
      <p>Hi there 👋🏾!</p>
      <p>
        I'm François. <!--I'm currently a senior PhD student at Carleton University,
        where I am conducting research under the supervision of Profs. <a
          href="https://www.sce.carleton.ca/faculty/green/green.php"
          >James Green</a
        >
        and <a href="https://www.biggarlab.ca/">Kyle Biggar</a>. My research
        interests include <span class="topic">peptide binder design</span>,
        <span class="topic">lysine methylation</span>,
        <span class="topic">high performance computing</span>, and
        <span class="topic">machine learning in protein science</span>.-->
        I am a co-founder and a research scientist at
        <a href="https://nuvobio.com"
          ><span class="orange">Nuvo</span><span class="green">B</span><span
            class="orange">i</span
          ><span class="green">o</span></a
        >, a biotechnology startup specializing in peptide binder design.
      </p>

      <p>
        When I'm not sciencing, you are likely to find me reading or journaling
        in a coffee shop, recording music in my home studio, or engaging with
        the Ottawa music community at an open mic. 🎤 ☕️
      </p>
      <p style="text-align: center;">
        I nearly forgot to mention that I looove cats!
      </p>
    {:else}
      <p>Salut 👋🏾!</p>
      <p>
        Je suis François<!--, présentement un doctorant à l'Université Carleton à
        Ottawa où je complète ma recherche sous la supervision des professeurs <a
          href="https://www.sce.carleton.ca/faculty/green/green.php"
          >James Green</a
        >
        et <a href="https://www.biggarlab.ca/">Kyle Biggar</a>. Mes intérêts de
        recherche comprennent la
        <span class="topic">conception d'inhibiteurs peptidiques</span>, la
        <span class="topic">méthylation des lysines</span>, le
        <span class="topic">calcul haute performance</span>
        et
        <span class="topic"
          >les applications de l'apprentissage automatique aux protéines</span
        >-->.
        Je suis chercheur et co-fondateur de
        <a href="https://nuvobio.com"
          ><span class="orange">Nuvo</span><span class="green">B</span><span
            class="orange">i</span
          ><span class="green">o</span></a
        >, une entreprise en démarage qui se spécialise dans la conception de
        peptides pour des applications thérapeutiques, entre autres.
      </p>

      <p>
        Dans mes temps libres, vous aurez de fortes chances de me trouver dans
        un café, dans mon studio de fortune en train d'enregistrer des chansons
        ou alors, dans un micro ouvert en pleine immersion parmi la communauté
        musicale locale. 🎤 ☕️
      </p>

      <p style="text-align: center;">J'oubliais; j'aime les chats!</p>
    {/if}
  </div>
</div>

<div id="news-container">
  <h2>{$locale === "en" ? "News" : "Nouvelles"}</h2>
  {#each news.toSorted((a, b) => {
    return new Date(b.fields.date) - new Date(a.fields.date);
  }) as newsPiece}
    <div class="news-title">
      {$locale === "en" ? newsPiece.fields.title : newsPiece.fields.titre}
    </div>
    <div class="news-date">
      {$locale === "en"
        ? new Intl.DateTimeFormat("en-US", { month: "long" }).format(
            new Date(newsPiece.fields.date)
          ) +
          " " +
          new Date(newsPiece.fields.date).getFullYear()
        : titleCase(
            new Intl.DateTimeFormat("fr-CA", { month: "long" }).format(
              new Date(newsPiece.fields.date)
            )
          ) +
          " " +
          new Date(newsPiece.fields.date).getFullYear()}
    </div>
    <div class="news-content">
      {@html $locale === "en"
        ? marked(newsPiece.fields.contentMarkdown)
        : marked(newsPiece.fields.contenuMarkdown)}
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
