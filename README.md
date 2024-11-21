# NASM Quine

## Description

**Quine** is a program that produces a copy of its own source code as its only output without reading it from a file. [(Wikipedia)](https://en.wikipedia.org/wiki/Quine_(computing))

Here's a quine written in x86_64 NASM. Of course, it is completely useless. The only purpose of it is to challenge the author.

## Build and run
To build you need NASM compiler installed:

```
sudo apt-get install nasm
```

Then compile and link:

```
nasm -f elf64 quine.asm
ld quine.o -o quine
```

Make file executable and run with:

```
chmod +x quine
./quine
```

As a result, quine will output its source code.

## Similarity check

To check that the output and the source file really have no differences, you can use the `diff` utility.

Save the output to some file:

```
./quine > test.txt
```

And then run:

```
diff -s test.txt quine.asm
```

It will report that the content of the files is identical.
