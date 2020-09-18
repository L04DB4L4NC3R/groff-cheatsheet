### Photos in groff

* Photos in groff require a `.PSPIC` register, which takes postscript photos. It can be used with the -C -R -L for left, right and center respectively.

```sh
.PSPIC -[L|C|R] "image_path.eps"
```

* To convert a normal image to postscript, you can use imagemagick:

```sh
sudo pacman -S imagemagick

convert p.png p.eps
```

* Compilation can be done without any macros:

```sh
groff -ms photo.ms -Thtml > o.html
```

* Note that PSPIC only supports `-Thtml -Txhtml -Tps -Tdvi` formats. For other formats, the image is replaced by an empty rectangle

See [this file](./photo.ms) for reference
