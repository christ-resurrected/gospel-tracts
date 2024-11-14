#import "@preview/cades:0.3.0": qr-code

#let qr-footer(size: 11mm, text-col-width: 100%) = {
  let domain = "me2christ.com"
  let qr-size = size
  set par(justify: false, leading: 0.5em)
  place(
    bottom + right,
    grid(
      columns: (text-col-width, qr-size), gutter: 5mm)[
      Please visit *#text(black)[#domain]*
    ][
      #qr-code("https://" + domain, width: qr-size)
    ],
  )
}
