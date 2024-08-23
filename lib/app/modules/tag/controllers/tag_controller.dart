import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/tag_model.dart';
import '../../../utils/api.dart';

class TagController extends GetxController {
  var tagList = <Data>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/tag';

  @override
  void onInit() {
    fecthTages();
    super.onInit();
  }

  void fecthTages() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var tag = Tag.fromJson(jsonResponse);
        tagList.value = tag.data!;
      } else {
        Get.snackbar("Error", "Failed to fecth tages");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fecth tages: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTag(Data newTag) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newTag.toJson()),
      );
      if (response.statusCode == 201) {
        fecthTages();
        Get.back();
        Get.snackbar("Success", "Tag Added Successfully");
      } else {
        Get.snackbar("Error", "Failed to add tages");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add tag: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateTag(int id, Data updatedTag) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedTag.toJson()),
      );
      if (response.statusCode == 200) {
        fecthTages();
        Get.back();
        Get.snackbar("Success", "Tag Updated Successfully");
      } else {
        Get.snackbar("Error", "Failed to update tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update tag: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteTag(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
      );
      if (response.statusCode == 200) {
        fecthTages();
        Get.snackbar("Success", "Tag Deleted Successfully");
      } else {
        Get.snackbar("Error", "Failed to delete tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete tag: $e");
    } finally {
      isLoading(false);
    }
  }
}
