# CIS310: Assembly Language Program for String Reversal

## Student Name and Email
Leah Mirch (lmirch@umich.edu)

## Introduction
This project demonstrates assembly language programming using the Irvine Library. The program performs string reversal, displays results, and dumps register contents. It showcases the use of assembly instructions to manipulate data and perform operations directly on hardware registers.

## Assembly Program Overview
### LeahMirch.asm
This file contains an assembly language program that:
- Defines a source string "Leah Mirch" and an empty target string.
- Reverses the characters in the source string and stores them in the target string.
- Displays the reversed string and dumps register contents to the screen.

## Code Explanation
```assembly
INCLUDE Irvine32.inc

.data
    ; Define source string with "Leah Mirch" and a corresponding empty target string.
    source BYTE "Leah Mirch", 0
    target BYTE SIZEOF source DUP(0)

.code
main PROC

    ; Find the length of the source string
    mov edx, OFFSET source
    call calculateStrLength      ; ECX will hold the length

    ; Setting pointers for traversing the strings.
    ; EBX will be used to point to the current character in the source string.
    ; EDI will be used to point to the current character in the target string.
    lea ebx, [source + ecx - 1]  ; Point to the last character in the source
    mov edi, OFFSET target

    ; Begin the character reversal loop
ReverseLoop:
    ; Check if all characters from source are reversed into target
    cmp ebx, OFFSET source
    jl ReversalComplete

    ; Move the character from source to target
    mov al, [ebx]
    mov [edi], al

    ; Update pointers: move to the next position in target and the previous character in source
    inc edi
    dec ebx
    jmp ReverseLoop

ReversalComplete:
    ; Null-terminate the target string
    mov byte ptr [edi], 0

    ; Display the original and reversed strings
    mov edx, OFFSET source
    call WriteString
    call Crlf

    mov edx, OFFSET target
    call WriteString
    call Crlf

    ; Exit the program
    call WaitMsg
    call ExitProcess

main ENDP
END main
```

## Running Instructions
### Prerequisites
- Microsoft Visual Studio with MASM (Microsoft Macro Assembler).
- Irvine32 library installed.

### Compilation and Execution
1. Open the project in Microsoft Visual Studio.
2. Ensure the `LeahMirch.asm` file is included in the project.
3. Build the project.
4. Run the project to see the output.

## Expected Output
The program displays the original string "Leah Mirch" followed by its reversed version "hcriM haeL".

## Screenshots
### Build Output
![Screenshot 1](./Screenshot%201.png)

### Program Execution
![Screenshot 2](./Screenshot%202.png)

This README.md file provides a comprehensive overview of the assembly language project, including the program's purpose, code explanation, running instructions, and screenshots of the output.