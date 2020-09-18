### Photos in groff

* Photos in groff require a `.PDFPIC` register, which takes PDF photos. It can be used with the -C -R -L for left, right and center respectively.

```sh
.PDFPIC -[L|C|R] [Width[Height]] "image_path.pdf"
```

* To convert a normal image to pdf, you can use imagemagick:

```sh
sudo pacman -S imagemagick

convert p.png p.pdf
```

* Compilation can be done without any macros:

```sh
groff -ms photo.ms -Tpdf > o.pdf
```

See [this file](./photo.ms) for reference
