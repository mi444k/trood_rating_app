import 'package:feedback_app/widgets/worker_item_rating.dart';
import 'package:flutter/material.dart';

Widget workerListItem({required Map worker}) => Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: const Color(0x10000000),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(worker["urlAvatar"], scale: 1),
                    ),
                  ),
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${worker["name"]}'),
              const SizedBox(height: 10),
              workerListItemRating(worker: worker),
            ],
          ),
        ],
      ),
    );
