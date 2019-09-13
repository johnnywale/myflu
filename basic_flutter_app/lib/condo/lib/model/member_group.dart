import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'member_group.jser.dart';

class MemberGroup {
   /* id */
  final int id;
   /* name */
  final String name;
   /* code */
  final String code;
   /* description */
  final String description;
   /* memberLevel */
  final int memberLevel;
   /* vip */
  final bool vip;
   /* overwritingCommission */
  final num overwritingCommission;
   /* directCommission */
  final num directCommission;
   /* autoUpgrade */
  final bool autoUpgrade;
   /* baseSalesVolume */
  final num baseSalesVolume;
   /* activeRepsRequired */
  final int activeRepsRequired;
   /* defaultGroup */
  final bool defaultGroup;
  

  MemberGroup(
    

{
     this.id = null,  
     this.name = null,  
     this.code = null,  
     this.description = null,  
     this.memberLevel = null,  
     this.vip = null,  
     this.overwritingCommission = null,  
     this.directCommission = null,  
     this.autoUpgrade = null,  
     this.baseSalesVolume = null,  
     this.activeRepsRequired = null,  
     this.defaultGroup = null 
    
    }
  );

  @override
  String toString() {
    return 'MemberGroup[id=$id, name=$name, code=$code, description=$description, memberLevel=$memberLevel, vip=$vip, overwritingCommission=$overwritingCommission, directCommission=$directCommission, autoUpgrade=$autoUpgrade, baseSalesVolume=$baseSalesVolume, activeRepsRequired=$activeRepsRequired, defaultGroup=$defaultGroup, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class MemberGroupSerializer extends Serializer<MemberGroup> with _$MemberGroupSerializer {

}
