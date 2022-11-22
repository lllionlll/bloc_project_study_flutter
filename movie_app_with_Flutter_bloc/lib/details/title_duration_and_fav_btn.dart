import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/movie.dart';

class TitleDurationAndFavBtn extends StatefulWidget {
  const TitleDurationAndFavBtn({
    Key? key,
    required this.kDefaultPadding,
    required this.movie,
  }) : super(key: key);

  final double kDefaultPadding;
  final Result movie;

  @override
  State<TitleDurationAndFavBtn> createState() => _TitleDurationAndFavBtnState();
}

class _TitleDurationAndFavBtnState extends State<TitleDurationAndFavBtn> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(widget.kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title!,
                  style: TextStyle(fontSize: 22, color: Colors.grey[900]),
                ),
                SizedBox(
                  height: widget.kDefaultPadding / 2,
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('y')
                          .format(widget.movie.releaseDate!.toLocal()),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: widget.kDefaultPadding,
                    ),
                    const Text(
                      'PG-15',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: widget.kDefaultPadding,
                    ),
                    const Text(
                      '2h 32min',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height / 14,
            width: size.width / 6,
            child: FloatingActionButton(
              backgroundColor: fav ? Colors.deepPurpleAccent : Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                setState(() => fav = !fav);
              },
              child: Icon(
                fav ? CupertinoIcons.heart_fill : CupertinoIcons.add,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
