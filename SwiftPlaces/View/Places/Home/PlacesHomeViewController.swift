//
//  PlacesHomeViewController.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

class PlacesHomeViewController: UIViewController {
    
    var presenter: PlacesHomePresenter?
    
    @IBOutlet weak var placesCardsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var places: [Place] = []
    var photos: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator?.hidesWhenStopped = true
        self.setupCollectionView()
        self.presenter?.view = self
        self.presenter?.getPlaces()
        self.presenter?.getPhotos()
    }
    
    func addPlaces(_ places: [Place]) {
        self.places = places
        uploadDataWithPhotos()
    }
    
    func populateWithPhotos(_ photos: [Photo]) {
        self.photos = photos
        uploadDataWithPhotos()
    }
    
    func uploadDataWithPhotos() {
        self.addPhotoToPlaces()
        self.placesCardsCollectionView.reloadData()
    }
    
    func startLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.activityIndicator.stopAnimating()
    }
    
    private func addPhotoToPlaces() {
        guard places.count > 0, photos.count > 0 else { return }
        var placesWithImage: [Place] = []
        for (index, var place) in places.enumerated() {
            if index < photos.count {
                place.cardImageUrl = photos[index].src?.medium
                place.originalImageUrl = photos[index].src?.original
                placesWithImage.append(place)
            }
        }
        self.places = placesWithImage
    }
    
    private func setupCollectionView() {
        self.placesCardsCollectionView.delegate = self
        self.placesCardsCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell() {
        self.placesCardsCollectionView.register(UINib.init(nibName: "PlaceCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PlaceCardCollectionViewCell.reusableIdentifier)
    }

}

extension PlacesHomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.didGoToDetails(of: places[indexPath.row])
    }
}

extension PlacesHomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceCardCollectionViewCell.reusableIdentifier, for: indexPath) as? PlaceCardCollectionViewCell else { return UICollectionViewCell() }
                
        cell.setupCell(placeHolderColor: UIColor.getRandomPlaceholderColor(), image: "", place: places[indexPath.row])
        return cell
    }
}

extension PlacesHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenWidth =  UIScreen.main.bounds.width
        
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 24
        
        let cellWidth = (screenWidth - (numberOfItemsPerRow * spacingBetweenCells)) / numberOfItemsPerRow
        
        // let cellHeight = CGFloat.random(in: 136 ..< 214)
        
        return CGSize(width: cellWidth, height: 216)
    }
}

