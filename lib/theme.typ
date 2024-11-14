#let cmyk-black = cmyk(30%, 30%, 30%, 100%) // mixam recommended setting for rich black
#let cmyk-fire = cmyk(00%, 20%, 30%, 00%)
#let cmyk-red = cmyk(00%, 100%, 100%, 00%)
#let cmyk-red-blood = cmyk(00%, 95%, 95%, 53%)
#let cmyk-white = cmyk(00%, 00%, 00%, 00%)

#let themes = (
  dark: (
    bg: cmyk-black,
    fg: cmyk-white,
    h1: cmyk-red,
    ref: cmyk(30%, 00%, 00%, 00%),
    ref-hi: cmyk(99%, 00%, 00%, 80%),
    strong: cmyk-white,
    verse: cmyk(00%, 80%, 75%, 00%),
    verse-hi: none,
    verse-strong: cmyk(00%, 50%, 90%, 00%),
  ),
  light: (
    bg: cmyk-white,
    fg: cmyk-black,
    h1: cmyk-black,
    ref: cmyk(99%, 30%, 00%, 70%),
    ref-hi: cmyk(00%, 00%, 70%, 00%),
    strong: cmyk(99%, 00%, 99%, 30%),
    verse: cmyk-white,
    verse-hi: cmyk-red-blood,
    verse-strong: cmyk-white,
  ),
)

#let set-theme(new-page: true, set-text: true, id, body) = {
  let theme = themes.at(id)
  let fire-text = it => strong(text(fill: cmyk-fire, stroke: 0.1pt + cmyk-red, it))
  set page(fill: theme.bg) if new-page
  set text(fill: theme.fg) if set-text
  show <refs>: it => {
    set highlight(fill: theme.ref-hi) if set-text
    set text(theme.ref) if set-text
    it
  }
  show <verse>: it => {
    set highlight(fill: theme.verse-hi) if set-text
    set text(theme.verse) if set-text
    show strong: set text(theme.verse-strong) if set-text
    it
  }
  show heading.where(level: 1): set text(theme.h1) if set-text
  show strong: set text(theme.strong) if set-text
  show regex("brimstone|burns|fire|hell|worm|wrath "): fire-text
  body
}
