#let emoji-heading(dx: 0mm, dy: 0mm, hd-w: 4fr, level: 1, size: 40pt, emoji, body) = {
  show emoji: text.with(size: size)
  grid(
    columns: (1fr, hd-w),
    place(dx: dx, dy: dy, emoji), heading(level: level, par(justify: false, leading: 0.5em, body)),
  )
}

#let image-heading(dx: 0pt, dy: 0pt, hd-w: 5fr, img-w: 25pt, img-x: +1, leading:0.5em, level: 1, img-name, body) = {
  let img = scale(x: img-x * 100%)[#image("/asset/" + img-name + ".svg", width: img-w)]
  grid(
    columns: (1fr, hd-w),
    move(dx: dx, dy: dy, img), heading(level: level, par(leading: leading, body)),
  )
}

#let twin-emoji-heading(dx: 0pt, dy: -7pt, size: 20pt, emoji, body) = {
  // workaround noto-emoji position bugs -- see typst issue #5242
  show emoji: text.with(size: size)
  place(left, dx: dx, dy: dy, scale(x: -100%, emoji))
  place(right, dx: -dx, dy: dy, emoji)
  heading(body)
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
