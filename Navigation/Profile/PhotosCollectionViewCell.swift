//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 18.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.backgroundColor = .systemGray6
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetup(_ model: PhotoModel) {
        photoImageView.image = model.image
    }
    
    private func layout() {
        contentView.backgroundColor = .white
        contentView.contentMode = .scaleAspectFit
        contentView.clipsToBounds = true
        contentView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
