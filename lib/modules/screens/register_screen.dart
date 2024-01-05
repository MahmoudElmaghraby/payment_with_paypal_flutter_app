import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:payment_flutter_app/modules/widgets/default_button.dart';
import 'package:payment_flutter_app/modules/widgets/default_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment Integration',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Delivery.png',
                height: 300,
                width: double.infinity,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DefaultTextFormFiled(
                            controller: firstNameController,
                            type: TextInputType.text,
                            hintText: 'First Name',
                            prefix: Icons.person,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DefaultTextFormFiled(
                            controller: lastNameController,
                            type: TextInputType.text,
                            hintText: 'Last Name',
                            prefix: Icons.person,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DefaultTextFormFiled(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hintText: 'Email',
                      prefix: Icons.email,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    DefaultTextFormFiled(
                      controller: phoneController,
                      type: TextInputType.number,
                      hintText: 'Phone',
                      prefix: Icons.phone_android,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    DefaultTextFormFiled(
                      controller: priceController,
                      type: TextInputType.number,
                      hintText: 'Price',
                      prefix: Icons.price_change,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter price';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    DefaultButton(
                      backgroundColor: Colors.purpleAccent.shade200,
                      radius: 15,
                      buttonWidget: const Text(
                        'Pay',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print('Doooooone');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return PaypalCheckout(
                                  sandboxMode: true,
                                  clientId:
                                  'AftF1VQVy62OPqgvWCyHlbYovGNd9qRq3J7RwRCqPeeKnOzOpZU9z-KpA-v2b2Ia9N2tG-qhbIGj0uuL',
                                  secretKey:
                                  'ECd1eGzQOL7dBOM-oYzKRe1Xi9pBqaj6-y3gnLDewmZM2H8oCJ619WxiBNCN3230ZbpMvF_YOWsfVMyR',
                                  returnURL: 'success.snippetcoder.com',
                                  cancelURL: 'cancel.snippetcoder.com',
                                  transactions: const [
                                    {
                                      "amount": {
                                        "total": '70',
                                        "currency": "USD",
                                        "details": {
                                          "subtotal": '70',
                                          "shipping": '0',
                                          "shipping_discount": 0
                                        }
                                      },
                                      "description":
                                      "The payment transaction description.",
                                      // "payment_options": {
                                      //   "allowed_payment_method":
                                      //       "INSTANT_FUNDING_SOURCE"
                                      // },
                                      "item_list": {
                                        "items": [
                                          {
                                            "name": "Apple",
                                            "quantity": 4,
                                            "price": '5',
                                            "currency": "USD"
                                          },
                                          {
                                            "name": "Pineapple",
                                            "quantity": 5,
                                            "price": '10',
                                            "currency": "USD"
                                          }
                                        ],

                                        // shipping address is not required though
                                        //   "shipping_address": {
                                        //     "recipient_name": "Raman Singh",
                                        //     "line1": "Delhi",
                                        //     "line2": "",
                                        //     "city": "Delhi",
                                        //     "country_code": "IN",
                                        //     "postal_code": "11001",
                                        //     "phone": "+00000000",
                                        //     "state": "Texas"
                                        //  },
                                      }
                                    }
                                  ],
                                  note: "Contact us for any questions on your order.",
                                  onSuccess: (Map params) async {
                                    print("onSuccess: $params");
                                  },
                                  onError: (error) {
                                    print("onError: $error");
                                    Navigator.pop(context);
                                  },
                                  onCancel: () {
                                    print('cancelled:');
                                  },
                                );
                              },
                            ),
                          );
                          /*return PaypalCheckout(
                            sandboxMode: true,
                            clientId:
                                'AftF1VQVy62OPqgvWCyHlbYovGNd9qRq3J7RwRCqPeeKnOzOpZU9z-KpA-v2b2Ia9N2tG-qhbIGj0uuL',
                            secretKey:
                                'ECd1eGzQOL7dBOM-oYzKRe1Xi9pBqaj6-y3gnLDewmZM2H8oCJ619WxiBNCN3230ZbpMvF_YOWsfVMyR',
                            returnURL: 'success.snippetcoder.com',
                            cancelURL: 'cancel.snippetcoder.com',
                            transactions: const [
                              {
                                "amount": {
                                  "total": '70',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '70',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Apple",
                                      "quantity": 4,
                                      "price": '5',
                                      "currency": "USD"
                                    },
                                    {
                                      "name": "Pineapple",
                                      "quantity": 5,
                                      "price": '10',
                                      "currency": "USD"
                                    }
                                  ],

                                  // shipping address is not required though
                                  //   "shipping_address": {
                                  //     "recipient_name": "Raman Singh",
                                  //     "line1": "Delhi",
                                  //     "line2": "",
                                  //     "city": "Delhi",
                                  //     "country_code": "IN",
                                  //     "postal_code": "11001",
                                  //     "phone": "+00000000",
                                  //     "state": "Texas"
                                  //  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              print('cancelled:');
                            },
                          );*/
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
