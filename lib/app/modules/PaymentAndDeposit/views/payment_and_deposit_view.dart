import 'package:flutter/material.dart';
import 'package:video_editing_app/app/modules/PaymentAndDeposit/views/payment_tab_bar.dart';
import 'package:video_editing_app/app/modules/PaymentAndDeposit/views/trancsaction_tab_bar.dart';
import 'account_tab_bar.dart';

class PaymentAndDepositView extends StatefulWidget {
  const PaymentAndDepositView({Key? key}) : super(key: key);

  @override
  State<PaymentAndDepositView> createState() => _PaymentAndDepositViewState();
}

class _PaymentAndDepositViewState extends State<PaymentAndDepositView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PaymentAppBar(sp, width),
          body: TabBarView(
            children: [
              AccountsTabBar(width, height, sp),
              TransactionTabBar(height, width, sp),
            ],
          ),
        ),
      ),
    );
  }
}
