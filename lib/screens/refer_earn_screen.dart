import 'package:flutter/material.dart';

class ReferAndEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Refer and Earn', style: TextStyle(fontSize: 18)),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        color: Colors.brown[400],
        child: Column(
          children: [
            // Top Illustration and Message
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/refer_image.png', // Replace with your illustration asset
                    height: 150,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Refer your friends, colleagues, and family to Opinion Bureau and earn extra for every successful qualification. You can earn ₹100 in five simple steps.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // How it Works Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How it Works',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 3 / 4,
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return HowItWorksStep(
                              stepNumber: index + 1,
                              title: [
                                'Share the referral link with your friends',
                                'Ask them to click on the referral link and join Opinion Bureau',
                                'Your referrals signup and set up their basic profile',
                                'They complete their first survey successfully',
                                'As they earn their membership approval, you earn your bonus!'
                              ][index],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          icon: Icon(Icons.share),
                          label: Text(
                            'Refer Now',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HowItWorksStep extends StatelessWidget {
  final int stepNumber;
  final String title;

  HowItWorksStep({required this.stepNumber, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.pink,
          child: Text(
            '$stepNumber',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
