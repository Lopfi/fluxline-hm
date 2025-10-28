#let render-title-table(entries) = {
  align(
    center,
    grid(
      columns: 2,
      gutter: 1em,
      align: left,
      ..for (term, desc) in entries {
        ([*#term:*], desc)
      }
    )
  )
}

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
    lang: "en"
  )

  set par(leading: 0.5em)

  
  // --- Title Page ---
  v(1cm)
  align(center, image("../media/university_logo.png", width: 26%))

  v(5mm)
  align(center, text(2em, weight: 700, "University of Applied Sciences Munich"))

  v(5mm)
  align(center, text(1.5em, weight: 100, faculty))
  
  v(15mm)

  align(center, text(1.3em, weight: 100, "Bachelor's Thesis in " + program))
  v(8mm)
  

  align(center, text(2em, weight: 700, title))
  
  let entries = ()
  entries.push(("Author", author))
  entries.push(("Examiner", examiner))
  entries.push(("Supervisors", supervisors))
  entries.push(("Start Date", start-date.display("[day].[month].[year]")))
  entries.push(("Submission Date", submission-date.display("[day].[month].[year]")))

  v(5cm)
  render-title-table(entries)



  pagebreak()

}