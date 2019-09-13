import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/facility_booking_create.dart';
import '../model/facility_booking.dart';
import '../model/error.dart';
import '../model/booking_session_status.dart';
import '../model/facility.dart';


part 'facility_api.jretro.dart';

@GenApiClient()
class FacilityApi extends _$FacilityApiClient with ApiClient {
    final Route base;

    FacilityApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// list all session
    ///
    /// List all session for  
    @GetReq(path: "/facility/:facility_id/session", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<List<BookingSessionStatus>> facilityFacilityIdSessionGet(
            @PathParam("facility_id") int facilityId
        ,
        @QueryParam("day") DateTime day
    );

    /// get all Facility
    ///
    /// get facility booking history 
    @GetReq(path: "/facility", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<List<Facility>> facilityGet(
    );

    /// Create a facility booking 
    ///
    /// Create a facility booking 
    @PostReq(path: "/facility/session/:session_id", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<FacilityBooking> facilitySessionSessionIdPost(
            @PathParam("session_id") int sessionId
        ,
        @AsJson() FacilityBookingCreate body
    );


}
