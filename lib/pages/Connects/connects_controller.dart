import 'package:get/get.dart';
import 'package:tourease/util/resources.dart';

class ConnectController extends GetxController {
  int index = 1;
  int groupJoin = 0;
  int superLeadConnect = 0;
  List<String> leadNames = ['Aakash', 'Udhay raj', 'Mahesh', 'Rajesh'];
  List<String> leadImages = [
    superLeadIcon1,
    superLeadIcon2,
    superLeadIcon3,
    superLeadIcon4
  ];

  List<String> groupTitles = [
    'Sports',
    'Food',
    'Trecking',
    'Events',
    'Fitness'
  ];
  List<String> groupImages = [
    groupIcon1,
    groupIcon2,
    groupIcon3,
    groupIcon4,
    groupIcon5
  ];
  List<String> addGroupImage = [
    addGroup1,
    addGroup2,
    addGroup3,
    addGroup4,
    addGroup5,
  ];
  List<String> addSuperLeadImage = [
    addsuperLead1,
    addsuperLead2,
    addsuperLead3,
    superLeadIcon4
  ];
}
