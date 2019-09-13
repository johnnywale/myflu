import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'login_credentials.jser.dart';

class LoginCredentials {
  
  final String loginName;
  
  final String password;
  

  LoginCredentials(
    

{
    
     this.loginName = null,  
     this.password = null 
    }
  );

  @override
  String toString() {
    return 'LoginCredentials[loginName=$loginName, password=$password, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class LoginCredentialsSerializer extends Serializer<LoginCredentials> with _$LoginCredentialsSerializer {

}
