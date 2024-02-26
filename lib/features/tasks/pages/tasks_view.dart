import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../widgets/task_item_widget.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  DateTime focusTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: const Alignment(0, 2.5),
          clipBehavior: Clip.none,
          children: [
            Container(
              width: mediaQuery.width,
              height: mediaQuery.height * 0.22,
              color: theme.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 80,
              ),
              child: Text(
                "TODO List",
                style: theme.textTheme.titleLarge,
              ),
            ),
            EasyInfiniteDateTimeLine(
              firstDate: DateTime(2023),
              focusDate: focusTime,
              lastDate: DateTime(2025),
              showTimelineHeader: false,
              timeLineProps: const EasyTimeLineProps(
                separatorPadding: 15,
              ),
              dayProps: EasyDayProps(
                inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                activeDayStyle: DayStyle(
                  dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                  ),
                  dayStrStyle: theme.textTheme.bodySmall?.copyWith(
                    color: theme.primaryColor,
                  ),
                  monthStrStyle: theme.textTheme.bodySmall?.copyWith(
                    color: theme.primaryColor,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                todayStyle: DayStyle(
                  dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                  dayStrStyle: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                  monthStrStyle: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onDateChange: (selectedDate) {
                setState(() {
                  focusTime = selectedDate;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
