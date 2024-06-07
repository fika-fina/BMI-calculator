import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double height = 1.5;
  TextEditingController weightController = TextEditingController();

  AlertDialog PopUp( double height, double weight){

    double bmi = weight/(height*height);
    String category = "";

    if(bmi<18.5){
      category = "underweight";
    }
    else if (bmi>=18.5 && bmi<25){
      category = "Normal";
    }
    else if (bmi>=25 && bmi<30){
      category = "Overweight";
    }
    else if (bmi>=30 && bmi<33){
      category = "Obeses";
    }
    else if (bmi>=33){
      category = "Extremely Obese";
    }


    return AlertDialog(

      title: Center(child: Text("Your BMI")),
      content: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("${bmi.toStringAsFixed(2)}"),
            Text(category),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            height > 2 ? Text("Yes") : Icon(Icons.add),

            Image.asset("bmi.jpg"),

            Text("Height (m)"),
            Text("${height.toStringAsFixed(2)} m"),

            Slider(
              min: 0.0,
                max: 3.0,
                value: height,
                onChanged:(val){
              setState(() {
                height = val;
              });
            }),

            TextField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: "Weight (KG)",
                hintText: "Enter weight",
                border: OutlineInputBorder(),
              ),
            ),


            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){

              double weight = double.parse(weightController.text);

              showDialog(context: context, builder: (BuildContext context) {
                return PopUp(height, weight);
              },);

            } , child: Text("Calculator", style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(40),
                shape: CircleBorder(),
                backgroundColor: Colors.yellow,
              ),
            )

          ],
        ),
      ),

    );
  }
}
