
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';

Future uploadImage(String title, File file1) async{

  var request = http.MultipartRequest("POST",Uri.parse("https://api.imgur.com/3/image"));

  request.fields['title'] = "dummyImage";
  request.headers['Authorization'] = "Client-ID 9820407c54523ac";

  var picture = http.MultipartFile.fromBytes('image', (await file1.readAsBytes()).buffer.asUint8List(),
      filename: 'testimage.png');

  request.files.add(picture);

  var response = await request.send();

  var responseData = await response.stream.toBytes();

  var result = String.fromCharCodes(responseData);

  return jsonDecode(result)["data"]["link"].toString();

}

take_photo(lat, lon, bottle) async{
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
  File file = File(photo.path);
  String code = generateRandomString(5);
  String link = await uploadImage(code, file);
  transmit(lat, lon, bottle, link);
  }
  return true;
}

String generateRandomString(int len) {
  var r = Random();
  const _chars = '1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}


transmit(lat,lon,bottle,link) async{
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    String code = generateRandomString(5);
    var url = Uri.parse(
        'http://192.168.1.192/students/Daniel/main.php?a=${code}&b=${link
            .toString()}&c=${formattedDate}&d=${lat}&e=${lon}&f=${bottle}');
    http.Response response = await http.get(url);
    print(url);
    print(response);
}

