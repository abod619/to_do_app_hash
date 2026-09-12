import 'package:flutter/material.dart';
import 'package:to_do_app_hash/widget/title_home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final List task;
  HomePage({super.key, required this.task});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: ListView.builder(
        itemCount: widget.task.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide.none,
                    left: BorderSide.none,
                    top: BorderSide.none,
                    bottom: BorderSide(
                      color: Colors.grey.withValues(alpha: 0.4),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.task[index]['title'],
                          style: GoogleFonts.cairo(
                            color: Color(0xFF20241F),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.task[index]['status'] =
                                  !widget.task[index]['status'];
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: widget.task[index]['status']
                                      ? Color(0xFF1F6F5C)
                                      : Color(0xFFB7B4A8),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: widget.task[index]['status']
                                          ? Color(0xFF1F6F5C)
                                          : Color(0xFFB7B4A8),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),

                              Text(
                                widget.task[index]['status']
                                    ? "مكتملة"
                                    : "لم تبدأ",
                                style: TextStyle(
                                  color: widget.task[index]['status']
                                      ? Color(0xFF1F6F5C)
                                      : Color(0xFF8A8C82),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            widget.task[index]['descri'],
                            style: TextStyle(
                              color: Color(0xFF7A7C74),
                              fontSize: 15,
                            ),
                            
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              widget.task.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete, size: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
