//
//  PostModel.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 15.05.2022.
//

import UIKit

struct PostModel {
    let author: String
    let description: String
    let image: UIImage
    var likes: Int
    var views: Int
    
    static func makePostModel() -> [PostModel] {
        var model = [PostModel]()
        model.append(PostModel(author: "Guts Official", description: "Looking forward", image: UIImage(named: "lookingForwardGuts")!, likes: 0, views: 6000))
        model.append(PostModel(author: "Guts Official", description: "Forever alone", image: UIImage(named: "foreverAloneGuts")!, likes: 0, views: 1400))
        model.append(PostModel(author: "Guts Official", description: "My Smile", image: UIImage(named: "GutsSmiling")!, likes: 0, views: 759))
        model.append(PostModel(author: "Guts Official", description: "What about madness?", image: UIImage(named: "gutsMadness")!, likes: 0, views: 7329))
        return model
    }
}
