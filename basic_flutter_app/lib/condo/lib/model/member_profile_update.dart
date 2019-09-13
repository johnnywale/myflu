import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'member_profile_update.jser.dart';

class MemberProfileUpdate {
   /* name */
  final String name;
   /* address */
  final String address;
   /* birthday */
  final DateTime birthday;
   /* block */
  final String block;
   /* citizenship */
  final String citizenship;
   /* city */
  final String city;
   /* company */
  final String company;
   /* email */
  final String email;
   /* entryRoute */
  final String entryRoute;
   /* extraStatus */
  final String extraStatus;
   /* fax */
  final String fax;
   /* gender */
  final String gender;
   /* givenName */
  final String givenName;
   /* jobTitle */
  final String jobTitle;
   /* hobby */
  final String hobby;
   /* industry */
  final String industry;
   /* maritalStatus */
  final String maritalStatus;
   /* mobile */
  final String mobile;
   /* workphone */
  final String workphone;
   /* newsLetter */
  final bool newsLetter;
   /* nric */
  final String nric;
   /* otherHobby */
  final String otherHobby;
   /* remark */
  final String remark;
   /* residentialStatus */
  final String residentialStatus;
   /* salutation */
  final String salutation;
   /* surName */
  final String surName;
   /* telephone */
  final String telephone;
   /* type */
  final String type;
   /* memberNo */
  final String memberNo;
   /* status */
  final String status;
   /* token */
  final String token;
   /* userName */
  final String userName;
  

  MemberProfileUpdate(
    

{
     this.name = null,  
     this.address = null,  
     this.birthday = null,  
     this.block = null,  
     this.citizenship = null,  
     this.city = null,  
     this.company = null,  
     this.email = null,  
     this.entryRoute = null,  
     this.extraStatus = null,  
     this.fax = null,  
     this.gender = null,  
     this.givenName = null,  
     this.jobTitle = null,  
     this.hobby = null,  
     this.industry = null,  
     this.maritalStatus = null,  
     this.mobile = null,  
     this.workphone = null,  
     this.newsLetter = null,  
     this.nric = null,  
     this.otherHobby = null,  
     this.remark = null,  
     this.residentialStatus = null,  
     this.salutation = null,  
     this.surName = null,  
     this.telephone = null,  
     this.type = null,  
     this.memberNo = null,  
     this.status = null,  
     this.token = null,  
     this.userName = null 
    
    }
  );

  @override
  String toString() {
    return 'MemberProfileUpdate[name=$name, address=$address, birthday=$birthday, block=$block, citizenship=$citizenship, city=$city, company=$company, email=$email, entryRoute=$entryRoute, extraStatus=$extraStatus, fax=$fax, gender=$gender, givenName=$givenName, jobTitle=$jobTitle, hobby=$hobby, industry=$industry, maritalStatus=$maritalStatus, mobile=$mobile, workphone=$workphone, newsLetter=$newsLetter, nric=$nric, otherHobby=$otherHobby, remark=$remark, residentialStatus=$residentialStatus, salutation=$salutation, surName=$surName, telephone=$telephone, type=$type, memberNo=$memberNo, status=$status, token=$token, userName=$userName, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class MemberProfileUpdateSerializer extends Serializer<MemberProfileUpdate> with _$MemberProfileUpdateSerializer {

}
