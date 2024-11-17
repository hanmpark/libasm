# libasm
The aim of this project is to get familiar with assembly language

## Basic concepts
### Registers
Assembly works mainly with registers. They can be compared to little pre-defined boxes that can store data.

The general-purpose registers are: `rax`, `rcs`, `rbx`, `rdx`, `rsi`, `rdi`, `rsp`, `rbp`, `r8`, `r9`, ...`r15`, `rip`

We have to be careful when putting data in those registers, because they can be used by the system at any time (read or written).

Among the above registers for example:
- `rax` is used to store the return value of a function
- `rcx` is used as a counter in loops
- `rbp` is used to store the base pointer
- `rdi`, `rsi`, `rdx`, `rcs`, `r8`, `r9` are used respectively to pass arguments, vulgarly like `function(rdi, rsi, rdx, rcs, r8, r9)`

### execution flow
Assembly is read *from top to bottom*.

The instruction can be grouped in labels, which are used to mark a specific point in the code. They are followed by a colon.

One thing that can be confusing is that although labels look like functions in other languages like C, they are not.

### Syntax
> The syntax used in this repositroy is the Intel syntax. It is the most common syntax used in assembly programming, and a requisite of the subject. It is characterized by the fact that the destination operand is on the left and the source operand is on the right.

### Instructions
Virtually all the lines in assembly are composed of an instruction followed by its operand(s).

### Behavior
It is very important to remember that every instruction can alter the behavior of the program implicitly.

For example: the `cmp` instruction will set the flags register according to the result of the comparison.

### Addressed and values
Like in C, we can work with addresses.

The square brackets `[]` are used to dereference an address.

For example, if we want to move the value at the address `0x1234` into the register `rax`, we can do:
```
cmp rax, [0x1234]
```

> Here we should technically use an identifier for the address (`BYTE`, `WORD`, `DWORD`, `QWORD`) to specify the size of the data we want to compare, but we ignored it for the sake of this explanation.

### Exporting symbols
In order to use the functions we write in assembly in a C program, we need to export them.

To do so, we can use the `global` directive.

For example, if we want to export the function `ft_strlen`, we can do:
```
global ft_strlen
```

For more information check [this site](!https://medium.com/@leogaudin/libasm-a-guide-to-get-familiar-with-assembly-in-42-830f619f4c5e)
