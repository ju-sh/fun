# long long int fact (long long int n) {
#     if (n < 1) {
#         return f;
#     } else {
#         return n * fact(n - 1);
#     }
# }

.global main
.data

.text

fact:
    bgt  x10, x0, recurse    # non-base case: n > 0
    addi x10, x0, 1          # return 1
recurse:
    addi  x2, x2, -16        # expand stack (x2 is SP)
    sw x10, 8(x2)            # save n to stack
    sw x1, 0(x2)             # save return address to stack
    addi x5, x10, -1         # calculate (n - 1)
    add x10, x5, x0          # set up (n-1) as argument to next function call
    jal x1, fact             # recursive function call
    lw x1, 0(x2)             # retrieve original return address
    lw x5, 8(x2)             # retrieve original n
    mul x10, x5, x10         # set up return value as (n * fact(n-1))
                             # mul available only in RV64M mulitply extension
over:
    jalr x0, 0(x1)           # return from fact() to caller function
