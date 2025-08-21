## Bootstrapping

`hoon.hoon` contains the Hoon language, standard library, and compiler. Naively, I'd expect that you could make the codebase clearer by separating these concerns out into their own files. (Theoretically, the five layers already split these concerns into discrete modules, but it's not clear to me how well they actually do this, and separate files would force the issue.)

However, the Hoon compiler itself being written in Hoon means that we have to think recursively. It's not possible to reason about why the Hoon compiler, and `hoon.hoon` as a whole, is as it is until I have an understanding of how the Arvo boot process relates to Hoon bootstrapping itself.

<this doc is unfinished, but the bootstrap compiler in practice is actually just the regular hoon compiler.>

#### Appendix

- [Core Academy 5. Arvo II: The Boot Sequence](https://docs.urbit.org/build-on-urbit/core-academy/ca04)