% Lead sheet with:
% - Guitar fretboard diagrams
% - Em predefined fretboard diagram override
% - Pickup note
% - Chord and other text suppressed above the pickup note
% - I THINK THIS IS IT!
\version "2.18.2"
\include "predefined-guitar-fretboards.ly"

% Override predefined fretboard for e minor.
% This just adds a G to the first (highest) string.
% A little contrived but it's brief.
\storePredefinedDiagram #default-fret-table \chordmode { e:m }
	#guitar-tuning
	#"o;2-2;2-3;o;o;3-4;"

\header {
	title = "Hit and Miss (Daphne)"
	composer = "Trad."  
}

theMelody = \relative c {
 	\clef treble
 	\key e \minor
 	\time 6/8

	% Pickup note
 	\partial 8 e'8
	
	% Verse melody (truncated for clarity)
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
 		\new ChordNames { \theChords }
		\new FretBoards { \theChords }
		\new Voice = "one" { \autoBeamOn \theMelody }
 		\new Lyrics \lyricsto "one" \theLyrics
	>>
 	\layout { }
 	\midi { }
}
