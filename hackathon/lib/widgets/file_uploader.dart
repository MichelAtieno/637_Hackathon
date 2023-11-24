// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:hackathon/widgets/show_dialog.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDF File Upload Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Call the function to pick a PDF file
              String? filePath = await pickPDFFile(context);
              if (filePath != null) {
                // Call the function to upload the PDF file
                await uploadPDFFile(context, filePath);
              }
            },
            child: const Text('Pick and Upload PDF File'),
          ),
        ),
      ),
    );
  }

  Future<String?> pickPDFFile(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first.path;
      } else {
        return null;
      }
    } catch (e) {
      String message = 'Error picking PDF file: $e';
      showAlertDialog(context, message, 'Error');
      return null;
    }
  }

  Future<void> uploadPDFFile(BuildContext context, String filePath) async {
    try {
      // Replace this with your server's upload endpoint
      String uploadUrl = 'https://example.com/upload';

      // Create a Dio instance
      Dio dio = Dio();

      // Create FormData
      FormData formData = FormData.fromMap({
        'pdf': await MultipartFile.fromFile(filePath, filename: 'pdf_file.pdf'),
      });

      // Send the request
      var response = await dio.post(uploadUrl, data: formData);

      // Check if the request was successful
      if (response.statusCode == 200) {
        String message = 'File uploaded successfully!';
        showAlertDialog(context, message, 'Success');
      } else {
        String message =
            'File upload failed with status: ${response.statusCode}';
        showAlertDialog(context, message, 'Error');
      }
    } catch (error) {
      String message = 'Error uploading file: $error';
      showAlertDialog(context, message, 'Error');
    }
  }
}
