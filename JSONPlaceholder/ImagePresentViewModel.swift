//
//  ImagePresentViewModel.swift
//  JSONPlaceholder
//
//  Created by nier on 2021/2/20.
//

import Foundation
import Alamofire

class ImagePresentViewModel: NSObject {
    
    private var data: [JSONPlaceholderPhoto]! {
        didSet {
            self.ImagePresentViewModeltoViewController(self.data)
        }
    }
    
    var ImagePresentViewModeltoViewController: (([JSONPlaceholderPhoto]) -> ()) = { _ in } 
    
    override init() {
        super.init()
        self.fetchData()
    }
    
    func fetchData() {
        let api = JSONPlaceholderApi.photos.api
        
        Session.default.request(api)
            .responseDecodable(of: [JSONPlaceholderPhoto].self) { (res) in
                if let data = res.value {
                    self.data = data
                }
            }
    }
}
