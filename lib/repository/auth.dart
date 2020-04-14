import 'package:app_template/model/response.dart';
import 'package:app_template/model/user.dart';
import 'package:app_template/util/network/http.dart';

class AuthRepository {
  Future<Response> signUp(String name, String email, String password) async {
    Response response = Response();
    User user;

    var params = new Map<String, dynamic>();
    params["name"] = name;
    params["email"] = email;
    params["password"] = password;

    final request = HttpHelper.post('/user', body: params);

    await request.then((result) {
      user = User.fromJson(result.data["data"]);

      response.status = result.data["status"];
      response.data = user;
      response.message = result.data["error"];
    }).catchError((e) {
      print(e);
    });

    return response;
  }
}