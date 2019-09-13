import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/country.dart';
import '../model/country_zone.dart';
part 'home_detail.jser.dart';

class HomeDetail {
   /* id */
  final int id;
   /* name */
  final String name;
   /* addressLine1 */
  final String addressLine1;
   /* addressLine2 */
  final String addressLine2;
   /* country */
  final String country;
   /* postalCode */
  final String postalCode;
   /* postCode */
  final String postCode;
   /* customerId */
  final int customerId;
   /* defaultAddress */
  final bool defaultAddress;
   /* telephone */
  final String telephone;
   /* mobile */
  final String mobile;
   /* state */
  final String state;
   /* fax */
  final String fax;
   /* email */
  final String email;
   /* website */
  final String website;
   /* contactPerson */
  final String contactPerson;
   /* contactEmail */
  final String contactEmail;
   /* surName */
  final String surName;
   /* givenName */
  final String givenName;
   /* city */
  final String city;
   /* liveCountry */
  final Country liveCountry;
   /* countryId */
  final int countryId;
   /* zoneId */
  final int zoneId;
   /* zone */
  final String zone;
   /* countryZone */
  final CountryZone countryZone;
   /* residentialStatus */
  final String residentialStatus;
   /* propertyType */
  final String propertyType;
   /* roomType */
  final String roomType;
  

  HomeDetail(
    

{
     this.id = null,  
     this.name = null,  
     this.addressLine1 = null,  
     this.addressLine2 = null,  
     this.country = null,  
     this.postalCode = null,  
     this.postCode = null,  
     this.customerId = null,  
     this.defaultAddress = null,  
     this.telephone = null,  
     this.mobile = null,  
     this.state = null,  
     this.fax = null,  
     this.email = null,  
     this.website = null,  
     this.contactPerson = null,  
     this.contactEmail = null,  
     this.surName = null,  
     this.givenName = null,  
     this.city = null,  
     this.liveCountry = null,  
     this.countryId = null,  
     this.zoneId = null,  
     this.zone = null,  
     this.countryZone = null,  
     this.residentialStatus = null,  
     this.propertyType = null,  
     this.roomType = null 
    
    }
  );

  @override
  String toString() {
    return 'HomeDetail[id=$id, name=$name, addressLine1=$addressLine1, addressLine2=$addressLine2, country=$country, postalCode=$postalCode, postCode=$postCode, customerId=$customerId, defaultAddress=$defaultAddress, telephone=$telephone, mobile=$mobile, state=$state, fax=$fax, email=$email, website=$website, contactPerson=$contactPerson, contactEmail=$contactEmail, surName=$surName, givenName=$givenName, city=$city, liveCountry=$liveCountry, countryId=$countryId, zoneId=$zoneId, zone=$zone, countryZone=$countryZone, residentialStatus=$residentialStatus, propertyType=$propertyType, roomType=$roomType, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class HomeDetailSerializer extends Serializer<HomeDetail> with _$HomeDetailSerializer {

}
