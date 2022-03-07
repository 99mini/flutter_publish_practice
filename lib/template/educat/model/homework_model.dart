class HomeworkModel {
  String? teacherName;
  String? homeworkName;
  String? img;
  HomeworkModel({
    this.teacherName,
    this.homeworkName,
    this.img,
  });
  HomeworkModel.fromJson(Map<String, dynamic> json) {
    teacherName = json['teacherName'];
    homeworkName = json['homeworkName'];
    img = json['img'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacherName'] = teacherName;
    data['homeworkName'] = homeworkName;
    data['img'] = img;
    return data;
  }
}
