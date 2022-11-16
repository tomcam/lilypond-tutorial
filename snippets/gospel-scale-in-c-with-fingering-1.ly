
\header {
  title = "Gospel scale in C"
  % Based on:
  % https://www.youtube.com/watch?v=tUzYR4QPgJc&t=365s
}

rightHand = \relative c, {
  \clef treble
  \key c \major
  \time 4/4
  % Hide the time signature:
  \override Staff.TimeSignature.transparent = ##t
  % Hide bar lines:
  \override Staff.BarLine.stencil = ##f
  \relative { c'4-1 d-2 dis-3 e-1
  g-2 a-3 c-1 }
}

<<
   \new Staff = "upper" \rightHand
>>

  \layout { }
  \midi { }
}

