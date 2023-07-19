// ignore_for_file: public_member_api_docs, sort_constructors_first
int calculate() {
  return 6 * 7;
}

class Node {
  int value;
  Node({
    required this.value,
  });
  Node? left = null;
  Node? right = null;
}

class Tree {
  Node? root = null;
  void insert({required int value, required Node? n1}) {
    if (root == null) {
      root = Node(value: value);
      n1 = root;
      print("root!.value");
    } else if (n1!.value < value && n1.right != null) {
      insert(value: value, n1: n1.right);
    } else if (n1.value < value && n1.right == null) {
      n1.right = Node(value: value);
    } else if (n1.value > value && n1.left != null) {
      insert(value: value, n1: n1.left);
    } else if (n1.value > value && n1.left == null) {
      n1.left = Node(value: value);
    }
    print(n1);
    if (n1 is Node) {
      rebalanceOneNode(node: n1);
    } else {
      print("root!.value");
    }
  }

  int getDepth({required Node? n1, int depth = 0}) {
    int f = depth, k = depth;

    if (n1 == null) {
      return 0;
    }
    if (n1.left != null) {
      f = getDepth(n1: n1.left, depth: depth + 1);
    }
    if (n1.right != null) {
      k = getDepth(n1: n1.right, depth: depth + 1);
    }
    if (k > f) {
      return k;
    } else {
      return f;
    }
  }

  void print2({required Node n1}) {
    if (root == null) {
      return;
    }
    if (n1.right != null) {
      this.print2(n1: n1.right!);
    }
    if (n1.left != null) {
      this.print2(n1: n1.left!);
    }
    int l = getDepth(n1: n1.left, depth: 0);
    int r = getDepth(n1: n1.right, depth: 0);

    int test_b = l - r;
    print("the depth= " + test_b.toString());
    print(n1.value);
  }

  void rebalance({required Node node}) {
    int l = 0, r = 0;
    if (root == null) {
      return;
    }   if (node.right != null) {
      this.rebalance(node: node.right!);
    }  if (node.left != null) {
      this.rebalance(node: node.left!);
    }
    l = getDepth(n1: node.left, depth: 0);
    r = getDepth(n1: node.right, depth: 0);

    int test_b = l - r;
   
    if (test_b <= 1 && test_b >= -1) {
     
      return;
    } else if (node.right != null &&
        node.right!.right != null &&
        test_b.isNegative) {
      //Node n = node, n2 = node.right!, n3 = node.right!.right!;
      Node n5 = Node(value: node.value);
      n5.left = node.left;
      n5.right = node.right!.left;
      node.value = node.right!.value;
      node.right = node.right!.right;
      node.left = n5;
    } else if (node.right != null &&
        node.right!.left != null &&
        test_b.isNegative) {
      //Node n = node, n2 = node.right!, n3 = node.right!.right!;
      Node n5 = Node(value: node.value);
      n5.left = node.left;
      n5.right = node.right!.left!.left;
      node.value = node.right!.left!.value;
      node.left = n5;
      node.right!.left = node.right!.left!.right;
    } else if (node.left != null && node.left!.left != null) {
      Node n1 = Node(value: node.value);
      n1.right = node.right;
      n1.left = node.left!.right;
      node.value = node.left!.value;
      node.left = node.left!.left!;
      node.right = n1;
    } else if (node.left != null && node.left!.right != null) {
      Node n1 = Node(value: node.value);
      n1.right = node.right;
      n1.left = node.left!.right!.right;
      node.value = node.left!.right!.value;
      node.left!.right = node.left!.right!.left;
      node.right = node.left;
      node.left = n1;
    }
  }

  void rebalanceOneNode({required Node node}) {
    int l = 0, r = 0;
    l = getDepth(n1: node.left, depth:0);
    r = getDepth(n1: node.right, depth: 0);

    int test_b = l - r;
    if (test_b <= 1 && test_b >= -1) {
      return;
    } else if (node.right != null &&
        node.right!.right != null &&
        test_b.isNegative) {
      //Node n = node, n2 = node.right!, n3 = node.right!.right!;
      Node n5 = Node(value: node.value);
      n5.left = node.left;
      n5.right = node.right!.left;
      node.value = node.right!.value;
      node.right = node.right!.right;
      node.left = n5;
    } else if (node.right != null &&
        node.right!.left != null &&
        test_b.isNegative) {
      //Node n = node, n2 = node.right!, n3 = node.right!.right!;
      Node n5 = Node(value: node.value);
      n5.left = node.left;
      n5.right = node.right!.left!.left;
      node.value = node.right!.left!.value;
      node.left = n5;
      node.right!.left = node.right!.left!.right;
    } else if (node.left != null && node.left!.left != null) {
      Node n1 = Node(value: node.value);
      n1.right = node.right;
      n1.left = node.left!.right;
      node.value = node.left!.value;
      node.left = node.left!.left!;
      node.right = n1;
    } else if (node.left != null && node.left!.right != null) {
      Node n1 = Node(value: node.value);
      n1.right = node.right;
      n1.left = node.left!.right!.right;
      node.value = node.left!.right!.value;
      node.left!.right = node.left!.right!.left;
      node.right = node.left;
      node.left = n1;
    }
  }

  void avlInsert({required int value}) {
    insert(value: value, n1: root);
    rebalance(node: root!);
  }
}
