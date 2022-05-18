//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 15.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var postDescriptionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var postLikesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var postViewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetup(_ model: PostModel) {
        postLabel.text = model.author
        postImageView.image = model.image
        postDescriptionTextLabel.text = model.description
        postLikesLabel.text = "Likes: \(model.likes)"
        postViewsLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
        [whiteView, postLabel, postImageView, postDescriptionTextLabel, postLikesLabel, postViewsLabel].forEach { contentView.addSubview($0) }
        
        let standartInset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            // whiteView
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // postLabel
            postLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: standartInset),
            postLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            postLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // postImageView
            postImageView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: standartInset),
            postImageView.widthAnchor.constraint(equalTo: whiteView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: whiteView.widthAnchor),
            
            // postDescriptionTextLabel
            postDescriptionTextLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: standartInset),
            postDescriptionTextLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            postDescriptionTextLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            
            // postLikesLabel
            postLikesLabel.topAnchor.constraint(equalTo: postDescriptionTextLabel.bottomAnchor, constant: standartInset),
            postLikesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            postLikesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset),
            
            // postViewsLabel
            postViewsLabel.topAnchor.constraint(equalTo: postDescriptionTextLabel.bottomAnchor, constant: standartInset),
            postViewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            postViewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset)
        ])
    }
}
