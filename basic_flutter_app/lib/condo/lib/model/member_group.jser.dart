// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_group.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MemberGroupSerializer implements Serializer<MemberGroup> {
  @override
  Map<String, dynamic> toMap(MemberGroup model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'member_level', model.memberLevel);
    setMapValue(ret, 'vip', model.vip);
    setMapValue(ret, 'overwriting_commission', model.overwritingCommission);
    setMapValue(ret, 'direct_commission', model.directCommission);
    setMapValue(ret, 'auto_upgrade', model.autoUpgrade);
    setMapValue(ret, 'base_sales_volume', model.baseSalesVolume);
    setMapValue(ret, 'active_reps_required', model.activeRepsRequired);
    setMapValue(ret, 'default_group', model.defaultGroup);
    return ret;
  }

  @override
  MemberGroup fromMap(Map map) {
    if (map == null) return null;
    final obj = MemberGroup(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        code: map['code'] as String ?? getJserDefault('code'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        memberLevel:
            map['member_level'] as int ?? getJserDefault('memberLevel'),
        vip: map['vip'] as bool ?? getJserDefault('vip'),
        overwritingCommission: map['overwriting_commission'] as num ??
            getJserDefault('overwritingCommission'),
        directCommission: map['direct_commission'] as num ??
            getJserDefault('directCommission'),
        autoUpgrade:
            map['auto_upgrade'] as bool ?? getJserDefault('autoUpgrade'),
        baseSalesVolume: map['base_sales_volume'] as num ??
            getJserDefault('baseSalesVolume'),
        activeRepsRequired: map['active_reps_required'] as int ??
            getJserDefault('activeRepsRequired'),
        defaultGroup:
            map['default_group'] as bool ?? getJserDefault('defaultGroup'));
    return obj;
  }
}
