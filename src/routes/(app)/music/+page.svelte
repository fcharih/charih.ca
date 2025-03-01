<script>
  import { locale } from "../i18n";
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Music" : "Musique"}</title>
</svelte:head>

<h1>{$locale === "en" ? "Music" : "Musique"}</h1>
{#if $locale === "en"}
  <p>
    In my spare times, I enjoy playing the guitar and singing. I started
    songwriting in my late teens.
  </p>
  <p>
    Life (grad school) got in the way and left me with very little time to play
    and write music. Art and music are important, but fighting diseases is
    important too! I'm starting to get back into it as I'm wrapping up that PhD
    and am writing new songs.
  </p>
  <p>
    I look forward to sharing my songs with you once I get a minute to record
    them!
  </p>
{:else}
  <p>
    Dans mes temps libres, j'aime écrire de la musique. Je compose des chansons
    depuis l'adolescence.
  </p>
  <p>
    Mes études ont accaparé beaucoup de mon temps, ce qui m'en a laissé trop peu
    pour jouer et écrire des chansons. L'art et la musique sont importants, mais
    combattre les maladies l'est aussi. Comme j'approche la fin de mon doctorat,
    je suis en train de me remettre à l'écriture.
  </p>
  <p>J'ai hâte de partager mes chansons avec vous!</p>
{/if}

<!--
<div>
  <iframe
    style="border: 0; width: 300px; height: 470px; display: block; margin: 20px auto;"
    src="https://bandcamp.com/EmbeddedPlayer/album=1272590194/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/transparent=true/"
    seamless
    ><a href="https://itsfrancois31.bandcamp.com/album/half-moon-eyes-single"
      >Half Moon Eyes (Single) by Francois 31</a
    ></iframe
  >
</div>
-->
