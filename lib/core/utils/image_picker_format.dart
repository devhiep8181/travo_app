
import 'package:image_picker/image_picker.dart';

class ImagePickerFormat {
  final ImagePicker _imagePicker = ImagePicker();

  Future<String?> getImageFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    } else {
      // Nếu không chọn ảnh, trả về null
      return null;
    }
  }
}
