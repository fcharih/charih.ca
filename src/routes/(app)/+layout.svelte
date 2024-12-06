<script>
  import { locale } from "./i18n";

  import "../../app.css";
</script>

<header>
  <a href="/">{$locale === "en" ? "Home" : "Accueil"}</a>
  <a href="/research">{$locale === "en" ? "Research" : "Recherche"}</a>
  <a href="/cv">{$locale === "en" ? "CV" : "CV"}</a>
  <a href="/music">{$locale === "en" ? "Music" : "Musique"}</a>
  <select bind:value={$locale}>
    <option value={"en"}>EN 🇬🇧</option>
    <option value={"fr"}>FR 🇫🇷</option>
  </select>
</header>

<section>
  <div class="padder">
    <slot></slot>
  </div>
</section>

<footer>
  {#if $locale === "en"}
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
