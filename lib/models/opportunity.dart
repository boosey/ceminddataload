import 'package:ceminddataload/util/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'opportunity.g.dart';

const opportunityIdxProject = 1;

@JsonSerializable()
class Opportunity {
  final String opportunityid;
  final String opportunityname;

  Opportunity(this.opportunityid, this.opportunityname);

  Map<String, dynamic> toJson() => _$OpportunityToJson(this);

  factory Opportunity.fromJson(Map<String, dynamic> json) =>
      _$OpportunityFromJson(json);

  factory Opportunity.fromJsonDataCells(List<dynamic> dataCells) {
    final String opportunityid = dataCells[opportunityIdxProject][value];
    final String opportunityname = dataCells[opportunityIdxProject][label];

    return Opportunity(
      opportunityid,
      opportunityname,
    );
  }
}
