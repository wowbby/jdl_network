import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';


@JsonSerializable()
class TestModel{
  String name;
  String address;
  String phone;

  TestModel(this.name,this.address,this.phone);

  factory TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
