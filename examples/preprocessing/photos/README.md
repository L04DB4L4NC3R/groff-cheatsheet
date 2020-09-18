### Graphics and Photos using GNU troff

The `pic` preprocessor can be used for creating and inserting diagrams in groff. It comes with its own turing incomplete language. See [the pic preprocessor](./pic_preprocessor) for details.

Inserting images can be done by:

* [PSPIC macro](./PSPIC) (does not require any preprocessor), but it does not work on PDF output type
* [PDFPIC macro](./PDFPIC), which can be used for inserting PDF images in a groff document
