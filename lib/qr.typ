#import "@preview/rustycure:0.1.0": qr-code

#let qr-footer(size: 11mm, padding-bottom: 0pt, text-col-width: 100%) = {
  let domain = "me2Christ.com"
  let qr-size = size
  set par(justify: false, leading: 0.5em)
  place(
    bottom + right,
    grid(
      columns: (text-col-width, qr-size), gutter: 5mm
    )[
      #pad(bottom: padding-bottom)[Please visit *#text(black)[#domain]*]
    ][
      #qr-code("https://" + domain, quiet-zone: false)
    ],
  )
}
