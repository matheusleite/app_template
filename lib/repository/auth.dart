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
      response.status = false;
      response.message = e.toString();
    });

    return response;
  }

  Future<Response> login(String email, String password) async {
    Response response = Response();
    User user;

    var params = new Map<String, dynamic>();
    params["email"] = email;
    params["password"] = password;

    final request = HttpHelper.post('/login', body: params);

    await request.then((result) {
      //TODO: handle token

      user = User.fromJson(result.data["data"]);

      response.status = result.data["status"];
      response.data = user;
      response.message = result.data["error"];
    }).catchError((e) {
      print(e);
      response.status = false;
      response.message = e.toString();
    });

    return response;
  }
}