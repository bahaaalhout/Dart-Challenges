// Stacks:
// Challenge 1: Reverse a List

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  reverse_list(numbers);
}

void reverse_list(List list) {
  List stack = [];
  List newstack = [];
  for (final i in list) {
    stack.add(i);
  }
  while (stack.isNotEmpty) {
    dynamic value = stack.removeLast();
    newstack.add(value);
    print(value);
  }
  print(newstack);
}
