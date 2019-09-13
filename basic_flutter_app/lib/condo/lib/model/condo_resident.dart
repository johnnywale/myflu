import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/country.dart';
import '../model/home_detail.dart';
import '../model/member_group.dart';
part 'condo_resident.jser.dart';

class CondoResident {
   /* id */
  final int id;
   /* name */
  final String name;
   /* address */
  final String address;
   /* approvedDate */
  final DateTime approvedDate;
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
   /* countryId */
  final int countryId;
   /* countryZoneId */
  final int countryZoneId;
   /* dtype */
  final String dtype;
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
   /* home */
  final HomeDetail home;
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
   /* registerDate */
  final DateTime registerDate;
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
   /* unitNumber */
  final String unitNumber;
   /* country */
  final Country country;
   /* avatar */
  final String avatar;
   /* loginName */
  final String loginName;
   /* memberGroup */
  final MemberGroup memberGroup;
   /* memberNo */
  final String memberNo;
   /* status */
  final String status;
   /* token */
  final String token;
   /* userName */
  final String userName;
   /* verified */
  final bool verified;
   /* lastLogin */
  final DateTime lastLogin;
   /* test */
  final bool test;
   /* facebookId */
  final String facebookId;
   /* agent */
  final bool agent;
   /* expireDate */
  final DateTime expireDate;
   /* profileUpdated */
  final bool profileUpdated;
   /* remoteId */
  final int remoteId;
   /* fcmToken */
  final String fcmToken;
   /* allowBook */
  final bool allowBook;
   /* residentType */
  final String residentType;
  

  CondoResident(
    

{
     this.id = null,  
     this.name = null,  
     this.address = null,  
     this.approvedDate = null,  
     this.birthday = null,  
     this.block = null,  
     this.citizenship = null,  
     this.city = null,  
     this.company = null,  
     this.countryId = null,  
     this.countryZoneId = null,  
     this.dtype = null,  
     this.email = null,  
     this.entryRoute = null,  
     this.extraStatus = null,  
     this.fax = null,  
     this.gender = null,  
     this.givenName = null,  
     this.jobTitle = null,  
     this.hobby = null,  
     this.home = null,  
     this.industry = null,  
     this.maritalStatus = null,  
     this.mobile = null,  
     this.workphone = null,  
     this.newsLetter = null,  
     this.nric = null,  
     this.otherHobby = null,  
     this.registerDate = null,  
     this.remark = null,  
     this.residentialStatus = null,  
     this.salutation = null,  
     this.surName = null,  
     this.telephone = null,  
     this.type = null,  
     this.unitNumber = null,  
     this.country = null,  
     this.avatar = null,  
     this.loginName = null,  
     this.memberGroup = null,  
     this.memberNo = null,  
     this.status = null,  
     this.token = null,  
     this.userName = null,  
     this.verified = null,  
     this.lastLogin = null,  
     this.test = null,  
     this.facebookId = null,  
     this.agent = null,  
     this.expireDate = null,  
     this.profileUpdated = null,  
     this.remoteId = null,  
     this.fcmToken = null,  
     this.allowBook = null,  
     this.residentType = null 
    
    }
  );

  @override
  String toString() {
    return 'CondoResident[id=$id, name=$name, address=$address, approvedDate=$approvedDate, birthday=$birthday, block=$block, citizenship=$citizenship, city=$city, company=$company, countryId=$countryId, countryZoneId=$countryZoneId, dtype=$dtype, email=$email, entryRoute=$entryRoute, extraStatus=$extraStatus, fax=$fax, gender=$gender, givenName=$givenName, jobTitle=$jobTitle, hobby=$hobby, home=$home, industry=$industry, maritalStatus=$maritalStatus, mobile=$mobile, workphone=$workphone, newsLetter=$newsLetter, nric=$nric, otherHobby=$otherHobby, registerDate=$registerDate, remark=$remark, residentialStatus=$residentialStatus, salutation=$salutation, surName=$surName, telephone=$telephone, type=$type, unitNumber=$unitNumber, country=$country, avatar=$avatar, loginName=$loginName, memberGroup=$memberGroup, memberNo=$memberNo, status=$status, token=$token, userName=$userName, verified=$verified, lastLogin=$lastLogin, test=$test, facebookId=$facebookId, agent=$agent, expireDate=$expireDate, profileUpdated=$profileUpdated, remoteId=$remoteId, fcmToken=$fcmToken, allowBook=$allowBook, residentType=$residentType, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class CondoResidentSerializer extends Serializer<CondoResident> with _$CondoResidentSerializer {

}
