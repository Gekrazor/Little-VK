//
//  PhotosData.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 19.05.2022.
//

import UIKit

struct PhotoModel {
    let image: UIImage
    let description: String
    
    static func makePhotosArr() -> [PhotoModel] {
        var photoModel = [PhotoModel]()
        photoModel.append(PhotoModel(image: UIImage(named: "photo1")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo2")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo3")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo4")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo5")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo6")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo7")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo8")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo9")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo10")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo11")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo12")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo13")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo14")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo15")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo16")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo17")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo18")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo19")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo20")!, description: ""))
        photoModel.append(PhotoModel(image: UIImage(named: "photo21")!, description: ""))
        return photoModel
    }
}
