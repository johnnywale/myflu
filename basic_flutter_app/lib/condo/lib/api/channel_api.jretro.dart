// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ChannelApiClient implements ApiClient {
  final String basePath = "";
  Future<Channel> channelGet(String path) async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "jovx",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/channel")
        .query("path", path);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
