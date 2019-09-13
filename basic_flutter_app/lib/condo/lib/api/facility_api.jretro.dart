// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$FacilityApiClient implements ApiClient {
  final String basePath = "";
  Future<List<BookingSessionStatus>> facilityFacilityIdSessionGet(
      int facilityId, DateTime day) async {
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
        .path("/facility/:facility_id/session")
        .pathParams("facility_id", facilityId)
        .query("day", day);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<Facility>> facilityGet() async {
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
        .path("/facility");
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<FacilityBooking> facilitySessionSessionIdPost(
      int sessionId, FacilityBookingCreate body) async {
    var req = base.post
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
        .path("/facility/session/:session_id")
        .pathParams("session_id", sessionId)
        .json(jsonConverter.to(body));
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
