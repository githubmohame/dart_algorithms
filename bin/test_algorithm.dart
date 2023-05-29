 import 'package:test_algorithm/test_algorithm.dart';

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
  //t1.rebalance(node: t1.root! );*/
  
}
