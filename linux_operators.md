---
tags:
  - linux
  - terminal
---
# | Operator

The pipe operator is used to funnel the output from one command as input to another.

```bash
# Displays all ".txt" 
ls | grep "*.txt"
```

```bash
# Counts the lines that contains the work error
cat file.txt | grep "error" | wc -l
```

# > Operator

The `>` operator redirects a command's standard output into a file instead of displaying it in the terminal. If the file doesn't exist, Linux creates it. If it already exists, its previous contents are overwritten.

```bash
ls > files.txt
```

To append output without deleting existing contents, use `>>`:

```bash
# Appends instead of overwriting
ls >> files.txt
```

In Linux, `>|` is a special redirection operator that forces a file to be overwritten, even when the shell's noclobber option is enabled.




