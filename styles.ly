\include "version.ly"

% Transcribed by Tom Campbell January-February 2017 

%{
From:

The American Musical Miscellany: A Collection of the Newest and Most Approved Songs, Set to Music

Published in Northampton Massachusetts, 1798

PDF version originally found at IMSLP
http://imslp.org/wiki/The_American_Musical_Miscellany_(Various)

Alternate lyrics:
http://quod.lib.umich.edu/e/evans/N28649.0001.001/1:80?rgn=div1;view=fulltext


N.B. This source best viewed in a monospace font because
to the right of the music markup are space-filled comments 
displaying the lyrics.

%}

% Supposed to enable clickable URLS, according to:
% http://lilypond.org/doc/v2.18/Documentation/usage/configuring-the-system-for-point-and-click
% But supposedly this can cause security issues? Heh? Reread that section
\pointAndClickOn

% Bullet character
bulletChar = \markup { \char ##x2022 }

%{ ***********************************
   * 
   * EXPERIMENTAL PARAGRAPH STYLES 
   * 
   *********************************** 
%}

#(define-markup-list-command (n layout props text) 
	(markup-list?)
	"Normal explanatory paragraph"
 	(interpret-markup-list layout props
		#{
			\markuplist \huge {
				\concat {
					\vspace #1.5
					\wordwrap { #text }
				}
			}
  		#}))

%{ ***********************************
   * 
   * HEADER HIERARCHY 
   * corresponds to HTML headers
   * 
   *********************************** 
%}

#(define-markup-command (headerOne layout props text) 
	(markup?)
 	"Create a level 1 header"
 	(interpret-markup layout props
		#{
			\markup {
				\fontsize #6
				\line \bold \sans { #text }
				\vspace #3
			}
  		#}))

#(define-markup-command (headerTwo layout props text) 
	(markup?)
 	"Create a level 2 header"
 	(interpret-markup layout props
		#{
			\markup {
				\vspace #2
				\fontsize #3
				\line \bold \sans { #text }
			}
  	#}))

#(define-markup-command (headerThree layout props text) 
	(markup?)
 	"Create a level 3 header"
 	(interpret-markup layout props
		#{
			\markup {
				\vspace #2
				\fontsize #1
				\line \bold \sans { #text }
			}
  	#}))



%{ ***********************************
   * 
   * PARAGRAPH STYLES 
   * 
   *********************************** 
%}



%{ ***********************************
   * bulletParagraph
   * Resembles HTML unordered list item
   *********************************** 
%}
#(define-markup-list-command (bulletParagraph layout props text) 
	(markup-list?)
	"Paragraph starting with a bullet-indicates action"
 	(interpret-markup-list layout props
		#{
			\markuplist  \huge {
				\concat {
					\vspace #1.5
					\bulletChar \hspace #1
					\wordwrap { #text }
				}
			}
  		#}))


%{ ***********************************
   * normalParagraph
   * Resembles HTML p style
   *********************************** 
%}
#(define-markup-list-command (normalParagraph layout props text) 
	(markup-list?)
	"Normal explanatory paragraph"
 	(interpret-markup-list layout props
		#{
			\markuplist  \huge {
				\concat {
					\vspace #1.5
					\wordwrap { #text }
				}
			}
  		#}))




