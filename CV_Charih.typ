#import "@preview/fontawesome:0.5.0": *
#import "@preview/icu-datetime:0.1.2": fmt-date, fmt-time, fmt-datetime, experimental

#set text(font: "Palatino", size: 10pt)
#show link: set text(blue)
//#show heading: set align(center)
#set list(indent: 3em, spacing: 10pt)

#let cv = yaml("src/lib/content/cv.yaml")

#set page(margin: (
  top: 1.5cm,
  bottom: 1.5cm,
  left: 1.5cm,
  right: 1.5cm,
),
footer: context [
  Prepared with #fa-icon("heart", solid: true) and Typst
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
  #h(1fr)
  Last updated: #fmt-date(datetime.today(), locale: "en", length: "full") 
]
)

#let fa(name) = {
  text(
    font: "Font Awesome 6 Free",
    size: 10pt,
    box[ #name ]
  )
}

#align(center)[#text(weight: "bold", size: 2.5em)[François Charih]]

#show heading.where(level:3): it => [
  #set align(center)
  #it.body
  #v(1em)
]

#show heading.where(level:2): it => [
  #set align(center)
  #set text(1em, weight: "bold")
  #box[
  //#line(length: 100%)
  //#v(-0.8em)
  #it.body
  //#v(-0.8em)
  //#line(length: 100%)
  ]
]

// Formatting functions
#let print-education(contents) = {
  table(
  stroke: none,
  columns: (1fr, auto),
  //inset: 10pt,
  row-gutter: 1em,
  align: (left, right),
  ..for entry in contents {
    ([
      #text(weight: "bold")[#entry.degree in #entry.topic] \
      #entry.school\
      *Thesis:* #entry.thesistitle \
      #if entry.keys().contains("advisors") [
        #[*Thesis advisor(s):* #entry.advisors.map(advisor => [#link(advisor.website)[#advisor.name]]).join(", ", last: " and ")]
      ] else [

      ]
    ], [
      #entry.years \
      #fa-icon("location-dot") #entry.location \

    ])
  }
)
}

#let print-employment(contents) = {
  for entry in contents {
    table(
      stroke: none,
      columns: (auto, 1fr),
      //inset: 10pt,
      row-gutter: 1em,
      align: (left, right),
      [
        #text(weight: "bold")[#entry.title] \
        #entry.employer \
      ],
      [
        #entry.years \
        #fa-icon("location-dot") #entry.location \

      ]
    )
    list(..entry.details.map(d => list.item(d)))
  }
}

#let format-journal(entry) = {
   [#entry.authors. #entry.title (#entry.year). #text(style: "italic")[#entry.publisher]. 
   ]
    if entry.volume != "" [#entry.volume]
    if entry.issue != "" [(#entry.issue)]
    if entry.volume != "" [.]
    if entry.comment != "" [ (#entry.comment)]
    if entry.url != "" [ \[#link(entry.url)[Link]\]]

    [

    ]

}

#let format-conference(entry) = {
  [#entry.authors. #entry.title. #text(style: "italic")[#entry.conference], #entry.location, #entry.date.]
    if entry.comment != "" [ (#entry.comment)]
    if entry.url != "" [ \[#link(entry.url)[Link]\]]

    [

    ]
}



#let print-journal-papers(publications, first: false) = {
  let journal-entries = publications.filter(p => p.type == "journal")
    if first [
      \[J#(journal-entries.len())\] #format-journal(publications.at(0))
    ] else [
      #for (i, entry) in journal-entries.enumerate().slice(1) {
        [\[J#(journal-entries.len() - i)\] #format-journal(entry)]
      }
    ]
}

#let print-conference-papers(publications, first: false) = {
  let conference-entries = publications.filter(p => p.type == "conference")
  if first [
    \[C#(conference-entries.len())\] #format-conference(conference-entries.at(0))
  ] else [
    #for (i, entry) in conference-entries.enumerate().slice(1) {
      [\[C#(conference-entries.len() - i)\] #format-conference(entry)]
    }
  ]
}

#let format-other(entry) = {
  [#entry.authors. #entry.title. #text(style: "italic")[#entry.type], #entry.publisher, #if "location" in entry { entry.location }, #entry.date.]
    if entry.comment != "" [ (#entry.comment)]
    if entry.url != "" [ \[#link(entry.url)[Link]\]]

    [

    ]
}

#let print-other(publications, first: false) = {
  let other-entries = publications.filter(p => not ("journal", "conference").contains(p.type))
  if first [
    \[O#(other-entries.len())\] #format-other(other-entries.at(0))
  ] else [
    #for (i, entry) in other-entries.enumerate().slice(1) {
      [\[O#(other-entries.len() - i)\] #format-other(entry)]
    }
  ]
}

#let format-presentation(entry, num) = {
  table(
    stroke: none,
    columns: (1fr, auto),
    //inset: 10pt,
    row-gutter: 1em,
    align: (left, right),
    [
      \[PW#num\] #text(weight: "bold")[#entry.title] \
      #entry.event #if entry.url != "" [ \[#link(entry.url)[Link]\]]\
    ],
    [
      #entry.date \
      #fa-icon("location-dot") #entry.location \
    ]
  )
}

#let print-presentations(contents, first: false) = {
  if first [
     #format-presentation(contents.at(0), contents.len())
  ] else [
    #for (i, entry) in contents.enumerate().slice(1) {
      [#format-presentation(entry, contents.len() - i)]
    }
  ]
}

#let format-poster(entry, num) = {
  table(
      stroke: none,
      columns: (1fr, auto),
      //inset: 10pt,
      row-gutter: 1em,
      align: (left, right),
      [
        [P#(num)] #text(weight: "bold")[#entry.title] \
        #entry.event #if entry.keys().contains("url") and entry.url != "" [ \[#link(entry.url)[Link]\]]\
      ],
      [
        #entry.date \
        #fa-icon("location-dot") #entry.location \

      ]
    )
}

#let print-posters(contents, first: false) = {
  if first [
    #format-poster(contents.at(0), contents.len()) 
  ] else [
    #for (i, entry) in contents.enumerate().slice(1) {
      format-poster(entry, contents.len() - i) 
    }
  ]
}

#let format-award(entry) = {
  table(
    stroke: none,
    columns: (1fr, auto),
    //inset: 10pt,
    row-gutter: 1em,
    align: (left, right),
    [
      #text(weight: "bold")[#entry.title], #entry.source #if entry.keys().contains("value") and entry.value != ""  [(#entry.value)] \
      #if entry.keys().contains("comment") and entry.comment != ""  [#entry.comment]
    ],
    [
      #entry.year
    ]
  )
}

#let print-awards(contents, first: false) = {
  if first [
    #format-award(contents.at(0))  
  ] else [
    #for (i, entry) in contents.enumerate().slice(1) {
      format-award(entry)  
    }
  ]
}

#let print-mentees(contents) = {
  for (i, entry) in contents.enumerate() {
    table(
      stroke: none,
      columns: (1fr, auto),
      //inset: 10pt,
      row-gutter: 1em,
      align: (left, right),
      [
        #text(weight: "bold")[#entry.student], #entry.type \
        Project: #text(style: "italic")[#entry.project]
      ],
      [
        #entry.date
      ]
    )
  }
}

#let format-involvement(entry) = {
  table(
      stroke: none,
      columns: (1fr, auto),
      //inset: 10pt,
      row-gutter: 1em,
      align: (left, right),
      [
        #text(weight: "bold")[#entry.title] \
        #entry.source
      ],
      [
        #entry.year
      ]
    )
}

#let print-involvement(contents, first: false) = {
  if first [
      #format-involvement(contents.at(0))
  ] else [
    #for (i, entry) in contents.enumerate().slice(1) {
      format-involvement(entry)
    }
  ]
}

Carleton University Biomedical Informatics Collaboratory (cuBIC)\
Institute of Biochemistry, Carleton University \
Health Science Building, Room 4302
1125, Colonel By Drive \
Ottawa, ON (K1S 5B6) \
#fa-icon("envelope") #link("mailto:francois@charih.ca")[francois\@charih.ca] \
#fa-icon("earth") #link("https://charih.ca")[https://charih.ca]

== Research interests

#align(center)[
#table(
  stroke: none,
  columns: (auto, auto, auto),
  //inset: 10pt,
  row-gutter: 1em,
  column-gutter: 3em,
  align: (left, left, left),
  [
    Computational biology \
    Biomedical informatics
  ],
  [
    Applied machine learning \
    High performance computing
  ],
  [
    Software development \
    Protein/peptide engineering
  ]
)
]
== Education

#print-education(cv.education)

#box(width: 100%)[
== Relevant employment experience
#print-employment(cv.employment.slice(0, count: 1))
]
#print-employment(cv.employment.slice(1))

#show "F. Charih": name => text(weight: "bold")[F. Charih]
#box(width: 100%)[
== Publications

=== Peer-reviewed journal articles
#print-journal-papers(cv.publications, first: true)
]

#print-journal-papers(cv.publications, first: false)

#box(width: 100%)[
=== Conference proceedings
#print-conference-papers(cv.publications, first: true)
]

#print-conference-papers(cv.publications, first: false)


#box(width: 100%)[
=== Other manuscripts (_e.g._ pre-prints, theses, _etc._)

#print-other(cv.publications, first: true)
]

#print-other(cv.publications, first: false)


#box(width: 100%)[
== Presentations and workshops

#print-presentations(cv.presentations, first: true)
]
#print-presentations(cv.presentations, first: false)

#box(width: 100%)[
== Selected posters
#print-posters(cv.posters, first: true)
]

#print-posters(cv.posters, first: false)

#box(width: 100%)[
== Awards and honours
#print-awards(cv.awards, first: true)
]

#print-awards(cv.awards)

#box(width: 100%)[
== Research mentoring
I have had the great pleasure to mentor the following students:
]

#print-mentees(cv.mentoring)

#box(width: 100%)[
== Peer reviews

I have reviewed submissions for the following peer-reviewed journals or conferences:
]

#for p in cv.peerreviews [
  - #p.venue (#p.count review#if p.count > 1 [s])
]

#box(width: 100%)[
== Other relevant roles
#print-involvement(cv.involvement, first: true)
]

#print-involvement(cv.involvement)

#box(width: 100%)[
== Languages

*Natural languages:* French (native), English (full professional proficiency), Moroccan Arabic (elementary proficiency)

*Programming languages:* Python, Rust, C/C++, JavaScript, Java, HTML/CSS
]
