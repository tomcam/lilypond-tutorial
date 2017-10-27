% Version of Lilypad used to create this file
\version "2.19.54" 

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

% Bullet character
bulletChar = \markup { \char ##x2022 }


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


#(define-markup-list-command (bulletParagraph layout props text) 
	(markup-list?)
	"Paragraph starting with a bullet-indicates action"
 	(interpret-markup-list layout props
		#{
			\markuplist {
				\concat {
					\vspace #1.5
					\bulletChar \hspace #1
					\wordwrap { #text }
				}
			}
  		#}))


#(define-markup-list-command (normalParagraph layout props text) 
	(markup-list?)
	"Normal explanatory paragraph"
 	(interpret-markup-list layout props
		#{
			\markuplist {
				\concat {
					\vspace #1.5
					\wordwrap { #text }
				}
			}
  		#}))





% Because this is for a 6x9 book format,
% set default staff size to 14 points from the default, which is 20.
% All font sizes are derived from this number.
% This must be at the top level.
% #(set-global-staff-size 20)

% Most of this is gratefully stolen from Benjamin Bloomfield's
% incredible Collection of Christmas Carols:
% https://github.com/bbloomf/christmas-carols
\paper {
  % This has weird effects I need to understand better:
  % print-all-headers = ##t
  paper-height = 9\in
  paper-width = 6\in
  % Without this, first line of music is indented
  indent = #0

  % This seems to be responsible for the huge space between the 
  % Range section and the score.
  % It's a sort of flex system:
  % http://lilypond.org/doc/v2.19/Documentation/notation/flexible-vertical-spacing-paper-variables
%{
  system-system-spacing =
    #'((basic-distance . 5)    
       (minimum-distance . 0)
       (padding . -5)          
       (stretchability . 20)) 
%}

  ragged-last-bottom = ##f
  ragged-bottom = ##f
  two-sided = ##t
  inner-margin = 0.5\in
  outer-margin = 0.25\in
  top-margin = 0.25\in
  bottom-margin = 0.25\in
  first-page-number = #1
  print-first-page-number = ##t
%{
  headerLine = \markup{\override #'(font-name . "Garamond Premier Pro") "header line"}
  oddHeaderMarkup = \markup\fill-line{
     \override #'(font-name . "Garamond Premier Pro")\abs-fontsize #8.5
     \combine 
        \fill-line{"" \on-the-fly #print-page-number-check-first
        "odd header markup"
        }
        \fill-line{\headerLine}
  }
  evenHeaderMarkup = \markup {
     \override #'(font-name . "Garamond Premier Pro")\abs-fontsize #8.5
     \combine
        \on-the-fly #print-page-number-check-first
        "even header markup"
        \fill-line{\headerLine}
  }
%} 
}