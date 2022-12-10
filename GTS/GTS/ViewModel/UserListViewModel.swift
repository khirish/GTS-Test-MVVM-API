//
//  UserListViewModel.swift
//  GTS
//
//  Created by Khirish Meshram on 10/12/22.
//

import Foundation

protocol UserListViewModelDelegate {
    func didReceiveUserList(userResponse: [UserResults]);
}

struct UserListViewModel {
    
    var delegate: UserListViewModelDelegate?
    let userListApi = ApiEndpoints.userListsApi
    let httpManager = HttpManager()
    
    func fetchUsersList() {
    
        guard let userListUrl = URL(string: userListApi) else { return }
        
        httpManager.getUsersList(requestUrl: userListUrl) { userResponseData in
            delegate?.didReceiveUserList(userResponse: userResponseData)
        }
    }
    
    
}
