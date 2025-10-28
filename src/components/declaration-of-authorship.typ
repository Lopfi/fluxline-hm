#let declaration-of-authorship(
  author: "",
  title: "",
  place: "Munich",
  submission-date: datetime.today(),
  signature: none,
) = {
  [
  = Declaration of Authorship
  I, #{author}, declare that this thesis titled, “#{title}” and
  the work presented in it are my own. I confirm that:

  - This work was done wholly or mainly while in candidature for a research degree at this University.
  - Where any part of this thesis has previously been submitted for a degree or any other qualification at this University or any other institution, this has been clearly stated.
  - Where I have consulted the published work of others, this is always clearly attributed.
  - Where I have quoted from the work of others, the source is always given. With the exception of such quotations, this thesis is entirely my own work.
  - I have acknowledged all main sources of help.
  - Where the thesis is based on work done by myself jointly with others, I have made clear exactly what was done by others and what I have contributed myself.

  \ #{place}, the #{submission-date.display()}
  ]

  align(left, signature)
  pagebreak()
}