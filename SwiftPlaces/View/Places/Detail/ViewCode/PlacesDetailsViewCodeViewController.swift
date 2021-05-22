//
//  PlacesDetailViewCodeViewController.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 22/05/21.
//

import UIKit
import Cosmos

class PlacesDetailsViewCodeViewController: UIViewController {
    
    // MARK: Controller Config
    var presenter: PlacesDetailsPresenter?
    var placeDetail: PlaceDetailViewModel?
    var detailPhotos: [Photo] = []
    
    // MARK: View Components
    private lazy var topImageView: UIImageView = { return UIImageView(frame: .zero) }()
    private lazy var ratingView: UIView = { return UIView(frame: .zero) }()
    private lazy var containerRatingView: UIView = { return UIView(frame: .zero) }()
    private lazy var placeTitleLabel: PageTitleWhite = { return PageTitleWhite(frame: .zero) }()
    private lazy var ratingStarsView: CosmosView = { return CosmosView(frame: .zero) }()
    private lazy var photosContainerView: UIView = { return UIView(frame: .zero) }()
    private lazy var photosTitleLabel: Title = { return Title(frame: .zero) }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let collectionViewFlow = UICollectionViewFlowLayout()
        collectionViewFlow.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlow)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "PlaceDetailPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PlaceDetailPhotoCollectionViewCell.reusableIdentifier)
        return collectionView
    }()
    

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pageConfig()
        configNavigationBar()
        applyViewCode()
        setupPresenter()
    }
    
    // MARK: Private methods
    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupPresenter() {
        presenter?.view = self
        presenter?.getPlaceDetailImages()
    }
    
    // MARK: Public methods
    func populateWithPhotos(_ photos: [Photo]) {
        detailPhotos = photos
        photosCollectionView.reloadData()
    }
}

extension PlacesDetailsViewCodeViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(topImageView)
        
        view.addSubview(ratingView)
        ratingView.addSubview(containerRatingView)
        ratingView.addSubview(placeTitleLabel)
        ratingView.addSubview(ratingStarsView)
        
        view.addSubview(photosContainerView)
        photosContainerView.addSubview(photosTitleLabel)
        photosContainerView.addSubview(photosCollectionView)
    }
    
    func setupConstraints() {
        topImageView.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing, .height(300)], toView: view)
        
        ratingView.setConstraints([.bondToLeading, .bondToTrailing, .height(100)], toView: view)
        ratingView.setConstraints([.marginFromAbove(0)], toView: topImageView)
        
        containerRatingView.setConstraints([.marginEqual(16)], toView: ratingView)
        placeTitleLabel.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing], toView: containerRatingView)
        ratingStarsView.setConstraints([.bondToLeading, .bondToBottom], toView: containerRatingView)
        ratingStarsView.setConstraints([.marginFromAbove(10)], toView: placeTitleLabel)
        
        photosContainerView.setConstraints([.marginFromLeading(26), .marginFromTrailing(26), .height(100)], toView: view)
        photosTitleLabel.setConstraints([.marginFromAbove(32)], toView: ratingView)
        photosTitleLabel.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing], toView: photosContainerView)
        photosCollectionView.setConstraints([.bondToLeading, .bondToBottom, .height(60)], toView: photosContainerView)
        photosCollectionView.setConstraints([.bondToTrailing], toView: view)
    }
    
    func configureViews() {
        if let urlString = placeDetail?.imageUrl, let url = URL(string: urlString) {
            self.topImageView.sd_setImage(with: url)
        }
        
        ratingView.backgroundColor = .topaz
        placeTitleLabel.text = placeDetail?.name
        
        var settings = CosmosSettings()
        settings.filledImage = UIImage(named: "starOn")
        settings.emptyImage = UIImage(named: "starOff")
        settings.textFont = RatingWhite().font
        settings.textColor = RatingWhite().textColor
        settings.textMargin = 10
        settings.updateOnTouch = false
        ratingStarsView.settings = settings
        ratingStarsView.text = placeDetail?.review
        ratingStarsView.rating = placeDetail?.reviewScore ?? 0
        
        photosTitleLabel.text = "Fotos".localized()
        photosCollectionView.backgroundColor = .clear
        photosCollectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDelegate & Data Source
extension PlacesDetailsViewCodeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailPhotos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceDetailPhotoCollectionViewCell.reusableIdentifier, for: indexPath) as? PlaceDetailPhotoCollectionViewCell else { return UICollectionViewCell() }

        cell.setImage(from: detailPhotos[indexPath.row].src?.medium)
        return cell
    }
}
