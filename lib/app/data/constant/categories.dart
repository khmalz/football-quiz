import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:football_quiz/app/data/enum/league.dart';

final List<Map<String, dynamic>> categories = [
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "Champions League",
    "color": Colors.blueAccent,
    "league": League.championsleague.name
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Premier League",
    "color": Colors.purple,
    "league": League.premierleague.name
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "La Liga",
    "color": Colors.redAccent,
    "league": League.laliga.name
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Serie A",
    "color": Colors.green,
    "league": League.seriea.name
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "Europa League",
    "color": Colors.orange,
    "league": League.europaleague.name
  },
  {
    "icon": FontAwesomeIcons.globe,
    "title": "FIFA World Cup",
    "color": Colors.red,
    "league": League.worldcup.name
  },
  {
    "icon": FontAwesomeIcons.flag,
    "title": "Copa America",
    "color": Colors.lightBlue,
    "league": League.copaamerica.name
  },
  {
    "icon": FontAwesomeIcons.earthAsia,
    "title": "Asian Cup",
    "color": Colors.redAccent,
    "league": League.asiancup.name
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Ballon d'Or",
    "color": const Color.fromARGB(255, 255, 215, 0),
    "league": League.balondor.name
  },
  // {
  //   "icon": FontAwesomeIcons.personRunning,
  //   "title": "Golden Boot",
  //   "color": Colors.orange,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.rightLeft,
  //   "title": "Transfers",
  //   "color": Colors.lightGreen,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.calendarDays,
  //   "title": "Iconic Matches",
  //   "color": Colors.brown,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.mapLocationDot,
  //   "title": "Stadiums & Venues",
  //   "color": Colors.teal,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.userShield,
  //   "title": "Goalkeepers",
  //   "color": Colors.lightBlue,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.shieldHalved,
  //   "title": "Defenders",
  //   "color": Colors.deepOrange,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.handshakeAngle,
  //   "title": "Midfielders",
  //   "color": Colors.green,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.personRunning,
  //   "title": "Forwards",
  //   "color": Colors.red,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.userTie,
  //   "title": "Managers & Coaches",
  //   "color": Colors.indigo,
  //   "league": ""
  // },
  // {
  //   "icon": FontAwesomeIcons.shield,
  //   "title": "BRI Liga 1",
  //   "color": Colors.blue,
  //   "league": ""
  // },
];
