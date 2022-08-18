import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Fact {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String id;
  @HiveField(1)
  @JsonKey(name: "__v")
  final int v;
  @HiveField(2)
  @JsonKey(name: "text")
  final String text;
  @HiveField(3)
  @JsonKey(name: "createdAt")
  final String createdDate;

  Fact({
    required this.id,
    required this.v,
    required this.text,
    required this.createdDate,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}

class FactAdapter extends TypeAdapter<Fact> {
  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.text);
    writer.writeString(obj.createdDate);
    writer.writeString(obj.id);
    writer.writeInt(obj.v);
  }

  @override
  Fact read(BinaryReader reader) {
    String text = reader.readString();
    String createdDate = reader.readString();
    String id = reader.readString();
    int v = reader.readInt();
    return Fact(id: id, text: text, createdDate: createdDate, v: v);
  }
}
