import 'package:stars_live/models/follower_model.dart';

class UserModel {
  String? status;
  List<Data>? data;
  String? msg;

  UserModel({
    this.status,
    this.data,
    this.msg,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;

    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? name;
  String? email;
  dynamic phone;
  dynamic salary;
  dynamic shiftTransferredUsd;
  String? balanceInCoins;
  dynamic diamonds;
  dynamic totalReceivedGifts;
  String? isOnline;
  String? isLive;
  String? image;
  String? followed;
  Types? types;
  LevelHost? levelHost;
  LevelHost? levelUser;
  dynamic apiToken;
  List<Follower>? followers;
  List<Follower>? followeds;

  Data(
      {this.id,
      this.type,
      this.name,
      this.email,
      this.phone,
      this.salary,
      this.shiftTransferredUsd,
      this.balanceInCoins,
      this.diamonds,
      this.totalReceivedGifts,
      this.isOnline,
      this.isLive,
      this.image,
      this.followed,
      this.levelHost,
      this.levelUser,
      this.apiToken,
      this.types,
      this.followers,
      this.followeds});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    salary = json['salary'];
    shiftTransferredUsd = json['shift_transferred_usd'];
    balanceInCoins = json['balance_in_coins'].toString();
    diamonds = json['diamonds'];
    totalReceivedGifts = json['total_received_gifts'];
    isOnline = json['is_online'];
    isLive = json['is_live'];
    image = json['image'];
    followed = json['followed'];
    levelHost = json['level_host'] != null
        ? new LevelHost.fromJson(json['level_host'])
        : null;
    levelUser = json['level_user'] != null
        ? new LevelHost.fromJson(json['level_user'])
        : null;

    types = json['types'] != null
        ? new Types.fromJson(json['types'])
        : null;
    apiToken = json['api_token'];

    if (json['followers'] != null) {
      followers = <Follower>[];
      json['followers'].forEach((v) {
        followers!.add(Follower.fromJson(v));
      });
    }
    if (json['followeds'] != null) {
      followeds = <Follower>[];
      json['followeds'].forEach((v) {
        followeds!.add(Follower.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['salary'] = this.salary;
    data['shift_transferred_usd'] = this.shiftTransferredUsd;
    data['balance_in_coins'] = this.balanceInCoins;
    data['diamonds'] = this.diamonds;
    data['total_received_gifts'] = this.totalReceivedGifts;
    data['is_online'] = this.isOnline;
    data['is_live'] = this.isLive;
    data['image'] = this.image;
    data['followed'] = this.followed;
    if (this.levelHost != null) {
      data['level_host'] = this.levelHost!.toJson();
    }

    if (this.types != null) {
      data['types'] = this.types!.toJson();
    }

    if (this.levelUser != null) {
      data['level_user'] = this.levelUser!.toJson();
    }
    data['api_token'] = this.apiToken;
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    if (this.followeds != null) {
      data['followeds'] = this.followeds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LevelHost {
  dynamic level;
  dynamic previous;
  dynamic current;
  dynamic next;
  dynamic remaining;
  dynamic value;

  LevelHost(
      {this.level,
      this.previous,
      this.current,
      this.next,
      this.remaining,
      this.value});

  LevelHost.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    previous = json['previous'];
    current = json['current'];
    next = json['next'];
    remaining = json['remaining'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['previous'] = this.previous;
    data['current'] = this.current;
    data['next'] = this.next;
    data['remaining'] = this.remaining;
    data['value'] = this.value;
    return data;
  }
}

class Types {
  bool? normal;
  bool? broadcaster;
  bool? agent;
  bool? forwarder;
  bool? management;

  Types(
      {this.normal,
        this.broadcaster,
        this.agent,
        this.forwarder,
        this.management});

  Types.fromJson(Map<String, dynamic> json) {
    normal = json['normal'];
    broadcaster = json['broadcaster'];
    agent = json['agent'];
    forwarder = json['forwarder'];
    management = json['management'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['normal'] = this.normal;
    data['broadcaster'] = this.broadcaster;
    data['agent'] = this.agent;
    data['forwarder'] = this.forwarder;
    data['management'] = this.management;
    return data;
  }
}
