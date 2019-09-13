import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/channel.dart';
import '../model/error.dart';


part 'channel_api.jretro.dart';

@GenApiClient()
class ChannelApi extends _$ChannelApiClient with ApiClient {
    final Route base;

    ChannelApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// Get Channel By Paramter
    ///
    /// Get Channel By Paramter 
    @GetReq(path: "/channel", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<Channel> channelGet(
        
        @QueryParam("path") String path
    );


}
