import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/fab.dart';
import '../utils/config-color.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isButtonEnabled = false;
  String? selectedAddress;
  final List<String> addressOptions = ['Address 1', 'Address 2', 'Address 3', 'Address 4'];

  Widget buildRequiredLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget buildLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text),
      ),
    );
  }

  void checkIfAllFieldsFilled() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkIfAllFieldsFilled);
    phoneController.addListener(checkIfAllFieldsFilled);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onSearchSubmitted: (String ) {  },),
      backgroundColor: StyleConfigColor.text2,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Information',
                style: StyleConfigText.bodyTextBlack1.copyWith(
                  color: StyleConfigColor.orangeDark,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: buildRequiredLabel('Full name'),
                      fillColor: StyleConfigColor.text2,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: TextStyle(color: StyleConfigColor.text),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      label: buildRequiredLabel('Add a phone number'),
                      fillColor: StyleConfigColor.text2,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: StyleConfigColor.text),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedAddress,
              hint: buildLabel('Address'),
              decoration: InputDecoration(
                fillColor: StyleConfigColor.text2,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: addressOptions.map((String address) {
                return DropdownMenuItem<String>(
                  value: address,
                  child: Text(address),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAddress = newValue;
                  checkIfAllFieldsFilled();
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                label: buildLabel('Evocative Name'),
                fillColor: StyleConfigColor.text2,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(color: StyleConfigColor.text),
            ),


            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Security Information',
                style: StyleConfigText.bodyTextBlack1.copyWith(
                  color: StyleConfigColor.orangeDark,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Email field with "change" label
            TextField(
              decoration: InputDecoration(
                label: buildLabel('Email'),
                fillColor: StyleConfigColor.text2, // Background color of the text field
                filled: true, // Enable background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: TextButton(
                  onPressed: () {
                    // Define the action to change email here
                  },
                  child: Text(
                    'Thay đổi',
                    style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text),
                  ),
                ),
              ),
              style: TextStyle(color: StyleConfigColor.text), // Text color of the input
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedAddress,
              hint: buildLabel('CCCD / CMND / Passport'),
              decoration: InputDecoration(
                fillColor: StyleConfigColor.text2,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: addressOptions.map((String address) {
                return DropdownMenuItem<String>(
                  value: address,
                  child: Text(address),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAddress = newValue;
                  checkIfAllFieldsFilled();
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedAddress,
              hint: buildLabel('Favorite Categories'),
              decoration: InputDecoration(
                fillColor: StyleConfigColor.text2,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: addressOptions.map((String address) {
                return DropdownMenuItem<String>(
                  value: address,
                  child: Text(address),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAddress = newValue;
                  checkIfAllFieldsFilled();
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedAddress,
                    hint: buildLabel('Genderkingdom'),
                    decoration: InputDecoration(
                      fillColor: StyleConfigColor.text2,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: addressOptions.map((String address) {
                      return DropdownMenuItem<String>(
                        value: address,
                        child: Text(address),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAddress = newValue;
                        checkIfAllFieldsFilled();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Space between the dropdowns
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedAddress,
                    hint: buildLabel('Date of Birth'),
                    decoration: InputDecoration(
                      fillColor: StyleConfigColor.text2,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: addressOptions.map((String address) {
                      return DropdownMenuItem<String>(
                        value: address,
                        child: Text(address),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAddress = newValue;
                        checkIfAllFieldsFilled();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                  Navigator.of(context).pop();
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled ? StyleConfigColor.keppel : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Save changes',
                  style: StyleConfigText.bodyTextRegular1.copyWith(color: StyleConfigColor.text2),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'searchQuery',),
        ],
      ),
    );
  }
}
