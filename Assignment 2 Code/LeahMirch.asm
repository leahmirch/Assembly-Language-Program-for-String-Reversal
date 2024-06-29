INCLUDE Irvine32.inc

.data
; Define source string with "Leah Mirch" and a corresponding empty target string.
source BYTE "Leah Mirch", 0
target BYTE SIZEOF source DUP(0)

.code
main PROC

   ; Find the length of the source string
   mov edx, OFFSET source
   call calculateStrLength    ; ECX will hold the length

   ; Setting pointers for traversing the strings.
   ; EBX will be used to point to the current character in the source string.
   ; EDI will be used to point to the current position in the target string.
   lea ebx, [source + ecx - 1]  ; Point to the last character of source
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
   loop ReverseLoop

ReversalComplete:
   ; Display the original source string
   mov edx, OFFSET source
   call WriteString
   call Crlf

   ; Display the reversed target string
   mov edx, OFFSET target
   call WriteString
   call Crlf

   ; Cleanly exit the program
   exit
main ENDP

; Function to compute the length of a given null-terminated string
calculateStrLength PROC
   ; Initialize ECX to 0. ECX will hold the length of the string.
   xor ecx, ecx

LengthLoop:
   ; Fetch the current character and check if it's the end of the string
   mov al, [edx]
   test al, al
   je EndOfStr

   ; If not, increment the counter and move to the next character
   inc ecx
   inc edx
   jmp LengthLoop

EndOfStr:
   ret
calculateStrLength ENDP

END main