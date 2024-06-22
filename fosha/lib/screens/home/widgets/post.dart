import 'package:flutter/material.dart';
import 'package:fosha/screens/home/widgets/Post_Image.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User $i'),
                    Text('Location $i'),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const PostImg(imageUrl: 'https://via.placeholder.com/500'),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.comment_outlined),
              SizedBox(width: 16),
              Icon(Icons.send),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Liked by user1 and others'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('View all comments'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
