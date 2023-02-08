import 'package:ditto/hard_strings/area_name.dart';
import 'package:ditto/routes.dart' show route, addRoute;
import 'package:ditto/login/bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
// Tiruppur and Mettupalayam and coimbatore only supported

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  String pinCode = "Enter pincode";
  List<int> pinCodeInt = areas.keys.cast<int>().toList();
  List<String> pinCodes = ["Enter pincode"];
  String AreaName = "Area Name";
  TextEditingController name = TextEditingController();
  TextEditingController mobNum = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _passVisible = false;
  TextEditingController passVerify = TextEditingController();
  bool _passVerifyVisible = false;
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController landmark = TextEditingController();
  bool termsCondition = false;

  int selectedGender = 0;

  @override
  void initState() {
    super.initState();
    for (int x in pinCodeInt) {
      pinCodes.add(x.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return bg(
        child: SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text("REGISTER NOW",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            dropdownMenus("Enter the pincode", pinCode, pinCodes, (dynamic e) {
              pinCode = e;
              if (e == "Enter pincode") {
                AreaName = "Area Name";
              } else {
                AreaName = areas[int.parse(e)] ?? "Area not found";
              }
              setState(() {});
            }),
            const SizedBox(height: 5),
            dropdownMenus("Area Name", AreaName, [AreaName], (e) {}),
            const SizedBox(height: 5),
            TextField(
              controller: name,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: "Name"),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: mobNum,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: "Mobile Number"),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: pass,
              obscureText: !_passVisible,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                suffixIcon: Material(
                  color: Colors.transparent,
                  borderOnForeground: false,
                  child: IconButton(
                    splashColor: Colors.grey,
                    splashRadius: 120,
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      !_passVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passVisible = !_passVisible;
                      });
                    },
                  ),
                ),
                labelStyle: const TextStyle(color: Colors.grey),
                labelText: "4 Digit Password",
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: passVerify,
              obscureText: !_passVerifyVisible,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                suffixIcon: Material(
                  color: Colors.transparent,
                  borderOnForeground: false,
                  child: IconButton(
                    splashColor: Colors.grey,
                    splashRadius: 120,
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      !_passVerifyVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passVerifyVisible = !_passVerifyVisible;
                      });
                    },
                  ),
                ),
                labelStyle: const TextStyle(color: Colors.grey),
                labelText: "Confirm 4 Digit Password",
              ),
            ),
            TextField(
              focusNode: AlwaysDisabledFocusNode(),
              controller: _textEditingController,
              onTap: () {
                _selectDate(context);
              },
              decoration: const InputDecoration(
                  suffixIcon: Material(
                    color: Colors.transparent,
                    borderOnForeground: false,
                    child: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: "Date of birth"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Gender',
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                add_radio_button(0, 'Male'),
                add_radio_button(1, 'Female'),
              ],
            ),
            TextField(
              controller: email,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: "Email"),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: landmark,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: "Landmark"),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: termsCondition,
                    onChanged: (a) => setState(() {
                          termsCondition = !termsCondition;
                        })),
                const Text("Terms & Conditions")
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [Colors.cyan, Colors.cyan, Colors.blue]),
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyElevatedButton(
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [Colors.cyan, Colors.cyan, Colors.blue]),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  Row add_radio_button(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          value: btnValue,
          groupValue: selectedGender,
          onChanged: (e) {
            selectedGender = e ?? 0;
            setState(() {});
            debugPrint(e.toString());
          },
        ),
        Text(title)
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Widget dropdownMenus(String name, dynamic value, List<String> itemsName,
    void Function(dynamic)? fn) {
  return DropdownButtonFormField(
      value: value,
      items: itemsName
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: fn);
}

void signupPop(BuildContext context) {
  if (route.containsKey("/signUp") == false) {
    addRoute("/signUp", signUp());
  }
  Navigator.pushNamed(context, "/signUp");
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 0.5,
            offset: Offset(0, 5),
          )
        ],
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
