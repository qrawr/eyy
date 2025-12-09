# bubblesort.s - Bubble sort 10-element array at 0x400

addi s0, zero, 0x400    # base address
addi s1, zero, 1        # swapped flag
addi s2, zero, 0        # loop index

outer_loop:
    addi s1, zero, 0    # swapped = 0
    addi s2, zero, 0    # i = 0

inner_loop:
    addi t0, s2, 0
    slli t1, t0, 2      # offset = i*4
    add t2, s0, t1      # &sortarray[i]
    lw t3, 0(t2)        # sortarray[i]
    lw t4, 4(t2)        # sortarray[i+1]

    bge t4, t3, no_swap

    sw t4, 0(t2)
    sw t3, 4(t2)
    addi s1, zero, 1    # swapped = 1

no_swap:
    addi s2, s2, 1
    blt s2, 9, inner_loop

    bne s1, zero, outer_loop

done:
