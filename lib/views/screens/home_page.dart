import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sky_scrapper_api_flutter_app/utils/helper/helper.dart';
import 'package:sky_scrapper_api_flutter_app/utils/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getApi() async {
    await WeatherApiHelper.apiHelper.getApi();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: WeatherApiHelper.apiHelper.getApi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Current? data = snapshot.data;
            return Container(
                child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: data!.is_day == 1
                      ? Image.asset(
                          "assets/images/CTa.gif",
                          fit: BoxFit.cover,
                        )
                      : Image.asset("assets/images/logo.gif",
                          fit: BoxFit
                              .cover), //Image.asset("assets/night/cloudy.jpg", fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 10, right: 10),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_sharp, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 130,
                            height: 20,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                " Surat, India",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  //fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.share_location_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.temp_c}',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.5,
                                fontSize: 70.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text("o",
                              style: GoogleFonts.poppins(
                                  color: Colors.white38,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Text(
                              //   "It's ${data!.current.condition.text}",
                              //   style: GoogleFonts.poppins(
                              //     color: Colors.white60,
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 18,
                              //     letterSpacing: 1,
                              //   ),
                              // ),
                              SizedBox(
                                width: 5,
                              ),
                              Spacer(),

                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Is Day : ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.is_day}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wind  Direction : ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.wind_dir}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Temp. in F : ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.temp_f}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Cloud : ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.cloud}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wind speed in KPH: ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.wind_kph} KPH",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wind Speed in MPH: ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.wind_mph}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Humidity : ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.humidity}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Last updated : ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "${data.last_updated}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ));
          }
          return CircularProgressIndicator(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
