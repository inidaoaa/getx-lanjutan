import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/kategori_model.dart';
import '../../../utils/api.dart';

class KategoriController extends GetxController {
  var kategoriList = <Data>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/kategori';

  @override
  void onInit() {
    fecthKategories();
    super.onInit();
  }

  void fecthKategories() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var kategori = Kategori.fromJson(jsonResponse);
        kategoriList.value = kategori.data!;
      } else {
        Get.snackbar("Error", "Failed to fecth kategories");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fecth kategories: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addKategori(Data newKategori) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newKategori.toJson()),
      );
      if (response.statusCode == 201) {
        fecthKategories();
        Get.back();
        Get.snackbar("Success", "Category Added Successfully");
      } else {
        Get.snackbar("Error", "Failed to add category");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add category: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateKategori(int id, Data updatedKategori) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedKategori.toJson()),
      );
      if (response.statusCode == 200) {
        fecthKategories();
        Get.back();
        Get.snackbar("Success", "Category Updated Successfully");
      } else {
        Get.snackbar("Error", "Failed to update category");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update category: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteKategori(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
      );
      if (response.statusCode == 200) {
        fecthKategories();
        Get.snackbar("Success", "Category Deleted Successfully");
      } else {
        Get.snackbar("Error", "Failed to delete category");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete category: $e");
    } finally {
      isLoading(false);
    }
  }
}
