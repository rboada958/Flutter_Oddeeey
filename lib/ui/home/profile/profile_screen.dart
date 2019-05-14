import 'package:flutter/material.dart';
import 'package:flutter_social/ui/home/profile/blocs/profile_bloc.dart';
import 'package:flutter_social/ui/home/profile/models/response_profile.dart';
import 'package:flutter_social/ui/home/profile/widgets/custom_profile.dart';
import 'package:flutter_social/utils/constantes.dart';
import 'package:flutter_social/utils/utils.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String token;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.token = "Bearer " + preferences.getApiToken();
      print("Token in the profile: ${this.token}");
      profileBloc.getProfile(this.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<ResponseProfile>(
        stream: profileBloc.profile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var day = getDay(parseStringDate(snapshot.data.data.created_at));
            var weekDay =
                getWeekDay(parseStringDate(snapshot.data.data.created_at));
            var month =
                getMonth(parseStringDate(snapshot.data.data.created_at));
            var year = getYear(parseStringDate(snapshot.data.data.created_at));
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  backgroundColor: Colors.deepOrange,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Image.network(
                      snapshot.data.data.images[0].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              customText("${snapshot.data.data.name}, "),
                              customText(
                                calculateAge(parseStringDate(
                                        snapshot.data.data.birthday))
                                    .toString(),
                              ),
                              snapshot.data.data.gender == 0
                                  ? selectGender(male)
                                  : selectGender(female),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Text(
                                '..',
                                style: TextStyle(
                                  backgroundColor: Colors.deepOrange,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Text(
                                'Member since $weekDay, $day $month $year',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  customText("0\$"),
                                  Text(
                                    "Winnings",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  customText("0\$"),
                                  Text(
                                    "Balance",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  customText("0\$"),
                                  Text(
                                    "OnGoing",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(coins),
                                Stack(
                                  children: <Widget>[
                                    Image.asset(background),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          child: Text(
                                            'Purchase coins & deals',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ), padding: EdgeInsets.only(left: 25.0, top: 20.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 15.0),
                          child: customText('Interests'),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: true,
                          crossAxisCount: 3,
                          children: List.generate(
                            snapshot.data.data.categories.length,
                            (index) {
                              return gridView(
                                  snapshot.data.data.categories[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.hasError.toString()));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
