//
//  CustomCell.swift
//  UICollectionViewParallaxCellProject
//
//  Created by dave76 on 03/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit
import UICollectionViewParallaxCell

class CustomCell: UICollectionViewParallaxCell {
  
  var backgroundImage: UIImageView? {
    didSet {
      guard let imageView = backgroundImage else { return }
      imageView.contentMode = .scaleAspectFill
      setupbackgroundParallax(imageView: imageView, cornerRadius: 0, paddingOffset: paddingOffset, topConstraint: 0, bottomConstraint: 0, leadingConstraint: 0, trailingConstraint: 0)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
