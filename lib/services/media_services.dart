import 'package:image_picker/image_picker.dart';

class MediaServices {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> captureImage() async {
    try{
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera,);
      return photo;
    }catch(e){
      return null;
    }
  }

  static Future<XFile?> captureVideo() async{
    try{
      final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
      return video;
    }catch(e){
      return null;
    }
  }

  static captureAudio(){
    //todo: add capture audio service
  }

}
