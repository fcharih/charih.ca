<script>
</script>

<svelte:head>
  <title>Charih | Research</title>
</svelte:head>

<h1>Research</h1>

<p>
  I am currently a PhD student in Electrical and Computer Engineering
  specializing in computational biology. I am particularly interested in
  applications of artificial intelligence (AI)/machine learning (ML) to design
  novel therapeutic peptides and study lysine methylation. I have also developed
  an interest in high performance computing throughout the past years. My thesis
  advisors are Profs. <a
    href="https://www.sce.carleton.ca/faculty/green/green.php">James R. Green</a
  >
  (Systems and Computer Engineering) and
  <a href="https://www.biggarlab.ca/">Kyle K. Biggar</a> (Biochemistry).
</p>

<h2>Current reseach</h2>
<p>
  As part of my thesis work, I apply AI/ML tools to the study of lysine
  methylation. My research can be subdivided into three research themes:
</p>

<img id="thesis-themes" src="/img/1-thesis_themes.png" />

<ol>
  <li>
    <b>Proteome-wide identification of the lysine methylation sites</b><br />
    Our cells express over 20,000 proteins, a large portion of which are substrates
    in a set of chemical reactions called post-translational modifications (phosphorylation,
    acetylation, methylation, etc.) These reactions can modulate the function, stability
    and localization within the cell. I aim to develop new machine learning approaches
    to answer questions such as:
    <i
      >What proteins are methylated? How does this relate to other
      modifications? What are the implications of this modification?</i
    >
  </li>
  <li>
    <b
      >Improving the computational efficiency of in silico design of lysine
      methyltransferase inhibitors</b
    ><br />I am improving upon the state-of-the-art algorithms for peptide
    inhibitor design using sequence information only, as existing algorithms are
    computationally intensive and not scalable. We are developing a fast
    algorithm named Darwin which leverages large databases of protein-protein
    interactions active peptides capable of specifically modulating the activity
    of lysine methyltransferases (KMTs) and lysine demethylases (KDMs).
    Overactive KMTs/KDMs are involved in a number of cancers, and these peptides
    could supplement existing therapies and improve their efficacy.
  </li>
  <li>
    <b>Optimizing the design process for difficult-to-target proteins</b><br />
    Sequence-based peptide engineering methods rely on validated protein-protein
    interactions (PPIs). In some cases, databases of known PPIs provide insightful
    information that can guide the peptide design process. In other cases, the finite
    set of known interactions is insufficient as the target may bear little similarity
    to proteins with known interactors. I am trying to improve the search strategy
    in a very large peptide space in order to probe it more efficiently using deep
    learning techniques (protein language models).
  </li>
</ol>

<p>
  Want to know more about my main research project? Feel free to take a look at
  my submission for the 2021 Gradflix contest:
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

<h2>Previous research</h2>
<ol>
  <li>
    <b>Structural biology</b><br />
    Under the supervision of
    <a
      href="https://www.uottawa.ca/faculty-medicine/leadership-team/dr-jean-francois-couture"
      >Prof. Jean-François Couture</a
    >, I completed my my
    <a href="https://charih.ca/Charih_Honours_2015.pdf">honours thesis</a>
    on the structural characterisation of the Fur (Ferric Uptake Regulator) protein
    in Campylobacter jejuni a pathogenic agent responsible for numerous cases of
    gastroenteritis. I crystallized the protein and built a draft model of the structure,
    which was further refined by Prof. Couture. This research was
    <a href="https://www.nature.com/articles/s41598-018-25157-6"> published </a>
    in the scientific journal <i>Scientific Reports</i>.
  </li>
  <li>
    <b>Computational audiology</b><br />
    I have previously worked in computational audiology. My
    <a href="https://curve.carleton.ca/873548bb-f077-49d4-a5a6-9a69fddf1284"
      >master's thesis</a
    > work focused on the ML-assisted classification of audiograms to facilitate
    their interpretation by non-experts.
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
