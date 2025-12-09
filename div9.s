# div9.s - Check divisibility by 9 using repeated subtraction
# a0 contains positive number input
# Output: a0 = 1 if divisible by 9, else 0

addi t0, zero, 9      # divisor = 9

loop:
    blt a0, t0, not_div   # if a0 < 9 → not divisible
    sub a0, a0, t0        # a0 -= 9
    j loop

not_div:
    bne a0, zero, end     # if remainder != 0 → not divisible
    addi a0, zero, 1      # divisible → return 1
    j finish

end:
    addi a0, zero, 0      # not divisible → return 0

finish:
