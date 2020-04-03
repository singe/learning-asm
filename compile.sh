#!/bin/bash

# Defaults
args=("$@")
file="${args[$#-1]}"
arch="x86_64"
run=false
cleanup=false
xxd=false

function usage() {
  echo """
    Simple assembler and linker automation
    Usage:
      -h help This help
      -a <arch> Specify the architecture default: x86_64
      -r run  Run the program after building it
      -c cleanup Delete the .o and binary afterwards
      -x xxd  Run the output through xxd when running it
  """
  exit 0
}

while getopts "hrcxa:" OPTIONS; do
  case ${OPTIONS} in
    h) usage;;
    a) arch="$OPTARG";;
    r) run=true;;
    c) cleanup=true;;
    x) xxd=true;;
  esac
done

echo "[*] Architecure: $arch"
echo "[*] Input file : $file"
base=$(echo $file | cut -d\. -f1)
#echo "[*] Basename : $base"

echo "[*] Assembling ..."
as $file -arch $arch -o $base.o
if [[ $? -eq 0 ]]; then 
  echo "✅ Assembly done : $base.o"
else
  echo "❌ Assembly FAILURE"
  exit 1
fi

echo "[*] Linking ..."
ld -lSystem -arch $arch $base.o -e _main -o $base
if [[ $? -eq 0 ]]; then 
  echo "✅ Linking done : $base"
else
  echo "❌ Linking FAILURE"
  exit 1
fi

if $run; then
  echo "[*] Running $base ..."
  echo "--------"
  if $xxd; then
    ./$base | xxd
  else
    ./$base
  fi 
  echo "--------| ret: $?"
fi

if $cleanup; then
  echo "[*] Cleaning up : $base.o $base"
  rm -f $base $base.o
fi
