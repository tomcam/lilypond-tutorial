% Lead sheet with single melody line. Includes default guitar fretboard diagrams
% as supplied by Lilypond
% See also:
%  https://github.com/tomcam/lilypond-tutorial/blob/master/snippets/lead-sheet-in-progress-1.ly
%  http://lilybin.com/2x4ocz/1
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


