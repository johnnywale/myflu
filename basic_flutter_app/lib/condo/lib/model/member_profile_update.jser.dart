// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_profile_update.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MemberProfileUpdateSerializer
    implements Serializer<MemberProfileUpdate> {
  @override
  Map<String, dynamic> toMap(MemberProfileUpdate model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'address', model.address);
    setMapValue(
        ret, 'birthday', dateTimeUtcProcessor.serialize(model.birthday));
    setMapValue(ret, 'block', model.block);
    setMapValue(ret, 'citizenship', model.citizenship);
    setMapValue(ret, 'city', model.city);
    setMapValue(ret, 'company', model.company);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'entry_route', model.entryRoute);
    setMapValue(ret, 'extra_status', model.extraStatus);
    setMapValue(ret, 'fax', model.fax);
    setMapValue(ret, 'gender', model.gender);
    setMapValue(ret, 'given_name', model.givenName);
    setMapValue(ret, 'job_title', model.jobTitle);
    setMapValue(ret, 'hobby', model.hobby);
    setMapValue(ret, 'industry', model.industry);
    setMapValue(ret, 'marital_status', model.maritalStatus);
    setMapValue(ret, 'mobile', model.mobile);
    setMapValue(ret, 'workphone', model.workphone);
    setMapValue(ret, 'news_letter', model.newsLetter);
    setMapValue(ret, 'nric', model.nric);
    setMapValue(ret, 'other_hobby', model.otherHobby);
    setMapValue(ret, 'remark', model.remark);
    setMapValue(ret, 'residential_status', model.residentialStatus);
    setMapValue(ret, 'salutation', model.salutation);
    setMapValue(ret, 'sur_name', model.surName);
    setMapValue(ret, 'telephone', model.telephone);
    setMapValue(ret, 'type', model.type);
    setMapValue(ret, 'member_no', model.memberNo);
    setMapValue(ret, 'status', model.status);
    setMapValue(ret, 'token', model.token);
    setMapValue(ret, 'user_name', model.userName);
    return ret;
  }

  @override
  MemberProfileUpdate fromMap(Map map) {
    if (map == null) return null;
    final obj = MemberProfileUpdate(
        name: map['name'] as String ?? getJserDefault('name'),
        address: map['address'] as String ?? getJserDefault('address'),
        birthday: dateTimeUtcProcessor.deserialize(map['birthday'] as String) ??
            getJserDefault('birthday'),
        block: map['block'] as String ?? getJserDefault('block'),
        citizenship:
            map['citizenship'] as String ?? getJserDefault('citizenship'),
        city: map['city'] as String ?? getJserDefault('city'),
        company: map['company'] as String ?? getJserDefault('company'),
        email: map['email'] as String ?? getJserDefault('email'),
        entryRoute:
            map['entry_route'] as String ?? getJserDefault('entryRoute'),
        extraStatus:
            map['extra_status'] as String ?? getJserDefault('extraStatus'),
        fax: map['fax'] as String ?? getJserDefault('fax'),
        gender: map['gender'] as String ?? getJserDefault('gender'),
        givenName: map['given_name'] as String ?? getJserDefault('givenName'),
        jobTitle: map['job_title'] as String ?? getJserDefault('jobTitle'),
        hobby: map['hobby'] as String ?? getJserDefault('hobby'),
        industry: map['industry'] as String ?? getJserDefault('industry'),
        maritalStatus:
            map['marital_status'] as String ?? getJserDefault('maritalStatus'),
        mobile: map['mobile'] as String ?? getJserDefault('mobile'),
        workphone: map['workphone'] as String ?? getJserDefault('workphone'),
        newsLetter: map['news_letter'] as bool ?? getJserDefault('newsLetter'),
        nric: map['nric'] as String ?? getJserDefault('nric'),
        otherHobby:
            map['other_hobby'] as String ?? getJserDefault('otherHobby'),
        remark: map['remark'] as String ?? getJserDefault('remark'),
        residentialStatus: map['residential_status'] as String ??
            getJserDefault('residentialStatus'),
        salutation: map['salutation'] as String ?? getJserDefault('salutation'),
        surName: map['sur_name'] as String ?? getJserDefault('surName'),
        telephone: map['telephone'] as String ?? getJserDefault('telephone'),
        type: map['type'] as String ?? getJserDefault('type'),
        memberNo: map['member_no'] as String ?? getJserDefault('memberNo'),
        status: map['status'] as String ?? getJserDefault('status'),
        token: map['token'] as String ?? getJserDefault('token'),
        userName: map['user_name'] as String ?? getJserDefault('userName'));
    return obj;
  }
}
