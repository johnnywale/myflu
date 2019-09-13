// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$UserApiClient implements ApiClient {
  final String basePath = "";
  Future<FacilityBooking> userFacilityBookingFacilityBookingIdDelete(
      int facilityBookingId) async {
    var req = base.delete
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
        .path("/user/facility-booking/:facility_booking_id")
        .pathParams("facility_booking_id", facilityBookingId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<Member> userMeGet() async {
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
        .path("/user/me");
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<Member> userMePut(MemberProfileUpdate body) async {
    var req = base.put
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
        .path("/user/me")
        .json(jsonConverter.to(body));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<MemberNotification> userNotificationNotificationIdPut(
      int notificationId) async {
    var req = base.put
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
        .path("/user/notification/:notification_id")
        .pathParams("notification_id", notificationId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<FacilityBooking>> userUserIdFacilityBookingGet(int userId) async {
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
        .path("/user/:user_id/facility-booking")
        .pathParams("user_id", userId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> userUserIdFcmPut(int userId, FcmUpdate body) async {
    var req = base.put
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
        .path("/user/:user_id/fcm")
        .pathParams("user_id", userId)
        .json(jsonConverter.to(body));
    await req.go(throwOnErr: true);
  }

  Future<PagedMemberNotification> userUserIdNotificationGet(
      int userId,
      int pageNo,
      int pageSize,
      String orderBy,
      String order,
      String filters) async {
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
        .path("/user/:user_id/notification")
        .pathParams("user_id", userId)
        .query("page_no", pageNo)
        .query("page_size", pageSize)
        .query("order_by", orderBy)
        .query("order", order)
        .query("filters", filters);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<void> userUserIdPasswordPut(
      int userId, MemberPasswordUpdate body) async {
    var req = base.put
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
        .path("/user/:user_id/password")
        .pathParams("user_id", userId)
        .json(jsonConverter.to(body));
    await req.go(throwOnErr: true);
  }
}
