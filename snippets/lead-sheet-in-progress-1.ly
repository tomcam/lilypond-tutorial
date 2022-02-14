% http://lilybin.com/pvmkwk/16
% Example lead sheet showing:
% 1. Custom fretboard diagrams
% 2. Pickup note that supresses "N.C." where the chord symbol would go
% 3. General lead sheet principles
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
    g4^\markup \fret-diagram-terse #"o;2-2;2-3;o;o;o;" a8 b4 e8
	d8.^\markup \fret-diagram #"c:6-1-2;6-2;5-2;4-4;3-4;2-3;1-2; #" e16 fis8 
	e4^\markup \fret-diagram-terse #"o;2-2;2-3;o;o;o;" b16 c
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
