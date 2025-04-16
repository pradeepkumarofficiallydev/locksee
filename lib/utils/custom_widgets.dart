import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class CustomWidgets {
  static Widget addressWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.pushNamed(context, "/success");
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2,color: Colors.purple),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Default Address",
                style: TextStyle(fontSize: 10),
              ),
              Radio(
                  activeColor: Colors.purple,
                  value: "radio value",
                  groupValue: "group value",

                  onChanged: (value) {
                    print(value); //selected value
                  })
            ]),
            Text(
              "Address Primary",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
            Text(
              "City",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "State, Pincode",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "Phone Number",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.black)
              ),
              child: Text(
                "Deliever to this address",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Edit address",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black)
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Delete address",
                            style: TextStyle(color: Colors.black),
                          ),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget productSumWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),  color: Color(0xffC8E900),),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/test.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Brand"),
                    Text("Product Name"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Brand"),
                    Text(
                      "Product Name",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, "/address_list");
                    }, child: Text(
                      "Place Request",),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.purple,
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        )),
                    Text("*Discalimer*"),
                  ],
                ),
              )),
        ],
      ),
    );
  }



  static void showCircularIndicator(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });




    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext dialogContext) {
    //     Future.delayed(Duration(milliseconds: 1000), () {
    //       if (Navigator.of(dialogContext).canPop()) {
    //         Navigator.of(dialogContext).pop();
    //       }
    //     });
    //
    //     return Dialog(
    //       backgroundColor: Colors.black12,
    //       insetPadding: EdgeInsets.zero,
    //       child: Container(
    //         width: double.infinity,
    //         height: double.infinity,
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       ),
    //     );
    //   },
    // );

    // Navigator.pushNamed(context, "/loading_page");

  }











  static Widget showCircularIndicator1(BuildContext context,double height, Color appColor,) {
    //
    // double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    // double height = width * 0.4; // Maintain aspect ratio


    return Container(
      //color: Colors.red,



        height: height,
        width: height,

        child:

        Center(

          child: CircularProgressIndicator(

            color: appColor,

            strokeWidth: 3,

          ),
        )
    );
  }









}
