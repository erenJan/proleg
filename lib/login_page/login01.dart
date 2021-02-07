import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
//Scrollable bottomsheet sign_up form

class LoginPage extends StatefulWidget{
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  with SingleTickerProviderStateMixin{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(170, 80, 80, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    SizedBox(height:40.0),
                    CarouselSlider(
                      options: CarouselOptions(height: 200.0),
                      items: ['assets/config.json','assets/config.json','assets/config.json'].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width-180,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.amber
                              ),
                              child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                            );
                          },
                        );
                      }).toList(),
                    ),
                    FormField()
                  ],
                ),
              ),
            ),
            BottomSheet()
          ],
        ),
      ),
    );
  }
}
//logo
class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top:20),
        alignment: Alignment.center,
        child: Image.network('https://images-na.ssl-images-amazon.com/images/I/515cl%2B02yjL.png',width: MediaQuery.of(context).size.width/1.7,height: MediaQuery.of(context).size.height/5)
      )
    );
  }
}
//logoIcon
class LogoIcon extends StatelessWidget {
  const LogoIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        child: Image.network('https://images-na.ssl-images-amazon.com/images/I/515cl%2B02yjL.png',width: 70,height: 70)
      )
    );
  }
}
//animated logo
class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Image.network('https://images-na.ssl-images-amazon.com/images/I/515cl%2B02yjL.png',width: MediaQuery.of(context).size.width/2.3);
  }
}
//login form
class FormField extends StatefulWidget {
  const FormField({Key key}) : super(key: key);

  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  bool passwordVisibility = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _passwordToggle(){
    setState((){
      passwordVisibility = ! passwordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top:60.0,left: 30.0),
        alignment: Alignment.topLeft,
        child: Form(
            key: _formKey,
            child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.4,
                      child: TextFormField(//email
                        controller: _emailController,
                        decoration: new InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color:Colors.white),
                          focusColor: Colors.white,
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.white,
                              width: 2.0
                            )
                          )
                        ),
                        validator: (String mail){
                          if(mail.isEmpty){
                            return "Lütfen bir mail yazınız";
                          }
                          return null;
                        },
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                child:Row(
                  children: [ 
                    Container(
                      width: MediaQuery.of(context).size.width/1.4,
                      child: TextFormField(//password 
                        obscureText: passwordVisibility,
                        controller: _passwordController,
                        decoration: new InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color:Colors.white),
                          focusColor: Colors.white,
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.white,
                              width: 2.0
                            )
                          )
                        ),
                        validator: (String mail){
                          if(mail.isEmpty){
                            return "Lütfen bir şifre yazın";
                          }
                          return null;
                        },
                      )
                    ),
                    SizedBox(width:10),
                    GestureDetector(
                      onTap: _passwordToggle,
                      child: Container(
                        padding: EdgeInsets.only(top:14),
                        child: Icon(!passwordVisibility ? Icons.remove_red_eye : Icons.visibility_off ,size: 30,color: Colors.white),
                      )
                    )
                  ],
                )
              ), 
              Container(
                margin: EdgeInsets.only(top:30,bottom:16,right: 40),
                width: MediaQuery.of(context).size.width/1.5,
                child: FlatButton(
                  child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  color: Colors.white,
                  textColor: Colors.pink,
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 40),
                width: MediaQuery.of(context).size.width/5 ,
                child: Row(
                  children: [
                    Expanded(
                      child:Divider()
                    ),
                    Text('OR'),
                    Expanded(
                      child:Divider()
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                margin: EdgeInsets.only(right: 40),
                padding: EdgeInsets.only(top:0),
                width: MediaQuery.of(context).size.width/1.5,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    
                  },
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
//bottomsheet
double minHeight = Platform.isAndroid ? 80.0:150.0;

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}
class _BottomSheetState extends State<BottomSheet> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double get maxHeight => MediaQuery.of(context).size.height;
  double get headerTopMargin => lerp(80, 50);
  double get headerFontSize => lerp(16, 0); 
  bool headerTextvisibility = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600), 
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) => 
    lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: <Widget>[
                  Header(
                    fontSize: headerFontSize,
                    topMargin: 24,
                  ),
                  SignupContainer(
                    topMargin: headerTopMargin,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }
  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _controller.fling(velocity: max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0); //<-- or just continue to whichever edge is closer
  }
}


class Header extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  const Header({Key key, @required this.fontSize, @required this.topMargin}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.only(right:20.0,left:40.0),//do not forget to change this to centered fixed!! it was just for iphone 11 
        child: Row(
          children: [  
            Text(
              'Henüz kayıt olmadınız mı?',
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              ' Kayıt Ol',
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.blue,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
//signup container
class SignupContainer extends StatelessWidget {
  final double topMargin;
  const SignupContainer({Key key, @required this.topMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height:topMargin),
          Logo(),
          FormUpField()
        ],
      ),
    );
  }
}
class FormUpField extends StatefulWidget {
  @override
  _FormUpFieldState createState() => _FormUpFieldState();
}

class _FormUpFieldState extends State<FormUpField> {
  final TextEditingController _signEmail = TextEditingController();

  final TextEditingController _signPassword = TextEditingController();


  final TextEditingController _nameSurname = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _success = true;
  String _message;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top:60.0,left: 0.0),
        alignment: Alignment.topLeft,
        child: Form(
          key: _formKey,
            child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.4,
                      child: TextFormField(//name-surname
                        controller: _nameSurname,
                        decoration: new InputDecoration(
                          labelText: 'Name Surname',
                          labelStyle: TextStyle(color:Colors.blue),
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.blue,
                              width: 2.0
                            )
                          )
                        ),
                        validator: (String nameSurname){
                          if(nameSurname.isEmpty){
                            return "Adınızı Soyadınızı giriniz";
                          }
                          return null;
                        },
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(//email
                      width: MediaQuery.of(context).size.width/1.4,
                      child: TextFormField(
                        controller: _signEmail,
                        decoration: new InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color:Colors.blue),
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.blue,
                              width: 2.0
                            )
                          )
                        ),
                        validator: (String email){
                          if(email.isEmpty){
                            return "Emailinizi yazınız";
                          }
                          return null;
                        },
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                child:Row(
                  children: [ 
                    Container(//password
                      width: MediaQuery.of(context).size.width/1.4,
                      child: TextFormField(
                        controller: _signPassword,
                        obscureText: true,
                        decoration: new InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color:Colors.blue),
                          focusColor: Colors.blue,
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.blue,
                              width: 2.0
                            )
                          )
                        ),
                        validator: (String password){
                          if(password.isEmpty){
                            return "Lütfen bir şifre yazın";
                          }
                          return null;
                        },
                      )
                    ),
                    SizedBox(width:10),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.only(top:14),
                        child: Icon(!false ? Icons.remove_red_eye : Icons.visibility_off ,size: 30,color: Colors.blue),
                      )
                    )
                  ],
                )
              ),
              SizedBox(height:10),
              Container(
                margin: EdgeInsets.only(top:30,bottom:16),
                width: MediaQuery.of(context).size.width/1.3,
                child: FlatButton(
                  child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async {
                      
                    },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null ? '' : _message ?? '')
              )
            ],
          ),
        )
      )
    );
  }
  @override
  void dispose() {
    _signEmail.dispose();
    _signPassword.dispose();
    super.dispose();
  }
}
