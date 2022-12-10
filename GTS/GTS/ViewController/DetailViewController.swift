//
//  DetailViewController.swift
//  GTS
//
//  Created by Khirish Meshram on 10/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userAge: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userJoinedDate: UILabel!
    @IBOutlet weak var userDob: UILabel!
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userState: UILabel!
    @IBOutlet weak var userCountry: UILabel!
    @IBOutlet weak var userPostcode: UILabel!
    @IBOutlet weak var ageView: UIView!
    
    var item: UserResults?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            userImg.downloaded(from: item.picture.large)
            userAge.text = String(item.dob.age)
            userEmail.text = "Email: \(item.email)"
            userCity.text = "city: \"\(item.location.city)\""+","
            userState.text = "state: \"\(item.location.state)\""+","
            userCountry.text = "country: \"\(item.location.country)\""+","
            
            switch item.location.postcode {
            case .integer(let val):
                userPostcode.text = "postcode: \"\(String(val))\""+","
            case .string(let val):
                userPostcode.text = "postcode: \"\(val)\""+","
            }
            configureVC(item)
        }
    }
    
    func configureVC(_ item: UserResults) {
        ageView.rotate(degrees: 45)
        userAge.rotate(degrees: -45)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dobDate = dateFormatter.date(from: item.dob.date)!
        let joinDate = dateFormatter.date(from: item.registered.date)!
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "dd MMM yyyy"
        userDob.text = "DOB: \(newDateFormater.string(from: dobDate))"
        userJoinedDate.text = "Date Joined: \(newDateFormater.string(from: joinDate))"
    }
    


}

extension UIView {
    func rotate(degrees: CGFloat) {
        rotate(radians: CGFloat.pi * degrees / 180.0)
    }

    func rotate(radians: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}
