import 'dart:convert';
// create using quicktype.io
Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.civilizations,
    });

    List<Civilization> civilizations;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        civilizations: List<Civilization>.from(json["civilizations"].map((x) => Civilization.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "civilizations": List<dynamic>.from(civilizations.map((x) => x.toJson())),
    };
}

class Civilization {
    Civilization({
        this.id,
        this.name,
        this.expansion,
        this.armyType,
        this.uniqueUnit,
        this.uniqueTech,
        this.teamBonus,
        this.civilizationBonus,
    });

    int id;
    String name;
    Expansion expansion;
    String armyType;
    List<String> uniqueUnit;
    List<String> uniqueTech;
    String teamBonus;
    List<String> civilizationBonus;

    factory Civilization.fromJson(Map<String, dynamic> json) => Civilization(
        id: json["id"],
        name: json["name"],
        expansion: expansionValues.map[json["expansion"]],
        armyType: json["army_type"],
        uniqueUnit: List<String>.from(json["unique_unit"].map((x) => x)),
        uniqueTech: List<String>.from(json["unique_tech"].map((x) => x)),
        teamBonus: json["team_bonus"],
        civilizationBonus: List<String>.from(json["civilization_bonus"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "expansion": expansionValues.reverse[expansion],
        "army_type": armyType,
        "unique_unit": List<dynamic>.from(uniqueUnit.map((x) => x)),
        "unique_tech": List<dynamic>.from(uniqueTech.map((x) => x)),
        "team_bonus": teamBonus,
        "civilization_bonus": List<dynamic>.from(civilizationBonus.map((x) => x)),
    };
}

enum Expansion { THE_CONQUERORS, AGE_OF_KINGS, AFRICAN_KINGDOMS, RISE_OF_RAJAS, FORGOTTEN_EMPIRES }

final expansionValues = EnumValues({
    "African Kingdoms": Expansion.AFRICAN_KINGDOMS,
    "Age of Kings": Expansion.AGE_OF_KINGS,
    "Forgotten Empires": Expansion.FORGOTTEN_EMPIRES,
    "Rise of Rajas": Expansion.RISE_OF_RAJAS,
    "The Conquerors": Expansion.THE_CONQUERORS
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
