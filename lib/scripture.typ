// refs with books delimited by ; e.g. [Matthew 5:27-30, 13:47-50, 25:41-46; Luke 12:4-5]
#let references(refs) = {
  // replace verse range e.g. Mark 9:43-44 with long dash, but not book e.g. 1-Cor
  let rx = regex("-(\d)")
  show rx: it => sym.dash.em + it.text.match(rx).captures.at(0)

  // highlight each book separately
  let to-string(content) = {
    if content.has("text") {
      content.text
    } else {
      content.children.map(to-string).join("")
    }
  }
  let books = to-string(refs).split(";")

  context {
    // set top-edge to workaround typst issue #2231. Also setting extent has issue #2939.
    // for some reason setting <refs> label here does not work for a single item, so caller must set it
    books.map(b => [#highlight(top-edge: text.size - 1pt, b.trim())]).join(" ")
  }
}

#let see(ref, extra: none) = {
  [(see#extra #references(ref)<refs>)]
}

#let seeAlso(ref) = {
  see(ref, extra: " also")
}

#let verse(ref, body) = {
  context {
    set highlight(bottom-edge: -4pt, top-edge: text.size + 2pt, extent: 4pt, radius: 3pt)
    [#("" + highlight(body))<verse>] // without adding "" the theme <verse> highlight show rule does not work
  }
  [ -- #references(ref)<refs>]
}
