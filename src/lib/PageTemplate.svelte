<script>
  import { page } from "$app/stores";
  let pathname = $page.url.pathname;
  let pagename = pathname.split("/").slice(-1)[0];
  let french = pathname.includes("fr");

  let en_fr_map = {
    "": "/fr",
    research: "fr/recherche",
    cv: "fr/cv",
    music: "fr/musique",
  };

  let fr_en_map = {
    fr: "/",
    recherche: "/research",
    musique: "/music",
    cv: "/cv",
  };

  let corresponding;
</script>

<header>
  {#if !french}
    <a href="/">Home</a>
    <a href="/research">Research</a>
    <a href="/cv">CV</a>
    <a href="/music">Music</a>
    <a href={en_fr_map[pagename]}>Français 🇫🇷</a>
  {:else}
    <a href="/fr">Accueil</a>
    <a href="/fr/recherche">Recherche</a>
    <a href="/fr/cv">CV</a>
    <a href="/fr/musique">Musique</a>
    <a href={fr_en_map[pagename]}>English 🇬🇧</a>
  {/if}
</header>

<section>
  <div class="padder">
    <slot></slot>
  </div>
</section>

<footer>
  {#if !french}
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
  /*=============== GLOBAL =================*/
  @font-face {
    font-family: "Source Sans";
    font-style: normal;
    font-weight: 400;
    src: url("%sveltekit.assets%/fonts/SourceSansPro-Regular.otf") format("otf");
  }

  body {
    font-family: "Source Sans", sans-serif;
    font-size: 14px;
  }

  :global(a) {
    color: #0f67a6;
    text-decoration: none;
  }

  :global(a:visited) {
    color: #0f67a6;
  }

  :global(h1, h2, h3) {
    text-align: center;
  }
  /*=============== LOCAL =================*/

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
