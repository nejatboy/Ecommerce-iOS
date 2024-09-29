//
//  StorageService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 29.09.2024.
//

import FirebaseStorage


struct StorageService: Service {
    
    static let instance = StorageService()
    private let storage = Storage.storage()
    
    
    private init() { }
    
    
    /// Storage'a fotoğraf yüklemek için kullanırız
    ///
    /// - Parameters:
    ///   - image: Yüklemek istenen resim.
    ///   - completion: Yüklenen fotoğrafın url adresini döner.
    func upload(image: inout UIImage, completion: Callback<String>?) {
        let maxSize = CGSize(width: 960.0, height: 960.0)
        
        if image.size.width > maxSize.width {
            image = resizeImage(image: image, targetSize: maxSize) ?? image
        }
        
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            show(message: "Resizing error.", type: .error)
            return
        }
        
        let imageName = UUID().uuidString + ".jpg"
        let ref = storage.reference().child(imageName)
        
        ref.putData(data, metadata: nil) { metadata, error in
            if let error = error {
                self.show(message: error.localizedDescription, type: .error)
                return
            }
            
            ref.downloadURL { url, error in
                if let url = url {
                    completion?(url.absoluteString)
                    return
                }
                
                self.show(message: error?.localizedDescription, type: .error)
            }
        }
    }
    
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio  = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let newSize: CGSize = widthRatio > heightRatio
        ? CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        : CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

