import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Container(
      width: mediaQuery.width,
      height: 115,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 90,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Play Basket Ball",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.alarm,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "10:30 AM",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 38,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
