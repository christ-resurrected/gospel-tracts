#let cmyk-black = cmyk(30%, 30%, 30%, 100%) // mixam recommended setting for rich black
#let cmyk-fire = cmyk(00%, 00%, 50%, 00%)
#let cmyk-red = cmyk(00%, 100%, 100%, 00%)
#let cmyk-white = cmyk(00%, 00%, 00%, 00%)

#let themes = (
  dark: (
    bg: cmyk-black,
    fg: cmyk-white,
    h1: cmyk-red,
    ref: cmyk(30%, 00%, 00%, 00%),
    ref-hl: cmyk(99%, 00%, 00%, 80%),
    strong: cmyk-white,
    verse: cmyk(00%, 00%, 10%, 00%),
    verse-extent: 0mm, // typst bug #2939 manifests if > 0
    verse-jesus: cmyk-red,
    verse-hl: cmyk(00%, 95%, 95%, 63%),
    verse-strong: cmyk(00%, 40%, 80%, 00%),
  ),
  light: (
    bg: cmyk-white,
    fg: cmyk-black,
    h1: cmyk-black,
    ref: cmyk(99%, 30%, 00%, 70%),
    ref-hl: cmyk(00%, 00%, 70%, 00%),
    strong: cmyk(99%, 00%, 99%, 30%),
    verse: cmyk-black,
    verse-extent: 1mm,
    verse-jesus: cmyk-red,
    verse-hl: cmyk(00%, 00%, 00%, 15%),
    verse-strong: cmyk(90%, 00%, 00%, 50%),
  ),
)

#let set-theme(new-page: true, set-text: true, id, body) = {
  let theme = themes.at(id)
  let fire-text = it => strong(text(fill: cmyk-fire, stroke: 0.3pt + cmyk-white, it))
  set page(fill: theme.bg) if new-page
  set text(fill: theme.fg) if set-text
  show <refs>: it => {
    set highlight(fill: theme.ref-hl) if set-text
    set text(theme.ref) if set-text
    it
  }
  show <verse>: it => {
    set highlight(extent: theme.verse-extent, fill: theme.verse-hl) if set-text
    set text(theme.verse, style: "italic") if set-text
    show strong: set text(theme.verse-strong) if set-text
    show <jesus>: set text(theme.verse-jesus) if set-text
    it
  }
  show heading.where(level: 1): set text(theme.h1) if set-text
  show strong: set text(theme.strong) if set-text
  show regex("brimstone|burns|fire|hell|worm|wrath "): fire-text
  body
}
