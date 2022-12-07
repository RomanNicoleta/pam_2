import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(MaterialApp(home:app1(),
  theme: new ThemeData(primarySwatch: Colors.pink),
  ));
}
class app1 extends StatefulWidget {
  @override
  _app1State createState() => _app1State ();
}

class _app1State extends State<app1> {
  int selected_date=0,selected_month=0,selected_year=0;
  String days_result="", months_result="", years_result="";
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text("Age Calculator",  style: TextStyle(
      color: Colors.white54 ,
      fontSize: 25,
    ),
    ),
    ),
    body: Center(
    child: Column(children: <Widget> [
      ElevatedButton(child: Text("Choose date", style: TextStyle(
        color: Colors.white54 , fontSize: 13,
      ),), onPressed: (){future_function();},),
      Text(years_result+" "+months_result+" "+days_result)
    ],),
    )
    );
  }
Future future_function() async
{
  DateTime? date1 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1800), lastDate: DateTime.now());

  setState(() {
    selected_date=int.parse(DateFormat("dd").format(date1 as DateTime));
    selected_month=int.parse(DateFormat("MM").format(date1 as DateTime));
    selected_year=int.parse(DateFormat("yyyy").format(date1 as DateTime));

    
    int current_d=int.parse(DateFormat("dd").format(DateTime.now()));
    int current_m=int.parse(DateFormat("MM").format(DateTime.now()));
    int current_y=int.parse(DateFormat("yyyy").format(DateTime.now()));

    int day=NrOfDays(current_m,current_y);

    if(current_d-selected_date>0)
      days_result=(current_d-selected_date).toString()+" days";
    else
    {
      days_result = (current_d +day- selected_date).toString() + " days";
      current_m=current_m-1;
    }

    if(current_m-selected_month>=0)
      months_result=(current_m-selected_month).toString()+" months";
    else
      {
        months_result=(current_m+12-selected_month).toString()+" months";
        current_y=current_y-1;
      }
//aici
    years_result=(current_y-selected_year).toString()+" years";
  });

}

int NrOfDays(int check_month, int check_year)
{
  int check_day;
  if(check_month==1 || check_month==3 || check_month==5 || check_month==7 || check_month==8 || check_month==10 || check_month==12)
    check_day=31;

  else if(check_month==4 || check_month==6 || check_month==9 || check_month==11)
    check_day=30;

  else
    {
      if(check_year%4==0)
        check_day=29;
      else
        check_day=28;
    }

  return check_day;
}

}
