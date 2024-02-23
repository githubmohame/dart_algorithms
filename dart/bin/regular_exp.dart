int findPatternKmp(String txt, String patt, int start) {
  List<int> lps = createLps(patt);
  int j = 0;
  int i = start;
  while (i < txt.length) {
    if (txt[i] == patt[j]) {
      i++;
      j++;
    } else if (j > 0) {
      j = lps[j - 1];
    } else {
      i++;
    }
    if (j == patt.length) {
      return i;
    }
  }
  return -1;
}

List<int> createLps(String s1) {
  int i = 0, j = 1;
  List<int> l1 = [];
  l1.add(0);
  while (j < s1.length) {
    if (s1[i] == s1[j]) {
      l1.add(i + 1);
      i++;
      j++;
    } else if (i != 0) {
      i = l1[i - 1];
    } else {
      l1.add(0);
      j++;
    }
  }
  return l1;
}

bool checkStarRegExp(String s1, int start, int end, List<String> star) {
  List<String> str1 = [...star];
  for (int i = start; i <= end;) {
    if (str1.length == 0) {
      return false;
    }
    if (str1[0] == "." || str1[0] == s1[i]) {
      i++;
    } else {
      str1.removeAt(0);
    }
  }
  return true;
}

bool checkIsValid(String s1, String patt) {
  for (int i = 0; i < s1.length; i++) {
    if (patt[i] != "." && patt[i] != s1[i]) {
      return false;
    }
  }
  return true;
}

int searchPattern(String s1, String patt, int start) {
  String search = "";
  int i = 0;
  while (i < patt.length && patt[i] == ".") {
    i++;
  }
  int j = i;
  while (j < patt.length && patt[j] != ".") {
    j++;
  }

  search = patt.substring(i, j);

  int nextPoint = start;
  if (search != "") {
    do {
      nextPoint = findPatternKmp(s1, search, nextPoint);
    } while (nextPoint != -1 &&
        !checkIsValid(
            s1.substring(nextPoint - i - search.length,
                nextPoint - i - search.length + patt.length),
            patt));
  } else {
    if (start + j < s1.length &&
        checkIsValid(s1.substring(start, start + j), patt)) {
      if (patt == "..") {}
      if (s1.length - start + 1 > patt.length) {
        return start + 1;
      }
    }
    return -1;
  }
  if (nextPoint != -1) {
    return nextPoint - i - search.length + patt.length;
  }
  return nextPoint;
}

class Words {
  String txt;
  List<int> pos = [];
  int cur = 0;
  Words({
    required String s1,
    required this.txt,
    required this.pos,
  }) {
    int start = 0;
    bool isFlage = true;
    if (txt.split("").toSet().length == 1 &&
        txt.split("").toSet().contains(".")) {
      isFlage = false;
    }
    while (start != -1) {
      start = searchPattern(s1, txt, start);
      if (start != -1) {
        if (isFlage) {
          pos.add(start - txt.length);
        } else {
          pos.add(start);
        }
      }
    }
    cur = pos.length;
  }
  int getLastPos() {
    if (cur != -1) {
      return pos[cur];
    }
    return -1;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$txt:$pos->$cur";
  }
}

int getPrevValue(List<int> l1, int value) {
  int i = 0;
  for (i; i < l1.length; i++) {
    if (value < l1[i]) {
      return i;
    }
  }
  return i;
}

void main() {
  String patt = "a*b..c*kf.", s1 = "ababckfl", searchPatt = "";
  patt = "aabc.*abc";
  s1 = "aabcabc";
  patt = "a";
  s1 = "aa";
  searchPatt = "";
  List<String> words = [];
  for (int i = 0; i < patt.length; i++) {
    if (patt[i] == "*") {
    } else if (i < patt.length - 1 && patt[i + 1] != "*") {
      searchPatt += patt[i];
    } else if ((i < patt.length - 1 && patt[i + 1] == "*")) {
      if (searchPatt.isNotEmpty) {
        words.add(searchPatt);
        searchPatt = "";
      }
      words.add(patt[i] + "*");
    } else {
      searchPatt += patt[i];
    }
  }
  if (searchPatt.isNotEmpty) {
    words.add(searchPatt);
    searchPatt = "";
  }
  Map<String, Words> mapWords = {};
  for (int i = 0; i < words.length; i++) {
    if (words[i][words[i].length - 1] != "*") {
      // listWords.add(Words(s1: s1, txt: words[i], pos: []));
      mapWords[i.toString() + ":" + words[i].toString()] =
          Words(s1: s1, txt: words[i], pos: []);
    }
  }
  List<int> listStar = [];
  int? flage;
  for (int i = 0; i < words.length; i++) {
    if (words[i][words[i].length - 1] != "*" && flage != null) {
      listStar.add(flage);
      flage = null;
    }
    if (words[i][words[i].length - 1] == "*") {
      flage = i;
    }
  }
  if (flage != null) {
    listStar.add(flage);
  }
  int lastPossPos = s1.length - 1;
  int index = words.length - 1;
  List<String> starWords = [];
  while (index >= -1) {
    if (index == -1 && starWords.length > 0) {
      if (checkStarRegExp(s1, 0, lastPossPos - 1, starWords)) {
        print("Valid");
        return;
      }

      int index1 = getPrevValue(listStar, starWords.length);
      if (index1 == words.length) {
        print("Not Valid");
        return;
      } else {
        index = listStar[index1];
        if (index == words.length - 1) {
          lastPossPos = words.length - 1;
        } else {
          lastPossPos =
              mapWords[(index + 1).toString() + ":" + words[index + 1]]!.pos[
                  mapWords[(index + 1).toString() + ":" + words[index + 1]]!
                      .cur];
        }
        starWords.clear();
        continue;
      }
    }
    if (index == -1) {
      print("Not valid");
      return;
    }

    if (words[index][words[index].length - 1] != "*" && index == 0) {
      if (mapWords[index.toString() + ":" + words[index]]!.pos.length == 0) {
        print("Not Valid");
        return;
      } else if (mapWords[index.toString() + ":" + words[index]]!.pos[0] != 0) {
        print("Not Valid");
        return;
      }
      print(lastPossPos);
      if (mapWords[index.toString() + ":" + words[index]]!.pos[0] == 0 &&
          mapWords[index.toString() + ":" + words[index]]!.txt.length - 1 ==
              lastPossPos - 1) {
        print("Valid");
        return;
      }
      //apWords[index.toString() + ":" + words[index]]!.cur--;

      int index1 = getPrevValue(listStar, index + starWords.length);
      if (index1 == words.length) {
        print("Not Valid");
        return;
      } else {
        index = listStar[index1];
        continue;
      }
    }
    if (words[index][words[index].length - 1] == "*") {
      starWords.insert(0, words[index][0]);
    } else {
      if (starWords.isNotEmpty) {
        mapWords[index.toString() + ":" + words[index]]!.cur--;

        while (mapWords[index.toString() + ":" + words[index]]!.cur != -1 &&
            mapWords[index.toString() + ":" + words[index]]!.pos[
                    mapWords[index.toString() + ":" + words[index]]!.cur] >=
                lastPossPos) {
          mapWords[index.toString() + ":" + words[index]]!.cur--;
        }
        if (mapWords[index.toString() + ":" + words[index]]!.cur == -1) {
          print("Not Valid");
          return;
        }

        if (!checkStarRegExp(
            s1,
            mapWords[index.toString() + ":" + words[index]]!
                    .pos[mapWords[index.toString() + ":" + words[index]]!.cur] +
                mapWords[index.toString() + ":" + words[index]]!.txt.length,
            lastPossPos - 1,
            starWords)) {
          int index1 = getPrevValue(listStar, index + starWords.length);
          if (index1 == words.length) {
            return;
          } else {
            index = listStar[index1];
            if (index == words.length - 1) {
              lastPossPos = words.length - 1;
            } else {
              lastPossPos =
                  mapWords[(index + 1).toString() + ":" + words[index + 1]]!
                          .pos[
                      mapWords[(index + 1).toString() + ":" + words[index + 1]]!
                          .cur];
            }
            starWords.clear();
            continue;
          }
        } else {
          lastPossPos = mapWords[index.toString() + ":" + words[index]]!
              .pos[mapWords[index.toString() + ":" + words[index]]!.cur];
          starWords.clear();
        }
        //else  if(){}
      } else {
        mapWords[index.toString() + ":" + words[index]]!.cur--;

        while (mapWords[index.toString() + ":" + words[index]]!.cur != -1 &&
            mapWords[index.toString() + ":" + words[index]]!.pos[
                    mapWords[index.toString() + ":" + words[index]]!.cur] >=
                lastPossPos) {
          mapWords[index.toString() + ":" + words[index]]!.cur--;
        }
        if (mapWords[index.toString() + ":" + words[index]]!
                    .pos[mapWords[index.toString() + ":" + words[index]]!.cur] +
                mapWords[index.toString() + ":" + words[index]]!.txt.length -
                1 !=
            s1.length - 1) {
          print("Not Valid");
        }
        lastPossPos = mapWords[index.toString() + ":" + words[index]]!
            .pos[mapWords[index.toString() + ":" + words[index]]!.cur];
      }
    }

    index--;
  }
}