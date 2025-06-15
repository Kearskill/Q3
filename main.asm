; Author: Kearney Leith Julius
; Program Name: Q3.asm
; Program Description: Write a program that prompts the user for three 32-bit integers stores them in an array,
;					   calculates the sum of the array, and displays the sum on the screen. 
; Date: 15 June 2025

INCLUDE Irvine32.inc

.data
input SDWORD ?, ? , ?									; Array to store three integers
question BYTE "Enter 32-bit integers: ", 0				; Prompt for input
answer BYTE "The sum of the 32-bit integers is: ", 0	; Message to display the sum

.code
main PROC

	; 
	mov ecx, LENGTHOF input ; Set loop counter for 3 integers
	mov edi, OFFSET input   ; Point EDI to the start of the input array

Loop1:
	mov edx, OFFSET question ; Load the address of the question
	call WriteString         ; Display the question
	call ReadInt           ; Read an integer from the user

	mov [edi], eax          ; Store the integer in the array
	add edi, TYPE input ; Move to the next element in the array
	loop Loop1              ; Repeat for 3 integers

	mov eax, 0					;initialize eax	to 0 for sum
	mov ecx, LENGTHOF input ; Reset loop counter for summation
	mov edi, OFFSET input   ; Reset EDI to the start of the input array

Loop2:
	add eax, [edi]          ; Add the current integer to the sum
	add edi, TYPE input     ; Move to the next element in the array
	loop Loop2              ; Repeat for all integers
	mov edx, OFFSET answer  ; Load the address of the answer message
	call WriteString         ; Display the answer message
	call WriteInt            ; Display the sum in EAX
	call Crlf               ; Print a new line

exit
main ENDP
END main