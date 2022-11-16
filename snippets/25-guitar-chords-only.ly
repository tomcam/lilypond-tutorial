\include "predefined-guitar-fretboards.ly"
\header {
	title = "Chords for my song '25' (unfinished)"
	composer = "Tom Campbell"
}

% Shows how to display custom chord charts
% alone on the page.

<<
  \chords {
 	c:m7  f:7 bes:maj7 a:dim7
 	d:m7 g:7
 	c:m f:9
	bes:maj7 f:9
	bes:maj7 ees:maj7 
	d:7 a:9
	g:7
	c:m7 f:7
  }
 	\new FretBoards {
    	\chordmode {
			
			c:m7 f:7 bes:maj7 a:dim7
			
 			d:m7 g:7
			
  			c:m f:9
			
			bes:maj7 f:9
			
			bes:maj7 ees:maj7 
			
			d:7 a:9
			
			g:7
			
			c:m7 f:7
    	}      
	  
    }
  
>>
