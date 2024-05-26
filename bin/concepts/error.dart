void main() {
  recursiveFunc(1); // Stack Overflow
}

recursiveFunc(int count) {
  print(count);

  recursiveFunc(count + 1);
}
