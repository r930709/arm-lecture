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
	
	@ use suffix & Thumb2 code 3
	subs r0, #1     @ r0 = r0 - 1,and judge cpsr
	ite lt          @ if then else
	movlt r0, r5    @ then{ r0 = r5}
	bge .loop       @ else{ jump to .loop}
	
	pop {r3, r4, r5, r6, pc}		@EPILOG
	
	@ END CODE 
	.size fibonacci, .-fibonacci
	.end
