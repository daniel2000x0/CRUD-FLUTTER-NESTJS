import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// conteiner  errors 
class ErrorContainer extends StatelessWidget{


  final BuildContext context;
  final String img;
  final String  title;
  final String  message;
  final String  buttonText;
  final Function  onPressed;
  final double heightMultiplier;
  
  const ErrorContainer({
    Key? key,
    required this.context,
    required this.img,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
    required this.heightMultiplier,
  }) : super(key: key);





// cuadro de  dialogo  que  verifica   la eliminacion 
  @override
  Widget build(BuildContext context){
    // tamano  de la pantalla    
    final size = MediaQuery.of(context).size;
    // se usa hacer un widget segundario  que ocupe tod el  eespacio restante   al o largo  del,  eje horizontal  y verticalr 
    return Expanded(child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children:<Widget> [
          Image(image: AssetImage(img),
          fit: BoxFit.cover,
          height: size.height * heightMultiplier
          
),
          SizedBox(height: 30),
          Padding(padding: EdgeInsets.symmetric( horizontal:40),
          child:Text(
             title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24),
          ),),
          SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 40),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),

Container(width: double.infinity,
padding: EdgeInsets.only(top:30),
margin:EdgeInsets.symmetric(
  horizontal: 40
),
   child: ElevatedButton(
              onPressed: () {  },
              child: Text('RELOAD'),
              ),

)

        ],
      ),
    ),
    );
  }

}