//
//  PlaceDetailPhotoCollectionViewCodeViewCell.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 27/04/21.
//

import UIKit
import SDWebImage

class PlaceDetailPhotoCollectionViewCodeViewCell: UICollectionViewCell {

    private lazy var roundedView: RoundedView = { return RoundedView(frame: .zero) }()
    private lazy var imageView: UIImageView = { return UIImageView(frame: .zero) }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configureViews()
    }
}

extension PlaceDetailPhotoCollectionViewCodeViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        contentView.addSubview(roundedView)
        roundedView.addSubview(imageView)
    }
    
    func setupConstraints() {
        roundedView.setConstraints([.fillSuperView], toView: contentView)
        imageView.setConstraints([.fillSuperView], toView: roundedView)
    }
    
    func configureViews() {
        roundedView.backgroundColor = .topaz
        imageView.image = UIImage(named: "starOn")
    }
}
