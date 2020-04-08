int main() {
    char buf[11];
    char hello[6] = "Hello";
    char world[6] = "World";
    int i = 0;
    int j = 0;
  
    for (i = 0; hello[i] != '\0'; ++i) {
        buf[j] = hello[i];
        j++;
    }
    for (i = 0; world[i] != '\0'; ++i) {
        buf[j] = world[i];
        j++;
    }

    buf[j] = '\0';
    printf("%s", buf);
    return 0;
}
