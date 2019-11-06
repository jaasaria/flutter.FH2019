class ArrayObjectHelper {
  static String getFirstIndexArrayObject(Map<String, dynamic> json) {
    var _list = json.keys.toList();
    return json[_list[0]][0];
  }
}
