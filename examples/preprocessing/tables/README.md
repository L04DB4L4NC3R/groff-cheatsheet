### Tables in Groff

Tables can be made using the GNU tbl preprocessor:

```sh
tbl test.ms | groff -ms -Tpdf > o.pdf
```

The format of a table is the following:

```
.TS
options ;
format 
format-continued.
table
.TE
```

You can also use the `-t` flag in groff to use this preprocessor. See [this file](./table.ms) for reference.
