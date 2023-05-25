import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/ApiSerives/address.dart';
import 'package:frontend/Cart/model/address.dart';
import 'package:frontend/Cart/provider/CartProvider.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddressPage extends ConsumerStatefulWidget {
  AddressPage({super.key});

  @override
  ConsumerState<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends ConsumerState<AddressPage> {
  List<String> states = [
    "Madhesh ",
    "Bagmati ",
    "Gandaki ",
    "Lumbini ",
    "Karnali ",
    "Sudur Pashchim ",
  ];

  late Adddress _deliveryAddress = Adddress(
      fullName: "fullName",
      state: "state",
      district: "district",
      city: "city",
      phoneNumber: "123131",
      address1: "address1");

  @override
  Widget build(BuildContext context) {
    final addressProv = ref.watch(AddressProvider);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Address"),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.map_outlined,
                  color: CustomTheme().primaryColor1,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              width: MediaQuery.of(context).size.width / 6.5,
              height: 2.5,
              color: CustomTheme().primaryColor1,
            ),
          ],
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      onChanged: (value) async {
                        _deliveryAddress.fullName = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Full Name",
                          labelStyle: const TextStyle(fontFamily: "Poppins"),
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      autofillHints: states,
                      onChanged: (value) async {
                        _deliveryAddress.state = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "State",
                          labelStyle: const TextStyle(fontFamily: "Poppins"),
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.25,
                          child: TextField(
                            onChanged: (value) async {
                              _deliveryAddress.district = value;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                labelText: "District",
                                labelStyle:
                                    const TextStyle(fontFamily: "Poppins"),
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.25,
                          child: TextField(
                            onChanged: (value) async {
                              _deliveryAddress.city = value;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                labelText: "City",
                                labelStyle:
                                    const TextStyle(fontFamily: "Poppins"),
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: InternationalPhoneNumberInput(
                      onInputChanged: ((value) {
                        _deliveryAddress.phoneNumber =
                            value.phoneNumber.toString();
                      }),
                      inputDecoration: InputDecoration(
                          filled: true,
                          labelText: "Phone Number",
                          labelStyle: const TextStyle(fontFamily: "Poppins"),
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      onChanged: (value) async {
                        _deliveryAddress.address1 = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Address Line 1",
                          labelStyle: const TextStyle(fontFamily: "Poppins"),
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      onChanged: (value) async {
                        _deliveryAddress.address2 = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Address Line 2",
                          labelStyle: const TextStyle(fontFamily: "Poppins"),
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      onChanged: ((value) {
                        _deliveryAddress.extraDetails = value;
                      }),
                      minLines: 7,
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        hintText:
                            "Use this Area to Enter any additional Details About your Location",
                        labelStyle: const TextStyle(fontFamily: "Poppins"),
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: CustomTheme().primaryColor1,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                        onPressed: () async {
                          addressProv.addAddress(_deliveryAddress);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Add Address",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                ],
              )
            ]),
      )),
    );
  }
}
