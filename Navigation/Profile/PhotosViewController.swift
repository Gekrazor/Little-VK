//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 17.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var photoArr: [PhotoModel] = {
        let arr = PhotoModel.makePhotosArr()
        return arr
    }()
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        return collection
    }()
    
    private lazy var hiddenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0
        view.frame.size.height = UIScreen.main.bounds.height
        view.frame.size.width = UIScreen.main.bounds.width
        view.center = CGPoint(x: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2), y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 2))
        return view
    }()
    
    private lazy var hiddenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.opacity = 0
        button.setImage(UIImage(named: "pip.exit"), for: .normal)
        button.addTarget(self, action: #selector(tapExitAction), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tapExitAction() {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.hiddenView.layer.opacity = 0
            self.selectedImageView.layer.opacity = 0
        } completion: { _ in
            self.hiddenButton.layer.opacity = 0
        }
    }
    
    private lazy var selectedImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.opacity = 0
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.backgroundColor = .black
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        layout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func viewSetup() {
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.isHidden = false
        title = "Photo Gallery"
    }
    
    private func layout() {
        [photoCollectionView, hiddenView, selectedImageView, hiddenButton].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // photoCollectionView
            photoCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // selectedImageView
            selectedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selectedImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            selectedImageView.heightAnchor.constraint(equalTo: selectedImageView.widthAnchor, multiplier: 1),
            
            // hiddenButton
            hiddenButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            hiddenButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        cell.cellSetup(photoArr[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var  sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.hiddenView.layer.opacity = 0.7
            self.selectedImageView.image = self.photoArr[indexPath.row].image
            self.selectedImageView.layer.opacity = 1
        } completion: { _ in
            UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                self.hiddenButton.layer.opacity = 1
            }
        }
    }
}
