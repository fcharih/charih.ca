<script>
  import yaml from "js-yaml";
  import { marked } from "marked";

  import newsyaml from "$lib/content/news.yaml?raw";

  const news = yaml.load(newsyaml);
</script>

<svelte:head>
  <title>Charih | Accueil</title>
</svelte:head>

<div id="who-i-am">
  <img alt="francois" id="headshot" src="/img/charih1.png" />
  <h1>François Charih (il/lui)</h1>
  <div>(🇫🇷 prononciation: Fran-soi Cha-ri)</div>
  <div>Doctorant @ Université Carleton</div>
  <div>
    Chercheur and co-fondateur @ <a href="https://nuvobio.com">NuvoBio</a>
  </div>
  <div>Musicien, féministe, anti-raciste, queer 🏳️‍🌈💖💜💙</div>
</div>

<div id="socials">
  <a href="mailto:francois@charih.ca">Email</a>
  <div>|</div>
  <a href="https://bsky.app/profile/charih.ca">Bluesky</a>
  <div>|</div>
  <a href="https://scholar.google.ca/citations?user=6Ist2oUAAAAJ&hl=en"
    >Scholar</a
  >
  <div>|</div>
  <a href="https://github.com/fcharih">Github</a>
</div>

<div id="news-container">
  <h2>Nouvelles</h2>
  {#each news as newsPiece}
    <div class="news-title">{newsPiece.title_fr}</div>
    <div class="news-date">{newsPiece.date_fr}</div>
    <div class="news-content">
      {@html marked(newsPiece.content_fr)}
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
    margin: 10px auto;
    min-width: 250px;
  }

  h1 {
    margin: 0 auto;
  }

  h2 {
    text-align: center;
  }

  .news-title {
    font-weight: bold;
    font-size: 1.2rem;
  }
</style>
