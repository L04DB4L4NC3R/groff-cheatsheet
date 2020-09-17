### Citations using refer

* GNU refer is a preprocessor for groff which allows us to cite any article in our bibliography. Run the following command to run it:

```sh
refer -p ./bibliography.ref cite.ms | groff -ms -Tpdf > o.pdf
```

* To accumulate all your citations into a reference section, you can use a `-e` flag:

```sh
refer -p ./bibliography.ref -e cite.ms | groff -ms -Tpdf > o.pdf
```

* More common citation formats:

```sh
refer -p ./bibliography.ref -e -PS cite.ms | groff -ms -Tpdf > o.pdf
```
