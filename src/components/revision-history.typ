#let revision-history(
  author: none,
  revisions: none
) = {

[
  = Revision History
  #table(
    stroke: none,
    columns: 4,
    table.header(
      [*Revision*], [*Date*], [*Author(s)*], [*Description*],
    ),
    ..(
      for revision in revisions {
        (
        [#revision.version],
        [#revision.date.display()],
        [#author],
        [#revision.description],
        )
      }
    )
  )
]
  pagebreak()
}

