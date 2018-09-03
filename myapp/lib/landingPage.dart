import 'package:flutter/material.dart';


// Langing TYPe setup
enum LandingType {
  a,b,c
}

class Landingitem {
  final String title ;
  final String subtitle;
  final String imgpath;
  Landingitem({this.title,this.subtitle,this.imgpath});
}

List<Landingitem> landingitems = [
  new Landingitem(
    title:"MQTT-Cloud",
    subtitle:"MQTT is a machine-to-machine/Internet of Things connectivity protocol",
    imgpath:"assets/introduction-protocol.png"
  ),
 new Landingitem(
    title:"Machine-Learning",
    subtitle:"ML is a field of computer science that uses statistical techniques to give computer systems the ability to learn",
    imgpath:"assets/introduction-machine.png"
  ),
 new Landingitem(
    title:"Analyze",
    subtitle:"Exploratory Data Analysis(EDA) is an approach for data analysis that employs a variety of graphical techniques.",
    imgpath:"assets/introduction-analyze.png"
  ),
];

class LandingPage extends StatefulWidget{
  LandingPageState createState() =>  LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  LandingType status = LandingType.a;
  int pagesindex = 0 ;

  checkstatus(LandingType type){
    return status == type;
  }
  List<Widget> createWidgrt(){
    List list = [];
    LandingType.values.map(
      (index) {
        list.add(new Text(index.toString()));
      }).toList();
    return list;
  }
  void changeindex(LandingType type){
    setState(() {
       status = type;   
    });
    switch(type){
      case LandingType.a:
        setState(() {
          pagesindex = 0;
        });
         break;
      case LandingType.b:
        setState(() {
          pagesindex = 1;   
        });
         break;
      case LandingType.c:
        setState(() {
          pagesindex = 2;     
        });
         break;
    }
  }

  void pressed() { 
    if (pagesindex<2) {
      setState(() {
        pagesindex +=1;   
      });
    }
    else{
      Navigator.of(context).pushNamed("/login");
    }
    switch(pagesindex){
      case 0:
        setState((){
          status = LandingType.a;
        });
        break;
      case 1:
        setState((){
          status = LandingType.b;
        });
        break;
      case 2:
        setState((){
          status = LandingType.c;
        });
        break;
      default:
        break;
    }
  
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.grey[800],
      body: new Container(
        alignment: AlignmentDirectional.bottomCenter,
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            new Padding(padding: EdgeInsets.only(top:40.0),),
            CenterView(
              imgpath: landingitems[pagesindex].imgpath,
              title: landingitems[pagesindex].title,
              subtitle: landingitems[pagesindex].subtitle,
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: LandingType.values.map((LandingType renderstatus){
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0,right:5.0),
                  child: new InkWell(
                    onTap: () => changeindex(renderstatus),
                    child: new Container(
                      width:checkstatus(renderstatus)?20.0:15.0,
                      height:checkstatus(renderstatus)?20.0:15.0,
                      decoration: new BoxDecoration(
                        color:checkstatus(renderstatus)?Colors.red:Colors.teal,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                );
              }).toList()
            ),
            new Padding(padding: EdgeInsets.only(top:40.0) ,),
            new SizedBox(
              width: 150.0,
              child: new RaisedButton(
                color: Colors.blue,
                onPressed:pressed,
                child: new Text("Start",),
              ),
            )
          ]
        )
      )
    );
  }
}

class CenterView extends StatelessWidget {
  CenterView({this.imgpath,this.title,this.subtitle});
  final String imgpath;
  final String title;
  final String subtitle;
  // title Style 
  final TextStyle titlestyle = new TextStyle(
    color: Colors.blue,
    fontSize: 26.0,
  );
  // Subtile Style
  final TextStyle subtitlestyle = new TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(left:30.0,right:30.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top:40.0) ,),
         
          new Padding(padding: EdgeInsets.only(top:40.0) ,),
          new Container(
            width: MediaQuery.of(context).size.width-40,
            height: 300.0,
            child: Image.asset(imgpath,fit:BoxFit.fitWidth),
          ),
         
          new Padding(padding: EdgeInsets.only(top:40.0) ,),
          new Text(
            title,
            style: titlestyle,
            textAlign: TextAlign.left,
          ),
          new Padding(padding: EdgeInsets.only(top:10.0) ,),
          new Container(
            height: 80.0,
            child: new Text(
              subtitle,
              style: subtitlestyle,  
            ),
          ),
          new Padding(padding: EdgeInsets.only(bottom:40.0) ,),
        ],
      ),
    );
  }
}