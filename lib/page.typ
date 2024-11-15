#let h1-emoji(x: 0pt, dy: -7pt, size: 20pt, emoji, body) = {
  // workaround noto-emoji position bugs -- see typst issue #5242
  show emoji: text.with(size: size)
  place(left, dx: x, dy: dy, scale(x: -100%, emoji))
  place(right, dx: -x, dy: dy, emoji)
  [= #body]
}

#let set-page(bleed: 0mm, safe: 0mm, height: none, width: none, body) = {
  set page(
    margin: (safe + bleed),
    height: (height + 2 * bleed),
    width: (width + 2 * bleed),
  )
  body
}

#let set-style(text-size: none, body) = {
  set par(justify: true)
  set text(font: "DejaVu Sans Mono", size: text-size)
  body
}
