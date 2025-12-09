// bubblesort.c - High-level bubble sort

int main() {
    int sortarray[10] = {89, 63, -55, -107, 42, 98, -425, 203, 0, 303};
    int i, swapped;

    do {
        swapped = 0;
        for (i = 0; i < 9; i++) {
            if (sortarray[i] > sortarray[i+1]) {
                int temp = sortarray[i];
                sortarray[i] = sortarray[i+1];
                sortarray[i+1] = temp;
                swapped = 1;
            }
        }
    } while (swapped);

    return 0;
}
