// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CountrySerializer implements Serializer<Country> {
  @override
  Map<String, dynamic> toMap(Country model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'address_format', model.addressFormat);
    setMapValue(ret, 'iso_code_2', model.isoCode2);
    setMapValue(ret, 'iso_code_3', model.isoCode3);
    setMapValue(ret, 'import_id', model.importId);
    setMapValue(ret, 'phone_code', model.phoneCode);
    setMapValue(ret, 'post_code_required', model.postCodeRequired);
    setMapValue(ret, 'status', model.status);
    return ret;
  }

  @override
  Country fromMap(Map map) {
    if (map == null) return null;
    final obj = Country(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        addressFormat:
            map['address_format'] as String ?? getJserDefault('addressFormat'),
        isoCode2: map['iso_code_2'] as String ?? getJserDefault('isoCode2'),
        isoCode3: map['iso_code_3'] as String ?? getJserDefault('isoCode3'),
        importId: map['import_id'] as int ?? getJserDefault('importId'),
        phoneCode: map['phone_code'] as String ?? getJserDefault('phoneCode'),
        postCodeRequired: map['post_code_required'] as bool ??
            getJserDefault('postCodeRequired'),
        status: map['status'] as bool ?? getJserDefault('status'));
    return obj;
  }
}
