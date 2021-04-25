//
//  PlacesDetailsViewController.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

class PlacesDetailsViewController: UIViewController {
    
    var presenter: PlacesDetailsPresenter?
    var placeDetail: PlaceDetailViewModel?

    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var reviewScore: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var scheduleTimeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reviewView.backgroundColor = UIColor.topaz
        self.setup()
    }
    
    func setup() {
        self.placeNameLabel.text = placeDetail?.name
        self.reviewScore.text = placeDetail?.review
        self.aboutLabel.text = placeDetail?.about
        self.scheduleTimeLabel.text = placeDetail?.timeSchedule
        self.phoneLabel.text = placeDetail?.phoneNumber
        self.locationLabel.text = placeDetail?.location
    }
}
