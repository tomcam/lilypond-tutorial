\include "styles.ly"
\include "version.ly"

% Layout block is score-specific layout settings
\layout {
	line-width = 6.0\in
	right-margin = 4.0\in
}

% See "http://lilypond.org/doc/v2.18/Documentation/notation/the-paper-block"
% See "http://lilypond.org/doc/v2.18/Documentation/notation/horizontal-spacing-paper-variables#paper-variables-for-widths-and-margins"
\paper {
 	top-margin = 0.5\in
	right-margin = 2.0\in
	ragged-right = ##t % Document the ##t thing! I tried #t, \#t, etc.
%	line-width = 4.0\in
}

\paper {
	% This had no effect:
	% #(set-global-staff-size 30)

	#(define fonts
		(set-global-fonts
			#:roman "Baskerville"
		))
}

%{ ***********************************
   FONT EXPERIMENTS

			SANS
			Nice, but doesn't go great with Baskerville as roman
			#:sans "Verdana"
			#:sans "AppleGothic"

			To heavy & informal			
			#:sans "DIN Alternate Bold"

			ROMAN
			Best so far. Font is a little light.
			#:roman "Baskerville"

			Good. Font is satisfyingly heavy.
			#:roman "Marion"

			Good but 80s-style narrow. Best size is \huge
			#:roman "Bodoni 72"

			Good. Slightly old-fashioned. A little too heavy.
			#:roman "Georgia"

			Pretty good.
			#:roman "Charter"

			Good. Slightly old-fashioned.
			#:roman "Athelas"

			Probably good. Small as tested.
			#:roman "Times New Roman"

			Shows up small. A bit old-fashioned.
			#:roman "Didot"

			Looks 1920s
			#:roman "Cochin"

			Nice but too narrow
			#:roman "AppleMyungjo"

   *********************************%}


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
   * << and >>
   * Standardize a way to express URLS
   * Metronome marks. See http://lilypond.org/doc/v2.18/Documentation/notation/displaying-rhythms 

   INVESTIGATE
   
   * Why does the # in this URL cause an error on compilation?

	\markup \normalParagraph { 
	For more, see http://lilypond.org/doc/v2.18/Documentation/notation/	writing-rhythms#durations
	}

   * Figure out why this doesn't word wrap:
	\markup \normalParagraph { "Now compile it. Compiling, also called typesetting, converts the code you wrote into beautifully engraved sheet music." }

    * How can I make columns of fixed width in text markup? 
      I would like column 2 to start 50% in for all my 2-column examples." }

    * Figure out how to do version declarations as macros.
      Updating the markup would only need to be done once

   *********************************** 
%}



%{ ***********************************
   * 
   * WRITING THE SCORE 1.
   * 
   *********************************** 
%}

% \markup \override #'(font-size . 4)

\markup \headerOne  { "Writing tunebooks with Lilypond" }

\markup  {
	\column {
		{
			\n { "The Lilypond documentation is pretty complete but a little light on end-to-end tutorial material." 
"This book shows you how to use the subset of its features required to write songs in lead sheet style."
"Normally it's a single melody line with lyrics." 
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
		\normalParagraph { 
			{ "The first line you should write is" }
			\typewriter {"\\version"} 
			{" followed by whatever the current version of Lilypad is in quotes. For example:"}
		}
		\normalParagraph { \typewriter {"\\version \"2.19.54\"" }}
		\normalParagraph { "If you don't know which version you're running, here's out to find out:" }
		\bulletParagraph { "From the" \bold { LilyPond } "menu, choose" \bold About. }
		\bulletParagraph { "Follow it with the notes of the score. The whole file should look like this:" }
		\line { " " }
		\typewriter {
			"\\version \"2.19.54\"" 
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
   * CHANGING THE CLEF
   * 
   ********************************* 
%}

\markup \headerTwo { "Changing the clef" }
\markup \normalParagraph { 
			That's probably  not how you want these notes represented.
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
			It's not just bass and treble. Lillypond has a huge variety of clefs available.
			More common clefs include 
			\typewriter { "tenor" },
			\typewriter { "alto" }, and
			\typewriter { "percussion" }, but you'll see a host of others at \typewriter { http://lilypond.org/doc/Documentation/notation/clef-styles}.
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

\markup \headerThree { Each \typewriter { "'" } raises the pitch an octave }

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


\markup \headerThree { Each \typewriter { "," } lowers the pitch an octave }

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
			"}"
			"{"
			"    \\relative c, {"
			"         c d e f"
			"    }"
			"}"
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

\markup \headerTwo { "Comments--adding notes to yourself in the score" }

\markup \normalParagraph { 
			Suppose you want to include a message to yourself in the score but you
			don't want it to appear in the final output. You can do that with comments.
			Single-line comments start with a \typewriter { "%" }.
			Copy this, then compile it. The comments do not appear in the final output. That's a feature, not a bug.
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
			{ 
				\relative c' { 
					c d e f 
					g a b c
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
			LilyPond defaults to 4 beats per measure but of course that's easily changed using \typewriter { "\\time:" } 
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
			You can change time signatures at any point: 
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

\markup \headerThree { Append \typewriter { "es" } to make a note flat }

\markup \normalParagraph { 
	Append \typewriter { "es" } to a note name to give it a flat sign. 
}

\markup \headerThree { Append \typewriter { "is" } to make a note sharp }

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

\markup \normalParagraph { 
			TODO: More about this. Explain lists and why the braces are required.
		}

%{ ***********************************
   * 
   * KEY SIGNATURE
   * 
   *********************************** 
%}


\markup \headerTwo { "Changing the key signature" }

\markup \normalParagraph { 
			Define the key signature using \typewriter { "\\key"}, followed by its letter, followed by \typewriter { "\\major" }
			or \typewriter { "\\minor" }.
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
			"    {"
			"         g f e d   % WRONG for the key of G!"
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

\markup \normalParagraph { 
			Concluding graf
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

\markup \normalParagraph { 
			Concluding graf
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
			"		e8 e fis16 g8"
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
	Concluding graf
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






