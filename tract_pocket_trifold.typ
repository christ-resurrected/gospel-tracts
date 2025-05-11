#import "lib/page.typ": *
#import "lib/qr.typ": qr-footer
#import "lib/scripture.typ": see, seeAlso, verse
#import "lib/theme.typ": set-theme
#import emoji: faith, fire, megaphone, quest, seedling, skull

// INSTANTPRINT "Third A5 Portrait C-fold"
#let (bleed, safe) = (3mm, 3mm)
#let flap-width = 68mm
#let back-width = 70mm
#let front-width = 72mm
#let final-height = 140mm // height of finished tract after trimming, for better form factor
#let print-height = 148mm // printed height of tract before manual trim

#set box(height: final-height, inset: safe) // each of the 6 panels has its own safe area
#show: set-page.with(bleed: bleed, safe: 0mm, height: print-height, width: front-width + back-width + flap-width)
#show: set-style.with(text-size: 10pt)
#set text(overhang: false)

// guide line for manual trim
#let trim-guideline() = {
  place(
    line(
      length: 100%,
      start: (0mm, final-height + 1mm),
      stroke: (paint: cmyk(0%, 0%, 0%, 70%), dash: "loosely-dotted"),
    ),
  )
}

#let vline-separator(x) = {
  place(
    line(
      angle: 90deg,
      length: final-height,
      start: (x, 0mm),
      stroke: (paint: cmyk(0%, 0%, 0%, 70%), dash: "loosely-dotted"),
    ),
  )
}

#let trifold-exterior(flap, back, front) = {
  show heading.where(level: 1): align.with(center)
  show heading.where(level: 1): text.with(19pt)
  show: set-theme.with("dark")
  trim-guideline()
  vline-separator(flap-width)
  vline-separator(flap-width + back-width)
  grid(
    columns: (flap-width, back-width, front-width),
    box(flap), box(back), box(front),
  )
}

#let trifold-interior(front, back, flap) = {
  show heading.where(level: 1): text.with(17pt)
  show: set-theme.with("light")
  trim-guideline()
  vline-separator(front-width)
  vline-separator(front-width + back-width)
  grid(
    columns: (front-width, back-width, flap-width),
    box(front), box(back), box(flap),
  )
}

#trifold-exterior(
  [
    #twin-emoji-heading(fire)[= DANGER!]
    Jesus says #verse[Mark 9:43-44][#quote[If your hand causes you to *sin*, cut it off. It is better for you to enter into life maimed, rather than having two hands, to go to hell, into the fire that shall never be quenched -- where #quote[_Their worm does not die And the fire is not quenched._]]]

    #verse[Mark 7:21-22][#quote[For from within, out of the heart of men, proceed *evil thoughts*, *adulteries*, *fornications*, *murders*, *thefts*, *covetousness*, *wickedness*, *deceit*, *lewdness*, an *evil eye*, *blasphemy*, *pride*, *foolishness*.]]
    // Luke 13:1-5, John 5:26-29, 12:31, 15:6].

    #verse[Mat.10:28][#quote[And do not fear those who kill the body but cannot kill the soul. But rather fear Him who is able to destroy both soul and body in hell.]]
    #seeAlso[Mat.5:27-30, 7:21-23, 13:40-42,47-50, 24:50-51]
  ],
  [
    #twin-emoji-heading(skull.bones)[= WARNING!]
    The apostle Paul warns:
    #verse[Gal.5:19-21][Now the works of the flesh are evident, which are: *adultery*, *fornication*, *uncleanness*, *lewdness*, *idolatry*, *sorcery*, *hatred*, *contentions*, *jealousies*, *outbursts of wrath*, *selfish ambitions*, *dissensions*, *heresies*, *envy*, *murders*, *drunkenness*, *revelries*, and *the like*; ...... that those who practice *such things* will NOT inherit the kingdom of God.]
    #seeAlso[Eph.5:5,6;Col.3:5-9].

    #verse[1-Cor.6:10][nor *thieves*, nor *covetous*, nor *drunkards*, nor *revilers*, nor *extortioners* will inherit the kingdom of God.]
    #seeAlso[vs 9; Rom.1:18-32, 2:3-9; 1-Tim.6:9-10; 2-Tim.3:1-5].

    #verse[Col. 3:6][Because of these things the wrath of God is coming upon the sons of disobedience]
    #seeAlso[Mat.22:13; Luke 16:22-24; Acts 3:23; 2-Thes.1:7-10].
  ],
  [
    #twin-emoji-heading(megaphone)[= ALERT!]
    == JESUS WILL RETURN TO JUDGE THE WORLD IN RIGHTEOUSNESS #v(1mm)
    Jesus will come back to give to us all according to what we did. Those who follow Jesus and do the will of His Father will be\ welcomed into His eternal kingdom. But those who continue to do evil will face God’s punishment.\
    #see[Acts 17:31; Mat.25:41,46]

    #verse[Hebrews 9:27 NKJV][And as it is appointed for men to die once, but after this the judgement]
    #seeAlso[Heb.4:13, 10:26-31]

    #verse[Revelation 21:8][#quote[But the *cowardly*, *unbelieving*, *abominable*, *murderers*, *sexually immoral*, *sorcerers*, *idolaters*, and all *liars* shall have their part in the lake which burns with fire and brimstone, which is the second death.]]
    #seeAlso[Rev.14:10-11, 20:10-15, 22:15; 2-Peter 3:7,10-12; Jude 1:6-7, 13; Mal.4:1; Isaiah 33:14].
  ],
)

#trifold-interior(
  [
    #image-heading("dove", dy: -2pt, hd-w: 3fr, img-w: 39pt, img-x: -1)[THE GOSPEL OF \ JESUS CHRIST] #v(-2mm)
    #verse[Matthew 4:17][From that time Jesus began to preach and to say, *#quote[Repent, for the kingdom of heaven is at hand.]<jesus>*]

    The kingdom of God was opened to us when Jesus came. He is King of kings and Lord of lords, the Son of God, the Saviour, and the One who will judge the world. Jesus is the One we must *obey* if we want to be a part of the eternal kingdom we were created for.
    #see[Mat.24:14; Mark 1:14-15, 9:47; Luke 4:43; John 3:3-5]

    #emoji-heading(dx: -1mm, dy: -2mm, hd-w: 6fr, level: 2, faith.christ)[JESUS DIED AND ROSE FROM THE GRAVE]
    #v(-1mm) Jesus was crucified but God raised Him from the dead and seated Him at His right hand, proving Jesus is the Son of God. Jesus gave His life as a ransom, to open our eyes, to turn us back to God, to free us from our
  ],
  [
    selfish ways. This He suffered, hoping we would listen to Him and be changed into righteous people who *love* God and *do* His will.
    #see[Mat.12:39-40; Mk. 12:29-31; John 12:32; Acts 26:18]

    #emoji-heading(dx: -0mm, dy: -2mm, size: 25pt, level: 2, seedling)[ETERNAL LIFE OFFERED TO ALL WHO SUBMIT]
    #verse[John 14:6][Jesus said to him, *#quote[I am the way, the truth, and the life. No one comes to the Father except through Me.]<jesus>*]

    All who trust Jesus and *humbly submit* to His authority are forgiven by God. They are released from sin's captivity and receive the Holy Spirit, empowered for a supernatural life. This is a gift of God’s grace, but not something we can abuse. Scripture urges Christians to remain in the grace of God and warns them not to receive it in vain.
    #see[Acts 5:32, 10:43, 13:38-39; Rom.11:22; 2-Cor.5:17, 6:1; Eph.2:8-10; Tit.2:11-14]
  ],
  [
    #image-heading(level: 2, "question-mark")[HOW MUST WE RESPOND \ TO THIS GOOD NEWS?] #v(-0.5mm)
    #verse[Acts 2:38][Then Peter said to them,\ *#quote[Repent, and let every one of you be baptized in the name of Jesus Christ for the remission of sins; and you shall receive the gift of the Holy Spirit.]*] #seeAlso[Acts 3:19].

    Being a Christian means a *full surrender* of your whole life to Jesus as your Lord and King. If you are ready for that commitment, you must *repent* and be baptized in His name. Then you must learn to *obey* all He taught and commanded, take up your cross, and follow Him to the very end. God will help you if you are *willing* and *obedient*
    #see[Mat.10:37-39; Luke 9:23-25, 14:26-33; John 14:21, 15:1-10; Php.3:12-14; 1-John 3:3-10].

    #qr-footer(padding-bottom: 3pt, size: 10mm, text-col-width: 50%)
  ],
)
