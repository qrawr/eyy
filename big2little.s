# big2little.s - Convert 8 words from big-endian to little-endian
# Memory starts at 0x300

addi t0, zero, 0x300   # base address

addi t1, zero, 8       # process 8 words
word_loop:
    beq t1, zero, done

    lb t2, 0(t0)        # load bytes big-endian order
    lb t3, 1(t0)
    lb t4, 2(t0)
    lb t5, 3(t0)

    sb t2, 3(t0)        # store in little-endian order
    sb t3, 2(t0)
    sb t4, 1(t0)
    sb t5, 0(t0)

    addi t0, t0, 4      # next word
    addi t1, t1, -1
    j word_loop

done:
