import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Order Model Class
class OrderModel {
  final String orderId;
  final int itemCount;
  final String address;
  final String amount;
  final String expectedDelivery;
  final String status;

  OrderModel({
    required this.orderId,
    required this.itemCount,
    required this.address,
    required this.amount,
    required this.expectedDelivery,
    required this.status,
  });
}

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Pending', 'Completed', 'Cancelled', 'Processed'];

  // Sample orders data
  final List<OrderModel> pendingOrders = [
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '1200 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Pending',
    ),
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '7400 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Pending',
    ),
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '2400 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Pending',
    ),
  ];

  final List<OrderModel> completedOrders = [
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '1200 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Completed',
    ),
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '7400 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Completed',
    ),
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '2400 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Completed',
    ),
  ];

  final List<OrderModel> cancelledOrders = [
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '1200 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Cancelled',
    ),
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '7400 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Cancelled',
    ),
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '2400 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Cancelled',
    ),
  ];

  final List<OrderModel> processedOrders = [
    OrderModel(
      orderId: 'KR21241',
      itemCount: 3,
      address: 'SD-21, North Nazimabad, Karachi',
      amount: '1200 Rs',
      expectedDelivery: 'Monday, 14 April',
      status: 'Processed',
    ),
  ];

  List<OrderModel> getCurrentOrders() {
    switch (selectedTabIndex) {
      case 0:
        return pendingOrders;
      case 1:
        return completedOrders;
      case 2:
        return cancelledOrders;
      case 3:
        return processedOrders;
      default:
        return pendingOrders;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Orders',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff121212),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Divider(
            color: Color(0xffEEF0F6),
            height: 1,
          ),
          SizedBox(height: 24),
          // Tab Bar
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Container(
              padding: EdgeInsets.all(6),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffEEF0F6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  tabs.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        child: Container(
                          height: 38,
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                          decoration: BoxDecoration(
                            color: selectedTabIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: selectedTabIndex == index
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedTabIndex == index
                                    ? Color(0xffFF5934)
                                    : Color(0xff121212),
                              ),
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          // Orders List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: getCurrentOrders().length,
              itemBuilder: (context, index) {
                return OrderCard(order: getCurrentOrders()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  Color getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Color(0xffE8E8E8);
      case 'Completed':
        return Color(0xff17B556).withValues(alpha: 0.1);
      case 'Cancelled':
        return Color(0xffFF5934).withValues(alpha: 0.1);
      case 'Processed':
        return Color(0xff007AFF).withOpacity(0.1);
      default:
        return Color(0xffE8E8E8);
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'Pending':
        return Color(0xff121212);
      case 'Completed':
        return Color(0xff17B556);
      case 'Cancelled':
        return Color(0xffFF5934);
      case 'Processed':
        return Color(0xff007AFF);
      default:
        return Color(0xff121212);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 11),
      decoration: BoxDecoration(
        color: Color(0xffF8F9FB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID # ${order.orderId}',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff121212),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: getStatusColor(order.status),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  order.status,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: getStatusTextColor(order.status),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(
            '${order.itemCount} Items',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000).withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 4),
          Text(
            order.address,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000).withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 23),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000).withValues(alpha: 0.4),
                    ),
                  ),
                  Text(
                    order.amount,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFF5934),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 19),
              Container(
                height: 22,
                width: 1,
                color: Color(0xff000000).withValues(alpha: 0.25),
              ),
              SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected Delivery',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000).withValues(alpha: 0.4),
                    ),
                  ),
                  Text(
                    order.expectedDelivery,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff121212),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
