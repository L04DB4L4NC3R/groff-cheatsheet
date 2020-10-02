## Research paper samples
Research paper samples in single and double column layout

---

The research paper uses `refer` and `tbl` preprocessors.

```sh
# refer is for citations
# -e is for accumulating references into a reference section
# -t is for the tbl preprocessor
# -U is the unsafe mode, for PDFPIC
refer -p ./bibliography.ref -e -PS report.ms | groff -ms -Kutf8 -t -U -Tpdf > report.pdf
refer -p ./bibliography.ref -e -PS report_two_col.ms | groff -ms -Kutf8 -t -U -Tpdf > report_two_col.pdf
```

* [double column layout](./double_column_research_paper.ms)
* [single column layout](./single_column_research_paper.ms)
* [bibliography](./bibliography.ref)
