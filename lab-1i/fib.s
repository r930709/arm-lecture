	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}
	
	
	@ r3 = -1(previous) , r4 = 1(result) , r5 = sum , r6 = i, r0 = x
	mov r3, #-1  
	mov r4, #1
 	mov r5, #0
	mov r6, #0

.loop:
	@ sum = result + previous
	add r5, r3, r4 
	
	@ previous = result
	mov r3, r4

	@ result = sum
	mov r4 , r5
	
		
	@ check whether i <= x, it means check whether x-i>= 0 
	add r6, #1     @ r6 = r6 + 1(i++)
	cmp r0, r6     @ r0 - r6 ? (x-i ?)
	bge .loop
	mov r0 ,r5     @ put sum to return result 
		
	pop {r3, r4, r5, r6, pc}		@EPILOG
	
	@ END CODE 
	.size fibonacci, .-fibonacci
	.end
