import 'package:flutter/material.dart';
import 'package:to_do_app_hash/models/note_model.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart';
import 'package:to_do_app_hash/widget/day_selector.dart';
import 'package:timelines_plus/timelines_plus.dart';

class DeilyPlanScreen extends StatefulWidget {
  const DeilyPlanScreen({super.key});

  @override
  State<DeilyPlanScreen> createState() => _DeilyPlanScreenState();
}

class _DeilyPlanScreenState extends State<DeilyPlanScreen> {
  Notes? task = Notes();

  String formatDate(DateTime date) {
    return intl.DateFormat("EEEE, d MMMM yyyy", 'ar').format(date);
  }

  String days(DateTime daysSele) {
    return intl.DateFormat('EEEE', 'ar').format(daysSele);
  }

  String daysNumber(DateTime daysSele) {
    return intl.DateFormat('d', 'ar').format(daysSele);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'خطتي اليوم',
              style: TextStyle(
                color: AppColors.colorBlack,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.iconsColor,
                ),
                SizedBox(width: 5),
                Text(
                  formatDate(DateTime.now()),
                  style: TextStyle(color: AppColors.secondaryText),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Day Selector
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  final date = DateTime.now().add(Duration(days: index));
                  return DaySelector(
                    day: days(date),
                    dayNumber: daysNumber(date),
                    isSelectedDay: index == 0,
                  );
                }),
              ),
            ),

            SizedBox(height: 10),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TimelineTile(
                    nodeAlign: TimelineNodeAlign.basic,
                    contents: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.boxShadow,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.sunny,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text('الاستيقاظ و الفطور '),
                            ],
                          ),
                        ],
                      ),
                    ),
                    oppositeContents: Text('08:00'),

                    node: TimelineNode(
                      indicator: DotIndicator(
                        border: BoxBorder.all(
                          color: AppColors.primary,
                          width: 3,
                        ),
                        color: Colors.transparent,
                        size: 12,
                      ),
                      startConnector: SolidLineConnector(
                        color: AppColors.boxShadow,
                      ),
                      endConnector: SolidLineConnector(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
