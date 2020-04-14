syscall:::entry /pid == $target/ { 
  printf("%s, 0x%x(%d), 0x%x(%d), 0x%x(%d), 0x%x(%d)", probefunc, arg0, arg0, arg1, arg1, arg2, arg2, arg3, arg3);
}
