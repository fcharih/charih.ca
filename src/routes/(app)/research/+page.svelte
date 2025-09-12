<script>
  import { locale } from "../i18n";
</script>

<svelte:head>
  <title>Charih | {$locale === "en" ? "Research" : "Recherche"}</title>
</svelte:head>

<h1>{$locale === "en" ? "Research" : "Recherche"}</h1>

<p>
  {#if $locale === "en"}
    I earned my PhD in Electrical and Computer Engineering (Carleton, 2025),
    though I specialize in computational biochemistry. I am particularly
    interested in applications of artificial intelligence (AI)/machine learning
    (ML) to design novel therapeutic peptides and study lysine methylation. I
    have also developed an interest in high performance computing throughout the
    past years. My thesis advisors were Profs. <a
      href="https://www.sce.carleton.ca/faculty/green/green.php"
      >James R. Green</a
    >
    (Systems and Computer Engineering) and
    <a href="https://www.biggarlab.ca/">Kyle K. Biggar</a> (Biochemistry).
  {:else}
    Je suis titulaire d'un doctorat en génie électrique et informatique de
    l'Université Carleton (2025), quoique je me spécialise en biochimie
    computationnelle. Je m'intéresse tout particulièrement aux applications de
    l'apprentissage automatique dans la conception d'inhibiteurs peptidiques et
    l'étude de la méthylation des lysines. Dans le cadre de mes projets de
    recherches, j'utilise des techniques de calcul haute performance (high
    performance computing). Mes directeurs de thèse sont les professeurs <a
      href="https://www.sce.carleton.ca/faculty/green/green.php"
      >James R. Green</a
    >
    (département de génie des systèmes et informatique) et
    <a href="https://www.biggarlab.ca/">Kyle K. Biggar</a> (département de biochimie).
  {/if}
</p>

<h2>{$locale === "en" ? "Current research" : "Recherche actuelle"}</h2>
<p>
  {#if $locale === "en"}
    As part of my PhD thesis work, I applied AI/ML tools to the study of lysine
    methylation. My PhD research falls within three research themes:
  {:else}
    Dans le cadres de mes travaux de thèse, je me suis intéressé aux
    applications de l'IA pour l'étude de la méthylation des lysines. Mes travaux
    de doctorat se déclinent en trois axes de recherche:
  {/if}
</p>

<img id="thesis-themes" src="/img/1-thesis_themes.png" />

<ol>
  <li>
    {#if $locale === "en"}
      <b>Proteome-wide identification of the lysine methylation sites</b><br />
      Our cells express over 20,000 proteins, a large portion of which are substrates
      in a set of chemical reactions called post-translational modifications (phosphorylation,
      acetylation, methylation, etc.) These reactions can modulate the function,
      stability and localization within the cell. I aim to develop new machine learning
      approaches to answer questions such as:
      <i
        >What proteins are methylated? How does this relate to other
        modifications? What are the implications of this modification?</i
      >
    {:else}
      <b
        >Identification du méthylome des lysines à l'échelle du protéome avec
        l'IA</b
      ><br />
      Nos cellules expriment au-delà de 20,000 différentes protéines qui sont sujettes
      à des modifications chimiques appellées modifications post-traductionnelles
      (phosphorylation, acétylation, méthylation, etc.) qui altèrent leur fonction,
      leur stabilité et leur localisation dans la cellule.
      <i
        >Quelles protéines sont sujettes à la méthylation sur leurs lysines?
        Quel est le lien entre la méthylation et la fonction?</i
      >
    {/if}
  </li>
  <li>
    {#if $locale === "en"}
      <b
        >Improving the computational efficiency of in silico design of lysine
        methyltransferase inhibitors</b
      ><br />I am improving upon the state-of-the-art algorithms for peptide
      inhibitor design using sequence information only, as existing algorithms
      are computationally intensive and not scalable. We are developing a fast
      algorithm named Darwin which leverages large databases of protein-protein
      interactions active peptides capable of specifically modulating the
      activity of lysine methyltransferases (KMTs) and lysine demethylases
      (KDMs). Overactive KMTs/KDMs are involved in a number of cancers, and
      these peptides could supplement existing therapies and improve their
      efficacy.
    {:else}
      <b
        >Développement d'algorithmes de conception d'inhibiteurs peptidiques
        ciblant les (dé)méthylases de lysines plus performants</b
      ><br />J'itère sur l'état de l'art en algorithmes de conception
      d'inhibiteurs peptidiques. Les algorithmes qui sont informés par les
      séquences en acides aminés qui existent présentement ont des coûts de
      calculs très élevés. Nous développons un algorithme plus performant nommé
      Darwin qui fait usage de grandes quantités de données sur les interactions
      entre les protéines pour concevoir des inhibiteurs de (dé)méthylases des
      lysines. Ces enzymes sont surexprimées dans un nombre important de cancers
      et nous anticipons que ces peptides pourraient être utilisés comme
      thérapies adjuvantes pour augmenter l'efficacité des traitements actuels.
    {/if}
  </li>
  <li>
    {#if $locale === "en"}
      <b>Optimizing the design process for difficult-to-target proteins</b><br
      />
      Sequence-based peptide engineering methods rely on validated protein-protein
      interactions (PPIs). In some cases, databases of known PPIs provide insightful
      information that can guide the peptide design process. In other cases, the
      finite set of known interactions is insufficient as the target may bear little
      similarity to proteins with known interactors. I am trying to improve the search
      strategy in a very large peptide space in order to probe it more efficiently
      using deep learning techniques (protein language models).
    {:else}
      <b
        >Optimisation de l'algorithme de conception d'inhibiteur peptidiques
        pour les protéines difficiles à cibler</b
      ><br />
      Les algorithmes de conception d'inhibiteurs peptidiques qui utilisent la structure
      primaire des protéines font usage de banques de données répertoriant les interactions
      entre protéines. Dans certains cas, les protéines ciblées ont peu de similarité
      avec les protéines ayant des interactions connues, ce qui rend la conception
      d'inhibiteurs plus difficile. J'essaie donc d'optimiser la stratégie avec laquelle
      l'espace (infiniment grand) des peptides est exploré pour converger aussi rapidement
      que possible vers des peptides capables d'interagir avec la cible en utilisant
      des techniques d'apprentissage profond (modèle de langage des protéines).
    {/if}
  </li>
</ol>

<p>
  {#if $locale === "en"}
    Want to know more about my main research project? Feel free to take a look
    at my submission for the 2021 Gradflix contest:
  {:else}
    Vous voulez en savoir plus sur mon projet de recherche principal? Vous
    pouvez visionner la vidéo (en anglais) que j'ai soumise au concours Gradflix
    en 2021. Elle résume en une minute l'essentiel de mon projet.
  {/if}
</p>

<div class="yt">
  <iframe
    height="400"
    src="https://www.youtube.com/embed/jE3-lh7vuNE?si=biHHOWK-WStRSNOR"
    title="YouTube video player"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    referrerpolicy="strict-origin-when-cross-origin"
    allowfullscreen
  ></iframe>
</div>

<h2>{$locale === "en" ? "Previous research" : "Recherche antérieure"}</h2>
<ol>
  <li>
    {#if $locale === "en"}
      <b>Structural biology</b><br />

      Under the supervision of
      <a
        href="https://www.uottawa.ca/faculty-medicine/leadership-team/dr-jean-francois-couture"
        >Prof. Jean-François Couture</a
      >, I completed my my
      <a href="https://charih.ca/Charih_Honours_2015.pdf">honours thesis</a>
      on the structural characterisation of the Fur (Ferric Uptake Regulator) protein
      in Campylobacter jejuni a pathogenic agent responsible for numerous cases of
      gastroenteritis. I crystallized the protein and built a draft model of the
      structure, which was further refined by Prof. Couture. This research was
      <a href="https://www.nature.com/articles/s41598-018-25157-6">
        published
      </a>
      in the scientific journal <i>Scientific Reports</i>.
    {:else}
      <b>Biologie structurale</b><br />
      Sous la supervision du professeur
      <a
        href="https://www.uottawa.ca/faculty-medicine/leadership-team/dr-jean-francois-couture"
        >Jean-François Couture</a
      >, j'ai complété ma
      <a href="https://charih.ca/Charih_Honours_2015.pdf"
        >thèse de premier cycle</a
      >
      sur la caractérisation structurale de la protéine Fur (Ferric uptake regulator)
      dans C. jejuni. J'ai participé à la résolution de la structure de la protéine.
      Les résultats des travaux auxquels j'ai contribué ont été
      <a href="https://www.nature.com/articles/s41598-018-25157-6"> publiés </a>
      dans la revue scientifique <i>Scientific Reports</i>.
    {/if}
  </li>
  <li>
    {#if $locale === "en"}
      <b>Computational audiology</b><br />
      I have previously worked in computational audiology. My
      <a href="https://curve.carleton.ca/873548bb-f077-49d4-a5a6-9a69fddf1284"
        >master's thesis</a
      > work focused on the ML-assisted classification of audiograms to facilitate
      their interpretation by non-experts.
    {:else}
      <b>Audiologie computationnelle</b><br />
      J'ai complété des travaux en informatique biomédicale dans le cadre de mon
      <a href="https://curve.carleton.ca/873548bb-f077-49d4-a5a6-9a69fddf1284"
        >projet de maîtrise</a
      >. Je me suis intéressé à la classification automatique de courbes
      audiométriques pour faciliter leur interprétation par des professionnels
      de la santé non-spécialistes.
    {/if}
  </li>
</ol>

<style>
  li {
    margin-top: 1rem;
    margin-bottom: 1rem;
  }

  #thesis-themes {
    display: block;
    margin: 10px auto;
    width: 30%;
  }

  .yt {
    width: 90%;
    margin: auto;
  }
  .yt iframe {
    width: 100%;
    border: 0;
    overflow: hidden;
  }
</style>
