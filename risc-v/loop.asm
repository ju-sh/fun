# for(i=0; i<100; ++i) {
#     a[i] = b[i] + c;
# }

.global main
.data

.text
main:
      addi x6, x0, 100
      addi x5, x0, 10
      sw   x5, 0(x6)
      addi x5, x5, 1
      sw   x5, 8(x6)

begin:
      addi x5, x0,  80 
      add  x6, x0,  x0 
loop: add  x8, x28, x6
      add  x7, x29, x6
      lw   x7, 0(x7)      
      add  x7, x7,  x30
      sw   x7, 0(x8)      
      addi x6, x6,  8  
      bne  x6, x5,  loop
