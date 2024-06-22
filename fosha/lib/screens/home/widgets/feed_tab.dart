import 'package:flutter/material.dart';
import 'package:fosha/screens/home/widgets/post.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    const SizedBox(height: 4),
                    Text('Story $index'),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(),
        for (var i = 0; i < 5; i++) Post(i: i),
      ],
    );
  }
}
