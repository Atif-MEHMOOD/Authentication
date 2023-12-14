import 'package:authenticationproject/Data/Network/BaseApiService.dart';
import 'package:authenticationproject/Data/Network/NetwrorkApiService.dart';
import 'package:authenticationproject/Utils/Utils.dart';
import 'package:authenticationproject/components/app_url.dart';

class AuthRepository{
  BaseApiService _apiService= NetworkApiService();

Future<dynamic> loginApi(dynamic data) async{
  try{
    dynamic response = await _apiService.GetPostApiSercice(AppUrl.loginEndPoint, data);
 return response;
  }
  catch (e){

   throw e;

    
  }
}


  Future<dynamic> Registerapi(data) async{
    try{
      dynamic response = await _apiService.GetPostApiSercice(AppUrl.loginEndPoint,data);
      return response;
    }
    catch (e){
      throw e;

    }
  }
}
