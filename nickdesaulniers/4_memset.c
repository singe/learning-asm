#include <stdio.h>
#include <string.h>
#include <inttypes.h>
int main () {
  int8_t array [16];
  memset(&array, 42, 16);
  int8_t* ptr = array;
  printf("Current byte: %" PRId8 "\n", *ptr);
  ++(*ptr);
  printf("Current byte: %" PRId8 "\n", *ptr);
  ++ptr;
  printf("Current byte: %" PRId8 "\n", *ptr);
}
