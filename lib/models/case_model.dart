class CaseModel {
  List<CaseData>? data;
  Links? links;
  Meta? meta;

  CaseModel({this.data, this.links, this.meta});

  CaseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CaseData>[];
      json['data'].forEach((v) {
        data!.add(new CaseData.fromJson(v));
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

class CaseData {
  int? id;
  int? caseCategoryId;
  String? title;
  String? shortDesc;
  String? thumbnail;
  int? totalLikes;
  int? totalComments;
  String? status;
  int? imageId;
  List<String>? imageList;
  List<Questions>? questions;
  bool? isLike;
  bool? isBookmark;
  User? user;
  List<CaseValues>? caseValues;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CaseData(
      {this.id,
        this.caseCategoryId,
        this.title,
        this.shortDesc,
        this.thumbnail,
        this.totalLikes,
        this.totalComments,
        this.status,
        this.imageId,
        this.imageList,
        this.questions,
        this.isLike,
        this.isBookmark,
        this.user,
        this.caseValues,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  CaseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseCategoryId = json['case_category_id'];
    title = json['title'];
    shortDesc = json['short_desc'];
    thumbnail = json['thumbnail'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    status = json['status'];
    imageId = json['image_id'];
    imageList = json['imageList'].cast<String>();
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    isLike = json['is_like'];
    isBookmark = json['is_bookmark'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['case_values'] != null) {
      caseValues = <CaseValues>[];
      json['case_values'].forEach((v) {
        caseValues!.add(new CaseValues.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['case_category_id'] = this.caseCategoryId;
    data['title'] = this.title;
    data['short_desc'] = this.shortDesc;
    data['thumbnail'] = this.thumbnail;
    data['total_likes'] = this.totalLikes;
    data['total_comments'] = this.totalComments;
    data['status'] = this.status;
    data['image_id'] = this.imageId;
    data['imageList'] = this.imageList;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    data['is_like'] = this.isLike;
    data['is_bookmark'] = this.isBookmark;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.caseValues != null) {
      data['case_values'] = this.caseValues!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Questions {
  String? answer;
  String? question;
  int? viewOrder;

  Questions({this.answer, this.question, this.viewOrder});

  Questions.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    question = json['question'];
    viewOrder = json['view_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['question'] = this.question;
    data['view_order'] = this.viewOrder;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? userType;
  String? profilePic;

  User({this.id, this.name, this.userType, this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userType = json['user_type'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_type'] = this.userType;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}

class CaseValues {
  int? id;
  int? casesId;
  Null? title;
  String? value;
  int? order;
  Null? imageList;
  Null? imageId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  CaseValues(
      {this.id,
        this.casesId,
        this.title,
        this.value,
        this.order,
        this.imageList,
        this.imageId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  CaseValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    casesId = json['cases_id'];
    title = json['title'];
    value = json['value'];
    order = json['order'];
    imageList = json['image_list'];
    imageId = json['image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cases_id'] = this.casesId;
    data['title'] = this.title;
    data['value'] = this.value;
    data['order'] = this.order;
    data['image_list'] = this.imageList;
    data['image_id'] = this.imageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

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


