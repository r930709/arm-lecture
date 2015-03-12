    .text     //(此開始標簽以下的部分將是processor要run的instructions) 

    _start: .global _start   //(_start不單純只是名稱，其代表程式的進入點，等價於C語言的main()，告訴

                            //  鏈接器ld入口是_start，為了讓其他檔案的程式能夠使用此程式，所以使用標簽

                            //  .global宣告此程式碼的全域性質)

    //(以下將是printf("")、return(0)的組語寫法，就是call兩個system_call()sys_write(),sys_exit())

    @ sys_write ( fd, pstr, len)   //(sys_write()會使用到的傳遞參數)     

            @ r7=4 r0 r1 r2        //對應到Linux Syscall table

            mov r0, #1 @ fd <- stdout   //(將 stdout 指定給 fd，1為output to the console)

            adr r1, msg @ pstr <- *msg   //(msg 的位址丟給 pstr,r1去接)

            mov r2, #14 @ len <- 14    //(14 是 "Hello, world!\n" 的字元長度丟給len,r2去接)

            mov r7, #4 @ syscall <- sys_write 

            swi 0 @ system call //(發出Software interrupt，將準備進入kernel mode執行system call

                                //   也就是執行sys_write())

    @ sys_exit ( exitcode )      //(sys_exit()會使用到的傳遞參數)

            @ r7=1 r0            //對應到Linux Syscall table

            mov r0, #0 @ exitcode <- 0  //(exitcode就是exit的status)

            mov r7, #1 @ syscall <- sys_exit

            swi 0 @ system call //(發出Software interrupt，將準備進入kernel mode執行system call

                                //   也就是執行sys_exit()，r0=0代表exit success)

    msg:

            .asciz "Hello, world!\n"

            .end    //(end of file)
