#let h1-dove(dx: 0pt, dy: -4pt, width: 6fr, body) = {
  let dove = scale(x: -100%)[#image("/asset/dove-of-peace.svg", width: 39pt)]
  grid(columns: (1fr, width))[#move(dx: dx, dy: dy, dove)][= #body]
  v(-2mm)
}

#let h1-emoji(x: 0pt, dy: -7pt, size: 20pt, emoji, body) = {
  // workaround noto-emoji position bugs -- see typst issue #5242
  show emoji: text.with(size: size)
  place(left, dx: x, dy: dy, scale(x: -100%, emoji))
  place(right, dx: -x, dy: dy, emoji)
  [= #body]
}

#let h2-emoji(dx: 0mm, dy: 0mm, scale-x: 100%, size: 30pt, width: 4fr, emoji, body) = {
  show emoji: text.with(size: size)
  show emoji: scale.with(x: scale-x)
  grid(columns: (1fr, width))[#place(dx: dx, dy: dy, emoji)][== #body]
}

#let image-heading(dx: 0pt, dy: 0pt, body-width: 5fr, image-width: 25pt, image-scale-x: 100%, url, body) = {
  let img = scale(x: image-scale-x)[#image(url, width: image-width)]
  grid(columns: (1fr, body-width))[#move(dx: dx, dy: dy, img)][#body]
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
  show emoji.skull.bones: text.with(font: "Noto Color Emoji") // fix
  body
}
