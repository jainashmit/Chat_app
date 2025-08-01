import 'package:chat_app/service/stroageHelper.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  final _picker = ImagePicker();

  Future selectImage() async {
    final _pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (_pickedImage != null) {
      StorageHelper.deleteProfileImagePath();
      StorageHelper.saveProfileImagePath(_pickedImage.path);
      // return _image;
    }
  }

  Future selectDummyImage() async {
    final _pickedDummyImage = await _picker.pickImage(source: ImageSource.gallery);

    if (_pickedDummyImage != null) {
      DummyStorageHelper.deleteProfileImagePath();
      DummyStorageHelper.saveProfileImagePath(_pickedDummyImage.path);
      // return _image;
    }
  }
}
