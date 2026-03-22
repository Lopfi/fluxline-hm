#let titlepage(
  author: "Max Mustermann",
  title: "My Thesis Title",
  subtitle: "Awesome Subtitle",
  faculty: "Faculty of Applied Natural Sciences and Mechatronics",
  program: "Mechatronics",
  examiner: "Prof. Dr. Erika Mustermann",
  supervisors: "Dr. John Doe",
  start-date: datetime(year: 2023, month: 10, day: 1),
  submission-date: datetime.today(),
) = {

  set page(
    margin: (left: 20mm, right: 20mm, top: 30mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )

  set text(
    size: 12pt,
    lang: "en",
  )

  set par(leading: 0.5em)

  // --- Title Page ---
  v(1cm)
  align(center, image("../media/university_logo.png", width: 40%))

  v(8mm)
  align(center, text(1em, tracking: 0.15em, smallcaps[Bachelor Thesis]))

  v(4mm)
  line(length: 100%, stroke: 0.5pt)
  v(4mm)

  align(center, text(1.6em, weight: 700, title))

  v(4mm)
  line(length: 100%, stroke: 0.5pt)

  v(8mm)
  align(center, text(1.1em, smallcaps(author)))

  v(2fr)

  // Supervisor / Examiner table
  align(
    center,
    grid(
      columns: (auto, auto),
      column-gutter: 2em,
      row-gutter: 0.6em,
      align: (left, left),
      [_Supervisor:_], supervisors,
      [],[],
      [_First Examiner:_], examiner,
      [_Second Examiner:_], "Prof. Dr. Georg Eggers",
    ),
  )

  v(2fr)

  align(center)[
    _A thesis submitted in fulfillment of the requirements_ \
    _for the degree of Bachelor of Science_

    #v(3mm)
    _in_
    #v(3mm)

    _#program _

    #v(3mm)
    #text(fill: rgb("#c0392b"))[#faculty] \
    #text(fill: rgb("#c0392b"))[Munich University of Applied Sciences]
  ]

  v(2fr)

  align(center, submission-date.display("[month repr:long] [day], [year]"))

  v(5mm)

  pagebreak()

}