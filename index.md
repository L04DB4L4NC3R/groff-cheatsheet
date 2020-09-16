## Groff Cheatsheet
The helpful groff cheatsheet along with examples. **contributions are welcome**.

---

## Index

* [General](#general)
* [Text Formatting](#text-formatting)
* [Paragraph Formatting](#paragraph-formatting)
* [Headings](#headings)
* [Pre Processing](#pre-processing)
* [Custom Macros](#custom-macros)

<br>

---

### General
| Command | Functionality |
|:-------:|:-------------:|
| .RP [no] | Prints cover page on its own. Can be avoided with `.RP no` |
| .TL | Title of the document |
| .AU | Author Name |
| .AI | Author Institution |
| .AB [no] and .AE block | Abstract beginning and end blocks. `.AB no` ensures the abstract keyword is silenced |
| .DA [XXX] | Current date on title page and footers |
| .ND [XXX] | Current date only on the title page |
| .1C | 1 columned layout |
| .2C | 2 columned layout |
| .MC [WIDTH[GUTTER]] | Multiple column layout (by default 2 with no args) |
| .XS page_num and .XE | Table of contents block |
| .XA page_num | Entry in the table of contents block |
| .PX | Print a manually-generated table of contents without resetting the page number. |

<br>

---

### Text Formatting

| Command | Functionality |
|:-------:|:-------------:|
| .B | Bold |
| .I | Italics |
| .BI | Bold and Italics |
| .P1 | Prints the header on page 1. The default is to suppress the header. |
| .BX | Box |
| .UL | Underline |
| .LG | Prints all text following in larger type (2 points larger than the current point size) |
| .SM | Prints all text following in smaller type (2 points smaller than the current point size) |
| .NL | Prints all text following in the normal point size |
| .R | Sets its first argument in roman (or regular) type. It operates similarly to the B macro otherwise. |
| .CW | Sets its first argument in italic type. It operates similarly to the B macro otherwise. |

<br>

---

### Paragraph Formatting

| Command | Functionality |
|:-------:|:-------------:|
| .PP | Standard paragraph |
| .QP | Quoted paragraph |
| .XP | The XP macro produces an exdented paragraph. The first line of the paragraph begins at the left margin, and subsequent lines are indented (the opposite of PP). |
| .RS and .RE | Start and end a section of indented text, respectively. The PI register controls the amount of indent. |
| .IP | List points. Use `.IP \(bu [width]` for bullet points with given width. Use `.IP [number]` for numbered points. |
| .TA | Tabbing |

<br>

---

### Headings

| Command | Functionality |
|:-------:|:-------------:|
| .NH xxx | Numbered heading where numbers specify levels of depth |
| .SH | Section heading (un-numbered) |
| .LH | Left heading |
| .CH | Center heading |
| .RH | Right heading |
| .LF | Left footer |
| .CF | Center footer |
| .RF | Right footer |
| .OH | Headers for odd pages. eg: `.OH 'left'center'right'` |
| .EH | Headers for even pages. |

<br>

---

### Pre Processing
| Command | Functionality |
|:-------:|:-------------:|
| .TS [H] and .TE | Denotes a table, to be processed by the tbl preprocessor. The optional H argument instructs groff to create a running header with the information up to the TH macro. |
| .PS and .PE | Denotes a graphic, to be processed by the pic preprocessor. You can create a pic file by hand, using the AT&T pic manual available on the Web as a reference, or by using a graphics program such as xfig. |
| .EQ [align] and .EN | Denotes an equation, to be processed by the eqn preprocessor. The optional align argument can be C, L, or I to center (the default), left-justify, or indent the equation. |
| .[ and .] | References and citations block, to be processed by the refer preprocessor. |

<br>

---

### Custom Macros

| Command | Functionality |
|:-------:|:-------------:|
| .de and ... | You can define macros between the block. See [this example](./examples/double_column_research_paper.ms) |
| .so filename | Source macros from filename |
