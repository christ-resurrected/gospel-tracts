#import "lib/page.typ": set-page, set-style
#import "lib/qr.typ": qr-footer
#import "lib/theme.typ": cmyk-red, set-theme
#import "lib/scripture.typ": see, seeAlso, verse
#import emoji: fire, skull

#show: set-page.with(bleed: 3mm, safe: 4mm, height: 148.5mm, width: 105mm)
#show: set-style.with(text-size: 11pt)
#show heading.where(level: 1): text.with(17pt)

// #show: page-theme.with(id: "dark") - BUG #420: this overrides show<refs> in #show page-theme.with(id: "light")
#set-theme("dark")[
  #show fire: text.with(size: 20pt)
  #show skull.bones: text.with(font: "Noto Color Emoji", size: 20pt)
  #grid(
    align: (left, center + horizon, right),
    columns: (auto, 1fr, auto),
    rows: 29pt,
    [#fire#skull.bones], [= WARNING! DANGER!], [#skull.bones#fire],
  ) #v(-2mm)
  Our Lord Jesus Christ and His apostles explicitly warn us of the coming eternal judgement and the danger of living in sin:

  #verse[Mark 9:43-44 NKJV][#quote[If your hand causes you to *sin*, cut it off. It is better for you to enter into life maimed, rather than having two hands, to go to hell, into the fire that shall never be quenched -- where #quote[_Their worm does not die And the fire is not quenched._]]]
  #seeAlso[Matt.5:27-30, 13:47-50, 25:41-46; Luke 12:4-5, 16:22-24].


  #verse[Revelation 21:8][#quote[But the *cowardly*, *unbelieving*, *abominable*, *murderers*, *sexually immoral*, *sorcerers*, *idolaters*, and all *liars* shall have their part in the lake which burns with fire and *brimstone*, which is the second death.]] #seeAlso[Galatians 5:19-21; Ephesians 5:5-6; Col.3:5-9; 2-Thes.1:7-9; Heb. 9:27, 10:31; Rev.14:10-11, 20:12-15].

  #verse[1-Corinthians 6:10][nor *thieves*, nor *covetous*, nor *drunkards*, nor *revilers*, nor *extortioners* will inherit the kingdom of God.]
]

#set-theme("light")[
  #show heading: par.with(leading: 0.5em)
  #let dove = scale(x: -100%)[#text(size: 37pt, emoji.dove)]
  #grid(columns: 2)[#move(dx: -10pt, dy: -8pt, dove)][= REPENT, FOR THE KINGDOM OF HEAVEN IS AT HAND!]
  Jesus came to free us from sin, to open our eyes and turn us from darkness to light, and from the power of Satan to God #see[Acts 26:18], to transform us into children of God who *practice righteousness*.

  Just as Jesus humbled Himself in *obedience* even to the point of death on a cross, was buried, and rose on the third day, we must also follow His example and take up our own cross, humble ourselves and turn away from our sins in true *repentance*, bury the old life of sin in baptism, and be raised to a new life by receiving the Holy Spirit #see[John 3:3-7; Acts 2:38, 3:19, 5:32, 8:15-17].

  With our sins forgiven, we enter into a supernatural relationship with God, walking humbly with Him and *keeping* His commandments to the very end #see[Matthew 24:13; Gal.2:20, 5:22-25; Titus 2:11-14; Heb. 5:9].
  This is eternal life #see[John 17:3].

  #qr-footer(text-col-width: 70%)
]
