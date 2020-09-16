## Groff Cheatsheet
The helpful groff cheatsheet, taken from various sources

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
| .NH xxx | Numbered heading where numbers specify levels of depth |
| .SH | Section heading (un-numbered) |

### Text Formatting

| Command | Functionality |
|:-------:|:-------------:|
| .B | Bold |
| .I | Italics |
| .BI | Bold and Italics |
| .P1 | |
| .BX | Box |
| .UL | Underline |
| .LG | |
| .SM | |
| .NL | |

### Paragraph Formatting

| Command | Functionality |
|:-------:|:-------------:|
| .PP | Standard paragraph |
| .QP | Quoted paragraph |
| .XP | The XP macro produces an exdented paragraph. The first line of the paragraph begins at the left margin, and subsequent lines are indented (the opposite of PP). |
| .R | |
| .CW | |
| .RS | |
| .RE | |
| .IP | List points. Use `.IP \(bu [width]` for bullet points with given width |
| .TA | Tabbing |

### Headings

| Command | Functionality |
|:-------:|:-------------:|
| .LH | Left heading |
| .CH | Center heading |
| .RH | Right heading |
| .LF | |
| .CF | |
| .RF | |
| .OH | |
| .EH | |
| .PX | |

### Pre Processing
| Command | Functionality |
|:-------:|:-------------:|
| .TS [H] and .TE | |
| .PS and .PE | |
| .EQ [align] and .EN | |
| .[ and .] | |

### Defining macros

| Command | Functionality |
|:-------:|:-------------:|
| .de and ... | You can define macros between the block. See [this example](./double_column_research_paper.ms) |
| .so filename | Source macros from filename |
