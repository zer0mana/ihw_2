#include <stdio.h>

static char res[1000];

void solve(char first[], int first_size) {
    int sub_size = 0, i = 0;
    char substr[1000];
    char x;
    for (int i1 = 0; i1 < first_size; ++i1) {
        x = first[i1];
        if ((x >= 'a') && (x <= 'z')) {
            substr[sub_size++] = x;
            continue;
        }
        int flag = 1;
        for (int i2 = 0; i2 < sub_size; ++i2) {
            if (substr[i2] != substr[sub_size - i2 - 1]) {
                flag = 0;
            }
        }
        if (flag == 1 && sub_size != 0) {
            for (int i2 = 0; i2 < sub_size; ++i2) {
                res[i++] = substr[i2];
            }
            res[i++] = ' ';
        }
        sub_size = 0;
    }
    int flag = 1;
    for (int i2 = 0; i2 < sub_size; ++i2) {
        if (substr[i2] != substr[sub_size - i2 - 1]) {
            flag = 0;
        }
    }
    if (flag == 1) {
        for (int i2 = 0; i2 < sub_size; ++i2) {
            res[i++] = substr[i2];
        }
    }
}

int main() {
    char str[1000], ch;
    int first_size = 0;
    do {
        ch = fgetc(stdin);
        str[first_size++] = ch;
    } while(ch != '\n');
    solve(str, first_size - 1);
    printf("%s", res);
    return 0;
}
