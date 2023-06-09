import 'package:tourease/webservices/api_request.dart';
import 'package:tourease/webservices/response_model.dart';
import 'package:tourease/webservices/url_constants.dart';

class Signup {
  signup({
    Function()? beforeSend,
    Function(ResponseModel responseModel)? onSucess,
    Function(ResponseModel responseModel)? onError,
  }) {
    ApiRequest(
      url: UrlConstants.MAIN_URL,
    ).getRequest(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onError: (error) {
          print(error);
        },
        onSuccess: (data) {
          onSucess!(data);
        });
  }
}
