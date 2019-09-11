//
//  ImageTableViewCell.swift
//  SDWebImage-WebP-bug
//
//  Created by Kenneth Krzeminski on 9/10/19.
//  Copyright © 2019 krze. All rights reserved.
//

import SDWebImage
import UIKit

final class ImageTableViewCell: UITableViewCell {
    
    static let identifier = "ImageTableViewCell"
    private var sdImageView: SDAnimatedImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        let imageView = SDAnimatedImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        // Make the image view a square
        let squareSize = UIScreen.main.bounds.size.width
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: squareSize),
            imageView.heightAnchor.constraint(equalToConstant: squareSize)
            ])
        
        self.sdImageView = imageView
    }
    
    func setup(with url: URL) {
        sdImageView?.sd_setImage(with: url, completed: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
