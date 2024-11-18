<script>
  import yaml from "js-yaml";
  import { marked } from "marked";

  import newsyaml from "$lib/content/news.yaml?raw";

  const news = yaml.load(newsyaml);
</script>

<svelte:head>
  <title>Charih | Home</title>
</svelte:head>

<div id="who-i-am">
  <img alt="francois" id="headshot" src="/img/charih1.png" />
  <h1>François Charih (he/him/his)</h1>
  <div>(🇬🇧 pronunciation: Fran-swa Sha-ree)</div>
  <div>PhD candidate @ Carleton University</div>
  <div>
    Lead scientist and co-founder @ <a href="https://nuvobio.com">NuvoBio</a>
  </div>
  <div>Musician, feminist, antiracist, queer 🏳️‍🌈💖💜💙</div>
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
  <h2>News</h2>
  {#each news as newsPiece}
    <div class="news-title">{newsPiece.title}</div>
    <div class="news-date">{newsPiece.date}</div>
    <div class="news-content">
      {@html marked(newsPiece.content)}
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
    min-width: 250px;
    margin: 10px auto;
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
</style>
