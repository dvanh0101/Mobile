class Post {
  Id? iId;
  String? postsId;
  String? createBy;
  String? topic;
  List<String>? tags;
  String? title;
  String? content;
  String? motelID;
  List<String>? attachments;
  CreateAt? createAt;
  CreateAt? updateAt;
  Comments? comments;
  int? likes;
  int? views;
  int? shares;
  bool? isActive;

  Post(
      {this.iId,
        this.postsId,
        this.createBy,
        this.topic,
        this.tags,
        this.title,
        this.content,
        this.motelID,
        this.attachments,
        this.createAt,
        this.updateAt,
        this.comments,
        this.likes,
        this.views,
        this.shares,
        this.isActive});

  Post.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    postsId = json['Posts_id'];
    createBy = json['CreateBy'];
    topic = json['Topic'];
    tags = json['Tags'].cast<String>();
    title = json['Title'];
    content = json['Content'];
    motelID = json['MotelID'];
    attachments = json['Attachments'].cast<String>();
    createAt = json['CreateAt'] != null
        ? new CreateAt.fromJson(json['CreateAt'])
        : null;
    updateAt = json['UpdateAt'] != null
        ? new CreateAt.fromJson(json['UpdateAt'])
        : null;
    comments = json['Comments'] != null
        ? new Comments.fromJson(json['Comments'])
        : null;
    likes = json['Likes'];
    views = json['Views'];
    shares = json['Shares'];
    isActive = json['Is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['Posts_id'] = this.postsId;
    data['CreateBy'] = this.createBy;
    data['Topic'] = this.topic;
    data['Tags'] = this.tags;
    data['Title'] = this.title;
    data['Content'] = this.content;
    data['MotelID'] = this.motelID;
    data['Attachments'] = this.attachments;
    if (this.createAt != null) {
      data['CreateAt'] = this.createAt!.toJson();
    }
    if (this.updateAt != null) {
      data['UpdateAt'] = this.updateAt!.toJson();
    }
    if (this.comments != null) {
      data['Comments'] = this.comments!.toJson();
    }
    data['Likes'] = this.likes;
    data['Views'] = this.views;
    data['Shares'] = this.shares;
    data['Is_active'] = this.isActive;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class CreateAt {
  String? date;

  CreateAt({this.date});

  CreateAt.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}

class Comments {
  int? count;
  List<String>? list;

  Comments({this.count, this.list});

  Comments.fromJson(Map<String, dynamic> json) {
    count = json['Count'];
    list = json['List'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Count'] = this.count;
    data['List'] = this.list;
    return data;
  }
}
