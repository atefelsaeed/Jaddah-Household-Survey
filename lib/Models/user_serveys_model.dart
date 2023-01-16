class UserSurveysModel {
  bool? status;
  List<UserSurveysModelData>? data;

  UserSurveysModel({this.status, this.data});

  UserSurveysModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UserSurveysModelData>[];
      json['data'].forEach((v) {
        data!.add(UserSurveysModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserSurveysModelData {
  int? id;
  String? userId;
  String? hAENO;
  String? hAEName;
  String? qTANO;
  String? qTANAME;
  String? bLOKNO;
  String? pOINTX;
  String? pOINTY;
  String? createdAt;
  String? updatedAt;

  UserSurveysModelData({
    this.id,
    this.userId,
    this.hAENO,
    this.hAEName,
    this.qTANO,
    this.qTANAME,
    this.bLOKNO,
    this.pOINTX,
    this.pOINTY,
    this.createdAt,
    this.updatedAt,
  });

  UserSurveysModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    hAENO = json['HAE_NO'];
    hAEName = json['HAE_name'];
    qTANO = json['QTA_NO'];
    qTANAME = json['QTANAME'];
    bLOKNO = json['BLOKNO'];
    pOINTX = json['POINT_X'];
    pOINTY = json['POINT_Y'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['HAE_NO'] = hAENO;
    data['HAE_name'] = hAEName;
    data['QTA_NO'] = qTANO;
    data['QTANAME'] = qTANAME;
    data['BLOKNO'] = bLOKNO;
    data['POINT_X'] = pOINTX;
    data['POINT_Y'] = pOINTY;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
