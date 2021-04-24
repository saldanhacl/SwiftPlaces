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
    let places = ["Nome", "do", "lugar", "aqui"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
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
        self.presenter?.didGoToDetails()
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
        
        cell.setupCell(placeName: places[indexPath.row])
        return cell
    }
}

extension PlacesHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenWidth =  UIScreen.main.bounds.width
        
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 24
        
        let cellWidth = (screenWidth - (numberOfItemsPerRow * spacingBetweenCells)) / numberOfItemsPerRow
        
        let cellHeight = CGFloat.random(in: 136 ..< 214)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

