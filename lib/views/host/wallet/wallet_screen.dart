import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/utils/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Wallet',
          fontSize: 18.sp,

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet Balance Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    CustomTextOne(
                      text: 'Your balance',
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextOne(
                      text: '\$340',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomTextButton(
                        text: 'Withdraw Now',
                        onTap: () {
                          // Withdraw action
                        },
                        padding: 12.r,
                        color: Colors.white,
                        textColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // History Title
              CustomTextOne(
                text: 'History',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              // Transaction List
              Column(
                children: List.generate(
                  6, // Replace with dynamic count
                      (index) {
                    // Example transaction data
                    final transactionType =
                    index == 0 ? 'Withdraw' : 'William send';
                    final transactionDate =
                    index == 0 ? '22-July-2025' : '22-July-2024';
                    final transactionAmount = index == 0 ? '-\$100' : '+\$12';
                    final amountColor =
                    index == 0 ? Colors.red : Colors.green;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Transaction Type and Amount
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextOne(
                                text: transactionType,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              CustomTextOne(
                                text: transactionAmount,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: amountColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          // Transaction Date and ID
                          CustomTextOne(
                            text: transactionDate,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          CustomTextOne(
                            text: 'TransactionID: #100875428',
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
