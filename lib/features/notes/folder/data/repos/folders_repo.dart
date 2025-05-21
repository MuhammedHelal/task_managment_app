import 'package:hive/hive.dart';
import 'package:planning_app/core/utils/strings.dart';
import 'package:planning_app/features/notes/folder/data/models/folder_entity.dart';

class FoldersRepo {
  Future<List<FolderEntity>> getFolders() async {
    final box = Hive.box<FolderEntity>(AppStrings.foldersBox);
    return box.values.toList();
  }
}
