\include "styles.ly"
\include "version.ly"


\include "styles.ly"
\include "version.ly"


% Layout block is score-specific layout settings
\layout {
	line-width = 6.0\in
	right-margin = 4.0\in
}

% See "http://lilypond.org/doc/v2.18/Documentation/notation/the-paper-block"
% See "http://lilypond.note flatorg/doc/v2.18/Documentation/notation/horizontal-spacing-paper-variables#paper-variables-for-widths-and-margins"
\paper {
 	top-margin = 0.5\in
	right-margin = 2.0\in
	ragged-right = ##t % Document the ##t thing! I tried #t, \#t, etc.
	#(define fonts
		(set-global-fonts
			#:roman "Baskerville"
		))
}



%{ ***********************************
   CONVENTIONS

  * See more reference at the end of a section should use this form.
    NOTE ABSENCE OF VERSION NUMBER IN URL. The version gets resolved in
     at lilypond.org when you paste in an address using this form. Slick!

	\markup \normalParagraph { 
		See http://lilypond.org/doc/Documentation/notation/writing-pitches for more details.
	}

   TODO
   * Lyrics
   * Screen shot of finished product for intro
   * << and >>
   * Standardize a way to express URLS
   * Metronome marks. See http://lilypond.org/doc/v2.18/Documentation/notation/displaying-rhythms 
   * Table of contents

   *********************************** 
%}



%{ ***********************************
   * 
   * WRITING THE SCORE 1.
   * 
   *********************************** 
%}


\markup \headerOne  { "Writing tunebooks with Lilypond" }

\markup  {
	\column {
		{
			\n { The Lilypond documentation is pretty complete but a little light on end-to-end tutorial material.This book shows you how to use the subset of its features required to write songs in lead sheet style. Normally it's a single melody line with lyrics. 
			}
		}
	}
}



\markup {
	\column {
		\headerOne  { "Writing the Score" }
		\normalParagraph { "This section goes through the creation of a simple score step by step." }
		\headerTwo { "The minimum file" } 

		\bulletParagraph { "From the" \bold { File } "menu, choose" \bold New. }
		\normalParagraph { "A simple notepad appears." }
		\bulletParagraph { The first line you should write is
			\typewriter "\\version" 
			followed by whatever the current version of Lilypad is in quotes. For example: }
		\line { " " }
		\typewriter {
			#versionNumber 
		}


		\normalParagraph { "If you don't know which version you're running, here's how to find out:" }
		\bulletParagraph { "From the" \bold { LilyPond } "menu, choose" \bold About. }
		\bulletParagraph { "Follow it with the notes of the score. The whole file should look like this:" }
		\line { " " }
		\typewriter {
			#versionNumber 
         	"{"
         	"     c d e f"
         	"}"
		}
		\headerTwo { "Save your file" } 
		\bulletParagraph { "From the" \bold { File } "menu, choose" \bold Save. }
		\headerTwo { "Compile/typeset your file" } 

		\normalParagraph { Now compile your music file.
			\italic Compiling, also called typesetting, 
			converts the code you've written into beautifully engraved music. }

		\bulletParagraph { "From the" \bold { Compile } "menu, choose" \bold Typeset or press Command+R. (Save your file if you haven't already.) }
		\normalParagraph { "Results:" }
	}
}

\markup {
	\column { 		 
	\vspace #1
		\typewriter {
			#versionNumber
         	"{"
            "    c d e f "
 			"}"
		}
	}
	\column {
	\line { " " }
		\score {
			{ 
				c d e f 
			}
		}
	}
}

%{ ***********************************
   * 
   * OUTPUT WINDOW
   * 
   ********************************* 
%}

\markup \headerTwo { The Output window }

\markup \normalParagraph { 
	Lilypond's output appears in a separate window. In normal operation
	you'll see many, many lines looking something like this:
}

\markup {
	\vspace #1
}


\markup \tiny \box \pad-markup #1.5 {
	\column \typewriter {
		\line { Processing `/Users/tom/songbook/American Dance 1850-1900.ly' } 
		\line { Parsing... } 
		\line { Interpreting music... } 
		\line { Preprocessing graphical objects... } 
		\line { Calculating line breaks... } 
		\line { Drawing systems... } 
		\line { \italic { etc...} } 
	}

}

\markup \normalParagraph { 
	If your source file contains no errors, the concluding lines look something like this:
}

\markup {
	\vspace #1
}


\markup \tiny \box \pad-markup #1.5 {
	\column \typewriter  {
		\line { Layout output to `/var/folders/7k/2n4d6vn6k_mvr/T//lilypond-Ue4wmd'... } 
		\line { Converting to `American Dance 1850-1900.pdf'...} 
		\line { Deleting `/var/folders/7k/2n4d6vn6k_mvr/T//lilypond-Ue4wmd'... } 
		\line { Success: compilation successfully completed } 
	}

}

\markup \normalParagraph { 
	If there's an error, for example, you forget a trailing
\typewriter { "}" } in a score, a large number of messages like these will scroll past:
}


\markup {
	\vspace #1
}
\markup \tiny \box \pad-markup #1.5 {
	\column \typewriter  {
		\line { Layout output to `/var/folders/7k/2n4d6vn6k_mvr/T//lilypond-Ue4wmd'... } 
		\line { "'/Users/tom/songbook/American Dance 1850-1900.ly':206:1: error:" } 
		\line { "markup outside of text script or \\lyricmode" }
		\line { "'/Users/tom/songbook/American Dance 1850-1900.ly':228:1: error:" } 
		\line { "Spurious \\line in \\score" } 
		\line { "'/Users/tom/songbook/American Dance 1850-1900.ly':228:1: error: " }
		\line { "markup outside of text script or \\lyricmode" }
		\line { "\\markup '/Users/tom/songbook/American Dance 1850-1900.ly':1638:3:" }
		\line { "error: syntax error, unexpected end of input, expecting '}'" }
		\line { "Interpreting music..." }
		\line { "Preprocessing graphical objects... " }
		\line { "Calculating line breaks... " }
		\line { "Drawing systems..." }
		\line { "Finding the ideal number of pages..." }
		\line { "Fitting music on 1 or 2 pages..." }
		\line { "Drawing systems..." }
		\line { "Layout output to `/var/folders/7k/2n4hyw3d6vn6k_mvr64mmk4h0000gp" }
		\line { "/T//lilypond-01l3cQ'..." }
		\line { "Converting to `American Dance 1850-1900.pdf'..." }
		\line { "Deleting `/var/folders/7k/22n4d6vn6k_mvr/T//lilypond-Ue4wmd'..." }
		\line { "fatal error: failed files: '/Users/tom/songbook/American Dance 1850-1900.ly" }
		\line { "'/Users/tom/songbook/American Dance 1850-1900.ly" }
	}

}

\markup \normalParagraph { 
	Running across such a giant list of error messages looks intimidating. 	You will find that it's invariably cascade of problems caused
	by just one thing. Usually that one thing is the absence of a curly 
	brace, parenthesis, or quote mark.
}

% ///
%{ ***********************************
   * 
   * Formatting
   * 
   ********************************* 
%}

\markup \normalParagraph { 
	In fact, let's take another look at the way your score
	is formatted to clarify how it's formatted.
}

\markup \normalParagraph { 
	Lilypond thinks of things in lists.
	Usually those lists are in between these 
	things, which are sometimes called curly braces: 
	\typewriter { "{ }" }. The first score you did, which consisted
	of a list of four notes between the curly braces, looked like this:
}

\markup {
	\column { 		 
	\vspace #1
		\typewriter {
			#versionNumber
         	"{"
            "    c d e f "
 			"}"
		}
	}
}


\markup \normalParagraph { 
	It could also be written like this:
}

\markup {
	\vspace #2
	\column {
		\typewriter {
			#versionNumber
         	"{  c d e f }"
		}
	}
}

\markup \normalParagraph { 
	Or:
}

\markup {
	\vspace #2
	\column {
		\typewriter {
			#versionNumber
			"% You could... but don't"
         	"{"
         	"  c d e f }"
		}
	}
}



\markup \normalParagraph { 
	A list just needs
	its delimiters, such as curly braces, and the items in
	the list, separated by spaces. The number of spaces between
	items in the list don't matter. And a carriage return (blank line)
	functions identically to a space. So does a tab character.
}

\markup \headerThree { Always write the opening and closing list characters first }

\markup \normalParagraph { 
	The most important thing to remember about writing any kind
	of list in Lilypond is to make sure you write the opening
	and closing characters (for example, \typewriter { "{" }
	and \typewriter { "}" }) before you write anything else, 
	because the most common errors are when you forget to 
	write a closing list delimiter or quote mark.
}





% ///
%{ ***********************************
   * 
   * CHANGING THE CLEF
   * 
   ********************************* 
%}

\markup \headerTwo { "Changing the clef" }
\markup \normalParagraph { 
	The clef is assumed to be treble. You can specify the clef easily
	using \typewriter { "\\clef" }.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\clef bass"
			"    {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\clef bass
				{
					c d e f 
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	It's not just bass and treble. Lillypond has a huge variety of clefs available. More common clefs include 
\typewriter { "tenor" }, \typewriter { "alto" }, and \typewriter { "percussion" }, but you'll see a host of others at http://lilypond.org/doc/Documentation/notation/clef-styles
	}

%{ ***********************************
   * 
   * RELATIVE PITCHES
   * 
   ********************************* 
%}


\markup \headerTwo { "Specifying a starting pitch" }
\markup \normalParagraph { 
			You can specify a relative starting pitch and Lilypond will use it to put the whole
			sequence of notes in context.
			Repeat the last example but surround with with a \typewriter { "relative 'c { }" } notation:
		}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c' {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d e f 
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	You're not restricted to \typewriter { "c'".}
It could be any note, like \typewriter { "g'" }  or \typewriter { "d'" }. 
}

\markup \headerThree { Raise relative pitch one octave per \typewriter { "'" } }

\markup \normalParagraph { 
			To go up an octave, try it again but with double  \typewriter { "''" } marks like this,
			once again surrounding the whole sequence in curly braces:  \typewriter { "relative c'' { }" }:
		}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'' {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c'' { 
					c d e f 
				}
			}
		}
	}	
}


\markup \headerThree { Lower relative pitch one octave per \typewriter { "," } }


\markup \normalParagraph { 
			To go down an octave, append a comma \typewriter { "," } like this:
		}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c, {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c, { 
					c d e f 
				}
			}
		}
	}	
}

\markup \normalParagraph { 
			And of course they can be mixed:
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c {"
			"         c d e f"
			"    }"
			" "
			"    \\relative c, {"
			"         c d e f"
			" "
			"    }"
			"    \\relative c' {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c { 
					c d e f 
				}
			
			
				\relative c, { 
					c d e f 
				}
			
			
				\relative c' { 
					c d e f 
				}
			}
		}
	}	
}



\markup \normalParagraph { 
	See http://lilypond.org/doc/Documentation/notation/writing-pitches for more details.
}



%{ ***********************************
   * 
   * COMMENTS
   * 
   ********************************* 
%}

\markup \headerTwo { "Comments: adding notes to yourself in the Lilypad source" }

\markup \normalParagraph { 
			Suppose you want to include a message to yourself in the score but you don't want it to appear in the final output. You can do that with comments.
			Single-line comments start with a \typewriter { "%" }.
			Copy this, then compile it. The comments do not appear in the final output. That's a feature, not a bug. Comments that go to your Lilypond source, stay in your Lilypond source. They won't be seen in the printed score:
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"% Have someone double-check this passage"
			"{"
			"    \\relative c' {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d e f 
				}
			}
		}
	}	
}

\markup \headerThree { "Multi-line comments" }


\markup \normalParagraph { 
			Sometimes your comments need many more than one or two lines.
			There is a second comment type for this purpose.
			Multi-line comments start with \typewriter { "{%" } and end with \typewriter { "%}". }
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			\line { "{% Have someone double-check this passage" }
			\line { "I've been at this 24 hours." }
			\line { "I'm not thinking straight" }
			\line { "And I still have 7 more sections to write %}" }
			"{"
			"    \\relative c' {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d e f 
				}
			}
		}
	}	
}



%{ ***********************************
   * 
   * MEASURES
   * 
   ********************************* 
%}


\markup \headerTwo { "Measures are marked automatically" }

\markup \normalParagraph { 
			LilyPond keeps track of measures for you automatically.
		}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c' {"
			"         c d e f"
			"         g a b c"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
				\relative c' { 
					c d e f 
					g a b c
				}
		}
	}	
}

\markup \normalParagraph { 
	For clarity these examples separate the
	measures visually, but it's not necessary: 
}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c' {"
			"         c d e f g a b c"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d e f g a b c
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	You can add the pipe character (\typewriter "|")
	into your markup as a visual aid to remind you 
	where measure breaks occur. If you put it in the
	wrong place, you'll get a warning that says something
	like \typewriter { warning: barcheck failed at: 1/2 c d  | e f g a b c }.
    Lilypond refuses to place a measure line where it wouldn't fit the
	score: 
}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c' {"
			"         % Causes warning message"
			"         c d | e f g a b c"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d e f g a b c
				}
			}
		}
	}	
}


%{ ***********************************
   * 
   * TIME SIGNATURE
   * 
   ********************************* 
%}


\markup \headerTwo { "Changing the time signature" }

\markup \normalParagraph { 
			LilyPond defaults to 4 beats per measure but of course that's easily changed using \typewriter { time }:
		}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c' {"
			"    \\time 3/4"
			"         c d e"
			"         f g a"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
				\time 3/4
					c d e 
					f g a
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	You can change time signatures at any point. 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c' {"
			"    \\time 3/4"
			"         c d e"
			"         f g a"
			"    \\time 2/4"
			"         b c"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
				\time 3/4
					c d e 
					f g a
				\time 2/4
					b c
				}
			}
		}
	}	
}


%{ ***********************************
   * 
   * SHARPS AND FLATS
   * 
   *********************************** 
%}

\markup \headerTwo { "Accidentals: adding sharp and flat signs" }

\markup \normalParagraph { 
	Form accidentals by appending them directly to the note letter.
	Make sure there is no space after the note letter.
}

\markup \headerThree { To make a note flat, append \typewriter { "es" } }

\markup \normalParagraph { 
	Append \typewriter { "es" } to a note name to give it a flat sign. 
}

\markup \headerThree { To make a note sharp, append \typewriter { "is" } }

\markup \normalParagraph { 
	Append \typewriter { "is" } to a note name to give it a sharp sign.
}

\markup \normalParagraph { 
		In the example below, to make the F an F sharp use the notation \typewriter { "fis" }, and to make the E an E flat use \typewriter { "ees" }. 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    {"
			"         c d ees fis"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d ees fis 
				}
			}
		}
	}	
}


%{ ***********************************
   * 
   * KEY SIGNATURE
   * 
   *********************************** 
%}


\markup \headerTwo { "Changing the key signature" }

\markup \normalParagraph { 
	Define the key signature using \typewriter { "\\key"}, followed by its letter, followed by \typewriter { "\\major" } or \typewriter { "\\minor" }.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative g'"
			"    \\key g \\major"
			"    {"
			"         g fis e d"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative g' { 
				\key g \major
					g4 fis e d 
				}
			}
		}
	}	
}

\markup \headerTwo { "Note values are absolute and ignore key signature" }

\markup \normalParagraph { 
	In the previous example you may have noticed something unexpected.
	It was the fact that the F sharp was explicitly specified as \typewriter { "fis"}
even though the key was G. You'd think that you could just use  \typewriter { "f"}
because of the key signature. \bold { Lilypond requires that no matter what the key signature is, each note value must written out completely. }
	Let's look at an example.
	}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative g'"
			"    \\key g \\major"
			"        % WRONG for the key of G!"
			"        g f e d"
			"        g fis e d"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative g' { 
				\key g \major
				\time 4/4
					g4 f e d 
					g4 fis e d
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	Intuitively, you would think that because the key signature is G major,
	the first notation example \typewriter { g f e d } would be sufficient,
	that LilyPond would understand from context that the sharp sign is
	implied. Unfortunately that's not the case, so no matter what
	key you're in you need to write out each note in full, as if it
	were in the key of C.
}



%{ ***********************************
   * 
   * NOTE DURATIONS
   * 
   *********************************** 
%}

\markup \headerTwo { "Changing note durations" }

\markup \normalParagraph { 
			Lilypond assumes you are using quarter notes. 
			Append \typewriter { "\\1" } to make it a whole note,
			\typewriter { "\\2" } to make it a half note, 
			\typewriter { "\\4" } for a quarter,
			\typewriter { "\\8" } for an eighth... you see the pattern.
			If the next note is the same duration, you don't have to repeat its duration marking.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    \\time 3/4"
			"    {"
			"         c d8 e8 f16 g16 a16 b16"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
				\time 3/4
					c d8 e8 f16 g16 a16 b16 
				}
			}
		}
	}	
}

\markup \headerThree { Duration marks apply until the duration changes }

\markup \normalParagraph { 
			If the next note is the same duration, you don't have to repeat its duration marking.
			This is a simplified version of the previous example.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    \\time 3/4"
			"    {"
			"         c d8 e f16 g a b"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
				\time 3/4
					c4 d8 e f16 g a b 
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	"For more, see http://lilypond.org/doc/Documentation/notation/writing-rhythms#durations" 
}

%{ ***********************************
   * 
   * Triplets
   * 
   *********************************** 
%}


\markup \headerTwo { "Triplets" }

\markup \normalParagraph { 
			Triplets use the \typewriter { "\\tuplet 3/2" } notation.
			The \typewriter { "3" } is the number of notes to be
			written and the \typewriter { "2" } is the number of notes
			that would normally be written there.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative g' {"
			"    \\key g \major"
			"    \\clef treble"
			"    \\time 4/4"
			"         \\tuplet 3/2 { c8 b a } d c b4. b8"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative g' { 
					\key g \major
					\clef treble
					\time 4/4
					\tuplet 3/2 { c8 b a } d c b4. b8
				}
			}
		}
	}	
}

\markup \headerThree { "Figures other than triplets" }

\markup \normalParagraph { 
			The \typewriter { "\\tuplet" } idea may have sounded more general to you than use for mere triplets. If so, you were right.
			The fraction-style notation can be used for ther figures. For example, if you wanted 5 beats for the quarter note duration, you would
use \typewriter { "\\tuplet 5/2" } as shown next.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative g' {"
			"    \\key g \major"
			"    \\clef treble"
			"    \\time 4/4"
			"         \\tuplet 5/2 { c8 b a b a } d c b4. b8"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative g' { 
					\key g \major
					\clef treble
					\time 4/4
					\tuplet 5/2 { c8 b a b a } d c b4. b8
				}
			}
		}
	}	
}

%{ NEED TO FIGURE OUT HOW TO DEAL WITH # IN URL
\markup \normalParagraph { 
			See http://lilypond.org/doc/v2.19/Documentation/learning/advanced-rhythmic-commands#tuplets for more details.
		}

%}

%{ ***********************************
   * 
   * DOTTED NOTES 
   * 
   *********************************** 
%}

\markup \headerTwo { "Dotted notes" }

\markup \normalParagraph { Dotted notes are easy. Just add a dot, like this: \typewriter { "." }
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    {"
			"         c. d8 e4 f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c4. d8 e4 f
				}
			}
		}
	}	
}






%{ ***********************************
   * 
   * GRACE NOTES
   * 
   *********************************** 
%}


\markup \headerTwo { "Grace notes" }
\markup \normalParagraph { 
			To add grace notes (which aren't included in the note count), use \typewriter { "\\grace" } followed by the grace note.
			In this case the \typewriter { "\\grace g16" } isn't applied to the measure count. 
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative a'"
			"    {"
			"         a4 g f \\grace g16 f4"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative a' { 
					a4 g f \grace g16 f4 
				}
			}
		}
	}	
}


%{ ***********************************
   * 
   * Trills
   * 
   *********************************** 
%}


\markup \headerTwo { "Trills" }
\markup \normalParagraph { 
			It is common to add a trill to a grace note. Use \typewriter { "\\trill" } directly after the note for this purposes.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative g'"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 6/8"
			"    {"
			"         \\grace c8\\trill b4. a8 g b"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative g' { 
				\key g \major
				\clef treble
				\time 6/8
					\grace c8\trill b4. a8 g b 
				}
			}
		}
	}	
}


%{ ***********************************
   * 
   * BEAMS
   * 
   *********************************** 
%}

\markup \headerTwo { "Beams" }

\markup \normalParagraph { 
		Lilypond does a good job guessing when notes need beams. Let's start with this example.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"	\\relative e'' {" 
			"		\\key e \\minor"
			"		\\time 2/4"
			"		e8 e e16 fis16 g8"
			"	}"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative e'' { 
					\key e \minor
					\time 2/4
					e8 e e16 fis16 g8
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	This is no accident. Just as LilyPond comes preset to 4/4 time and the key of C,
	it starts in a state called \typewriter { "\\autoBeamOn" }. As you've already
	guessed, that means there's also \typewriter { "\\autoBeamOff" }.
}



\markup \normalParagraph { 
		Let's separate notes using \typewriter { "\\autoBeamOff" }.
		}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"	\\relative e'' {" 
			"		\\key e \\minor"
			"		\\time 2/4"
			"		\\autoBeamOff"
			"		e8 e e16 fis16 g8"
			"	}"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative e'' { 
					\key e \minor
					\time 2/4
					\autoBeamOff
					e8 e e16 fis16 g8
				}
			}
		}
	}	
}


\markup \normalParagraph { 
	And you can mix and match at will, even within the same measure.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"	\\relative e'' {" 
			"		\\key e \\minor"
			"		\\time 2/4"
			"		\\autoBeamOff"
			"		e8 e"
			"		\\autoBeamOff"
			"		e16 fis16 g8"
			"	}"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative e'' { 
					\key e \minor
					\time 2/4
					\autoBeamOff
					e8 e 
					\autoBeamOn
					e16 fis16 g8
				}
			}
		}
	}	
}


\markup \headerThree { 
	Adding beams: Using \typewriter { "[" } and \typewriter { "]" } to replace flags with beams 
}

\markup \normalParagraph { 
	The last note of this measure is an example where one might wish to override \typewriter { autoBeamOn }. 
	No \typewriter { autoBeamOff }directive is necessary. For the second half of the note, just use surround the second through fourth notes with
	square brackets, like this: \typewriter { b32 [c32 d32 e32] }.
}


\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"	\\relative c' {" 
			"		\\time 3/4"
			"		c8 d"
			"		e16 f g a"
			"		b32 c32 d32 e32"
			"		b32 [c32 d32 e32]"
			"	}"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					\time 3/4
					c8 d 
					e16 f g a
					b32 c32 d32 e32
					b32 [c32 d32 e32]
				}
			}
		}
	}	
}


%{ ***********************************
   * 
   * PHRASE MARKS
   * 
   *********************************** 
%}


\markup \headerTwo { "Phrase marks" }

\markup \normalParagraph { 
	To add a phrase mark, surround \bold { all but the first note in the phrase } in
	parentheses: 
	 \typewriter { "( )" }.
}

\markup \normalParagraph { 
	In this example, we want the triplet to use a phrase mark. Here it is without
	the phrase mark. 
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 4/4"
			"    \\tuplet 3/2 {c8 b a} d c b4. b8"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\relative g' {
				\key g \major
				\clef treble
				\time 4/4
					\tuplet 3/2 {c8 b a} d c b4. b8 
			}
		}
	}	
}


\markup \normalParagraph { 
	Note the parentheses around the \typewriter { "(b a)" } only; not 
	the \typewriter { "(c8 b a)" } as you might suppose.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"\\relative g' {"
			"    \\key g \\major"
			"    \\clef treble"
			"    \\time 4/4"
			"    \\tuplet 3/2 {c8 (b a)} d c b4. b8"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			\relative g' {
				\key g \major
				\clef treble
				\time 4/4
				\tuplet 3/2 {c8 (b a)} d c b4. b8 
			}
		}
	}	
}

%{ ***********************************
   * 
   * ENDING WITH A DOUBLE BAR
   * 
   *********************************** 
%}

\markup \headerTwo { "Bar lines ending a phrase or piece" }

\markup \normalParagraph { 
	Lilypond has every kind of bar line you need to end the piece or a part of it.
}

\markup \headerThree { "Ending with a double bar" }

\markup \normalParagraph { 
	Use \typewriter { "\\bar" } and the bar style to end a piece.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    {"
			"         f e d c \bar \"|.\" "
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					f4 e d c \bar "|."
				}
			}
		}
	}	
}

\markup \headerThree { "Ending with a repeat" }

\markup \normalParagraph { 
	Use \typewriter { "\\bar \":|]\" " } to repeat a phrase.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    {"
			"         f e d c \bar \":|]\" "
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					f4 e d c \bar ":|]"
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	Lilypond has more bar options than most sane composers have ever contemplated. See http://lilypond.org/doc/Documentation/notation/bars for more details.
}



%{ ***********************************
   * 
   * FERMATAS
   * 
   *********************************** 
%}


\markup \headerTwo { "Fermatas" }

\markup \normalParagraph { 
	To add a fermata over a note, simply append \typewriter { "\\fermata" } to it with no space.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"	\\relative g' {"
			"		\\key g \\major"
			"		\\clef treble"
			"		\\time 6/8"
			"		g8 a b d4.\fermata"
			"	}"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative g' { 
					\key g \major
					\clef treble
					\time 6/8
					g8 a b d4.\fermata
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	See "http://lilypond.org/doc/v2.19/Documentation/notation/list-of-articulations#fermata-scripts" for more fermata options.
}


%{ ***********************************
   * 
   * DOCUMENTATION TEMPLATE
   * 
   *********************************** 
%}

%{
\markup \headerTwo { "XXHeader2" }

\markup \normalParagraph { 
	Text example with \typewriter { "\\typewriter" }.
}

\markup {
	\vspace #1
	\column {
		\hspace #8 \column \typewriter {
			#versionNumber
			"{"
			"    \\relative c'"
			"    {"
			"         c d e f"
			"    }"
			"}"
		}
	}
	\column {
		\line { " " }
		\line { " " }
		\line { " " }
		\score {
			{ 
				\relative c' { 
					c d e f 
				}
			}
		}
	}	
}

\markup \normalParagraph { 
	Concluding graf
}

%}












