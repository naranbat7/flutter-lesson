abstract class StorableModel {
  int id;

  StorableModel({this.id = -1});

  List<Object?> get queryList;
}
