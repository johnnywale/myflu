// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condo_resident.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CondoResidentSerializer implements Serializer<CondoResident> {
  Serializer<HomeDetail> __homeDetailSerializer;
  Serializer<HomeDetail> get _homeDetailSerializer =>
      __homeDetailSerializer ??= HomeDetailSerializer();
  Serializer<Country> __countrySerializer;
  Serializer<Country> get _countrySerializer =>
      __countrySerializer ??= CountrySerializer();
  Serializer<MemberGroup> __memberGroupSerializer;
  Serializer<MemberGroup> get _memberGroupSerializer =>
      __memberGroupSerializer ??= MemberGroupSerializer();
  @override
  Map<String, dynamic> toMap(CondoResident model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'address', model.address);
    setMapValue(ret, 'approved_date',
        dateTimeUtcProcessor.serialize(model.approvedDate));
    setMapValue(
        ret, 'birthday', dateTimeUtcProcessor.serialize(model.birthday));
    setMapValue(ret, 'block', model.block);
    setMapValue(ret, 'citizenship', model.citizenship);
    setMapValue(ret, 'city', model.city);
    setMapValue(ret, 'company', model.company);
    setMapValue(ret, 'country_id', model.countryId);
    setMapValue(ret, 'country_zone_id', model.countryZoneId);
    setMapValue(ret, 'dtype', model.dtype);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'entry_route', model.entryRoute);
    setMapValue(ret, 'extra_status', model.extraStatus);
    setMapValue(ret, 'fax', model.fax);
    setMapValue(ret, 'gender', model.gender);
    setMapValue(ret, 'given_name', model.givenName);
    setMapValue(ret, 'job_title', model.jobTitle);
    setMapValue(ret, 'hobby', model.hobby);
    setMapValue(ret, 'home', _homeDetailSerializer.toMap(model.home));
    setMapValue(ret, 'industry', model.industry);
    setMapValue(ret, 'marital_status', model.maritalStatus);
    setMapValue(ret, 'mobile', model.mobile);
    setMapValue(ret, 'workphone', model.workphone);
    setMapValue(ret, 'news_letter', model.newsLetter);
    setMapValue(ret, 'nric', model.nric);
    setMapValue(ret, 'other_hobby', model.otherHobby);
    setMapValue(ret, 'register_date',
        dateTimeUtcProcessor.serialize(model.registerDate));
    setMapValue(ret, 'remark', model.remark);
    setMapValue(ret, 'residential_status', model.residentialStatus);
    setMapValue(ret, 'salutation', model.salutation);
    setMapValue(ret, 'sur_name', model.surName);
    setMapValue(ret, 'telephone', model.telephone);
    setMapValue(ret, 'type', model.type);
    setMapValue(ret, 'unit_number', model.unitNumber);
    setMapValue(ret, 'country', _countrySerializer.toMap(model.country));
    setMapValue(ret, 'avatar', model.avatar);
    setMapValue(ret, 'login_name', model.loginName);
    setMapValue(
        ret, 'member_group', _memberGroupSerializer.toMap(model.memberGroup));
    setMapValue(ret, 'member_no', model.memberNo);
    setMapValue(ret, 'status', model.status);
    setMapValue(ret, 'token', model.token);
    setMapValue(ret, 'user_name', model.userName);
    setMapValue(ret, 'verified', model.verified);
    setMapValue(
        ret, 'last_login', dateTimeUtcProcessor.serialize(model.lastLogin));
    setMapValue(ret, 'test', model.test);
    setMapValue(ret, 'facebook_id', model.facebookId);
    setMapValue(ret, 'agent', model.agent);
    setMapValue(
        ret, 'expire_date', dateTimeUtcProcessor.serialize(model.expireDate));
    setMapValue(ret, 'profile_updated', model.profileUpdated);
    setMapValue(ret, 'remote_id', model.remoteId);
    setMapValue(ret, 'fcm_token', model.fcmToken);
    setMapValue(ret, 'allow_book', model.allowBook);
    setMapValue(ret, 'resident_type', model.residentType);
    return ret;
  }

  @override
  CondoResident fromMap(Map map) {
    if (map == null) return null;
    final obj = CondoResident(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        address: map['address'] as String ?? getJserDefault('address'),
        approvedDate:
            dateTimeUtcProcessor.deserialize(map['approved_date'] as String) ??
                getJserDefault('approvedDate'),
        birthday: dateTimeUtcProcessor.deserialize(map['birthday'] as String) ??
            getJserDefault('birthday'),
        block: map['block'] as String ?? getJserDefault('block'),
        citizenship:
            map['citizenship'] as String ?? getJserDefault('citizenship'),
        city: map['city'] as String ?? getJserDefault('city'),
        company: map['company'] as String ?? getJserDefault('company'),
        countryId: map['country_id'] as int ?? getJserDefault('countryId'),
        countryZoneId:
            map['country_zone_id'] as int ?? getJserDefault('countryZoneId'),
        dtype: map['dtype'] as String ?? getJserDefault('dtype'),
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
        home: _homeDetailSerializer.fromMap(map['home'] as Map) ??
            getJserDefault('home'),
        industry: map['industry'] as String ?? getJserDefault('industry'),
        maritalStatus:
            map['marital_status'] as String ?? getJserDefault('maritalStatus'),
        mobile: map['mobile'] as String ?? getJserDefault('mobile'),
        workphone: map['workphone'] as String ?? getJserDefault('workphone'),
        newsLetter: map['news_letter'] as bool ?? getJserDefault('newsLetter'),
        nric: map['nric'] as String ?? getJserDefault('nric'),
        otherHobby:
            map['other_hobby'] as String ?? getJserDefault('otherHobby'),
        registerDate:
            dateTimeUtcProcessor.deserialize(map['register_date'] as String) ??
                getJserDefault('registerDate'),
        remark: map['remark'] as String ?? getJserDefault('remark'),
        residentialStatus: map['residential_status'] as String ??
            getJserDefault('residentialStatus'),
        salutation: map['salutation'] as String ?? getJserDefault('salutation'),
        surName: map['sur_name'] as String ?? getJserDefault('surName'),
        telephone: map['telephone'] as String ?? getJserDefault('telephone'),
        type: map['type'] as String ?? getJserDefault('type'),
        unitNumber:
            map['unit_number'] as String ?? getJserDefault('unitNumber'),
        country: _countrySerializer.fromMap(map['country'] as Map) ??
            getJserDefault('country'),
        avatar: map['avatar'] as String ?? getJserDefault('avatar'),
        loginName: map['login_name'] as String ?? getJserDefault('loginName'),
        memberGroup:
            _memberGroupSerializer.fromMap(map['member_group'] as Map) ??
                getJserDefault('memberGroup'),
        memberNo: map['member_no'] as String ?? getJserDefault('memberNo'),
        status: map['status'] as String ?? getJserDefault('status'),
        token: map['token'] as String ?? getJserDefault('token'),
        userName: map['user_name'] as String ?? getJserDefault('userName'),
        verified: map['verified'] as bool ?? getJserDefault('verified'),
        lastLogin:
            dateTimeUtcProcessor.deserialize(map['last_login'] as String) ??
                getJserDefault('lastLogin'),
        test: map['test'] as bool ?? getJserDefault('test'),
        facebookId: map['facebook_id'] as String ?? getJserDefault('facebookId'),
        agent: map['agent'] as bool ?? getJserDefault('agent'),
        expireDate: dateTimeUtcProcessor.deserialize(map['expire_date'] as String) ?? getJserDefault('expireDate'),
        profileUpdated: map['profile_updated'] as bool ?? getJserDefault('profileUpdated'),
        remoteId: map['remote_id'] as int ?? getJserDefault('remoteId'),
        fcmToken: map['fcm_token'] as String ?? getJserDefault('fcmToken'),
        allowBook: map['allow_book'] as bool ?? getJserDefault('allowBook'),
        residentType: map['resident_type'] as String ?? getJserDefault('residentType'));
    return obj;
  }
}
