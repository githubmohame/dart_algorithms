import 'package:test_algorithm/test_algorithm.dart';

//################################################################
// binary tree avl tree
//#################################################################
/*
void main(List<String> arguments) {
  Tree t1 = Tree();
  t1.avlInsert(value: 50 );
  t1.avlInsert(value: 20 );
  t1.avlInsert(
    value: 10
  );
   
   t1.avlInsert(
    value: 5
  );
 t1.avlInsert(
    value: 12
  );
 t1.avlInsert(
    value:  140
  );
   t1.avlInsert(
    value:  138
  );
   t1.avlInsert(
    value:  139
  );
   t1.avlInsert(
    value:  138
  );
    t1.avlInsert(
    value:  135
  );
t1.avlInsert(
    value: 40
  );
t1.avlInsert(
    value: 70
  );
  t1.avlInsert(
    value: 32
  );
  t1.avlInsert(
    value: 21
  );
  t1.avlInsert(
    value: 22
  );
  t1.rebalance(node:t1.root! );
  t1.rebalance(node: t1.root! );
  t1.print2(n1: t1.root!);
  //t1.rebalance(node: t1.root! ); 
  
}
*/
/*
//################################################################
// sort two lists
//#################################################################
class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    int len = ((nums1.length + nums2.length));
    int n = 0, m = 0;
    List<int> l = [];
    while (n < nums1.length && m < nums2.length) {
      int right1 = binary_search(nums1, nums2[m], n);
      int right2 = binary_search(nums2, nums1[n], m);

      if (right1 > right2) {
        l.addAll(nums1.sublist(n, right1));
        l.add(nums2[m]);
        m++;

        n = right1;
      } else {
        l.addAll(nums2.sublist(m, right2));

        l.add(nums1[n]);
        n++;
         m = right2;
      }
      
    }
    if (m < nums2.length) {
      l.addAll(nums2.sublist(m));
    }
    if (n < nums1.length) {
      l.addAll(nums1.sublist(n));
    }
    print(l);
    if (len.isOdd) {
        return l[len ~/ 2].toDouble();
      }
      else {
        return ((l[len ~/ 2] )+(l[len ~/ 2-1] ))/2;
      }
   }

  int binary_search(List<int> nums1, int u, int min) {
    int max = nums1.length;
    while (max != min) {
      if (nums1[((max + min) ~/ 2)] > u) {
        max = ((max + min) ~/ 2);
      } else if (nums1[((max + min) ~/ 2)] < u) {
        min = ((max + min) ~/ 2) + 1;
      } else {
        return ((max + min) ~/ 2);
      }
    }
    return min == nums1.length
        ? min
        : min == 0 && nums1[min] > u
            ? -1
            : min;
  }

  int right_mod(int mod, int right, List nums1, List nums2) {
    print(right);
    if (mod > right) {
      mod -= right;
      mod -= 1;
      if (mod > nums2.length - 1) {
        return nums1[mod - nums2.length + right + 1];
      }
      return nums2[mod];
    }
    print("done");
    return nums1[mod];
  }
}

void main() {
  //print(binary_search([1, 3, 8, 11], 0, 0));
  print(Solution().findMedianSortedArrays([1, 3], [ ]));
}

*/
// [2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]
/*void main() {
  List<String> s = [
    "LRUCache",
    "put",
    "put",
    "put",
    "put",
    "put",
    "get",
    "put",
    "get",
    "get",
    "put",
    "get",
    "put",
    "put",
    "put",
    "get",
    "put",
    "get",
    "get",
    "get",
    "get",
    "put",
    "put",
    "get",
    "get",
    "get",
    "put",
    "put",
    "get",
    "put",
    "get",
    "put",
    "get",
    "get",
    "get",
    "put",
    "put",
    "put",
    "get",
    "put",
    "get",
    "get",
    "put",
    "put",
    "get",
    "put",
    "put",
    "put",
    "put",
    "get",
    "put",
    "put",
    "get",
    "put",
    "put",
    "get",
    "put",
    "put",
    "put",
    "put",
    "put",
    "get",
    "put",
    "put",
    "get",
    "put",
    "get",
    "get",
    "get",
    "put",
    "get",
    "get",
    "put",
    "put",
    "put",
    "put",
    "get",
    "put",
    "put",
    "put",
    "put",
    "get",
    "get",
    "get",
    "put",
    "put",
    "put",
    "get",
    "put",
    "put",
    "put",
    "get",
    "put",
    "put",
    "put",
    "get",
    "get",
    "get",
    "put",
    "put",
    "put",
    "put",
    "get",
    "put",
    "put",
    "put",
    "put",
    "put",
    "put",
    "put"
  ];
  List<List<int>> fsm = [
    [10],
    [10, 13],
    [3, 17],
    [6, 11],
    [10, 5],
    [9, 10],
    [13],
    [2, 19],
    [2],
    [3],
    [5, 25],
    [8],
    [9, 22],
    [5, 5],
    [1, 30],
    [11],
    [9, 12],
    [7],
    [5],
    [8],
    [9],
    [4, 30],
    [9, 3],
    [9],
    [10],
    [10],
    [6, 14],
    [3, 1],
    [3],
    [10, 11],
    [8],
    [2, 14],
    [1],
    [5],
    [4],
    [11, 4],
    [12, 24],
    [5, 18],
    [13],
    [7, 23],
    [8],
    [12],
    [3, 27],
    [2, 12],
    [5],
    [2, 9],
    [13, 4],
    [8, 18],
    [1, 7],
    [6],
    [9, 29],
    [8, 21],
    [5],
    [6, 30],
    [1, 12],
    [10],
    [4, 15],
    [7, 22],
    [11, 26],
    [8, 17],
    [9, 29],
    [5],
    [3, 4],
    [11, 30],
    [12],
    [4, 29],
    [3],
    [9],
    [6],
    [3, 4],
    [1],
    [10],
    [3, 29],
    [10, 28],
    [1, 20],
    [11, 13],
    [3],
    [3, 12],
    [3, 8],
    [10, 9],
    [3, 26],
    [8],
    [7],
    [5],
    [13, 17],
    [2, 27],
    [11, 15],
    [12],
    [9, 19],
    [2, 15],
    [3, 16],
    [1],
    [12, 17],
    [9, 1],
    [6, 19],
    [4],
    [5],
    [5],
    [8, 1],
    [11, 7],
    [5, 2],
    [9, 28],
    [1],
    [2, 2],
    [7, 4],
    [4, 22],
    [7, 24],
    [9, 26],
    [13, 28],
    [11, 26]
  ];
  int k = 0;
  late LRUCache l;
  while (k < s.length) {
    if (s[k] == "LRUCache") {
      l = LRUCache(fsm[k][0]);
    }
    if (s[k] == "put") {
      l.put(fsm[k][0], fsm[k][1]);
    }
    if (s[k] == "get") {
      print(l.get(
        fsm[k][0],
      ));
    }
    k++;
  }
}
*/
void main() {
  LRUCache l = LRUCache(2);
  l.put('foo', 10);
  l.put('bar', 20);
  l.put('foo', 40);
  l.put('baz', 30);
  print( (l.map));
}

class LRUCache {
  Map<String, int> map = {};
  List<String> queue = [];
  int capacity = 0;
  LRUCache(int capacity) {
    this.capacity = capacity;
  }

  int get(String key) {
    if (map[key] != null) {
      queue.removeAt(queue.indexOf(key));
      queue.add(key);
      return map[key]!;
    } else {
      return -1;
    }
  }

  void put(String key, int value) {
    if (queue.length == capacity) {
      if (map[key] == null) {
        String key2 = queue.removeAt(0);
        map.remove(key2);
        queue.add(key);
        map[key] = value;
      } else {
        queue.removeAt(queue.indexOf(key));
        queue.add(key);
        map[key] = value;
      }
    } else {
      queue.add(key);
      map[key] = value;
    }
  }
}
