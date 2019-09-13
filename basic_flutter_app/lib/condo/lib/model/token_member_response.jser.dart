// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_member_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$TokenMemberResponseSerializer
    implements Serializer<TokenMemberResponse> {
  @override
  Map<String, dynamic> toMap(TokenMemberResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'token', model.token);
    setMapValue(ret, 'refresh_token', model.refreshToken);
    return ret;
  }

  @override
  TokenMemberResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = TokenMemberResponse(
        token: map['token'] as String ?? getJserDefault('token'),
        refreshToken:
            map['refresh_token'] as String ?? getJserDefault('refreshToken'));
    return obj;
  }
}
