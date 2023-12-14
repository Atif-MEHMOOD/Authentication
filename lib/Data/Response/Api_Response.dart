import 'Status.dart';

class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;
  ApiResponse(this.status,this.message, this.data);

  ApiResponse.loading(): status=Status.Loading;
  ApiResponse.Completed(): status=Status.Completed;
  ApiResponse.Error(): status=Status.Erorr;

  @override
  String toString(){
    return " status : $status \n message : $message \n Data: $data";
  }



}