//
//  UIPickerControllerPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/5/24.
//

import SwiftUI

struct UIPickerControllerPrac: View {
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")
    
    var body: some View {
        ZStack {
            VStack {
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    withAnimation {
                        self.imagePickerVisible.toggle()
                    }
                }) {
                    Text("Select an Image")
                }
            }//VStack
            .padding()
            if (imagePickerVisible) {
                MyImagePicker(imagePickerVisible: $imagePickerVisible,
                              selectedImage: $selectedImage)
            }
        }//ZStack
    }//body
}

#Preview {
    UIPickerControllerPrac()
}


struct MyImagePicker: UIViewControllerRepresentable {
    @Binding var imagePickerVisible: Bool
    @Binding var selectedImage: Image?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePickerVisible: $imagePickerVisible,
                           selectedImage: $selectedImage)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var imagePickerVisible: Bool
        @Binding var selectedImage: Image?
        
        init(imagePickerVisible: Binding<Bool>, selectedImage: Binding<Image?>) {
            _imagePickerVisible = imagePickerVisible
            _selectedImage = selectedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            selectedImage = Image(uiImage: uiImage)
            imagePickerVisible = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            imagePickerVisible = false
        }
    }
}
