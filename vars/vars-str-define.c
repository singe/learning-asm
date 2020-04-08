#define one "hello "
#define two "world"
#define concat(first, second) first second

int main() {
  const char* buf = concat(one, two);
  return 0;
}
