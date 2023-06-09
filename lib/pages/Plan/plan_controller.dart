import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tourease/pages/Plan/plan_model.dart';
import 'package:tourease/util/resources.dart';

class PlanController extends GetxController {
  TabController? tabController;

  List<ModelList> likedlist = [];
  List<ModelList> planedList = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() {
    likedlist.addAll({
      ModelList(
          location: 'Delhi, India',
          placeName: 'Delhi',
          time: '12 Feb - 1 March',
          image: planLikedImage1),
      ModelList(
          location: 'Kerala, India',
          placeName: 'Kerala',
          time: '5 May - 25 Jun',
          image: planLikedImage2),
      ModelList(
          location: 'Rajsthan, India',
          placeName: 'Rajsthan',
          time: '14 Jan - 12 Feb',
          image: planLikedImage3),
      ModelList(
          location: 'Tibet, India',
          placeName: 'Tibet',
          time: '17 Sep - 25 Sep',
          image: planLikedImage4),
      ModelList(
          location: 'Gokarna, India',
          placeName: 'Gokarna',
          time: '8 Aug - 12 Oct',
          image: planLikedImage5),
      ModelList(
          location: 'Junagdth, India',
          placeName: 'Junagdth',
          time: '8 Nov - 12 Nov',
          image: image6),
    });
    planedList.addAll({
      ModelList(title: 'Tibel Culture', image: planImage1),
      ModelList(title: 'Tribal Culture', image: planImage2),
      ModelList(title: 'Kannur Culture', image: planImage3),
    });
    update();
  }
}
