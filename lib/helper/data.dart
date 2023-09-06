// ignore_for_file: deprecated_member_use

import 'package:flutternews/models/category_model.dart';

List<CategoryModel> getCategories(){
  // ignore: prefer_collection_literals, unnecessary_new
  List <CategoryModel> category= <CategoryModel>[];
  CategoryModel categoryModel= new CategoryModel();

  categoryModel.categoryName= "Business";
  categoryModel.imageURL="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  categoryModel.categoryName= "Entertainment";
  categoryModel.imageURL="https://images.unsplash.com/photo-1606099670371-9826edc58751?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  categoryModel.categoryName= "General";
  categoryModel.imageURL="https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  categoryModel.categoryName= "Sports";
  categoryModel.imageURL="https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  categoryModel.categoryName= "Technology";
  categoryModel.imageURL="https://plus.unsplash.com/premium_photo-1661963212517-830bbb7d76fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1986&q=80";
  category.add(categoryModel);
  
  return category;


}