#import "utils.typ": *

#let thesis(
  title: none,
  subtitle: none,
  author: none,
  student-id: none,
  birth-date: none,
  faculty: "",
  semester: "",
  examiner: none,
  supervisors: none,
  submission-date: none,
  start-date: none,
  abstract: none,
  acknowledgements: none,
  bib: none,
  glossar-list: none,
  abbreviations-list: none,
  revisions: none,
  signature: none,
  appendix: none,
  body,
) = {

  show: make-glossary
  register-glossary(abbreviations-list)
  register-glossary(glossar-list)

  // Set the document's basic properties.
  set document(author: author, title: title)
  set page("a4")
  set par(justify: true)
  set text(font: "Liberation Sans", lang: "en", size: 12pt, hyphenate: false) // replaced this font: New Computer Modern
  show math.equation: set text(font: "Liberation Sans", weight: 400)

  show heading: it => titlecase(it)
  show heading.where(
    level: 1
  ): it => pad(bottom: 1em)[
    #set text(2em)
    #it
  ]

  show heading.where(
    level: 2
  ): it => pad(bottom: 0.4em, top: 0.4em)[
    #set text(1.3em)
    #it
  ]

  show heading.where(
    level: 3
  ): it => pad(bottom: 0.4em, top: 0.4em)[
    #set text(1.25em)
    #it
  ]

  show heading.where(
    level: 9
  ): it => pad(rest: 0em, bottom: -1.45em)[
    #it
  ]

  show heading.where(level: 1): set heading(supplement: [Chapter])

  show heading.where(level: 2): set heading(supplement: [Section])

  show heading.where(level: 3): set heading(supplement: [Subsection])

  show heading.where(level: 9): set heading(supplement: [])

  set table(
    fill: (x, y) =>
      if y == 0 {
        gray.lighten(40%)
      },
    align: left,
  )

  show table.cell.where(y: 0): strong

  show figure.where(kind: "code"): it => {
    if "label" in it.fields() {
      state("codly-label").update((_) => it.label)
      it
      state("codly-label").update((_) => none)
    } else {
      it
    }
  }

  show: codly-init.with()
  show figure: set block(breakable: true)
  codly(
    breakable: false,
    reference-sep: ", Row ",
    languages: codly-languages
  )

  show outline.entry.where(
    level: 1
  ): it => {
    if(it.element.has("level")) {
      v(2em, weak: true)
      strong(it)
    } else {
      v(1.2em, weak: true)
      it
    }
  }

  import "components/titlepage.typ": titlepage

  titlepage(
    title: title,
    subtitle: subtitle,
    author: author,
    faculty: faculty,
    supervisors: supervisors,
    examiner: examiner,
    start-date: start-date,
    submission-date: submission-date,
  )

  set page(numbering: "I", footer: context {
    set text(size: 10pt)
    align(center, counter(page).display()) // Automatically uses page.numbering
  })

  import "components/declaration-of-authorship.typ": declaration-of-authorship

  declaration-of-authorship(
    author: author,
    title: title,
    place: "Munich",
    submission-date:submission-date,
    signature: signature
  )

  if revisions != none {
    import "components/revision-history.typ": revision-history

    revision-history(
      author: author,
      revisions: revisions
    )
  }

  if abstract != none {
    abstract()
  }

  acknowledgements()

  outline(depth: 3, indent: auto)
  pagebreak()

  [= List of Figures]
  outline(title: none, target: figure.where(kind: image))
  pagebreak()

  [= List of Tables]
  outline(title: none, target: figure.where(kind: table))
  pagebreak()


  [= List of Program Codes]
  outline(title: none, target: figure.where(kind: "code"))
  pagebreak()

  [= List of Abbreviations]
  let print-page-number(entry, deduplicate: false) = {
    return ""
  }
  print-glossary(abbreviations-list, user-print-back-references: print-page-number)
  pagebreak()

  [= Glossary]
  print-glossary(glossar-list, user-print-back-references: print-page-number)
  pagebreak()

  set page(
    numbering: "1",
    number-align: center,
    footer: context {
      line(length: 100%, stroke: 0.045em)
      align(center, counter(page).display(page.numbering))
    },
  )
  counter(page).update(1)
  set heading(
    numbering: "1.1."
  )

  body

  pagebreak()

  set page(
    numbering: "I",
    number-align: center,
    footer: context {
      line(length: 100%, stroke: 0.045em)
      align(center, counter(page).display(page.numbering))
    },
  )
  counter(page).update(1)

  counter(heading).update(0)
  set heading(numbering: "A")

  if appendix != none {
    appendix()
  }

  if bib != none {
    pagebreak()

    bib
  }

}
