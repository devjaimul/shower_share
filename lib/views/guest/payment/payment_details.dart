import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Payment Details',
          fontSize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentRow('Date & Time', '05.00 AM, 12 June 2023', isBold: false),
              _buildDivider(),
              _buildPaymentRow('Total Hours', '3 hours', isBold: true),
              _buildDivider(),
              _buildPaymentRow('Per Hour', '\$50', isBold: false),
              _buildDivider(),
              _buildPaymentRow('Others facilities', '\$10', isBold: false),
              _buildDivider(),
              _buildPaymentRow('Sub Total', '\$160', isBold: true, isColored: true),
              _buildDivider(),
              _buildPaymentRow('Platform charge (10%)', '\$16', isBold: false),
              _buildDivider(),
              _buildPaymentRow(
                'Grand Total',
                '\$176',
                isBold: true,
                isColored: true,
                color: Colors.green,
                textColor: Colors.green
              ),
              SizedBox(height: 100.h,),
              CustomTextButton(text: 'Payment', onTap: (){Get.offAllNamed(RouteNames.customNavBar);})
            ],
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() => Divider(thickness: 1.h, color: Colors.grey[300]);

  // Custom Payment Row Widget
  Widget _buildPaymentRow(String label, String value,
      {bool isBold = false, bool isColored = false, Color? color,textColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextTwo(
            text: label,
            fontSize: 14.sp,
            color:textColor?? Colors.black,
          ),
          CustomTextTwo(
            text: value,
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isColored ? (color ?? Colors.green) : Colors.black,
          ),
        ],
      ),
    );
  }
}
