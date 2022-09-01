import 'package:acsfoodapp/const/stringconst.dart';
import 'package:acsfoodapp/pages/home/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<Homecontroller> {
  HomeView({Key? key}) : super(key: key) {
    controller.oninit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(context),
      floatingActionButton: _flotting(),
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

  _appbar() {
    return AppBar(
      title: Obx(() => Text("Welcome ${controller.name}")),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
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
    return SingleChildScrollView(
        child: Column(
      children: [
        _prevsinfo(context),
        _monthinfo(context),
      ],
    ));
  }

  _prevsinfo(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Container(
          width: MediaQuery.of(context).size.height * 0.9,
          height: MediaQuery.of(context).size.width * 0.30,
          color: Colors.black26,
          child: Column(
            children: [
              _prevcardfirstchild(),
              _prevcardsecoundchild(),
            ],
          )),
    );
  }

  _monthinfo(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.9,
        height: MediaQuery.of(context).size.width * 0.30,
        color: Colors.black26,
        child: Obx(() => Column(
              children: [
                _cardfirstchild(),
                _cardsecoundchild(),
              ],
            )),
      ),
    );
  }

  _cardfirstchild() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(controller.month.value.toString()),
      ),
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
              Text("Title"),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.currentmonth.toString())),
              ),
            ],
          ),
          Column(
            children: [
              Text("Title"),
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
        child: Obx(() => Text(controller.pmonth.value.toString())),
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
              Text("Title"),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.prevmonthcont.toString())),
              ),
            ],
          ),
          Column(
            children: [
              Text("Title"),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Obx(() => Text(controller.pamount.toString())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
