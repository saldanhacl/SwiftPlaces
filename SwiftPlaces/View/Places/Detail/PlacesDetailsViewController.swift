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
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var scheduleTimeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.backgroundColor = .clear
        self.pageImage.backgroundColor = UIColor.getRandomPlaceholderColor()
        tabBarController?.hidesBottomBarWhenPushed = true
        self.reviewView.backgroundColor = UIColor.topaz
        self.setup()
    }
    
    func setup() {
        if let urlString = placeDetail?.imageUrl, let url = URL(string: urlString) {
            self.pageImage.sd_setImage(with: url)
        }
        self.placeNameLabel.text = placeDetail?.name
        self.reviewScore.text = placeDetail?.review
        self.aboutLabel.text = placeDetail?.about
        self.scheduleTimeLabel.text = placeDetail?.timeSchedule
        self.phoneLabel.text = placeDetail?.phoneNumber
        self.locationLabel.text = placeDetail?.location
    }
    @IBAction func didTapToGoBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
