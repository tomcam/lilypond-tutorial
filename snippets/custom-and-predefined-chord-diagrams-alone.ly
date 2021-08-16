\include "predefined-guitar-fretboards.ly"
\header {
	title = "Custom and predefined guitar chord diagrams alone on the page"
	composer = "Tom Campbell"
}

% Shows how to display custom chord charts
% alone on the page.

<<
  \chords {
  d:m  c g a:dim7 
  }
 	\new FretBoards {
    	\chordmode {
			% Custom fret diagram
			d
 			\override FretBoard.fret-diagram-terse = #"x;x;o;2-1;3-2;2-3;"
			
			% Custom fret diagram
			c
	 		\override FretBoard.fret-diagram-terse = #"x;3-3;2-3;o;2-1;o;"   
			
			% Custom fret diagram
			g
 			\override FretBoard.fret-diagram-terse = #"3-3;2-2;o;o;0;3-1;"
			
			% Predefined fret diagram
			a:dim7
			
    	}      
	  
    }
  
>>
