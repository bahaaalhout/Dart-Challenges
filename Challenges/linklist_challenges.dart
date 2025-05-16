import 'dart:io';

void main() {
  LinkedList ll = LinkedList();
  // we used append method that we created to add items.
  ll.append(1);
  ll.append(2);
  ll.append(3);
  ll.append(2);
  ll.append(4);

  print("Original List:");
  ll.printList();

  print("\nPrint in Reverse:");
  printReverse(ll.head);

  print("\nMiddle Node:");
  print(findMiddle(ll.head)?.data);

  print("\nReversed List:");
  Node? reversed = reverseLinkedList(ll.head);
  LinkedList reversedList = LinkedList();
  reversedList.head = reversed;
  reversedList.printList();

  print("\nRemove All Occurrences:");
  Node? cleaned = removeAllOccurrences(ll.head, 2);
  LinkedList cleanedList = LinkedList();
  cleanedList.head = cleaned;
  cleanedList.printList();
}

class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  // add items to the linkedlist
  void append(int data) {
    if (head == null) {
      head = Node(data);
      return;
    }

    Node current = head!;
    while (current.next != null) {
      current = current.next!;
    }
    current.next = Node(data);
  }

  // print the linked list
  void printList() {
    Node? current = head;
    while (current != null) {
      stdout.write("${current.data} -> ");
      current = current.next;
    }
    print("null");
  }
}

// Challenge 1: Print in Reverse
// print the reverse LinkedList
void printReverse(Node? node) {
  if (node == null) return;
  printReverse(node.next);
  print(node.data);
}

// Challenge 2: Find the Middle Node
// find the middle node
Node? findMiddle(Node? head) {
  Node? slow = head;
  Node? fast = head;

  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  return slow;
}

// Challenge 3: Reverse a Linked List
// reverses a linked list "they’re linked in the other direction"
Node? reverseLinkedList(Node? head) {
  Node? prev = null;
  Node? current = head;

  while (current != null) {
    Node? next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  return prev;
}

// Challenge 4: Remove All Occurrences
Node? removeAllOccurrences(Node? head, int value) {
  Node dummy = Node(0);
  dummy.next = head;
  Node? current = dummy;

  while (current?.next != null) {
    if (current!.next!.data == value) {
      current.next = current.next!.next;
    } else {
      current = current.next;
    }
  }

  return dummy.next;
}
