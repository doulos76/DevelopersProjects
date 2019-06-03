//
//  ViewController.swift
//  UICollectionViewParallaxCellProject
//
//  Created by dave76 on 03/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let imageGallery = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6", "pic7", "pic8", "pic9", "pic10"]
  
  let cellId = "cellId"
  
  lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
    collectionView.delegate = self
    collectionView.dataSource = self
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupCollectionView()
  }
}

// MARK:- UI/UX methods

extension ViewController {
  func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.backgroundColor = .white
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let cells = collectionView.visibleCells as! [CustomCell]
    let bounds = collectionView.bounds
    for cell in cells {
      cell.parallaxOffset(collectionViewBounds: bounds, scrollDirecton: .vertical)
    }
  }
}

// MARK:- UICollectionView methods

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageGallery.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
    cell.paddingOffset = 150 // declares the offset intensity of parallax
    let image = UIImage(named: imageGallery[indexPath.item])
    let imageView = UIImageView(image: image)
    cell.backgroundImage = imageView
    let bounds = collectionView.bounds
    cell.parallaxOffset(collectionViewBounds: bounds, scrollDirecton: .vertical)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.frame.width
    let height = view.frame.height / 2
    return .init(width: width, height: height)
  }
  
}
