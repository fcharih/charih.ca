<script>
</script>

<svelte:head>
  <title>Charih | Recherche</title>
</svelte:head>

<h1>Recherche</h1>

<p>
  Je suis présentement doctorant en génie électrique et informatique, quoique je
  me spécialise en biologie computationnelle. Je m'intéresse tout
  particulièrement aux applications de l'apprentissage automatique dans la
  conception d'inhibiteurs peptidiques et l'étude de la méthylation des lysines.
  Dans le cadre de mes projets de recherches, j'utilise des techniques de calcul
  haute performance (high performance computing). Mes directeurs de thèse sont
  les professeurs <a href="https://www.sce.carleton.ca/faculty/green/green.php"
    >James R. Green</a
  >
  (département de génie des systèmes et informatique) et
  <a href="https://www.biggarlab.ca/">Kyle K. Biggar</a> (département de biochimie).
</p>

<h2>Recherche actuelle</h2>
<p>
  Dans le cadres de mes travaux de thèse, je m'intéresse aux applications de
  l'IA pour l'étude de la méthylation des lysines. Mes travaux se déclinent en
  trois axes de recherche:
</p>

<img id="thesis-themes" src="/img/1-thesis_themes.png" />

<ol>
  <li>
    <b
      >Identification du méthylome des lysines à l'échelle du protéome avec l'IA</b
    ><br />
    Nos cellules expriment au-delà de 20,000 différentes protéines qui sont sujettes
    à des modifications chimiques appellées modifications post-traductionnelles (phosphorylation,
    acétylation, méthylation, etc.) qui altèrent leur fonction, leur stabilité et
    leur localisation dans la cellule.
    <i
      >Quelles protéines sont sujettes à la méthylation sur leurs lysines? Quel
      est le lien entre la méthylation et la fonction?</i
    >
  </li>
  <li>
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
    et nous anticipons que ces peptides pourraient être utilisés comme thérapies
    adjuvantes pour augmenter l'efficacité des traitements actuels.
  </li>
  <li>
    <b
      >Optimisation de l'algorithme de conception d'inhibiteur peptidiques pour
      les protéines difficiles à cibler</b
    ><br />
    Les algorithmes de conception d'inhibiteurs peptidiques qui utilisent la structure
    primaire des protéines font usage de banques de données répertoriant les interactions
    entre protéines. Dans certains cas, les protéines ciblées ont peu de similarité
    avec les protéines ayant des interactions connues, ce qui rend la conception
    d'inhibiteurs plus difficile. J'essaie donc d'optimiser la stratégie avec laquelle
    l'espace (infiniment grand) des peptides est exploré pour converger aussi rapidement
    que possible vers des peptides capables d'interagir avec la cible en utilisant
    des techniques d'apprentissage profond (modèle de langage des protéines).
  </li>
</ol>

<p>
  Vous voulez en savoir plus sur mon projet de recherche principal? Vous pouvez
  visionner la vidéo que j'ai soumise au concours Gradflix en 2021. Elle résume
  en une minute l'essentiel de mon projet.
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

<h2>Travaux antérieurs</h2>
<ol>
  <li>
    <b>Structural biology</b><br />
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
  </li>
  <li>
    <b>Audiologie computationnelle</b><br />
    J'ai complété des travaux en informatique biomédicale dans le cadre de mon
    <a href="https://curve.carleton.ca/873548bb-f077-49d4-a5a6-9a69fddf1284"
      >projet de maîtrise</a
    >. Je me suis intéressé à la classification automatique de courbes
    audiométriques pour faciliter leur interprétation par des professionnels de
    la santé non-spécialistes.
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
