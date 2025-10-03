#import "@preview/fontawesome:0.5.0": *
#import "@preview/icu-datetime:0.1.2": experimental, fmt-date, fmt-datetime, fmt-time
#import "@preview/datify:0.1.4": custom-date-format

#let count-entries(entries) = {
  let counts = (:)
  for entry in entries {
    if entry.venue in counts {
      counts.insert(entry.venue, counts.at(entry.venue) + 1)
    } else {
      counts.insert(entry.venue, 1)
    }
  }
  return counts
}

#let to-datetime(datestring) = {
  let split_date = datestring.split("-")
  return datetime(day: int(split_date.at(2).split(" ").at(0)), month: int(split_date.at(1)), year: int(split_date.at(
    0,
  )))
}

#let title-case(string) = {
  return string.replace(regex("[A-Za-z]+('[A-Za-z]+)?"), word => upper(word.text.first()) + lower(word.text.slice(1)))
}

#let to-month-year(datestring) = {
  let dt = to-datetime(datestring)
  let uncapitalized = custom-date-format(dt, "MMM YYYY")
  return title-case(uncapitalized)
}

#let string-to-date(date-string) = {
  let split = date-string.split("-")
  return datetime(year: int(split.at(0)), month: int(split.at(1)), day: int(split.at(2).split(" ").at(0)))
}

#let date-as-array(date) = {
  return (date.year(), date.month(), date.day())
}

#let sort-by-datekey(array, key) = {
  return array.sorted(key: d => date-as-array(string-to-date(d.at(key)))).rev()
}


#set text(size: 10pt)
#show link: set text(blue)
//#show heading: set align(center)
#set list(indent: 3em, spacing: 10pt)

#let cv = yaml("cv.yaml")

#let entry-contains-key(entry, key) = {
  return key in entry.keys()
}

#set page(
  margin: (
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
  ],
)

#let fa(name) = {
  text(font: "Font Awesome 6 Free", size: 10pt, box[ #name ])
}

#align(center)[#text(weight: "bold", size: 2.5em)[François Charih]]

#show heading.where(level: 3): it => [
  #set align(center)
  #it.body
  #v(1em)
]

#show heading.where(level: 2): it => [
  #set align(center)
  #set text(1em, weight: "bold")
  #table(
    columns: 1fr,
    stroke: (left: none, right: none),
    [#it.body]
  )
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
      (
        [
          #text(weight: "bold")[#entry.degree in #entry.discipline] \
          #entry.institution\
          *Thesis:* #entry.thesis \
          #if entry.keys().contains("advisors") [
            #[*Thesis advisor(s):* #entry.advisors.map(advisor => [#link(advisor.split(",").at(1))[#advisor.split(",").at(0)]]).join(", ", last: " and ")]
          ] else [

          ]
        ],
        [
          #to-month-year(entry.start_date) - #to-month-year(entry.end_date) \
          #fa-icon("location-dot") #entry.location \

        ],
      )
    }
  )
}

#let print-employment(contents) = {
  for entry in contents {
    box[
      #table(
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
          #to-month-year(entry.start_date) - #{ if "end_date" in entry [#to-month-year(entry.end_date)] else [present] }\
          #fa-icon("location-dot") #entry.location \

        ],
      )
      #list(..entry.responsibilities.map(d => list.item(d)))
    ]
  }
}

#let format-journal(entry) = {
  [#entry.authors.join(", "). #entry.title (#entry.year). #text(style: "italic")[#entry.publisher]#if entry-contains-key(entry, "volume") [, #entry.volume]#if entry-contains-key(entry, "issue") [(#entry.issue)]#if entry-contains-key(entry, "volume") [.]
    #if entry-contains-key(entry, "status") and entry.status != "Published" [ (#entry.status).]
    #if "url" in entry [ \[#link(entry.url)[Link]\]]
  ]

  [

  ]
}

#let format-conference(entry) = {
  [#entry.authors.join(", "). #entry.title. #text(style: "italic")[#entry.conference], #entry.location, #entry.conference_date.]
  if entry-contains-key(entry, "comment") [ (#entry.comment)]
  if entry-contains-key(entry, "url") [ \[#link(entry.url)[Link]\]]

  [

  ]
}



#let print-journal-papers(publications, first: false) = {
  let journal-entries = publications
  if first [
    \[J#(journal-entries.len())\] #format-journal(journal-entries.at(0))
  ] else [
    #for (i, entry) in journal-entries.enumerate().slice(1) {
      [\[J#(journal-entries.len() - i)\] #format-journal(entry)]
    }
  ]
}

#let print-conference-papers(publications, first: false) = {
  let conference-entries = publications
    .filter(p => p.publication_type == "Conference")
    .sorted(key: p => int(p.conference_date.split(", ").at(1)))
    .rev()
  if first [
    \[C#(conference-entries.len())\] #format-conference(conference-entries.at(0))
  ] else [
    #for (i, entry) in conference-entries.enumerate().slice(1) {
      [\[C#(conference-entries.len() - i)\] #format-conference(entry)]
    }
  ]
}

#let format-other(entry) = {
  [#entry.authors.join(", "). #entry.title. #text(style: "italic")[#entry.publication_type], #entry.publisher#if "location" in entry { [, #entry.location] }, #entry.year.]
  if "comment" in entry [ (#entry.comment)]
  if "url" in entry [ \[#link(entry.url)[Link]\]]

  [

  ]
}

#let print-other(publications, first: false) = {
  let other-entries = publications.filter(p => not ("Journal", "Conference").contains(p.publication_type))
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
      #entry.event #if "url" in entry [ \[#link(entry.url)[Link]\]]\
    ],
    [
      #to-month-year(entry.date)\
      #fa-icon("location-dot") #entry.location \
    ],
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
      #to-month-year(entry.date)\
      #fa-icon("location-dot") #entry.location \

    ],
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
      #text(weight: "bold")[#entry.title], #entry.source #if entry.keys().contains("value") and entry.value != "" [(#entry.value)] \
      #if entry.keys().contains("comment") and entry.comment != "" [#entry.comment]
    ],
    [
      #to-month-year(entry.date)
    ],
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
        #text(weight: "bold")[#entry.student_name], #entry.degree \
        Project: #text(style: "italic")[#entry.project]
      ],
      [
        #to-month-year(entry.start_date) -
        #to-month-year(entry.end_date)
      ],
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
      #entry.organization
    ],
    [
      #to-month-year(entry.start_date) -
      #if "end_date" in entry [#to-month-year(entry.end_date)] else [present]
    ],
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

//Carleton University Biomedical Informatics Collaboratory (cuBIC)\
//Institute of Biochemistry, Carleton University \
NuvoBio \
Health Sciences Building, Room 4302 \
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
      Computational biochemistry \
      Biomedical informatics
    ],
    [
      Applied machine learning \
      High performance computing
    ],
    [
      Cloud computing \
      Peptide therapeutic design
    ],
  )
]
== Education

#print-education(sort-by-datekey(cv.degrees, "start_date"))

#let jobs = sort-by-datekey(cv.job, "start_date")
#box(width: 100%)[
  == Relevant employment experience
  #print-employment(jobs.slice(0, count: 1))
]
#print-employment(jobs.slice(1))


#let journal-papers = sort-by-datekey(
  cv.publicationList.filter(p => p.publication_type == "Journal"),
  "publication_date",
)
#show "F. Charih": name => text(weight: "bold")[F. Charih]
#box(width: 100%)[
  == Publications

  === Peer-reviewed journal articles
  #print-journal-papers(journal-papers, first: true)
]

#print-journal-papers(journal-papers, first: false)

#let conference-papers = sort-by-datekey(
  cv.publicationList.filter(p => p.publication_type == "Conference"),
  "conference_start_date",
).rev()
#box(width: 100%)[
  === Conference proceedings
  #print-conference-papers(conference-papers, first: true)
]

#print-conference-papers(conference-papers, first: false)


#let other = sort-by-datekey(
  cv.publicationList.filter(p => p.publication_type == "Preprint"),
  "publication_date",
)
#box(width: 100%)[
  === Other manuscripts (_e.g._ pre-prints, theses, _etc._)

  #print-other(other, first: true)
]

#print-other(other, first: false)


#let presentations = sort-by-datekey(cv.presentationList, "date")
#box(width: 100%)[
  == Presentations and workshops

  #print-presentations(presentations, first: true)
]
#print-presentations(presentations, first: false)

#let posters = sort-by-datekey(cv.posterList, "date")

#box(width: 100%)[
  == Selected posters
  #print-posters(posters, first: true)
]

#print-posters(posters, first: false)

#let awards = sort-by-datekey(cv.awardList, "date")

#box(width: 100%)[
  == Awards and honours
  #print-awards(awards, first: true)
]

#print-awards(awards)

#let mentoring = sort-by-datekey(cv.mentoringList, "start_date")
#box(width: 100%)[
  == Research mentoring
  I have had the great pleasure to mentor the following students:
]

#print-mentees(mentoring)

#box(width: 100%)[
  == Peer reviews

  I have reviewed submissions for the following peer-reviewed journals or conferences:
]

#for (k, v) in count-entries(cv.peerReviewList).pairs() [
  - #k (#v) // (#p.count review#if p.count > 1 [s])
]

#let communityWork = sort-by-datekey(cv.communityActivities, "start_date")
#box(width: 100%)[
  == Other relevant roles
  #print-involvement(communityWork, first: true)
]

#print-involvement(communityWork)

#box(width: 100%)[
  == Languages

  *Natural languages:* French (native), English (full professional proficiency), Moroccan Arabic (elementary proficiency)

  *Programming languages:* Python, Rust, C/C++, JavaScript, Java, HTML/CSS
]
