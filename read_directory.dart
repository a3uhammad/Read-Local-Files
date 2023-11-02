import 'dart:io';

void main() {
  final directoryPath = 'path'; //provide path here and use '\\' in between

  final directory = Directory(directoryPath);

  if (!directory.existsSync()) {
    print('Directory does not exist.');
    return;
  }

  printFilesRecursively(directory);
}

void printFilesRecursively(Directory directory) {
  String currentFolderName = directory.uri.pathSegments.last;

  if (currentFolderName == '' || currentFolderName == '/') {
    currentFolderName =
        directory.uri.pathSegments[directory.uri.pathSegments.length - 2];
  }

  for (var entity in directory.listSync()) {
    if (entity is File) {
      print('$currentFolderName - ${entity.uri.pathSegments.last}');
    }
  }

  for (var entity in directory.listSync()) {
    if (entity is Directory) {
      printFilesRecursively(entity);
    }
  }
}
