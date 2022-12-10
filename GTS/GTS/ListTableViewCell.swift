//
//  ListTableViewCell.swift
//  GTS
//
//  Created by Khirish Meshram on 10/12/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setupCell(_ user: UserResults) {
        userNameLbl.text = "\(user.name.first) \(user.name.last)"
        emailLbl.text = user.email
        countryLbl.text = "Country | \(user.location.country)"
        userImg.downloaded(from: user.picture.thumbnail)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dobDate = dateFormatter.date(from: user.registered.date)!
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "MMM dd yyyy"
        dateLbl.text = "\(newDateFormater.string(from: dobDate))"
    }

}
