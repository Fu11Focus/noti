import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:noti/util/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nowTime = DateFormat.Hm().format(DateTime.now()), timeOfUser;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(minutes: 1), (Timer t) => setTime());
  }

  void setTime() {
    setState(() {
      nowTime = DateFormat.Hm().format(DateTime.now());
    });
  }

  final TextEditingController _h1Controller = TextEditingController();
  final TextEditingController _h2Controller = TextEditingController();
  final TextEditingController _m1Controller = TextEditingController();
  final TextEditingController _m2Controller = TextEditingController();

  void setTimeofUser() {
    if (_h1Controller.text != '' &&
        _h2Controller.text != '' &&
        _m1Controller.text != '' &&
        _m2Controller.text != '') {
      setState(() {
        timeOfUser =
            '${_h1Controller.text + _h2Controller.text + ':' + _m1Controller.text + _m2Controller.text}';
      });
    } else {
      setState(() {
        timeOfUser = null;
      });
    }
  }

  void logining() {
    if (timeOfUser == nowTime) {
      Navigator.pushNamed(context, '/notifications');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(bottom: 120),
          backgroundColor: greyBg,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          content: SizedBox(
            height: 50,
            child: Row(
              children: [
                const Icon(
                  Icons.warning_outlined,
                  color: red,
                ),
                const Divider(
                  indent: 5,
                ),
                Text(
                  'The time is wrong. Try again.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 70),
          child: Text(
            'Log In',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 40),
          child: Text(
            'Enter current time in hh : mm format',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Text(
            nowTime.toString(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              margin: const EdgeInsets.only(right: 12),
              child: TextField(
                  controller: _h1Controller,
                  onChanged: (value) => setTimeofUser(),
                  maxLength: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: dark)),
            ),
            Container(
              width: 44,
              margin: const EdgeInsets.only(right: 12),
              child: TextField(
                  controller: _h2Controller,
                  onChanged: (value) => setTimeofUser(),
                  maxLength: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: dark)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: Text(
                ':',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: hintTxt),
              ),
            ),
            Container(
              width: 44,
              margin: const EdgeInsets.only(right: 12),
              child: TextField(
                  controller: _m1Controller,
                  onChanged: (value) => setTimeofUser(),
                  maxLength: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: dark)),
            ),
            Container(
              width: 44,
              margin: const EdgeInsets.only(right: 12),
              child: TextField(
                  controller: _m2Controller,
                  onChanged: (value) => setTimeofUser(),
                  maxLength: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: dark)),
            ),
          ],
        ),
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            MaterialButton(
              onPressed: logining,
              child: Container(
                  decoration: BoxDecoration(
                      color: timeOfUser == null ? grey : purple,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  width: MediaQuery.of(context).size.width - 30,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  margin:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 0),
                  child: Center(
                      child: Text(
                    'Confirm',
                    style: Theme.of(context).textTheme.titleLarge,
                  ))),
            )
          ]),
        )
      ]),
    );
  }
}
