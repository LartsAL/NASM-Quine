# NASM Quine

## Description

**Quine** is a program that produces a copy of its own source code as its only output without reading it from a file. [(Wikipedia)](https://en.wikipedia.org/wiki/Quine_(computing))

Here's a quine written in x86_64 NASM. Of course, it is completely useless. The only purpose of it is to challenge the author.

## Build and run
To build you need NASM compiler installed:

```
sudo apt-get install nasm
```

Then just:

```
nasm -f elf64 quine.asm
ld quine.o -o quine
```

Make executable and run with:

```
chmod +x quine
./quine
```
