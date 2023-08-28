class GenericModel {
  List<GenericData>? data;
  Links? links;
  Meta? meta;

  GenericModel({this.data, this.links, this.meta});

  GenericModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GenericData>[];
      json['data'].forEach((v) {
        data!.add(new GenericData.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class GenericData {
  int? id;
  String? name;
  String? precaution;
  String? indication;
  String? contraIndication;
  String? sideEffect;
  String? modeOfAction;
  String? interaction;
  String? pregnancyCategoryNote;
  String? adultDose;
  String? childDose;
  String? renalDose;
  String? administration;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Therapeutics>? therapeutics;

  GenericData(
      {this.id,
        this.name,
        this.precaution,
        this.indication,
        this.contraIndication,
        this.sideEffect,
        this.modeOfAction,
        this.interaction,
        this.pregnancyCategoryNote,
        this.adultDose,
        this.childDose,
        this.renalDose,
        this.administration,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.therapeutics});

  GenericData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    precaution = json['precaution'];
    indication = json['indication'];
    contraIndication = json['contra_indication'];
    sideEffect = json['side_effect'];
    modeOfAction = json['mode_of_action'];
    interaction = json['interaction'];
    pregnancyCategoryNote = json['pregnancy_category_note'];
    adultDose = json['adult_dose'];
    childDose = json['child_dose'];
    renalDose = json['renal_dose'];
    administration = json['administration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['therapeutics'] != null) {
      therapeutics = <Therapeutics>[];
      json['therapeutics'].forEach((v) {
        therapeutics!.add(new Therapeutics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['precaution'] = this.precaution;
    data['indication'] = this.indication;
    data['contra_indication'] = this.contraIndication;
    data['side_effect'] = this.sideEffect;
    data['mode_of_action'] = this.modeOfAction;
    data['interaction'] = this.interaction;
    data['pregnancy_category_note'] = this.pregnancyCategoryNote;
    data['adult_dose'] = this.adultDose;
    data['child_dose'] = this.childDose;
    data['renal_dose'] = this.renalDose;
    data['administration'] = this.administration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.therapeutics != null) {
      data['therapeutics'] = this.therapeutics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Therapeutics {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Therapeutics(
      {this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Therapeutics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

// class Links {
//   String? url;
//   String? label;
//   bool? active;
//
//   Links({this.url, this.label, this.active});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }
