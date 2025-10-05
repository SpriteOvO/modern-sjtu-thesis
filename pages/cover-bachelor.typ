#import "../utils/style.typ": zihao, ziti
#import "../utils/distr.typ": distr
#import "../utils/datetime-display.typ": datetime-display-without-day

#let cover-bachelor-page(
  date: datetime.today(),
  twoside: false,
  anonymous: false,
  info: (:),
) = {
  v(0.3cm)

  align(
    center,
    info.logo,
  )

  v(0.4cm)

  let cover-title = info.cover_title

  align(
    center,
    text(font: ziti.songti, size: zihao.xiaoer)[#cover-title],
  )

  v(1.86cm)

  align(
    center,
    text(font: ziti.songti, size: zihao.erhao, weight: "bold")[#info.title],
  )

  v(1fr)

  let info-key(zh) = distr(width: 5em, zh)

  let info-value(zh) = (
    text(
      zh,
      font: ziti.songti,
      size: zihao.sihao,
    )
  )

  set text(font: ziti.heiti, size: zihao.sihao)
  table(
    stroke: none,
    align: (x, y) => (
      if x >= 1 {
        left
      } else {
        right
      }
    ),
    columns: (37%, 1%, 62%),
    inset: (right: 0em),
    column-gutter: (-0.3em, 1em),
    row-gutter: 0.81em,
    [#info-key("姓名")],
    [#text(weight: "bold")[：]],
    [#if anonymous {} else {
      info-value(info.name)
    }],

    [#info-key("学号")],
    [#text(weight: "bold")[：]],
    [#if anonymous {} else {
      info-value(info.student_id)
    }],

    [#info-key("学院")], [#text(weight: "bold")[：]], [#info-value(info.school)],
    [#info-key("专业名称")], [#text(weight: "bold")[：]], [#info-value(info.major)],
  )

  v(2.8cm)

  align(
    center,
    text(font: ziti.songti, size: zihao.sihao, weight: "bold")[#datetime-display-without-day(date)],
  )

  v(2.45cm)

  pagebreak(
    weak: true,
    to: if twoside {
      "odd"
    },
  )
}
