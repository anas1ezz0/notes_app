// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';


ThemeData themeModedark =  ThemeData(
               scaffoldBackgroundColor:HexColor('333739'),
               primarySwatch: defaultColor,   
               appBarTheme: AppBarTheme(
                 titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: HexColor('333739'),
                  ),
                    backgroundColor:HexColor('333739'),
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.white),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    )
                ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor:defaultColor,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),

              ),
              textTheme: TextTheme(bodyMedium:TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                

              ) )

              ) ;
ThemeData themeModelight =  ThemeData(
                primarySwatch:defaultColor,
             
               scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                 titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.white
                  ),
                    backgroundColor:Colors.white,
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    )
                ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData
              (
               type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor:defaultColor,
                elevation: 20.0,
                backgroundColor:Colors.white,
              )

                 );
