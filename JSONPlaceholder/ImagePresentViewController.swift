//
//  ImagePresentViewController.swift
//  JSONPlaceholder
//
//  Created by nier on 2021/2/20.
//

import UIKit
import Alamofire
import AlamofireImage

class ImagePresentViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: ImagePresentViewModel = ImagePresentViewModel()
    
    private var photoData: [JSONPlaceholderPhoto] = []
    var images: [UIImage?] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        imageCollectionView.dataSource = self
        viewModel.ImagePresentViewModeltoViewController = updateView
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.itemSize = CGSize(width: self.view.frame.size.width / 4, height: self.view.frame.size.width / 4)
        
        imageCollectionView.collectionViewLayout = collectionViewLayout
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startFetchPhotoData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImagePresentViewController {
    
    func updateView(data: [JSONPlaceholderPhoto]) {
        finishFetchPhotoData()
        photoData = data
        imageCollectionView.reloadData()
    }
    
    func startFetchPhotoData() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func finishFetchPhotoData() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

extension ImagePresentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let photoInfo = photoData[indexPath.row]
        
        cell.layer.borderWidth = 1
        cell.idLabel.text = String(photoInfo.id)
        cell.titleLabel.text = photoInfo.title
        cell.backgroundImage.af.setImage(withURL: URL(string: photoInfo.thumbnailUrl)!)
        
        return cell
    }
}
