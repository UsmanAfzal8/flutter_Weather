import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../function/time_date_function.dart';
import '../../../providers/payment/payment_provider.dart';
import '../../../utilities/app_images.dart';
import '../cutom_text.dart';

class HistroyCrad extends StatelessWidget {
  const HistroyCrad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentProvider paymentPro = Provider.of<PaymentProvider>(context);
    return ListView.builder(
      itemCount: paymentPro.order.length,
      itemBuilder: (context, index) {
        int timestamp=0;
        for (int i = 0; i < paymentPro.receipt.length; i++) {
          if (paymentPro.order[index].receiptID ==
              paymentPro.receipt[i].receiptID) {
            timestamp = paymentPro.receipt[i].timestamp;
            break;
          }
        }
        print(paymentPro.order.length);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color(0xfff6f7f9),
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    color: Colors.white,
                    child: paymentPro.order[index].status.value=='cancel'? Image(image: AssetImage(AppImages.ellipsecancel)):Image(image: AssetImage(AppImages.ellipse)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ForText(
                        name: paymentPro.order[index].status.value,
                        bold: true,
                        size: 16,
                      ),
                      SizedBox(
                        width: 140,
                        child: Text(
                          'OrderId :${paymentPro.order[index].orderID}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        // child: ForText(
                        //   name: 'OrderId:',
                        //   size: 14,
                        // ),
                      ),
                      ForText(
                        name:
                            'Item: ${paymentPro.order[index].products.length}',
                        size: 14,
                      ),
                    ],
                  ),
                   ForText(
                    name: TimeStamp.timeInWords(timestamp),
                    bold: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
