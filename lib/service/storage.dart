import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

// Create a storage reference from our app
final storageRef = storage.ref();


Future<String> uploadImage(ref,file) {
  // upload
  final imageRef = storageRef.child(ref);
  imageRef.putFile(file);

  // get url
  return imageRef.getDownloadURL();
}