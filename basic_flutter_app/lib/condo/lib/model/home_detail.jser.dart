// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_detail.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$HomeDetailSerializer implements Serializer<HomeDetail> {
  Serializer<Country> __countrySerializer;
  Serializer<Country> get _countrySerializer =>
      __countrySerializer ??= CountrySerializer();
  Serializer<CountryZone> __countryZoneSerializer;
  Serializer<CountryZone> get _countryZoneSerializer =>
      __countryZoneSerializer ??= CountryZoneSerializer();
  @override
  Map<String, dynamic> toMap(HomeDetail model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'address_line_1', model.addressLine1);
    setMapValue(ret, 'address_line_2', model.addressLine2);
    setMapValue(ret, 'country', model.country);
    setMapValue(ret, 'postal_code', model.postalCode);
    setMapValue(ret, 'post_code', model.postCode);
    setMapValue(ret, 'customer_id', model.customerId);
    setMapValue(ret, 'default_address', model.defaultAddress);
    setMapValue(ret, 'telephone', model.telephone);
    setMapValue(ret, 'mobile', model.mobile);
    setMapValue(ret, 'state', model.state);
    setMapValue(ret, 'fax', model.fax);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'website', model.website);
    setMapValue(ret, 'contact_person', model.contactPerson);
    setMapValue(ret, 'contact_email', model.contactEmail);
    setMapValue(ret, 'sur_name', model.surName);
    setMapValue(ret, 'given_name', model.givenName);
    setMapValue(ret, 'city', model.city);
    setMapValue(
        ret, 'live_country', _countrySerializer.toMap(model.liveCountry));
    setMapValue(ret, 'country_id', model.countryId);
    setMapValue(ret, 'zone_id', model.zoneId);
    setMapValue(ret, 'zone', model.zone);
    setMapValue(
        ret, 'country_zone', _countryZoneSerializer.toMap(model.countryZone));
    setMapValue(ret, 'residential_status', model.residentialStatus);
    setMapValue(ret, 'property_type', model.propertyType);
    setMapValue(ret, 'room_type', model.roomType);
    return ret;
  }

  @override
  HomeDetail fromMap(Map map) {
    if (map == null) return null;
    final obj = HomeDetail(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        addressLine1:
            map['address_line_1'] as String ?? getJserDefault('addressLine1'),
        addressLine2:
            map['address_line_2'] as String ?? getJserDefault('addressLine2'),
        country: map['country'] as String ?? getJserDefault('country'),
        postalCode:
            map['postal_code'] as String ?? getJserDefault('postalCode'),
        postCode: map['post_code'] as String ?? getJserDefault('postCode'),
        customerId: map['customer_id'] as int ?? getJserDefault('customerId'),
        defaultAddress:
            map['default_address'] as bool ?? getJserDefault('defaultAddress'),
        telephone: map['telephone'] as String ?? getJserDefault('telephone'),
        mobile: map['mobile'] as String ?? getJserDefault('mobile'),
        state: map['state'] as String ?? getJserDefault('state'),
        fax: map['fax'] as String ?? getJserDefault('fax'),
        email: map['email'] as String ?? getJserDefault('email'),
        website: map['website'] as String ?? getJserDefault('website'),
        contactPerson:
            map['contact_person'] as String ?? getJserDefault('contactPerson'),
        contactEmail:
            map['contact_email'] as String ?? getJserDefault('contactEmail'),
        surName: map['sur_name'] as String ?? getJserDefault('surName'),
        givenName: map['given_name'] as String ?? getJserDefault('givenName'),
        city: map['city'] as String ?? getJserDefault('city'),
        liveCountry: _countrySerializer.fromMap(map['live_country'] as Map) ??
            getJserDefault('liveCountry'),
        countryId: map['country_id'] as int ?? getJserDefault('countryId'),
        zoneId: map['zone_id'] as int ?? getJserDefault('zoneId'),
        zone: map['zone'] as String ?? getJserDefault('zone'),
        countryZone:
            _countryZoneSerializer.fromMap(map['country_zone'] as Map) ??
                getJserDefault('countryZone'),
        residentialStatus: map['residential_status'] as String ??
            getJserDefault('residentialStatus'),
        propertyType:
            map['property_type'] as String ?? getJserDefault('propertyType'),
        roomType: map['room_type'] as String ?? getJserDefault('roomType'));
    return obj;
  }
}
