import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/facility_booking.dart';
import '../model/member_notification.dart';
import '../model/fcm_update.dart';
import '../model/member_profile_update.dart';
import '../model/paged_member_notification.dart';
import '../model/member.dart';
import '../model/error.dart';
import '../model/member_password_update.dart';


part 'user_api.jretro.dart';

@GenApiClient()
class UserApi extends _$UserApiClient with ApiClient {
    final Route base;

    UserApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// cancel booking
    ///
    /// cancel booking 
    @DeleteReq(path: "/user/facility-booking/:facility_booking_id", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<FacilityBooking> userFacilityBookingFacilityBookingIdDelete(
            @PathParam("facility_booking_id") int facilityBookingId
    );

    /// get Current User info
    ///
    /// get Current User info 
    @GetReq(path: "/user/me", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<Member> userMeGet(
    );

    /// update user info
    ///
    /// update user info 
    @PutReq(path: "/user/me", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<Member> userMePut(
        
        @AsJson() MemberProfileUpdate body
    );

    /// Mark readed
    ///
    /// mark message readed 
    @PutReq(path: "/user/notification/:notification_id", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<MemberNotification> userNotificationNotificationIdPut(
            @PathParam("notification_id") int notificationId
    );

    /// get facility booking history
    ///
    /// get facility booking history     
    @GetReq(path: "/user/:user_id/facility-booking", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<List<FacilityBooking>> userUserIdFacilityBookingGet(
            @PathParam("user_id") int userId
    );

    /// Update User Fcm 
    ///
    /// Update User Fcm 
    @PutReq(path: "/user/:user_id/fcm", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<void> userUserIdFcmPut(
            @PathParam("user_id") int userId
        ,
        @AsJson() FcmUpdate body
    );

    /// get notification
    ///
    /// get facility booking history     
    @GetReq(path: "/user/:user_id/notification", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<PagedMemberNotification> userUserIdNotificationGet(
            @PathParam("user_id") int userId
        ,
        @QueryParam("page_no") int pageNo, 
        
        @QueryParam("page_size") int pageSize, 
        
        @QueryParam("order_by") String orderBy, 
        
        @QueryParam("order") String order, 
        
        @QueryParam("filters") String filters
    );

    /// Update User password 
    ///
    /// Update User password 
    @PutReq(path: "/user/:user_id/password", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<void> userUserIdPasswordPut(
            @PathParam("user_id") int userId
        ,
        @AsJson() MemberPasswordUpdate body
    );


}
