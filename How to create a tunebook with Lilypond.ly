% Minimum Lilypad version required for the non-music variables feature
\include "settings.ly"


%{ ***********************************
   * 
   * WRITING THE SCORE 1.
   * 
   *********************************** 
%}

\markup \headerOne  { "Writing the Score" }


\markup {
	\vspace #1
	\column {
		 \headerOne { "The minimum file" } 
		\line {  { \bulletChar } "From the" \bold { File } "menu, choose" \bold "New". }
		"A simple notepad appears."

		\wordwrap {  { \bulletChar } "The first line should be" \typewriter { "\\version"}, followed by whatever the current version of Lilypad is in quotes. }
		"For example:"
		\line { " " }
		\typewriter {"\\version \"2.19.54\"" }
		\line { " " }

		"If you don't know the version number, you can find it out like this:"
		\wordwrap {  { \bulletChar } "From the" \bold { LilyPond } "menu, choose" \bold {About LilyPond} "and look at the numbers and dots following the word" \bold "Version" }
		\line { " " }
		\line {  { \bulletChar } "Follow it with the notes of the score:"}
		\typewriter {
         	"{"
         	"     c d e f"
         	"}"
		}
		"So the whole file looks like this:"
		\hspace #8 \column {
			\typewriter {
         		"\\version \"2.19.54\" "  
         		"{"
         		"     c d e f"
         		"}"
			}
		"To see what it will look like, you need to typeset the file, but first save it."
		\line {  { \bulletChar } "From the" \bold { File } "menu, choose" \bold "Save" or press Command+Save. }
		"Now compile it:" 
		\line {  { \bulletChar } "From the" \bold { Compile } "menu, choose" \bold "Typeset" or press Command+R. } 
		}
	}
}

\markup {
	\vspace #1
	\line { "Results:" }
}

{
	c d e f
}


%{ ***********************************
   * 
   * CHANGING THE CLEF
   * 
   ********************************* 
%}

\markup {
	\column {
		\headerTwo { "Changing the clef" }
		\wordwrap { 
			You can see that's not the natural range for the notes.
			The clef is assumed to be treble. You can specify the clef easily
			using \typewriter { "\\clef" }
		}
	}
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"{"
			"    \\clef bass"
			"     c d e f"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\absolute {
				\clef bass
				{ c d e f }
			}	
			
		}
	}	
}

\markup {
	\vspace #2
	\line \bold { "You will almost always use the" } 
	\typewriter {"relative"} {"keyword, like this:"}
}

\markup {
	\vspace #1
	\hspace #8 \column \typewriter {
         "\\version \"2.19.54\" "  
         "\\relative c' {"
         "     c d e f"
         "}"
	}
}

\markup {
	\vspace #1
	\line { "Results:" }
	\hspace #0
}

\relative c' {
	c d e f
}

%{ ***********************************
   * 
   * Sharps and flats
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\fontsize #4
	\line \bold { "Pitches" } 
}


\markup {
	\vspace #2
	\line 
	{   \bold { "Append" \typewriter {"es"} { "to a note name to add a flat,"}
		{"and"} \typewriter {"is"} {"to a note name to add a sharp"} }
	} 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
	         "\\version \"2.19.54\" "  
	         "\\relative c' {"
	         "     c d ees fis"
	         "}"
		}
	}
	\column {
		\line { " " }
		\score {
			\relative c' {
				c d ees fis
			}
		}
	}	
}

%{ ***********************************
   * 
   * Grace note
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\column {
		\wordwrap \bold { "To add grace notes that aren't included in the note count, use" } 
		\concat { \typewriter {"\\grace"} {" followed by the grace note." }}
		\wordwrap { 
		In this case, the \typewriter {"\\grace a8"} isn't applied to
		the measure count.
		}
	}
}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"<<"
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 6/8"
			"    \\grace a8 g4 fis8 e4 g8 |"
			"}"
			"\\addlyrics {"
			"    can of grog, If |"
			"}"
			">>"
		}
	}
	\column {
		\line { " " }
		\score {
			<<
			\relative g' {
				\key g \major
				\clef treble
				\time 6/8
				\grace a8 g4 fis8 e4 g8 |
			}
			\addlyrics {
				can of grog, If |
			}
			>>
		}
	}	
}

\markup {
	\vspace #1
	\line {"To learn about constructs similar to grace notes, visit http://lilypond.org/doc/v2.18/Documentation/notation/special-rhythmic-concerns"}
}
%{ ***********************************
   * 
   * Trill 1
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\column {
		\wordwrap \bold { "Adding a trill mark above the note" } 
		\wordwrap { 

			To create a { \bold \italic tr } just add
			\typewriter { "\\trill" } directly after the note name, 
			with no space. For example, \typewriter { "c8" } becomes
			 \typewriter { "c8\\trill" }. In the example below, the 
			trill is being added over a grace note.
		}

	}

}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"<<"
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 6/8"
			"    \\grace c8\\trill b4. a8 g8. [b16] |"
			"}"
			"\\addlyrics {"
			"    plea- sure this _ |"
			"}"
			">>"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			<<
			\relative g' {
				\key g \major
				\clef treble
				\time 6/8
				\grace c8\trill b4. a8 g8. [b16]  | 
			}
			\addlyrics {
				plea- sure this _ |
			}
			>>
		}
	}	
}

\markup {
	\vspace #1
	\line {"See also http://lilypond.org/doc/v2.19/Documentation/notation/expressive-marks-as-lines#trills"}
}

%{ ***********************************
   * 
   * Note length #1: Whole and half
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\line 
	{   \bold { "Append" \typewriter {"1"} { "to make a whole note,"}
		{"and"} \typewriter {"2"} {"to make a half note."} }
	} 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative c' {"
			"\\time 4/4"
         	"     c2 d2 | e1"
 			"}"
		}
	}
	\column {
		\line { " " }
		\score {
			\relative c' {
			\time 4/4
				 c2 d2 | e1
			}
		}
	}	
}

%{ ***********************************
   * 
   * Note length #2: Quarters and eighths
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\fontsize #4
	\line \bold { "Note lengths" } 
}


\markup {
	\vspace #2
	\line 
	{   \bold { "Append" \typewriter {"8"} { "to make an eighth note,"}
		{"and"} \typewriter {"4"} {"to make it a quarter"} }
	} 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative c' {"
			"\\time 2/4"
			"     c8 d e4"
			"}"
		}
	}
	\column {
		\line { " " }
		\score {
			\relative c' {
				c8 d e4
			}
		}
	}	
}

%{ ***********************************
   * 
   * Note length #3: Sixteenths, etc
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\fontsize #4
	\line \bold { "Note lengths: sixteenths and beyond" } 
}

\markup {
	\vspace #2
	\column {
		\wordwrap \bold { "Append" \typewriter 16 "to make it a 16th note," \typewriter 32 "to make it a 32nd note, and so on." }
		\wordwrap { "By the way, the" \typewriter [  and 
			\typewriter ] ensure beams are used instead of flags.  }
	}
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative c' {"
			"\\time 2/4"
			"     c8 d e16 f g"
			"     a b32 [c32 d32 e32]"
			"}"
		}
	}
	\column {
		\line { " " }
		\score {
			\relative c' {
			\time 2/4
				c8 d e16 f g
				a b32 [c32 d32 e32]
				
			}
		}
	}	
}


%{ ***********************************
   * 
   * Note length #4 : Repeat shortcut
   * 
   ********************************* 
%}

\markup {
	\vspace #2
	\line 
	{   \bold { "Notes use the same length until changed, so there's no reason to repeat them."}
		 
	} 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative c' {"
			"\\time 4/4"
         	"     c8 d e f g4 a"
 			"}"
		}
	}
	\column {
		\line { " " }
		\score {
			\relative c' {
			\time 4/4
				c8 d e f g4 a
			}
		}
	}	
}

%{ ***********************************
   * 
   * Adding phrase marks INTRO
   * 
   *********************************** 
%}


\markup {
	\vspace #2
	\column {
		\line \bold { "Adding phrase marks and beams" } 
		\wordwrap { 
			In this example the last beat needs a phrase mark over the 
			both sixteenths and the eight notes:
		}
	}
}

%{ ***********************************
   * 
   * Adding beams
   * 
   *********************************** 
%}


\markup {
	\vspace #2
	\column {
		\wordwrap \bold { "Adding beams: Using [ and ] to replace flags with beams." } 
		\wordwrap { Use parentheses \typewriter {"["} and \typewriter {"]"} 		to surround the all but the first note to be included in the phrase. 		Here's what the code looks like, first without the brackets and
		second with the brackets. Note that the \typewriter {"e16"} is 		not included, just the trailing notes: \typewriter { "[fis16 g8]"}
		}
	}
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative e'' {"
			"     \\key e \\minor"
			"     \\time 3/4"
			"     e2 e16 fis16 g8"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\version "2.19.54" 
			\relative e'' { 
				\autoBeamOff	
				\key e \minor
				\time 3/4
				e2 e16 fis16 g8      
			}
		}
	}	
}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative e'' {"
			"     \\key e \\minor"
			"     \\time 3/4"
			"     e2 e16 [fis16 g8]"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\version "2.19.54" 
			\relative e'' { 	
				\key e \minor
				\time 3/4
				e2 e16 [fis16 g8]      
			}
		}
	}	
}

%{ ***********************************
   * 
   * Triplets
   * 
   ********************************* 
%}


\markup {

	\vspace #2
	\column {
		\wordwrap \bold { "Triplets" } 
		\wordwrap { 
			Use \typewriter {"\\tuplet"}, followed by fraction
			 (\typewriter {"3/2"} in this case), followed by the notes
			enclosed in \typewriter {"{"} and \typewriter {"}"}.
		}
	}
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 4/4"
			"    \\tuplet 3/2 {c8 [b a]} d c b4. b8"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\relative g' {
				\key g \major
				\clef treble
				\time 4/4
					\tuplet 3/2 {c8 [b a]} d c b4. b8 
			}
		}
	}	
}



%{ ***********************************
   * 
   * Triplets with phrase marks
   * 
   ********************************* 
%}


\markup {

	\vspace #2
	\column {
		%\wordwrap \bold { "Triplets" } 
		\wordwrap  { 
			"To get a phrase mark, surround the second two notes with parentheses:" 
		} 
	}
}

\markup {
	\vspace #2
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 4/4"
			"    \\tuplet 3/2 {c8 ([(b a])} d c b4. b8"
			"}"
		}
	}
	\column {
		\score {
			\relative g' {
				\key g \major
				\clef treble
				\time 4/4
					\tuplet 3/2 {c8 ([(b a])} d c b4. b8 
			}
		}
	}	
}




%{ ***********************************
   * 
   * Adding phrase marks
   * 
   *********************************** 
%}


\markup {
	\vspace #2
	\column {
		\wordwrap \bold { "Adding phrase marks: Using ( and ) to show phrasing." } 
		\wordwrap { Use parentheses \typewriter {"("} and \typewriter {")"} 		to surround the all but the first note to be included in the phrase. 		Here's what the code looks like. Note that the \typewriter {"e16"} is 		not included, just the trailing notes: \typewriter { "([fis16 g8])"}
		}
	}
}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative e'' {"
			"     \\key e \\minor"
			"     \\time 3/4"
			"     e2 e16 ([fis16 g8])"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\version "2.19.54" 
			\relative e'' { 	
				\key e \minor
				\time 3/4
				e2 e16 ([fis16 g8])      
			}
		}
	}	
}



%{ ***********************************
   * 
   * FERMATA
   * 
   ********************************* 
%}

\markup {

	\vspace #2
	\column {
		\wordwrap \bold { "Fermatas" } 
		\wordwrap { 
			To add a fermata, simply append
			\typewriter {"\\fermata"} to the note with no space: 
		}
		
	}
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"<<"
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 6/8"
			"    g8 a b d4.\\fermata |"
			"}"
			"\\addlyrics {"
			"    Tra la la la |"
			"}"
			">>"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			<<
			\relative g' {
				\key g \major
				\clef treble
				\time 6/8
				g8 a b d4.\fermata |
			}
			\addlyrics {
				Tra la la la |
			}
			>>
		}
	}	
}

%{ ***********************************
   * 
   * BAR LINES AND REPEATS
   * 
   ********************************* 
%}
% http://lilypond.org/doc/v2.19/Documentation/notation/bars


\markup {
	\vspace #2
	\fontsize #4
	\line \bold { "Bar lines" } 
}



\markup {
	\column{
		\line { "See more at http://lilypond.org/doc/v2.19/Documentation/notation/bars" }
	}
}


\markup {
	\vspace #1
	\column { \bold { "Double bar lines:"}		 
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative c' {"
			"\\time 4/4"
            "    f4 e d c \\bar \"|.\" "
 			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
	 	\score {
			\relative c' {
			\time 4/4
				f4 e d c \bar "|."
			}
		}
	}	
}

\markup {
	\vspace #1
	\column {\bold { "Repeats:"}		 
		\hspace #8 \column \typewriter {
			"\\version \"2.19.54\" "  
			"\\relative c' {"
			"\\time 4/4"
            "    f4 e d c \\bar \":|]\" "
 			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\score {
			\relative c' {
			\time 4/4
				f4 e d c \bar ":|]"
			}
		}
	}	
}

 






