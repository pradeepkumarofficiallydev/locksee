import 'package:flutter/material.dart';

class AppTextStyles {
  // Headline Style
  static TextStyle headline1({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'MontserratAlternatesLight', // Custom font, replace with your font name
    );
  }





  static TextStyle headline2({Color color = Colors.black87}) {
    return TextStyle(
      fontSize: 16,


      fontFamily: 'MontserratAlternatesExtraBold', // Custom font, replace with your font name
      fontWeight: FontWeight.w400,
      color: color,
    );



  }

  // Body text style
  static TextStyle bodyText({Color color = Colors.black87}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }





  static TextStyle bodyText2({Color color = Colors.black54}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  // Button text style
  static TextStyle button({Color color = Colors.white}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }




  // Caption text style
  static TextStyle caption({Color color = Colors.grey}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  // Error text style
  static TextStyle error({Color color = Colors.red}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }


  //
  //
  //
  //
  //
  //
  //
  // static TextStyle nanoText18Bold(Color myColor,double height) {
  //   return GoogleFonts.notoSansDevanagari(
  //       textStyle: GoogleFonts.notoSansDevanagari(
  //           textStyle: TextStyle(
  //             fontSize: height,
  //             color: myColor,
  //             fontWeight: FontWeight.w700,
  //           )
  //       )
  //   );
  // }
  //
  // static TextStyle privacyTitleTextbold(Color myColor,double height) {
  //   return GoogleFonts.notoSansDevanagari(
  //       textStyle: GoogleFonts.notoSansDevanagari(
  //           textStyle: TextStyle(
  //             fontSize: height,
  //             color: myColor,
  //             fontWeight: FontWeight.w700,
  //           )
  //       )
  //   );
  // }
  //
  //
  //
  //
  // static TextStyle privacyTitleTextnorml(Color myColor,double height) {
  //   return GoogleFonts.notoSansDevanagari(
  //       textStyle: GoogleFonts.notoSansDevanagari(
  //           textStyle: TextStyle(
  //             fontSize: height,
  //             color: myColor,
  //             fontWeight: FontWeight.w500,
  //           )
  //       )
  //   );
  // }
  //
  //






  static TextStyle normaNoSpacingboldlopenSans(Color color,double height) {
    return


     TextStyle(

       wordSpacing: 5.0, // Adjust spacing between words

       height: 1.5
      ,fontSize: height,
      fontFamily: 'MontserratAlternatesExtraBold', // Custom font, replace with your font name
      fontWeight: FontWeight.w400,
      color: color,
    );




    //   GoogleFonts.notoSansDevanagari(
    //     textStyle: GoogleFonts.notoSansDevanagari(
    //         textStyle: TextStyle(
    //           wordSpacing: 0.0, // Adjust spacing between words
    //           height: 1, // Spacing between lines
    //
    //
    //           fontSize: height,
    //           color: myColor,
    //           fontWeight: FontWeight.w700,
    //         )
    //     )
    // );
  }

  static TextStyle normalopenSans(Color color,double height) {
    return


      TextStyle(

        fontSize: height,
        fontFamily: 'MontserratAlternatesLight', // Custom font, replace with your font name
        fontWeight: FontWeight.w400,
        color: color,
      );




    //   GoogleFonts.notoSansDevanagari(
    //     textStyle: GoogleFonts.notoSansDevanagari(
    //         textStyle: TextStyle(
    //           wordSpacing: 0.0, // Adjust spacing between words
    //           height: 1, // Spacing between lines
    //
    //
    //           fontSize: height,
    //           color: myColor,
    //           fontWeight: FontWeight.w700,
    //         )
    //     )
    // );
  }





  static TextStyle normalopenSans1(Color color,double height) {
    return


      TextStyle(

        fontSize: height,

        fontFamily: 'MontserratAlternatesExtraBold', // Custom font, replace with your font name
        fontWeight: FontWeight.w600,

        color: color,
      );



  }



  static TextStyle boldOpenSans(Color color,double height) {
    return


      TextStyle(

        fontSize: height,

        fontFamily: 'MontserratAlternatesExtraBold', // Custom font, replace with your font name
        fontWeight: FontWeight.w800,

        color: color,
      );



  }



//
  //
  //
  // static TextStyle normalopenSans(Color myColor, double height) {
  //   return GoogleFonts.notoSansDevanagari(
  //       textStyle: GoogleFonts.notoSansDevanagari(
  //           textStyle: TextStyle(
  //             //letterSpacing: 2.0,
  //             wordSpacing: 5.0, // Adjust spacing between words
  //
  //             height: 1.5, // Spacing between lines
  //
  //             fontSize:height,
  //             color: myColor,
  //             fontWeight: FontWeight.w500,
  //           )
  //       )
  //   );
  // }
  //
  //
  //
  // static TextStyle normaNoSpacinglopenSans(Color myColor, double height) {
  //   return
  //
  //
  //     GoogleFonts.notoSansDevanagari(
  //         textStyle: GoogleFonts.notoSansDevanagari(
  //             textStyle:
  //
  //             TextStyle(
  //               //letterSpacing: 2.0,
  //               /// wordSpacing: 5.0, // Adjust spacing between words
  //
  //
  //               // fontFamily: 'Maine',
  //               fontSize:height,
  //               color: myColor,
  //               fontWeight: FontWeight.w500,
  //             )
  //         )
  //     );
  // }
  //
  //



}
