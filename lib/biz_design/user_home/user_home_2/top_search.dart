import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_age.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_annual_income.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_area.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_area_person.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_button.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_free_word.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_industry.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_industry_other.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_job.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/search_qualification.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/top_search_header.dart';
import 'package:flutter/material.dart';

class TopSearch extends StatefulWidget {
  const TopSearch({Key? key}) : super(key: key);

  @override
  State<TopSearch> createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopSearchHeader(),
                SearchJob(),
                SearchIndustry(),
                SearchArea(),
                SearchQualification(),
                SearchAnnualIncome(),
                SearchAge(),
                SearchIndustryOther(),
                SearchAreaPerson(),
                SearchFreeWord(),
                SearchButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
