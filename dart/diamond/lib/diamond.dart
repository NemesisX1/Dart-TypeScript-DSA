class Diamond {
  List<String> rows(String char) {
    int baseSpacing = char.codeUnitAt(0) - 'A'.codeUnitAt(0);
    int aToAscii = 'A'.codeUnitAt(0);
    int nbrSpaceBetween = 1;
    int nbrSpaceAround = baseSpacing;
    List<String> halfList = [];
    List<String> accumulationString = [];
    List<String> result = [];

    if (char == "A") return ["A"];
    for (int i = 0; i < baseSpacing; i++) {
      accumulationString.add(".");
      for (int j = 0; j < nbrSpaceAround; j++) {
        accumulationString.add(".");
      }
      if (i == 0) {
        accumulationString
            .add(String.fromCharCode(aToAscii)); // if we are in the first line
        aToAscii++; // increment to go to B
      } else {
        accumulationString.add(String.fromCharCode(aToAscii));

        for (int k = 0; k < nbrSpaceBetween; k++) {
          accumulationString.add("·");
        }

        accumulationString.add(String.fromCharCode(aToAscii));
        aToAscii++;
        nbrSpaceBetween += 2;
      }

      for (int j = 0; j < baseSpacing; j++) {
        accumulationString.add("·");
      }

      nbrSpaceAround--;
      accumulationString.add("·");
      halfList.add(accumulationString.join(''));
      accumulationString.clear();
    }
    result = halfList + List.from(halfList.reversed);
    return result;
  }
}
