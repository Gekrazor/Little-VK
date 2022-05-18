//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 17.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var photoCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()
    
    private lazy var firstImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "photo1")
        return image
    }()
    
    private lazy var secondImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "photo2")
        return image
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "photo3")
        return image
    }()
    
    private lazy var fourthImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "photo4")
        return image
    }()
    
    private lazy var fakeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "photo.fill"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [whiteView, photoCellLabel, fakeButton, firstImageView, secondImageView, thirdImageView, fourthImageView].forEach { addSubview($0) }
        
        let smallInset: CGFloat = 8
        let bigInset: CGFloat = 12
        let sideInset: CGFloat = 90
        
        NSLayoutConstraint.activate([
            // whiteView
            whiteView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // photoCellLabel
            photoCellLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: bigInset),
            photoCellLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: bigInset),
            
            // pushButton
            fakeButton.centerYAnchor.constraint(equalTo: photoCellLabel.centerYAnchor),
            fakeButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -bigInset),
            
            // firstImageView
            firstImageView.topAnchor.constraint(equalTo: photoCellLabel.bottomAnchor, constant: bigInset),
            firstImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: bigInset),
            firstImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -bigInset),
            firstImageView.heightAnchor.constraint(equalToConstant: sideInset),
            firstImageView.widthAnchor.constraint(equalToConstant: sideInset),
            
            // secondImageView
            secondImageView.topAnchor.constraint(equalTo: photoCellLabel.bottomAnchor, constant: bigInset),
            secondImageView.leadingAnchor.constraint(equalTo: firstImageView.trailingAnchor, constant: smallInset),
            secondImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -bigInset),
            secondImageView.heightAnchor.constraint(equalToConstant: sideInset),
            secondImageView.widthAnchor.constraint(equalToConstant: sideInset),
            
            // thirdImageView
            thirdImageView.topAnchor.constraint(equalTo: photoCellLabel.bottomAnchor, constant: bigInset),
            thirdImageView.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor, constant: smallInset),
            thirdImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -bigInset),
            thirdImageView.heightAnchor.constraint(equalToConstant: sideInset),
            thirdImageView.widthAnchor.constraint(equalToConstant: sideInset),
            
            // fourthImageView
            fourthImageView.topAnchor.constraint(equalTo: photoCellLabel.bottomAnchor, constant: bigInset),
            fourthImageView.leadingAnchor.constraint(equalTo: thirdImageView.trailingAnchor, constant: smallInset),
            fourthImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -bigInset),
            fourthImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -bigInset),
            fourthImageView.heightAnchor.constraint(equalToConstant: sideInset),
            fourthImageView.widthAnchor.constraint(equalToConstant: sideInset),
        ])
    }
}
