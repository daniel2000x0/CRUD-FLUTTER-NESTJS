import 'package:flutter/material.dart';

class ActionButton  extends StatelessWidget{
  //comuinicacion  entre widgets  Voidcallback   no devuelven  un valor  al   widget padrte * cuando  queremos  notificar   al  widget  padre de  eventos  que han   ocurrido   en el  widget  hijo 
  final VoidCallback onAdd;
  final bool isEditMode;
   const ActionButton({
    super.key,
    required this.onAdd,
    required this.isEditMode
   });
   @override
   Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: onAdd, 
        child: Text(isEditMode ? 'Editar':'Agregar',style:TextStyle(fontSize:12 ),),
        ),
        TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancelar'),),
      ],
    );
   }
}