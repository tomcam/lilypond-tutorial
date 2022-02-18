% Lead sheet with single melody line. Includes default guitar fretboard diagrams
% as supplied by Lilypond
\version "2.18.2"
\include "predefined-guitar-fretboards.ly"

\header { 
	title = "Lead sheet template with lyrics and guitar chord charts"
	composer = "COMPOSER here"
	copyright = "COPYRIGHT here"

	% tagline is the footer.
	% tagline = "TAGLINE here"
	% Disable the footer
	tagline = ##f
} 


myChordNames =   {
    \chordmode {
      c1 | f | g | c
    }
  }

myMelody = 
    \relative c'' {
      c2 e4 e4
      f2. r4
      g2. a4
      e4 c2.
    }
  

 text = \lyricmode {
    \lyricsto "melody" {
      This is my song.
      I like to sing.
    }
  }


<<
	\new ChordNames { \myChordNames }
	\new FretBoards { \myChordNames }
	\new Voice = "melody" { \myMelody }
	\new Lyrics \lyricsto "melody" \text
>>


