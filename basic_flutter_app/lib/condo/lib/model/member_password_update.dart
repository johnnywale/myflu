import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'member_password_update.jser.dart';

class MemberPasswordUpdate {
   /* old password */
  final String oldPassword;
   /* new password */
  final String password;
   /* same as password */
  final String confirmPassword;
  

  MemberPasswordUpdate(
    

{
    
     this.oldPassword = null,  
     this.password = null,  
     this.confirmPassword = null 
    }
  );

  @override
  String toString() {
    return 'MemberPasswordUpdate[oldPassword=$oldPassword, password=$password, confirmPassword=$confirmPassword, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class MemberPasswordUpdateSerializer extends Serializer<MemberPasswordUpdate> with _$MemberPasswordUpdateSerializer {

}
