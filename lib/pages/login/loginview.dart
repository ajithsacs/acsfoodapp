import 'package:acsfoodapp/pages/login/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
class LogininView extends GetView<LoginController> {
  LogininView({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _singlechild(context),
    );
  }

  _singlechild(context) {
    return Obx(
      () => (controller.loader.value)
          ? SingleChildScrollView(child: _loginoutline(context))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:
                  Expanded(child: Center(child: CircularProgressIndicator()))),
    );
  }

  _loginoutline(context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            _icon(),
            form(context)
          ],
        ),
      ),
    );
  }

  _icon() {
    return Container(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/acs_logo.svg',
        placeholderBuilder: (BuildContext context) => Container(
            child: const CircularProgressIndicator()),
      ),
    );
  }

  form(context) {
    return Form(
        key: formkey,
        child: Column(
          children: [
            _username(),
            _password(),
            _button(context),
                    ],
        ));
  }

  _username() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "No Username Found";
          }
          return null;
        },
        cursorColor: Colors.black,
        autofocus: true,
        maxLength: 30,
        onEditingComplete: () {
          controller.removetext();
        },
        controller: controller.username,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Username*",
          prefixIcon: Icon(Icons.person),
          suffix: (controller.deletetext.value)
              ? IconButton(
                  onPressed: () {
                    controller.username.text = "";
                  },
                  icon: Icon(Icons.clear))
              : null,
        ),
      ),
    );
  }

  _password() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
      child: Obx(() => TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password cannot be Empty";
            }
            return null;
          },
          obscureText: controller.showpassword.value,
          controller: controller.password,
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Password*",
              prefixIcon: Icon(Icons.lock),
              suffix: (controller.showpassword.value)
                  ? IconButton(
                      onPressed: () {
                        controller.makepasswordshoworhide();
                      },
                      icon: Icon(Icons.visibility_off))
                  : IconButton(
                      onPressed: () {
                        controller.makepasswordshoworhide();
                      },
                      icon: Icon(Icons.visibility))))),
    );
  }

  _button(context) {
    return ElevatedButton(
      onPressed: () {
        if (formkey.currentState!.validate()) {
          controller.formsubmit(
              controller.username.text, controller.password.text);
        }
      },
      child: Text("Login"),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        shape: StadiumBorder(),
        minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height * 0.075),
      ),
    );
  }
}

