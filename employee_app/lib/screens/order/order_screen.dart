import 'package:employee_app/helper/extinsion/size_config.dart';
import 'package:employee_app/models/order_model.dart';
import 'package:employee_app/models/user_model.dart';
import 'package:employee_app/screens/profile/profile_screen.dart';
import 'package:employee_app/widget/button/custom_button.dart';
import 'package:employee_app/widget/inkwell/order_item.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      //separate it later
      drawer: Drawer(
        backgroundColor: const Color(0xffD7D1CA),
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.getWidth(multiply: 0.02),
            vertical: context.getHeight(multiply: 0.1),
          ),
          child: Column(
            children: [
              Image.asset('assets/image/logo.png'),
              context.addSpacer(multiply: 0.02),
              Text(
                'Welcome ${user.firstName}',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rosarivo'),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: context.getWidth(multiply: 0.05),
                  vertical: context.getWidth(multiply: 0.05),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.getWidth(multiply: 0.05),
                  vertical: context.getWidth(multiply: 0.02),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: kElevationToShadow[4],
                  color: const Color(0xffEFEDEA),
                ),
                child: const Text(
                  'Onze Cafe\nWhere Artisanal Coffee\nMeets a Warm, Inviting\nAtmosphere — A Place to Savor Handcrafted Beverages and Build Lasting Connections',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rosarivo'),
                ),
              ),
              context.addSpacer(multiply: 0.03),
              CustomButton(
                title: '     Profile',
                onPressed: () {
                  // navigate to profile
                },
                fixedSize: Size(context.getWidth(multiply: 0.4),
                    context.getHeight(multiply: 0.06)),
              ),
              context.addSpacer(multiply: 0.03),
              // CustomButton(
              //   title: '   My Order',
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const CartScreen(),
              //         ));
              //   },
              //   fixedSize: Size(context.getWidth(multiply: 0.4),
              //       context.getHeight(multiply: 0.06)),
              // ),
              // context.addSpacer(multiply: 0.03),
              // CustomButton(
              //   title: '    History',
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const HistoryScreen(),
              //         ));
              //   },
              //   fixedSize: Size(context.getWidth(multiply: 0.4),
              //       context.getHeight(multiply: 0.06)),
              // ),
              context.addSpacer(multiply: 0.08),
              CustomButton(
                title: '     Logout',
                titleColor: Colors.grey,
                onPressed: () {},
                fixedSize: Size(context.getWidth(multiply: 0.4),
                    context.getHeight(multiply: 0.06)),
              ),
              context.addSpacer(multiply: 0.04),
              const Text(
                'Version: 1.0.0',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Rosarivo'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Image.asset('assets/image/logo_small.png'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              FontAwesome.bars_staggered_solid,
              color: Color(0xffA8483D),
            )),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
            child: const CircleAvatar(
              backgroundColor: Color(0xffd9d9d9),
              backgroundImage: AssetImage('assets/image/appBarProfile.png'),
            ),
          ),
          SizedBox(
            width: context.getWidth(multiply: 0.03),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.getWidth(multiply: 0.05),
          vertical: context.getHeight(multiply: 0.15)
        ),
        child: Column(
          children: [
            Image.asset('assets/image/orderlogo.png'),
            Column(
              children: [
                OrderItem(order: OrderModel(
                  orderId: '124444444444446767',
                  time: '${DateTime.now()}',
                  totalPreparationTime: 12,
                  totalPrice: 25
                )),
                OrderItem(order: OrderModel(
                  orderId: '124444444444446767',
                  time: '${DateTime.now()}',
                  totalPreparationTime: 12,
                  totalPrice: 25
                )),
                OrderItem(order: OrderModel(
                  orderId: '124444444444446767',
                  time: '${DateTime.now()}',
                  totalPreparationTime: 12,
                  totalPrice: 25
                )),
                OrderItem(order: OrderModel(
                  orderId: '124444444444446767',
                  time: '${DateTime.now()}',
                  totalPreparationTime: 12,
                  totalPrice: 25
                )),
                OrderItem(order: OrderModel(
                  orderId: '124444444444446767',
                  time: '${DateTime.now()}',
                  totalPreparationTime: 12,
                  totalPrice: 25
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
