\version "2.18.2"
\header {
  title = "Hit and Miss (Daphne)"
  composer = "Trad."
}

theMelody = \relative c {
  \clef treble
  \key e \minor
  \time 6/8

  \partial 8 e'8
    g4 a8 b4 e8
	d8. e16 fis8 
	e4 b16 c
}

theLyrics = \lyricmode {
  When Daph -- ne from fair 
  Phoe -- bus did fly the --
}

theChords = \chordmode {
  % Replace the N.C. that would appear over
  % the pickup note
  \set noChordSymbol = ""
  \partial 8 r8 
  e2.:min
  b4.:min
  e4.:min
 }

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \theChords
    }
    \new Voice = "one" { \autoBeamOn \theMelody }
    \new Lyrics \lyricsto "one" \theLyrics
  >>
  \layout { }
  \midi { }
}
