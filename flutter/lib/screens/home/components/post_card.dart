import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String challenge;
  final String tags;
  final String content;
  final int likes;
  final int comments;
  final bool isLiked;
  final VoidCallback onLikePressed;

  const PostCard({
    Key? key,
    required this.username,
    required this.timeAgo,
    required this.challenge,
    required this.tags,
    required this.content,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.075,
                backgroundColor: const Color(0xFFD9D9D9),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.username,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF514F51),
                    ),
                  ),
                  Text(
                    widget.timeAgo,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFA6A6A6),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF06C4E), Color(0xFF9834D6)],
                  ),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Text(
                  widget.challenge,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.tags,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA84DE8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.content,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF797979),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              color: Color(0xFFA3A3A3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  widget.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: widget.isLiked ? Colors.red : Colors.grey,
                ),
                onPressed: widget.onLikePressed,
              ),
              Text(
                '${widget.likes}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF838383),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.comment, color: Color(0xFF838383)),
              const SizedBox(width: 8),
              Text(
                '${widget.comments}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF838383),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
