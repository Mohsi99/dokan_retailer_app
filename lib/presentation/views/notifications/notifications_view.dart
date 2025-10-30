import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationModel {
  final String title;
  final String description;
  final String date;
  final String iconAsset;

  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
    required this.iconAsset,
  });
}

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = [
      NotificationModel(
        title: 'Flash Sale Alert!',
        description: 'Don\'t miss out on our one-day only flash sale! Get 20% off all Products.',
        date: '1 Day Ago',
        iconAsset: 'assets/image/discount 1.png',
      ),
      NotificationModel(
        title: 'Flash Sale Alert!',
        description: 'Don\'t miss out on our one-day only flash sale! Get 20% off all Products.',
        date: '1 Day Ago',
        iconAsset: 'assets/image/discount 1.png',
      ),
      NotificationModel(
        title: 'Flash Sale Alert!',
        description: 'Don\'t miss out on our one-day only flash sale! Get 20% off all Products.',
        date: '1 Day Ago',
        iconAsset: 'assets/image/discount 1.png',
      ),
      NotificationModel(
        title: 'Flash Sale Alert!',
        description: 'Don\'t miss out on our one-day only flash sale! Get 20% off all Products.',
        date: '1 Day Ago',
        iconAsset: 'assets/image/discount 1.png',
      ),     NotificationModel(
        title: 'Flash Sale Alert!',
        description: 'Don\'t miss out on our one-day only flash sale! Get 20% off all Products.',
        date: '1 Day Ago',
        iconAsset: 'assets/image/discount 1.png',
      ),     NotificationModel(
        title: 'Flash Sale Alert!',
        description: 'Don\'t miss out on our one-day only flash sale! Get 20% off all Products.',
        date: '1 Day Ago',
        iconAsset: 'assets/image/discount 1.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff121212),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Color(0xffEEF0F6),
            height: 1,
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                  notification: notifications[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffEEF0F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon/Image

          Image.asset(
            notification.iconAsset,
            width: 38,
            height: 38,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Expanded(
                      child: Text(
                        notification.title,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff121212),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    // Date
                    Text(
                      notification.date,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000).withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // Description
                Text(
                  notification.description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}