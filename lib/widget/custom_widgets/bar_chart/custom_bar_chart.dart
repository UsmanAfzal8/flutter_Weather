import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/payment/payment_provider.dart';
import 'custom_bar_line.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentProvider paymentPro = Provider.of<PaymentProvider>(context);
    double totalCount = paymentPro.totalCount;
    double proccesing = paymentPro.proccesing;
    double completed = paymentPro.completed;
    double deleviry = paymentPro.deleviry;
    double cancel = paymentPro.cancel;
    double shipped = paymentPro.shipped;
    proccesing = (proccesing / totalCount) * 200;
    deleviry = (deleviry / totalCount) * 200;
    completed = (completed / totalCount) * 200;
    shipped = (shipped / totalCount) * 200;
    cancel = (cancel / totalCount) * 200;
    print('pending $proccesing');
    print('progress $deleviry');
    print('completed $completed');
    print('shipped $shipped');
    print('cancel $cancel');
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text('100%'),
                SizedBox(
                  height: 20,
                ),
                Text('80%'),
                SizedBox(
                  height: 20,
                ),
                Text('60%'),
                SizedBox(
                  height: 20,
                ),
                Text('40%'),
                SizedBox(
                  height: 20,
                ),
                Text('20%'),
              ],
            ),
           paymentPro.tempname=='All'? Expanded(
             child: SizedBox(
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomBarLine(percentage: completed, title: 'Confirmed'),
                    
                    CustomBarLine(percentage: proccesing, title: 'Processing'),
                    CustomBarLine(percentage: deleviry, title: 'Delivery'),
                    CustomBarLine(percentage: cancel, title: 'Cancel'),
                    CustomBarLine(percentage: shipped, title: 'Shipped'),
                  ],
                ),
             ),
           ):paymentPro.tempname=='Running'?Expanded(
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomBarLine(percentage: 0, title: 'Confirmed'),
                  CustomBarLine(percentage: proccesing, title: 'Processing'),
                  CustomBarLine(percentage: deleviry, title: 'Delivery'),
                  const CustomBarLine(percentage: 0, title: 'Cancel'),
                  CustomBarLine(percentage: shipped, title: 'Shipped'),
                ],
              ),
           ):paymentPro.tempname=='Previous'?Expanded(
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomBarLine(percentage: completed, title: 'Confirmed'),
                  const CustomBarLine(percentage: 0, title: 'Processing'),
                  const CustomBarLine(percentage: 0, title: 'Delivery'),
                  CustomBarLine(percentage: cancel, title: 'Cancel'),
                  const CustomBarLine(percentage: 0, title: 'Shipped'),
                ],
              ),
           ):SizedBox()
          ],
        ));
  }
}
