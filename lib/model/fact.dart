import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "__v")
  final int v;
  @JsonKey(name: "text")
  final String text;

  @JsonKey(name: "createdAt")
  final String createdDate;

  Fact({required this.id, required this.v, required this.text, required this.createdDate,});

  // Fact( this.id,  this.v,  this.text);
   factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  // factory Fact.fromJson(Map<String, dynamic> json) {
  //  // print("------FromJson "+json.toString());
  //
  //
  //   print("------FromJson "+json['_id'].toString());
  //   print("------FromJson "+json['__v'].toString());
  //   print("------FromJson "+json['text'].toString());
  //   Fact f = Fact(
  //     id: json['_id'] as String,
  //     v: json['__v'] as int,
  //     text: json['text'] as String,
  //     createdDate: json['createdAt'] as String,
  //   );
  //
  //
  //   return f;
  // }

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
class FactAdapter extends TypeAdapter<Fact>{
  // @override
  // read(BinaryReader reader) {
  //   // TODO: implement read
  // }


  @override
  // TODO: implement typeId
  int get typeId =>0;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.text);
    writer.writeString(obj.createdDate);
    writer.writeString(obj.id);
    writer.writeInt(obj.v);
  }

  @override
  Fact read(BinaryReader reader) {
    String text=reader.readString();
    String createdDate=reader.readString();
    String id=reader.readString();
    int v=reader.readInt();
return Fact(id:id,text: text,createdDate: createdDate,v: v);
  }
}