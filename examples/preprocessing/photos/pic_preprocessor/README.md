### Graphics in groff

The GNU pic preprocessor is able to generate graphics using the following syntax:

```sh
.PS
<pic syntax>
.PE
```

View the pic syntax reference from [here](./gpic.pdf)

---

A great way to add graphics/diagrams is to use the software called `xfig`. Draw anything you like in it and export it as `TPIC`. Then open the exported files and copy paste the pic syntax on the .PS .PE block.
