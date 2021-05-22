//
//  PlaceDetailPhotoCollectionViewCodeViewCell.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 27/04/21.
//

import UIKit
import SDWebImage

class PlaceDetailPhotoCollectionViewCodeViewCell: UICollectionViewCell {

    static let reusableIdentifier: String = "placeDetailPhotoCell"

    private lazy var roundedView: RoundedView = { return RoundedView(frame: .zero, cornerRadius: 10) }()
    private lazy var imageView: UIImageView = { return UIImageView(frame: .zero) }()
    
    var placeDetail: PlaceDetailViewModel?

    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        applyViewCode()
        configureViews()
    }
    
    func setImage(from urlString: String?) {
        if let imageUrl = urlString, let url = URL(string: imageUrl) {
            imageView.sd_setImage(with: url)
        }
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
        imageView.clipsToBounds = true
    }
}
