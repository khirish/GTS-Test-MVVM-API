//
//  ListViewController.swift
//  GTS
//
//  Created by Khirish Meshram on 10/12/22.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var items: [UserResults] = []
    private var userResponseModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users List"
        userResponseModel.delegate = self
        userResponseModel.fetchUsersList()
        
    }
    
    

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        let item = items[indexPath.row]
        listCell.setupCell(item)
        listCell.selectionStyle = .none
        return listCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sc = UIStoryboard(name: "Main", bundle: nil)
        let detailVc = sc.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let item = items[indexPath.row]
        detailVc.navigationItem.title = "\(item.name.first) \(item.name.last)"
        detailVc.item = item
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    

}

extension ListViewController: UserListViewModelDelegate {
    func didReceiveUserList(userResponse: [UserResults]) {
        self.items = userResponse
        
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
    
}


