import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'token_member_response.jser.dart';

class TokenMemberResponse {
   /* jwt token */
  final String token;
   /* jwt refresh token */
  final String refreshToken;
  

  TokenMemberResponse(
    

{
     this.token = null,  
     this.refreshToken = null 
    
    }
  );

  @override
  String toString() {
    return 'TokenMemberResponse[token=$token, refreshToken=$refreshToken, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class TokenMemberResponseSerializer extends Serializer<TokenMemberResponse> with _$TokenMemberResponseSerializer {

}
