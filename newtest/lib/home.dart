import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'package:newtest/controller/httpctrl.dart' as ht;
import 'package:newtest/globalVar.dart' as global;
import 'package:newtest/writeNews.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

class Home extends StatefulWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // httpct.loadData();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      print('Launching $url...');
      await launch(url);
    } else {
      print('Error launching $url!');
      return 0;
    }
  } //opens a custom url in the system browser

  //final httpct = Get.put(ht.ControllerHttp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 231, 231),
        title: Row(
          children: [
            Text(
              'Buletin',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.red,
                fontStyle: FontStyle.italic,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "|",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Story',
                    style: GoogleFonts.abel(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Creator',
                    style: GoogleFonts.abel(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Community',
                    style: GoogleFonts.abel(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Subscribe',
                    style: GoogleFonts.abel(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ),
          ],
        ),
        actions: [
          // IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {},
          //     color: Color.fromARGB(255, 136, 132, 132)),
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
              color: Color.fromARGB(255, 136, 132, 132)),
          // ... add more buttons

          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return CreateNewsPage();
                    },
                  ),
                );
              },
              color: Color.fromARGB(255, 136, 132, 132)),
          CircleAvatar(
            backgroundImage:
                NetworkImage(global.newsResponse.value.articles![0].urlToImage),
            // ... handle onTap for profile picture
          ),
          SizedBox(
            width: 10,
            height: 0,
          )
        ],
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Buletin',
      //     style: TextStyle(color: Colors.red, fontSize: 24),
      //   ),
      //   actions: [
      //     IconButton(icon: Icon(Icons.search), onPressed: () {}),
      //     IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
      //     // ... add more buttons
      //     CircleAvatar(
      //       backgroundImage: NetworkImage('url_to_profile_image'),
      //       // ... handle onTap for profile picture
      //     ),
      //     IconButton(icon: Icon(Icons.edit), onPressed: () {}),
      //   ],
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "WELLCOME TO BULETIN",
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 15, 15, 15),
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        // style: GoogleFonts.notoSansAdlam(
                        //   textStyle: Theme.of(context).textTheme.displayLarge,
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w600,
                        //   color: Color.fromARGB(255, 15, 15, 15),
                        //   fontStyle: FontStyle.italic,
                        // ),
                        children: [
                          TextSpan(
                            text: 'Craft narratives ',
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 15, 15, 15),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(
                                FontAwesomeIcons.handHoldingHeart,
                                size: 15,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' that ignite ',
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 15, 15, 15),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: 'inspiration',
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 211, 9, 9),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(
                                FontAwesomeIcons.lightbulb,
                                size: 15,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' knowledge ',
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 211, 9, 9),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(
                                FontAwesomeIcons.book,
                                size: 15,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 15, 15, 15),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ' entertainment ',
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 211, 9, 9),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(
                                FontAwesomeIcons.film,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              global.newsResponse.value.totalResults > 0
                  ? InkWell(
                      onTap: () {
                        print(timeago.format(
                          DateTime.parse(global
                              .newsResponse.value.articles![0].publishedAt),
                        ));
                        launchURL(global.newsResponse.value.articles![0].url);
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: global
                                  .newsResponse.value.articles![0].urlToImage,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.47,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.43,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            CachedNetworkImageProvider(global
                                                .newsResponse
                                                .value
                                                .articles![0]
                                                .urlToImage),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${global.newsResponse.value.articles![0].source!.name} • ${timeago.format(
                                          DateTime.parse(global.newsResponse
                                              .value.articles![0].publishedAt),
                                        )} ',
                                        style: GoogleFonts.abel(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    global
                                        .newsResponse.value.articles![0].title,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      '${global.newsResponse.value.articles![0].description}',
                                      maxLines: 4,
                                      style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Movies • ",
                                          style: GoogleFonts.notoSans(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Color.fromARGB(255, 211, 9, 9),
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "4 min read                                                                              ",
                                          style: GoogleFonts.notoSans(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Color.fromARGB(255, 12, 12, 12),
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ]))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest News ",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all >>",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: global.newsResponse.value.totalResults > 0
                        ? global.newsResponse.value.articles!.length
                        : 0,
                    itemBuilder: (BuildContext context, i) {
                      return i == 0
                          ? Container()
                          : InkWell(
                              onTap: () {
                                launchURL(
                                    global.newsResponse.value.articles![i].url);
                              },
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: global.newsResponse.value
                                            .articles![i].urlToImage,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 10,
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          global
                                                              .newsResponse
                                                              .value
                                                              .articles![i]
                                                              .urlToImage),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${global.newsResponse.value.articles![i].source!.name} • ${timeago.format(
                                                    DateTime.parse(global
                                                        .newsResponse
                                                        .value
                                                        .articles![i]
                                                        .publishedAt),
                                                  )} ',
                                                  style: GoogleFonts.abel(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .displayLarge,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              global.newsResponse.value
                                                  .articles![i].title,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Text(
                                            //     '${global.newsResponse.value.articles![i].description}',
                                            //     style: TextStyle(
                                            //       fontSize: 16,
                                            //       overflow: TextOverflow.visible,
                                            //     )),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: "News • ",
                                                    style: GoogleFonts.notoSans(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 211, 9, 9),
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "4 min read                                                                              ",
                                                    style: GoogleFonts.notoSans(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 12, 12, 12),
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                  ),
                                                ]))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  )
                                ],
                              ),
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
