import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Us'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showRatingDialog(context);
              },
              child: const Text('Open Rating Dialog'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ),
          AnimatedRatingDialog(),
        ],
      ),
    );
  }

  Future<void> showRatingDialog(BuildContext context) async {
    double initialRating = 3.0;
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController commentController = TextEditingController();

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return RatingDialog(
          initialRating: initialRating,
          nameController: nameController,
          ageController: ageController,
          commentController: commentController,
        );
      },
    );

    if (response != null && response['rating'] != null) {
      double starCount = response['rating'];
      print('Star Count: $starCount');
      if (response['name'] != null) {
        print('Name: ${response['name']}');
      }
      if (response['age'] != null) {
        print('Age: ${response['age']}');
      }
      if (response['comment'] != null) {
        print('Comment: ${response['comment']}');
      }

      saveRating(response);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Thanks for rating us!'),
            content: Text('We appreciate your feedback.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

class AnimatedRatingDialog extends StatefulWidget {
  @override
  _AnimatedRatingDialogState createState() => _AnimatedRatingDialogState();
}

class _AnimatedRatingDialogState extends State<AnimatedRatingDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: Tween<double>(begin: 0.5, end: 1.0)
              .animate(
                CurvedAnimation(
                  curve: Curves.fastOutSlowIn,
                  parent: _animationController,
                ),
              )
              .value,
          child: Opacity(
            opacity: _animationController.value,
            child: RatingDialog(
              initialRating: 3.0,
              nameController: TextEditingController(),
              ageController: TextEditingController(),
              commentController: TextEditingController(),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class RatingDialog extends StatefulWidget {
  final double initialRating;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController commentController;

  const RatingDialog({
    Key? key,
    required this.initialRating,
    required this.nameController,
    required this.ageController,
    required this.commentController,
  }) : super(key: key);

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  bool isNumeric(String value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: widget.initialRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 40.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      currentRating = rating;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: widget.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: widget.ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: widget.commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Add a comment (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      print('Submit button pressed');

                      if (widget.nameController.text.isEmpty ||
                          widget.ageController.text.isEmpty ||
                          widget.commentController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Fill All Fields'),
                              content:
                                  Text('Please fill all the required fields.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }

                      if (!isNumeric(widget.ageController.text)) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Invalid Age'),
                              content: Text(
                                  'Please enter a valid age (numeric value).'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }

                      saveRating({
                        'rating': currentRating,
                        'name': widget.nameController.text,
                        'age': widget.ageController.text,
                        'comment': widget.commentController.text,
                      });

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Thanks for rating us!'),
                            content: Text('We appreciate your feedback.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('SUBMIT'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void saveRating(Map<String, dynamic> data) async {
  try {
    final response = await http
        .post(
          Uri.parse('http://unimobileapp.000webhostapp.com/rate.php'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data),
        )
        .timeout(
            Duration(seconds: 10)); // Increase the timeout duration if needed

    if (response.statusCode == 200) {
      print('Rating saved successfully');
    } else {
      print('Error saving rating: ${response.body}');
    }
  } catch (e) {
    print('Error during HTTP Request: $e');
  }
}
