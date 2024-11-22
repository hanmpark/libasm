# libasm
The goal of this project is to get familiar with assembly language.

## Basic Concepts
### Registers
Assembly programming primarily involves working with **registers**. Registers can be thought of as small, predefined storage locations in the CPU that hold data.

The general-purpose registers in x86-64 are:
`rax`, `rcx`, `rdx`, `rbx`, `rsp`, `rbp`, `rsi`, `rdi`, `r8` to `r15`, and `rip`.

It’s important to handle registers with care because they may be used by the system at any time (for both reading and writing). Here are some key examples:
- **`rax`**: Stores the return value of a function.
- **`rcx`**: Commonly used as a counter in loops.
- **`rbp`**: Holds the base pointer, typically for stack frames.
- **`rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`**: Used for passing function arguments, in the order: `function(rdi, rsi, rdx, rcx, r8, r9)`.

### Execution Flow
Assembly instructions are executed **sequentially, from top to bottom**.

Instructions can be grouped into **labels**, which act as markers in the code. A label is defined with a name followed by a colon (`:`).

> [!NOTE]
> Although labels may resemble functions in higher-level languages like C, they are not functions.

### Syntax
The syntax used in this repository follows **Intel syntax**, the most common assembly syntax. This syntax requires the **destination operand to be on the left** and the **source operand to be on the right**.

### Instructions
In assembly, most lines consist of an **instruction** followed by its operand(s). Operands may represent data, addresses, or registers.

### Behavior
Each assembly instruction may **implicitly alter program behavior**. For instance:
- The `cmp` instruction compares two operands and sets flags in the **flags register** based on the result. These flags can then influence subsequent instructions, such as conditional jumps.

### Addresses and Values
Similar to C, assembly allows working with **addresses**.

To dereference an address, use square brackets `[]`. For example:
```asm
cmp rax, [0x1234]
```
This compares the value at memory address `0x1234` with the value in the rax register.
> [!NOTE]
> In practice, you should specify the size of the data being referenced (e.g., `BYTE`, `WORD`, `DWORD`, `QWORD`). For simplicity, this example omits the size specifier.

#### The `rsp` register
The `rsp` register stands for **Stack Pointer**. It is a special-purpose register that points to the **top of the stack** in memory. The stack is a region of memory used for storing data such as function arguments, return addresses, and local variables during program execution.

Key points about the `rsp` register:
- **Automatically managed**: The `rsp` register is adjusted automatically when certain instructions like `push` or `pop` are used:
  - `push` decreases the value of `rsp` and stores data at the new stack location.
  - `pop` retrieves data from the top of the stack and increases `rsp`.
- **Stack growth**: In x86-64 architecture, the stack grows **downward** (towards lower memory addresses). This means that when data is pushed onto the stack, the value of `rsp` decreases.
- **Manual adjustment**: In some cases, assembly programmers adjust `rsp` directly (e.g., for aligning the stack or reserving space for local variables).

##### example
```
push rax    ; Decrease rsp, store rax on the stack
pop rbx     ; Retrieve value from stack into rbx, increase rsp
```

> [!IMPORTANT]
> Ensure `rsp` is **16-byte aligned** before function calls to meet **Application Binary Interface (ABI)** requirements.

### Exporting Symbols
To use assembly functions in a C program, you need to **export** them using the `global` directive. For example:
```
global ft_strlen
```
This makes `ft_strlen` symbol available to the linker.

---
### Testing All Functions
The `test` rule in the Makefile is used to compile and run tests for all implemented functions. It ensures that all functionality behaves as expected.
```
make test
```
---
### Sources
- [Medium](https://medium.com/@leogaudin/libasm-a-guide-to-get-familiar-with-assembly-in-42-830f619f4c5e)
- [Cheat Sheet](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)
