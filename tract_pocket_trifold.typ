#import "lib/page.typ": h1-emoji, set-page, set-style
#import "lib/qr.typ": qr-footer
#import "lib/scripture.typ": see, seeAlso, verse
#import "lib/theme.typ": set-theme
#import emoji: faith, fire, megaphone, seedling, skull

#let flap-width = 71mm
#let roll-fold-extra-width = 1.25mm // so flap can fold inside 'roll fold' aka 'C-fold' (NOT 'Z-fold')
#let back-width = flap-width + roll-fold-extra-width
#let front-width = back-width
#let (bleed, safe) = (3mm, 3mm)

#set text(overhang: false)
#show: set-page.with(bleed: bleed, height: 140mm, width: front-width + back-width + flap-width)
#show: set-style.with(text-size: 10pt)

#let vline-separator(x) = {
  place(
    float: false,
    line(
      stroke: (paint: cmyk(0%, 0%, 0%, 70%), dash: "loosely-dotted"),
      start: (x, safe),
      angle: 90deg,
      length: 100% - safe,
    ),
  )
}

#let panel = box.with(height: 100%, inset: safe)

#let trifold-exterior(flap, back, front) = {
  show heading.where(level: 1): align.with(center)
  show heading.where(level: 1): text.with(19pt)
  show: set-theme.with("dark")
  vline-separator(flap-width)
  vline-separator(flap-width + back-width)
  grid(
    columns: (flap-width, back-width, front-width),
    panel(flap), panel(back), panel(front),
  )
}

#let trifold-interior(front-back, flap) = {
  show heading.where(level: 1): align.with(center)
  show heading.where(level: 1): text.with(17pt)
  show heading: par.with(leading: 0.5em)
  show: set-theme.with("light")
  vline-separator(front-width)
  vline-separator(front-width + back-width)
  grid(
    columns: (front-width + back-width, flap-width),
    panel(columns(2, gutter: safe + safe, front-back)), panel(flap),
  )
}

#let h2-emoji(dx: 0mm, dy: 0mm, scale-x: 100%, size: 30pt, width: 4fr, emoji, body) = {
  show emoji: text.with(size: size)
  show emoji: scale.with(x: scale-x)
  grid(columns: (1fr, width))[#place(dx: dx, dy: dy, emoji)][== #body]
}

#trifold-exterior(
  [
    #h1-emoji(fire)[DANGER!]
    Jesus says #verse[Mark 9:43-44][#quote[If your hand causes you to *sin*, cut it off. It is better for you to enter into life maimed, rather than having two hands, to go to hell, into the fire that shall never be quenched -- where #quote[_Their worm does not die And the fire is not quenched._]]]

    #verse[Mark 7:21-22][#quote[For from within, out of the heart of men, proceed *evil thoughts*, *adulteries*, *fornications*, *murders*, *thefts*, *covetousness*, *wickedness*, *deceit*, *lewdness*, an *evil eye*, *blasphemy*, *pride*, *foolishness*.]]
    #seeAlso[Mat. 5:27-30, 7:21-23, 13:40-42,47-50, 24:50-51; Luke 13:1-5, 16:22-24; John 5:26-29, 12:31, 15:6].

    #verse[Matthew 10:28][#quote[And do not fear those who kill the body but cannot kill the soul. But rather fear Him who is able to destroy both soul and body in hell.]]
  ],
  [
    #show skull.bones: text.with(font: "Noto Color Emoji") // fix
    #h1-emoji(skull.bones)[WARNING!]
    The apostle Paul warns:
    #verse[Galatians 5:19-21][Now the works of the flesh are evident, which are: *adultery*, *fornication*, *uncleanness*, *lewdness*, *idolatry*, *sorcery*, *hatred*, *contentions*, *jealousies*, *outbursts of wrath*, *selfish ambitions*, *dissensions*, *heresies*, *envy*, *murders*, *drunkenness*, *revelries*, and *the like*; ...... that those who practice *such things* will NOT inherit the kingdom of God.]

    #verse[1-Corinthians 6:10][nor *thieves*, nor *covetous*, nor *drunkards*, nor *revilers*, nor *extortioners* will inherit the kingdom of God.] #seeAlso[verse 9; Rom. 1:18, 1:28-32, 2:3-9; Eph.5:5-6; Col.3:5-9; 1-Tim.6:9-10; 2-Tim.3:1-5].

    #verse[Col. 3:6][Because of these things the wrath of God is coming upon the sons of disobedience]
    #seeAlso[Mat. 22:13; Acts 3:23; 2-Cor.5:10-11; 2-Thes.1:7-10].
  ],
  [
    #h1-emoji(megaphone)[ALERT!]
    == JESUS WILL RETURN TO JUDGE THE WORLD IN RIGHTEOUSNESS #v(1mm)
    Jesus will come back to give to us all according to what we did. Those who follow Jesus and do the will of His Father will be\ welcomed into His eternal kingdom. But those who continue to do evil will face God’s punishment.\
    #see[Acts 17:31; Mat.25:41,46]

    #verse[Hebrews 9:27 NKJV][And as it is appointed for men to die once, but after this the judgement]
    #seeAlso[Heb. 4:13, 10:26-31]

    #verse[Revelation 21:8][#quote[But the *cowardly*, *unbelieving*, *abominable*, *murderers*, *sexually immoral*, *sorcerers*, *idolaters*, and all *liars* shall have their part in the lake which burns with fire and *brimstone*, which is the second death.]]
    #seeAlso[Rev. 14:10-11, 20:10-15, 22:15; 2-Peter 3:7,10-12; Jude 1:6-7, 13; Mal.4:1; Isaiah 33:14].
  ],
)

#trifold-interior(
  [
    #h1-emoji(dy: 2mm, size: 25pt, sym.tilde)[THE GOSPEL OF \ JESUS CHRIST]
    #verse[Matthew 4:17][From that time Jesus began to preach and to say, *#quote[Repent, for the kingdom of heaven is at hand.]*]

    The kingdom of God was opened to us when Jesus came. He is King of kings and Lord of lords, the Son of God, the Saviour, and the One who will judge the world. Jesus is the One we must *obey* if we want to be a part of the eternal kingdom we were created for.
    #see[Mat. 24:14; Mark 1:14-15, 9:47; Luke 4:43; John 3:3-5]

    #h2-emoji(
      dx: -1mm,
      dy: -2mm,
      size: 40pt,
      width: 6fr,
      faith.christ,
    )[JESUS DIED AND ROSE FROM THE GRAVE]
    #v(-1mm) Jesus was crucified lawlessly but God raised Him from the dead and seated Him at His right hand, proving Jesus is the Son of God.
    Jesus gave His life as a ransom, to open our eyes, to turn us back to God, to free us from our selfish ways.
    This He suffered, hoping we would listen to Him and be changed into righteous people who *love* God and *do* His will.
    #see[Matthew 12:39-40; Mrk.10:45, 12:29-31; John 12:32; Acts 26:18]

    #h2-emoji(dx: -0mm, dy: -2mm, size: 25pt, scale-x: 100%, seedling)[FORGIVENESS AND NEW LIFE OFFERED TO ALL]
    #verse[John 14:6][Jesus said to him, *#quote[I am the way, the truth, and the life. No one comes to the Father except through Me.]*]

    All who trust Jesus and *humbly submit* to His authority are forgiven by God. They are released from captivity to sin and receive the Holy Spirit, empowered for a new life. This is a gift of God’s grace, but is not something we can abuse. Scripture urges Christians to remain in the grace of God and warns them not to receive it in vain.
    #see[Acts 5:32, 10:43, 13:38-39; Rom.11:22; 2-Cor.5:17, 6:1; Eph.2:8-10; Tit.2:11-14; Jude 1:4]
  ],
  [
    #h2-emoji(dx: -0mm, dy: -2mm, size: 25pt, width: 5fr, emoji.quest)[HOW MUST WE RESPOND \ TO THIS GOOD NEWS?]
    #verse[Acts 2:38][Then Peter said to them,\ *#quote[Repent, and let every one of you be baptized in the name of Jesus Christ for the remission of sins; and you shall receive the gift of the Holy Spirit.]*] #seeAlso[Acts 3:19].

    Being a Christian means a *full surrender* of your whole life to Jesus as your Lord and King. If you are ready for that commitment, you must *repent* and be baptized in His name. Then you must learn to *obey* all He taught and commanded, take up your cross, and follow Him to the very end. God will help you if you are *willing* and *obedient*
    #see[Mat. 10:37-39, 24:13; Luke 9:23-25, 14:26-33; John 14:21, 15:1-10; Acts 14:22; Php. 3:12-14; 2-Peter 1:3-11; 1-John 2:3-6, 3:3-10].

    #qr-footer(size: 10mm, text-col-width: 50%)
  ],
)
