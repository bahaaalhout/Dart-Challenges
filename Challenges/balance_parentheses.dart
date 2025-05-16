// Challenge 2: Balance the Parentheses

void main() {
  print(isBalancedParentheses('(((AsASas))'));
  print(isBalancedParentheses('(((asdSDasS)))'));
}

bool isBalancedParentheses(String str) {
  List<String> stack = [];
  for (final char in str.split('')) {
    if (char == '(') {
      stack.add(char); // Push opening parentheses.
    } else if (char == ')') {
      if (stack.isEmpty) return false; // No match for closing.
      stack.removeLast(); // Pop the matching '('.
    }
  }
  return stack.isEmpty;
}
