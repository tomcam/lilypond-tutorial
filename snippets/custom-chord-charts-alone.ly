\include "predefined-guitar-fretboards.ly"

% Shows how to display custom chord charts
% alone on the page.
<<
  \chords {
  d:m  c g
  }
 	\new FretBoards {
    	\chordmode {
			d
 			\override FretBoard.fret-diagram-terse = #"x;x;o;2-1;3-2;2-3;"
			
			c
	 		\override FretBoard.fret-diagram-terse = #"x;3-3;2-3;o;2-1;o;"   
			
			g
 			\override FretBoard.fret-diagram-terse = #"3-3;2-2;o;o;0;3-1;"
    	}      
	  
    }
  
>>
