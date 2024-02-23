class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? createListNodes(List<int> l1) {
  ListNode? start, cur;
  for (int i = 0; i < l1.length; i++) {
    if (start == null) {
      start = ListNode(l1[i]);
      cur = start;
    } else {
      cur!.next = ListNode(l1[i]);
      cur = cur.next;
    }
  }
  return start;
}

void printListNodes(ListNode? start) {
  while (start != null) {
    print(start.val);
    start = start.next;
  }
}

class Path {
  List<int> listNodesNumber = [];
  List<int> listNodeGroup = [];
  Path({required this.listNodeGroup, required this.listNodesNumber}) {}
}

List<Path>? genPaths(
    Map<int, List<int>> mapNumbers,
    Map<int, List<int>> mapGroups,
    List<int> beforeItems,
    Path path,
    List<int> groups,
    Set<int> visitedNodes) {
  List<Path> list = [];
  visitedNodes.add(path.listNodesNumber[0]);
  //print("$beforeItems :hhhhh  ${path.listNodesNumber}");
  for (int i = 0; i < beforeItems.length; i++) {
    if (path.listNodesNumber.toSet().contains(beforeItems[i]) ||
        (path.listNodeGroup.length != 0 &&
                path.listNodeGroup[0] != groups[beforeItems[i]]) &&
            path.listNodeGroup.toSet().contains(groups[beforeItems[i]])) {
      return null;
    }
    List<int> l1 = [
      ...path.listNodeGroup,
    ];
    if (mapNumbers[path.listNodesNumber[0]] == null) {
      mapNumbers[path.listNodesNumber[0]] = [beforeItems[i]];
    } else {
      mapNumbers[path.listNodesNumber[0]]!.add(beforeItems[i]);
    }
    if (l1[0] == groups[beforeItems[i]]) {
    } else if (mapGroups[path.listNodeGroup[0]] == null) {
      mapGroups[path.listNodeGroup[0]] = [groups[beforeItems[i]]];
    } else {
      mapGroups[path.listNodeGroup[0]]!.add(groups[beforeItems[i]]);
    }
    if (l1.length == 0 || l1[0] != groups[beforeItems[i]]) {
      l1.insert(0, groups[beforeItems[i]]);
    }
    if (visitedNodes.contains(beforeItems[i])) {
      continue;
    }
    list.add(Path(listNodesNumber: [
      beforeItems[i],
      ...path.listNodesNumber,
    ], listNodeGroup: l1));
  }
  return list;
}

bool findPaths(
    Map<int, List<int>> mapNumbers,
    Map<int, List<int>> mapGroups,
    List<int> groups,
    List<List<int>> beforeItems,
    int start,
    Set<int> visitedNodes) {
  List<Path> list = [];
  Path? curPath =
      Path(listNodeGroup: [groups[start]], listNodesNumber: [start]);
  while (curPath != null) {
    List<Path>? l1 = genPaths(mapNumbers, mapGroups,
        beforeItems[curPath.listNodesNumber[0]], curPath, groups, visitedNodes);
    // print("${curPath.listNodesNumber}the hellow");
    if (l1 == null) {
      return false;
    }
    list.addAll(l1);
    if (list.isEmpty) {
      curPath = null;
    } else {
      curPath = list.removeLast();
    }
  }
  return true;
}

class Group {
  List<int> listNode = [];
  Set<int> setNode = {};
  Group({required this.listNode, required this.setNode});
}

int? findNodeLoc(List<int> l1, int node) {
  for (int i = 0; i < l1.length; i++) {
    if (l1[i] == node) {
      return i;
    }
  }
  return null;
}

Group merg(Group g1, Group g2) {
  Set<int> set1 = g1.setNode, set2 = g2.setNode, set3 = {};
  List<int> l1 = g1.listNode, l2 = g2.listNode, l3 = [];
  while (l1.length > 0 && l2.length > 0) {
    if (l1.last == l2.last) {
      set3.add(l1.last);
      l3.insert(0, l1.last);
      set1.remove(l1.last);
      set2.remove(l1.last);
      l1.removeLast();
      l2.removeLast();
    } else if (!set2.contains(l1.last)) {
      set1.remove(l1.last);
      set3.add(l1.last);
      l3.insert(0, l1.last);
      l1.removeLast();
    } else {
      if (set1.contains(l2.last)) {
        l1.remove(l2.last);
        set1.remove(l2.last);
        l3.insert(0, l2.last);
        set3.add(l2.last);
      } else {
        set3.add(l2.last);
        l3.insert(0, l2.last);
      }
      set2.remove(l2.last);
      l2.removeLast();
    }
  }
  if (l1.isNotEmpty) {
    l3.insertAll(0, l1);
    set3.addAll(set1);
  }
  if (l2.isNotEmpty) {
    l3.insertAll(0, l2);
    set3.addAll(set2);
  }
  return Group(listNode: l3, setNode: set3);
}

void mergeGroupPathLoop(List<Group> result) {
  while (result.length > 1) {
    Group g1 = result.removeLast(), g2 = result.removeLast();
    // result.add(mergeGroupPathSameIter(g1, g2));
    result.add(merg(g1, g2));
  }
}

Group checkForMerge(Group g, List<Group> curPaths) {
  for (int i = 0; i < curPaths.length; i++) {
    if (curPaths[i].setNode.contains(g.listNode[0])) {
      Group g1 = curPaths[i];
      curPaths.removeAt(i);
      return merg(g1, g);
    }
  }
  return g;
}

List<Group> genPathGroup(
    Map<int, List<int>> mapGroups, Group g, List<Group> curPaths) {
  List<Group> list = [];
  List<int>? values = mapGroups[g.listNode[0]];
  if (values == null) {
    return [];
  }
  for (int i = 0; i < values.length; i++) {
    Group g2 = Group(listNode: [
      values[i],
      ...g.listNode,
    ], setNode: {
      ...g.setNode,
      values[i]
    });
    list.add(checkForMerge(g2, curPaths));
  }
  return list;
}

List<Group> getPathGroup(
  int start,
  Map<int, List<int>> mapGroups,
  Set<int> visitedNodes,
) {
  List<Group> list = [], result = [];
  Group? group = Group(listNode: [start], setNode: {start});
  while (group != null) {
    visitedNodes.add(group.listNode[0]);

    List<Group> l1 = genPathGroup(mapGroups, group, result);
    if (l1.length == 0) {
      result.add(group);
    }
    list.addAll(l1);
    if (list.isEmpty) {
      group = null;
    } else {
      group = list.removeLast();
    }
  }

  mergeGroupPathLoop(result);
  return result;
}

List<int> getListGroups(Map<int, List<int>> mapGroups) {
  List<int> groups = mapGroups.keys.toList();
  List<Group> result = [];
  Set<int> visitedNodes = {};
  for (int i = 0; i < groups.length; i++) {
    if (!visitedNodes.contains(groups[i])) {
      result.addAll(getPathGroup(
        groups[i],
        mapGroups,
        visitedNodes,
      ));
    }
  }

  mergeGroupPathLoop(result);
  return result.last.listNode;
}

void main() {
  int n = 8;
  List<int> group = [-1, -1, 1, 0, 0, 1, 0, -1];
  List<List<int>> beforeItems = [
    [],
    [6],
    [5],
    [6],
    [3],
    [],
    [4],
    []
  ];
  Set<int> visitedNodes = {};
  Map<int, List<int>> mapBeforeNumber = {}, mapGroups = {}, mapGroupsNum = {};
  print(getListGroups({
    3: [5, 4],
    13: [15, 14],
    12: [13],
    11: [13, 12],
    1: [2, 3],
    2: [3]
  }));

  for (int i = 0; i < n; i++) {
    if (mapGroupsNum[group[i]] == null) {
      mapGroupsNum[group[i]] = [i];
    } else {
      mapGroupsNum[group[i]]!.add(i);
    }
    if (!findPaths(
        mapBeforeNumber, mapGroups, group, beforeItems, i, visitedNodes)) {
      print("not Valid:");
      return;
    }
  }
  print(mapGroups);
  print(mapBeforeNumber);
  print(getListGroups({
    3: [5, 4],
    1: [2, 3],
    2: [3]
  }));
}
/*
Group mergeGroupPathDiffIter(Group g, List<Group> curPaths) {
  for (int i = 0; i < curPaths.length; i++) {
    if (curPaths[i].setNode.contains(g.listNode[0])) {
      int? loc = findNodeLoc(curPaths[i].listNode, g.listNode[0]);
      if (loc == null) {
        curPaths[i]
            .listNode
            .addAll(g.setNode.difference(curPaths[i].setNode).toList());
        curPaths[i].setNode.addAll(g.setNode);
      } else {
        curPaths[i].listNode.insertAll(
            loc + 1, g.setNode.difference(curPaths[i].setNode).toList());
        curPaths[i].setNode.addAll(g.setNode);
      }
      return curPaths[i];
    }
  }
  return g;
}

Group mergeGroupPathSameIter(Group g1, Group g2) {
  if (g1.listNode.length < g2.listNode.length) {
    Group sw = g2;
    g2 = g1;
    g1 = sw;
  }
  int i = -1;
  while (i * -1 < g2.listNode.length) {
    if (g1.listNode[i % g1.listNode.length] !=
        g2.listNode[i % g2.listNode.length]) {
      break;
    }
  }
  g1.listNode.addAll(g2.listNode.sublist(0, i % g2.listNode.length));
  g1.setNode.addAll(g2.setNode);
  return g1;
}


*/