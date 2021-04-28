//
//  PlacesDetailsViewController.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit
import SDWebImage

class PlacesDetailsViewController: UIViewController {
    
    var presenter: PlacesDetailsPresenter?
    var placeDetail: PlaceDetailViewModel?

    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var reviewScore: UILabel!
    @IBOutlet weak var scheduleTimeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var aboutTextLabel: UILabel!
    
    @IBOutlet weak var photosLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!

    @IBOutlet weak var detailPhotosCollectionView: UICollectionView!
    
    var detailPhotos: [Photo] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupLabels()
        self.presenter?.view = self
        self.presenter?.getPlaceDetailImages()
        self.setupCollectionView()
    }
    
    private func setupLabels() {
        self.aboutLabel.text = "About".localized()
        self.photosLabel.text = "Photos".localized()
    }
    
    private func setupCollectionView() {
        self.detailPhotosCollectionView.dataSource = self
        self.detailPhotosCollectionView.delegate = self
        registerCell()
    }
    
    private func registerCell() {
        self.detailPhotosCollectionView.register(UINib.init(nibName: "PlaceDetailPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PlaceDetailPhotoCollectionViewCell.reusableIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.backgroundColor = .clear
        self.pageImage.backgroundColor = UIColor.getRandomPlaceholderColor()
        tabBarController?.hidesBottomBarWhenPushed = true
        self.reviewView.backgroundColor = UIColor.topaz
        self.setup()
    }
    
    func populateWithPhotos(_ photos: [Photo]) {
        self.detailPhotos = photos
        self.detailPhotosCollectionView.reloadData()
    }
    
    func setup() {
        if let urlString = placeDetail?.imageUrl, let url = URL(string: urlString) {
            self.pageImage.sd_setImage(with: url)
        }
        self.placeNameLabel.text = placeDetail?.name
        self.reviewScore.text = placeDetail?.review
        self.aboutTextLabel.text = placeDetail?.about
        self.scheduleTimeLabel.text = placeDetail?.timeSchedule
        self.phoneLabel.text = placeDetail?.phoneNumber
        self.locationLabel.text = placeDetail?.location
    }
}

extension PlacesDetailsViewController: UICollectionViewDataSource {
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

extension PlacesDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 60, height: 60)
    }
}
