import 'package:pokeapi/dao/common.dart';

class PokemonColor {
  int id;
  String name;
  List<Names> names;
  List<CommonResult> pokemonSpecies;

  PokemonColor({this.id, this.name, this.names, this.pokemonSpecies});

  PokemonColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = new List<CommonResult>();
      json['pokemon_species'].forEach((v) {
        pokemonSpecies.add(new CommonResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] =
          this.pokemonSpecies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Names {
  String name;
  CommonResult language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new CommonResult.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}
