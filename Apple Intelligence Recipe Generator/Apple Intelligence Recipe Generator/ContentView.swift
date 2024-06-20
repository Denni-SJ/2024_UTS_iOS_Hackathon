//
//  ContentView.swift
//  Apple Intelligence Recipe Generator
//
//  Created by Rod Datham on 20/6/2024.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var selectedItem: PhotosPickerItem?
    @State var image: UIImage?

    var body: some View {
        VStack {
            // Display the camera view by default
            AccessCameraView(selectedImage: self.$selectedImage)

            // Display the selected image from the photo library, if any
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            }

            // Display the selected image from the camera, if any
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            }

            // PhotosPicker button
            PhotosPicker("Select an image", selection: $selectedItem, matching: .images)
                           .onChange(of: selectedItem) { newItem in
                               if let newItem = newItem {
                                   Task {
                                       if let data = try? await newItem.loadTransferable(type: Data.self) {
                                           image = UIImage(data: data)
                                           selectedImage = nil // Clear selectedImage if a new image is picked from the gallery
                                           
                                       } else {
                                           print("Failed to load the image")
                                       }
                                   }
                               }
                           }
                   }
                   .padding()
    }
}

struct AccessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: AccessCameraView
    
    init(picker: AccessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            self.picker.selectedImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.picker.selectedImage = originalImage
        }
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

#Preview {
    ContentView()
}
