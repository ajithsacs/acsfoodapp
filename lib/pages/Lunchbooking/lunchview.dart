import 'package:acsfoodapp/const/stringconst.dart';
import 'package:acsfoodapp/pages/Lunchbooking/lunchcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../const/Appcolor.dart';

class LunchView extends GetView<LunchController>{
  LunchView({Key? key}) : super(key: key) {
    controller.init();
  }

  // String dropdownvalue = 'Meals with One Chapati';

  // // List of items in our dropdown menu
  // var items = [
  //   "Meals with One Chapati",
  //   'Chapathi only',
  // ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: _appbar(),
          body: !controller.isbooked.value
              ? _body(context)
              : _bookedpage(context),
          floatingActionButton: !controller.isbooked.value
              ? flotingbutton()
              : _cancelfoodfloattingbutton(),
        ));
  }

  _appbar() {
    return AppBar(
      title: Text("Book Lunch"),
      backgroundColor:  AppColors.siteBlue,
    );
  }

  _body(context) {
    return Column(
      children: [
        _mainmanu(context),
        _dropdown(),
        _mainmanu1(context),
        _dropdown1(),
        // ListView.builder(itemBuilder: (context, index)
        // {

        // }),
        // ListTile(
        //     leading: Icon(Icons.rice_bowl_sharp),
        //     title: Obx(() => Text(controller.mainiteams[0].toString())),
        //     trailing: Obx(() => Radio(
        //           value: "riceandchapati",
        //           groupValue: controller.selected.value,
        //           onChanged: ((value) {
        //             controller.selected.value = value.toString();
        //           }),
        //         ))),
        // ListTile(
        //     leading: Icon(Icons.circle),
        //     title: Obx(() => Text(controller.mainiteams[1].toString())),
        //     trailing: Obx(() => Radio(
        //           value: "ricewithchapathi",
        //           groupValue: controller.selected.value,
        //           onChanged: ((value) {
        //             controller.selected.value = value.toString();
        //           }),
        //         ))),

        //   Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height * 0.3,
        //       child: Obx(() => ListView.builder(
        //             itemCount: controller.extraiteam.length,
        //             itemBuilder: (context, index) {
        //               return ListTile(
        //                   leading: Icon(Icons.circle),
        //                   title: Obx(() =>
        //                       Text(controller.extraiteam[index].toString())),
        //                   trailing: Obx(() => Radio(
        //                         value: controller.extraiteam[index].toString(),
        //                         groupValue: controller.selected.value,
        //                         onChanged: ((value) {
        //                           controller.selected.value = value.toString();
        //                         }),
        //                       )));
        //             },
        //           ))),
      ],
    );
  }
  _mainmanu1(context) {
    return SizedBox(
        height: 20,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
          child: Text(
            "Extra Dish",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ));
  }
  _dropdown() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
      child: Obx(() => DropdownButtonFormField(
        focusColor: Colors.red,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                gapPadding: 20,
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.indigoAccent, width: 1))),
          items: [
            for (var data in controller.mainiteams.value)
              DropdownMenuItem(
                child: Text(data),
                value: data,
              ),
          ],
          onChanged: (value) => controller.selected.value = value as String)),
    );
  }
  _dropdown1() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
      child: Obx(() => DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.indigoAccent, width: 1))),
          items: [
            for (var data in controller.extraiteam.value)
              DropdownMenuItem(
                child: Text(data),
                value: data,
              ),
          ],
          onChanged: (value) => controller.extra.value = value as String)),
    );
  }

  flotingbutton() {
    return FloatingActionButton.extended(
      onPressed: () async {
        var responc = await controller.booklunch();
        if (responc == 200) {
          controller.booked();
          Get.offAndToNamed(Appstring.home);
        } else {
          
        }
      },
      label: Text("Book Lunch"),
      icon: Icon(Icons.breakfast_dining),
    );
  }

  _mainmanu(context) {
    return SizedBox(
        height: 20,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
          child: Text(
            "Select Your Dish",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ));
  }

  _cancelfoodfloattingbutton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.cancel();
      },
      label: Text("Cancel Booking"),
      icon: Icon(Icons.cancel),
    );
  }

  _bookedpage(context) {
    return Center(
      child: Container(
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Text(
          "You have booked you meals",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        height: 150,
        width: MediaQuery.of(context).size.width * 0.9,
      ),
    );
  }
  //   items: list.map<DropdownMenuItem<String>>((String value) {
  //     return DropdownMenuItem<String>(
  //       value: value,
  //       child: Text(value),
  //     );
  //   }).toList(),
  // );
  _Homefloattingbutton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Get.toNamed(Appstring.home);
      },
      label: Text("Back Home"),
      icon: Icon(Icons.home),
    );
  }

}
