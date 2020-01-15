import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';


const String testDevice = '8BE6B8CC4FFF82EA6AAFEFFB171718DF';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] :null,
    nonPersonalizedAds: true,
    keywords: <String>['Game','pubg'],
  );
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: "your banner adunit here",
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print("BannerAd $event");
      }
    );
  }
    InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "your interstial aduit here",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print("IntestrialAd $event");
      }
    );
  }
  @override
  void initState() {
FirebaseAdMob.instance.initialize(
  appId: "your app id here"
);
_bannerAd = createBannerAd()..load()..show();
    super.initState();
  }
  @override
  void dispose() {
_bannerAd.dispose();
_interstitialAd.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADS DEEMO',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("DEMO FOR ADS"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Click on ads'),
            onPressed: (){
              createInterstitialAd()..load()..show();
            },
          ),
        ),
      ),
      
    );
  }
}