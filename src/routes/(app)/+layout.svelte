<script>
  import "../../app.css";
  import { page } from "$app/stores";
  $: activeUrl = $page.url.pathname;
  //let french = activeUrl.includes("fr");

  let en_fr_map = {
    "/": "/fr",
    "/research": "fr/recherche",
    "/cv": "fr/cv",
    "/music": "fr/musique",
  };

  let fr_en_map = {
    "/fr": "/",
    "/fr/recherche": "/research",
    "/fr/musique": "/music",
    "/fr/cv": "/cv",
  };

  let corresponding;
</script>

<header>
  {#if !activeUrl.includes("fr")}
    <a href="/">Home</a>
    <a href="/research">Research</a>
    <a href="/cv">CV</a>
    <a href="/music">Music</a>
    <a href={en_fr_map[activeUrl]}
      >FR <span style="font-size:0.9rem;">🇫🇷</span></a
    >
  {:else}
    <a href="/fr">Accueil</a>
    <a href="/fr/recherche">Recherche</a>
    <a href="/fr/cv">CV</a>
    <a href="/fr/musique">Musique</a>
    <a href={fr_en_map[activeUrl]}
      >EN <span style="font-size:0.9rem;">🇬🇧</span></a
    >
  {/if}
</header>

<section>
  <div class="padder">
    <slot></slot>
  </div>
</section>

<footer>
  {#if !activeUrl.includes("fr")}
    <div>
      Built by yours truly using <a href="https://svelte.dev/">Svelte</a>.
    </div>
    <div>
      Want to discuss opportunities to collaborate or chat over a coffee? Please <a
        href="mailto:francois@charih.ca">reach out</a
      >!
    </div>
  {:else}
    <div>
      Page bâtie avec amour et <a href="https://svelte.dev/">Svelte</a>.
    </div>
    <div>
      Vous voulez discuter d'une opportunité de collaborer ou parler en sirotant
      un bon café? N'hésitez-pas à <a href="mailto:francois@charih.ca"
        >me contacter</a
      >!
    </div>
  {/if}
</footer>

<style>
  body > div {
    background-image: url("/wallpaper.jpg");
  }
  header,
  section,
  footer {
    width: 90%;
    border: 2px solid black;
    padding: 10px;
    margin: 10px auto;
    background-color: white;
  }

  header {
    display: flex;
    justify-content: space-around;
    align-items: center;
  }

  section {
    flex-grow: 1;
    overflow-y: scroll;
  }

  .padder {
    padding: 30px;
  }

  footer {
    text-align: center;
  }
</style>
