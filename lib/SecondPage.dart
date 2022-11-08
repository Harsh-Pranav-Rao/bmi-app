import 'package:flutter/material.dart'; //import this from the first file
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; //this is done to add the rating bar into the working environment

//Create a stful widget
class SecondPage extends StatefulWidget {
  //remove the constructor here and create your own constructor, constructor takes same name as class, SecondPage
  SecondPage(
      {required this.result}); //This is our constructor SecondPage({}), and inside we type required this.result (This is done to create the variable, and pass it on to this page to use it)
  double
      result; //Create the result variable for this page (The variable you're passing on basically)

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    MaterialAccentColor bgcolor = Colors.greenAccent;
    String textWeight = "";

    if (widget.result < 18.5) {
      bgcolor = Colors.redAccent;
      textWeight = "Under Weight";
    } else if (widget.result > 25) {
      bgcolor = Colors.orangeAccent;
      textWeight = "Over Weight";
    } else if ((widget.result >= 18.5) && (widget.result <= 29.9)) {
      bgcolor = Colors.greenAccent;
      textWeight = "Normal Weight";
    } else if (widget.result > 29.9) {
      bgcolor = Colors.redAccent;
      textWeight = "Obese";
    }

    return Scaffold(
      //Create a scaffold
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
            "Results",
          style: TextStyle(
            color: Colors.white38,
          )
        ),
        automaticallyImplyLeading:
            false, // removes the back button on the app bar
        backgroundColor: Colors.pinkAccent,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: 400,
              height: 450,
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  color: bgcolor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("BMI : ${widget.result.toStringAsFixed(1)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )), //so any parameter you create, you need to add widget.variable for it to be used

                  Text(textWeight,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,

                      )),
                ],
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); //Navigator.pop(context) pops the current page you're in, making you go back to the previous page
                    },
                    child: Text(
                      "RE-CALCULATE",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(30),
                    ))
              ],
            ),
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }
}
