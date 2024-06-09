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
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Bundesliga",
    "color": Colors.black,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Ligue 1",
    "color": Colors.blue,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "Europa League",
    "color": Colors.orange,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.globe,
    "title": "FIFA World Cup",
    "color": Colors.red,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.earthEurope,
    "title": "UEFA European Championship",
    "color": Colors.blueAccent,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.flag,
    "title": "Copa America",
    "color": Colors.lightBlue,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.flagCheckered,
    "title": "African Cup of Nations",
    "color": Colors.green,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.earthAsia,
    "title": "Asian Cup",
    "color": Colors.redAccent,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Major League Soccer (MLS)",
    "color": Colors.lightBlue,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "FA Cup",
    "color": Colors.red,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "Copa del Rey",
    "color": Colors.orange,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "Coppa Italia",
    "color": Colors.green,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "DFB-Pokal",
    "color": Colors.black,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.shieldHalved,
    "title": "Community Shield",
    "color": Colors.blue,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.trophy,
    "title": "Supercopa de España",
    "color": Colors.red,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.users,
    "title": "UEFA Nations League",
    "color": Colors.blueAccent,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.medal,
    "title": "Olympic Football",
    "color": Colors.green,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.earthAmericas,
    "title": "FIFA Club World Cup",
    "color": Colors.red,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.venusMars,
    "title": "Women's World Cup",
    "color": Colors.pink,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.futbol,
    "title": "Ballon d'Or",
    "color": const Color.fromARGB(255, 255, 215, 0),
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.personRunning,
    "title": "Golden Boot",
    "color": Colors.orange,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.rightLeft,
    "title": "Transfers",
    "color": Colors.lightGreen,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.userNinja,
    "title": "Legendary Players",
    "color": Colors.deepPurple,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.calendarDays,
    "title": "Iconic Matches",
    "color": Colors.brown,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.mapLocationDot,
    "title": "Stadiums & Venues",
    "color": Colors.teal,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.clockRotateLeft,
    "title": "Historical Moments",
    "color": Colors.blueGrey,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.userShield,
    "title": "Goalkeepers",
    "color": Colors.lightBlue,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.shieldHalved,
    "title": "Defenders",
    "color": Colors.deepOrange,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.handshakeAngle,
    "title": "Midfielders",
    "color": Colors.green,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.personRunning,
    "title": "Forwards",
    "color": Colors.red,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.userTie,
    "title": "Managers & Coaches",
    "color": Colors.indigo,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.recordVinyl,
    "title": "Football Records",
    "color": Colors.yellow,
    "league": ""
  },
  {
    "icon": FontAwesomeIcons.shield,
    "title": "BRI Liga 1",
    "color": Colors.blue,
    "league": ""
  },
];
