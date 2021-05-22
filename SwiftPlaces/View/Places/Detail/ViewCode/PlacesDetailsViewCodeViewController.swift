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
    private lazy var contentViewSize = CGSize(
        width: self.view.frame.width, height: self.view.frame.height + 400 // TODO: Deixar de forma dinâmica
    )
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        print(self.view.frame.height)
        view.contentSize = contentViewSize
        view.frame = self.view.bounds
        view.autoresizingMask = .flexibleHeight
        view.bounces = true
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.frame.size = contentViewSize
        return view
    }()

    private lazy var topImageView: UIImageView = { return UIImageView(frame: .zero) }()
    
    private lazy var ratingView: UIView = { return UIView(frame: .zero) }()
    private lazy var containerRatingView: UIView = { return UIView(frame: .zero) }()
    private lazy var placeTitleLabel: PageTitleWhite = { return PageTitleWhite(frame: .zero) }()
    private lazy var ratingStarsView: CosmosView = { return CosmosView(frame: .zero) }()
    
    private lazy var contentContainer: UIView = { return UIView(frame: .zero) }()
    
    private lazy var photosContainerView: UIView = { return UIView(frame: .zero) }()
    private lazy var photosTitleLabel: Title = { return Title(frame: .zero) }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let collectionViewFlow = UICollectionViewFlowLayout()
        collectionViewFlow.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlow)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PlaceDetailPhotoCollectionViewCodeViewCell.self, forCellWithReuseIdentifier: PlaceDetailPhotoCollectionViewCodeViewCell.reusableIdentifier)
        return collectionView
    }()
    
    private lazy var aboutContainerView: UIView = { return UIView(frame: .zero) }()
    private lazy var aboutTitleLabel: Title = { return Title(frame: .zero) }()
    private lazy var aboutTextLabel: SecondBody = { return SecondBody(frame: .zero) }()

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(topImageView)
        
        contentView.addSubview(ratingView)
        ratingView.addSubview(containerRatingView)
        ratingView.addSubview(placeTitleLabel)
        ratingView.addSubview(ratingStarsView)
        
        contentView.addSubview(contentContainer)
        
        contentContainer.addSubview(photosContainerView)
        photosContainerView.addSubview(photosTitleLabel)
        photosContainerView.addSubview(photosCollectionView)
        
        contentContainer.addSubview(aboutContainerView)
        aboutContainerView.addSubview(aboutTitleLabel)
        aboutContainerView.addSubview(aboutTextLabel)
    }
    
    func setupConstraints() {
        topImageView.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing, .height(300)], toView: contentView)
        
        ratingView.setConstraints([.bondToLeading, .bondToTrailing], toView: contentView)
        ratingView.setConstraints([.marginFromAbove(0)], toView: topImageView)
        
        containerRatingView.setConstraints([.marginEqual(16)], toView: ratingView)
        placeTitleLabel.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing], toView: containerRatingView)
        ratingStarsView.setConstraints([.bondToLeading, .bondToBottom], toView: containerRatingView)
        ratingStarsView.setConstraints([.marginFromAbove(10)], toView: placeTitleLabel)
        
        contentContainer.setConstraints([.marginFromLeading(26), .marginFromTrailing(26), .marginFromBottom(32)], toView: contentView)
        contentContainer.setConstraints([.marginFromAbove(32)], toView: ratingView)

        photosContainerView.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing], toView: contentContainer)
        photosTitleLabel.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing], toView: photosContainerView)
        photosCollectionView.setConstraints([.marginFromAbove(16)], toView: photosTitleLabel)
        photosCollectionView.setConstraints([.bondToLeading, .bondToBottom, .height(60)], toView: photosContainerView)
        photosCollectionView.setConstraints([.bondToTrailing], toView: contentView)
        
        aboutContainerView.setConstraints([.bondToLeading, .bondToTrailing], toView: contentContainer)
        aboutContainerView.setConstraints([.marginFromAbove(32)], toView: photosContainerView)
        aboutTitleLabel.setConstraints([.bondToLeading, .bondToTop, .bondToTrailing], toView: aboutContainerView)
        aboutTextLabel.setConstraints([.marginFromAbove(16)], toView: aboutTitleLabel)
        aboutTextLabel.setConstraints([.bondToLeading, .bondToBottom, .bondToTrailing], toView: aboutContainerView)
    }
    
    func configureViews() {
        scrollView.showsVerticalScrollIndicator = false
        
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
        
        aboutTitleLabel.text = "Sobre".localized()
        aboutTextLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in quam velit. Phasellus lobortis gravida mauris sed ultrices. Nam fringilla laoreet massa at tincidunt. Nulla mauris ipsum, eleifend id massa convallis, aliquet sodales mauris. Aenean aliquet tempor odio eu aliquam. Maecenas posuere a nisi id ultrices. Nam nec sapien at tortor porta lobortis id et tellus. Fusce mollis aliquam dui, sed ullamcorper nisi imperdiet eget. Aenean aliquam augue eu erat molestie, at molestie magna ornare. Nunc venenatis eget massa ut pretium. Mauris mattis varius eros, vel congue lorem pharetra vitae. Nulla sed lacus eget erat bibendum rhoncus. Pellentesque vitae turpis efficitur, tristique ipsum a, maximus justo. Mauris in dolor vitae nibh dignissim sollicitudin et ac ipsum. Cras malesuada fermentum consectetur. Etiam in erat et nunc pulvinar varius sed non ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in quam velit. Phasellus lobortis gravida mauris sed ultrices. Nam fringilla laoreet massa at tincidunt. Nulla mauris ipsum, eleifend id massa convallis, aliquet sodales mauris. Aenean aliquet tempor odio eu aliquam. Maecenas posuere a nisi id ultrices. Nam nec sapien at tortor porta lobortis id et tellus. Fusce mollis aliquam dui, sed ullamcorper nisi imperdiet eget. Aenean aliquam augue eu erat molestie, at molestie magna ornare. Nunc venenatis eget massa ut pretium. Mauris mattis varius eros, vel congue lorem pharetra vitae. Nulla sed lacus eget erat bibendum rhoncus. Pellentesque vitae turpis efficitur, tristique ipsum a, maximus justo. Mauris in dolor vitae nibh dignissim sollicitudin et ac ipsum. Cras malesuada fermentum consectetur. Etiam in erat et nunc pulvinar varius sed non ligula."
        aboutTextLabel.numberOfLines = 0
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceDetailPhotoCollectionViewCodeViewCell.reusableIdentifier, for: indexPath) as? PlaceDetailPhotoCollectionViewCodeViewCell else { return UICollectionViewCell() }

        cell.setImage(from: detailPhotos[indexPath.row].src?.medium)
        return cell
    }
}
