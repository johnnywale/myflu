library swagger.api;

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import './auth/api_key_auth.dart';
import './auth/basic_auth.dart';
import './auth/oauth.dart';

import './api/album_api.dart';
import './api/article_api.dart';
import './api/calendar_event_api.dart';
import './api/channel_api.dart';
import './api/facility_api.dart';
import './api/open_api.dart';
import './api/user_api.dart';

import './model/album.dart';
import './model/album_photo.dart';
import './model/article.dart';
import './model/booking_limitation.dart';
import './model/booking_session.dart';
import './model/booking_session_status.dart';
import './model/calendar_event.dart';
import './model/category.dart';
import './model/channel.dart';
import './model/condo_resident.dart';
import './model/country.dart';
import './model/country_zone.dart';
import './model/error.dart';
import './model/error_content.dart';
import './model/error_field.dart';
import './model/facility.dart';
import './model/facility_booking.dart';
import './model/facility_booking_create.dart';
import './model/facility_sort.dart';
import './model/fcm_update.dart';
import './model/home_detail.dart';
import './model/html_content.dart';
import './model/login_credentials.dart';
import './model/member.dart';
import './model/member_group.dart';
import './model/member_notification.dart';
import './model/member_password_update.dart';
import './model/member_profile_update.dart';
import './model/meta.dart';
import './model/meta_info.dart';
import './model/notification_message.dart';
import './model/page_base.dart';
import './model/peak.dart';
import './model/success.dart';
import './model/template.dart';
import './model/token_member_response.dart';
import './model/page.dart';
import './model/paged_article.dart';
import './model/paged_calendar_event.dart';
import './model/paged_member_notification.dart';


final jsonJaguarRepo = JsonRepo()
    ..add(AlbumSerializer())
    ..add(AlbumPhotoSerializer())
    ..add(ArticleSerializer())
    ..add(BookingLimitationSerializer())
    ..add(BookingSessionSerializer())
    ..add(BookingSessionStatusSerializer())
    ..add(CalendarEventSerializer())
    ..add(CategorySerializer())
    ..add(ChannelSerializer())
    ..add(CondoResidentSerializer())
    ..add(CountrySerializer())
    ..add(CountryZoneSerializer())
    ..add(ErrorSerializer())
    ..add(ErrorContentSerializer())
    ..add(ErrorFieldSerializer())
    ..add(FacilitySerializer())
    ..add(FacilityBookingSerializer())
    ..add(FacilityBookingCreateSerializer())
    ..add(FacilitySortSerializer())
    ..add(FcmUpdateSerializer())
    ..add(HomeDetailSerializer())
    ..add(HtmlContentSerializer())
    ..add(LoginCredentialsSerializer())
    ..add(MemberSerializer())
    ..add(MemberGroupSerializer())
    ..add(MemberNotificationSerializer())
    ..add(MemberPasswordUpdateSerializer())
    ..add(MemberProfileUpdateSerializer())
    ..add(MetaSerializer())
    ..add(MetaInfoSerializer())
    ..add(NotificationMessageSerializer())
    ..add(PageBaseSerializer())
    ..add(PeakSerializer())
    ..add(SuccessSerializer())
    ..add(TemplateSerializer())
    ..add(TokenMemberResponseSerializer())
    ..add(PageSerializer())
    ..add(PagedArticleSerializer())
    ..add(PagedCalendarEventSerializer())
    ..add(PagedMemberNotificationSerializer())
;

final _defaultInterceptors = [OAuthInterceptor(), BasicAuthInterceptor(), ApiKeyAuthInterceptor()];

class JaguarApiGen {
    List<Interceptor> interceptors;
    String basePath = "http://www.ferrariapark.com.sg/v1";
    Route _baseRoute;

    /**
     * Add custom global interceptors, put overrideInterceptors to true to set your interceptors only (auth interceptors will not be added)
     */
    JaguarApiGen({List<Interceptor> interceptors, bool overrideInterceptors = false, String baseUrl}) {
        _baseRoute = Route(baseUrl ?? basePath).withClient(globalClient ?? IOClient());
        if(interceptors == null) {
            this.interceptors = _defaultInterceptors;
        }
        else if(overrideInterceptors){
            this.interceptors = interceptors;
        }
        else {
            this.interceptors = List.from(_defaultInterceptors)..addAll(interceptors);
        }

        this.interceptors.forEach((interceptor) {
            _baseRoute.before(interceptor.before);
            _baseRoute.after(interceptor.after);
        });
    }

    void setOAuthToken(String name, String token) {
        (_defaultInterceptors[0] as OAuthInterceptor).tokens[name] = token;
    }

    void setBasicAuth(String name, String username, String password) {
        (_defaultInterceptors[1] as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }

    void setApiKey(String name, String apiKey) {
        (_defaultInterceptors[2] as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }


    /**
     * Get AlbumApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    AlbumApi getAlbumApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return AlbumApi(base: base, serializers: serializers);
    }


    /**
     * Get ArticleApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    ArticleApi getArticleApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return ArticleApi(base: base, serializers: serializers);
    }


    /**
     * Get CalendarEventApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    CalendarEventApi getCalendarEventApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return CalendarEventApi(base: base, serializers: serializers);
    }


    /**
     * Get ChannelApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    ChannelApi getChannelApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return ChannelApi(base: base, serializers: serializers);
    }


    /**
     * Get FacilityApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    FacilityApi getFacilityApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return FacilityApi(base: base, serializers: serializers);
    }


    /**
     * Get OpenApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    OpenApi getOpenApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return OpenApi(base: base, serializers: serializers);
    }


    /**
     * Get UserApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    UserApi getUserApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return UserApi(base: base, serializers: serializers);
    }


}