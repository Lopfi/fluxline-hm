#import "../src/fluxline-hm.typ": thesis

#import "components/acknowledgements.typ": acknowledgements
#import "components/abstract.typ": abstract
#import "components/abbreviations.typ": abbreviations-list
#import "components/glossar.typ": glossar-list
#import "components/revisions.typ": revisions

#show: thesis.with(
  title: lorem(10),
  subtitle: lorem(12),
  author: "Erika Mustermann",
  submission-date: datetime.today(),
  student-id: 12345678,
  supervisors: "Prof. Dr. Max Mustermann",
  examiner: "Dr. John Doe",
  semester: "WiSe 2025/26",
  faculty: "Faculty of Applied Natural Sciences and Mechatronics",
  birth-date: datetime(year: 2000, day: 1, month: 1),
  abstract: none,
  bib: bibliography("bibliography.yml", title: "Bibliography", style: "ieee"),
  glossar-list: glossar-list,
  abbreviations-list: abbreviations-list,
  acknowledgements: acknowledgements,
  revisions: revisions,
  signature: image("signature.png", width: 30%)
)

#include "chapters/1_Lorem/index.typ"
#include "chapters/2_Ipsum/index.typ"
