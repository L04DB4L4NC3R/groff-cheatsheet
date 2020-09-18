### Mathematical equations in groff

GNU eqn is a preprocessor for groff that understands syntactical equations. Run the following:

```sh
eqn eqns.ms -Tpdf | groff -ms -Tpdf > o.pdf
```

You can also use the `-e` flag in groff to use this pre-processor. See [this file](./eqns.ms) for reference.
