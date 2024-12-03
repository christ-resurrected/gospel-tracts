#let emoji-heading(dx: 0mm, dy: 0mm, hd-w: 4fr, size: 40pt, emoji, heading) = {
  show emoji: text.with(size: size)
  grid(columns: (1fr, hd-w))[#place(dx: dx, dy: dy, emoji)][#heading]
}

#let image-heading(dx: 0pt, dy: 0pt, hd-w: 5fr, img-w: 25pt, img-x: +1, img-name, heading) = {
  let img = scale(x: img-x * 100%)[#image("/asset/" + img-name + ".svg", width: img-w)]
  grid(columns: (1fr, hd-w))[#move(dx: dx, dy: dy, img)][#heading]
}

#let twin-emoji-heading(x: 0pt, dy: -7pt, size: 20pt, emoji, heading) = {
  // workaround noto-emoji position bugs -- see typst issue #5242
  show emoji: text.with(size: size)
  place(left, dx: x, dy: dy, scale(x: -100%, emoji))
  place(right, dx: -x, dy: dy, emoji)
  [= #heading]
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
