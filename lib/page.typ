#let svg-heading(
  dx: 0pt,
  dy: 0pt,
  hd-w: 5fr,
  img-w: 25pt,
  img-scale-x: +1,
  img-scale-y: +1,
  leading: 0.5em,
  level: 1,
  img-name,
  body,
) = {
  let img = scale(x: img-scale-x * 100%, y: img-scale-y * 100%)[#image("/asset/" + img-name + ".svg", width: img-w)]
  grid(
    columns: (1fr, hd-w),
    move(dx: dx, dy: dy, img), heading(level: level, par(leading: leading, body)),
  )
}

#let svg-heading-x2(dx: 0pt, dy: -3pt, img-gap: 0.5em, size: 20pt, imgids, body) = {
  let imgs = imgids.map(id => [#image("/asset/" + id + ".svg", width: size)])
  for (i, img) in imgs.enumerate() {
    place(left, dx: dx + i * (size + img-gap), dy: dy, scale(x: -100%, img))
    place(right, dx: -dx - i * (size + img-gap), dy: dy, img)
  }
  heading(body)
}

#let set-page(bleed: 3mm, safe: 3mm, height: none, width: none, body) = {
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
