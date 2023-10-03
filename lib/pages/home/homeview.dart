import 'package:acsfoodapp/const/stringconst.dart';
import 'package:acsfoodapp/pages/home/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../const/Appcolor.dart';

class HomeView extends GetView<Homecontroller> {
  HomeView({Key? key}) : super(key: key) {
    controller.oninit();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    var currentdate = DateFormat("yyyy-MM-dd").format(
        DateTime(currentDate.year, currentDate.month, currentDate.day));
    return Scaffold(
      appBar: _appbar(),
      body: RefreshIndicator(
        onRefresh: () async {
          // You can put your refresh logic here
          await Future.delayed(Duration(seconds: 1));
          controller.oninit();
          // Refresh completed
        },
        child: _body(context),
      ),
      floatingActionButton: Obx(() => controller.isbooked.value == true
          ? _floattingcancell()
          : _flotting()),
    );
  }

  _flotting() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.booklunch();
      },
      label: Text("Book Lunch"),
      icon: Icon(Icons.food_bank_outlined),
      backgroundColor: Colors.tealAccent,
    );
  }
  _floattingcancell()
  {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.cancel();
      },
      label: Text("Cancel Lunch"),
      icon: Icon(Icons.cancel_rounded),
      backgroundColor: Colors.tealAccent,
    );
  }
  _appbar() {
    return AppBar(
      backgroundColor: AppColors.siteBlue,
      title: Obx(() => Text(
            "Hi ${((controller.name).toLowerCase()).capitalizeFirst}",
            style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
                color: Colors.white, // Change the text color to your preference
                fontWeight: FontWeight.w500, // You can set the font weigh
                fontFamily: 'Roboto'),
          )),
      actions: [
        // IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        IconButton(
            onPressed: () {
              controller.logout();
              Get.offNamed(Appstring.login);
            },
            icon: Icon(Icons.logout))
      ],
    );
  }

  _body(context) {
    return _lunchcount(context);

  }
_lunchcount(context)
{
  return SingleChildScrollView(
      child: Column(
        children: [
          _prevsinfo(context),
          _monthinfo(context),
          _empty(),
          _todayBooking()
        ],
      ));
}
  _prevsinfo(context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), 
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
          side: BorderSide(width: 1, color: AppColors.grey)),
      child: Column(
        children: [_prevcardfirstchild(), _prevcardsecoundchild(),
          Container(height: 20,)
        ],
      ),
    );
    //   Padding(
    //   padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
    //   child: Container(
    //       width: MediaQuery.of(context).size.height * 0.9,
    //       height: MediaQuery.of(context).size.width * 0.30,
    //       color: Colors.black26,
    //       child: Column(
    //         children: [
    //           _prevcardfirstchild(),
    //           _prevcardsecoundchild(),
    //         ],
    //       )),
    // );
  }

  _monthinfo(context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
          side: BorderSide(width: 1, color: AppColors.grey)),
      child: Column(
        children: [
          _cardfirstchild(),
          _cardsecoundchild(),
          Container(
            height: 20,
          )
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
    //   child: Container(
    //     width: MediaQuery.of(context).size.height * 0.9,
    //     height: MediaQuery.of(context).size.width * 0.30,
    //     color: Colors.black26,
    //     child: Obx(() => Column(
    //           children: [
    //             _cardfirstchild(),
    //             _cardsecoundchild(),
    //           ],
    //         )),
    //   ),
    // );
  }

  _cardfirstchild() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child:Obx(() => Text(controller.month.value.toString(),style: TextStyle(
            color: AppColors.siteBlue,
            fontWeight: FontWeight.w600
        ),),
      ),)
    );
  }

  _cardsecoundchild() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("Days",style: TextStyle(
                  fontWeight: FontWeight.w600
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.current_monthcount.toString())),
              ),
            ],
          ),
          Column(
            children: [
              Text("Amount",style: TextStyle(

                  fontWeight: FontWeight.w600
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.amount.toString())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _prevcardfirstchild() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Obx(() => Text(controller.prev_month.value.toString(),style: TextStyle(
          color: AppColors.siteBlue,
          fontWeight: FontWeight.w600
        ),)),
      ),
    );
  }

  _prevcardsecoundchild() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("Days",style: TextStyle(

                  fontWeight: FontWeight.w600
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.prev_monthcont.toString())),
              ),
            ],
          ),
          Column(
            children: [
              Text("Amount",style: TextStyle(

                  fontWeight: FontWeight.w600
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.prev_amount.toString())),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _empty() {
    return Container( height: 50,);

  }
  _todayBooking()
  {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
          side: BorderSide(width: 1, color: AppColors.grey)),
      child: Column(
        children: [
          _todayDate(),
          _selectedOption(),
          Container(
            height: 20,
          )
        ],
      ),
    );
  }
  _todayDate() {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child:Text("Bookings on "+DateTime.now().day.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().year.toString(),style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.w500
          ),
          ),)
    );
  }
  _selectedOption() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("Main Course",style: TextStyle(
                  fontWeight: FontWeight.w600
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("Rice"),
              ),
            ],
          ),
          Column(
            children: [
              Text("Extra",style: TextStyle(

                  fontWeight: FontWeight.w600
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child:Text(""),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
