# bubblesort.s - Corrected Bubble sort 10-element array at 0x400
# Array: 10 words starting at address 0x400
# Uses s0 as base address, s1 = swapped flag, s2 = index i
# t0-t6 used as temporaries

    .text
    .globl main
main:
    addi s0, zero, 0x400    # base address of sortarray
    addi s1, zero, 0        # swapped = 0 (will be set in loop)

outer_loop:
    addi s1, zero, 0        # swapped = 0
    addi s2, zero, 0        # i = 0
    addi t5, zero, 9        # t5 = 9 (loop limit, compare i < 9)

inner_loop:
    slli t0, s2, 2          # t0 = i * 4 (word offset)
    add t1, s0, t0          # t1 = address of sortarray[i]
    lw t2, 0(t1)            # t2 = sortarray[i]
    lw t3, 4(t1)            # t3 = sortarray[i+1]

    bge t3, t2, no_swap     # if sortarray[i+1] >= sortarray[i] -> no swap

    # swap: store t3 into sortarray[i], t2 into sortarray[i+1]
    sw t3, 0(t1)
    sw t2, 4(t1)
    addi s1, s1, 1          # swapped = 1

no_swap:
    addi s2, s2, 1          # i++
    blt s2, t5, inner_loop  # if i < 9, continue inner loop

    # If swapped != 0 then array may not be sorted; repeat outer loop
    bne s1, zero, outer_loop

    # Done
    ret
