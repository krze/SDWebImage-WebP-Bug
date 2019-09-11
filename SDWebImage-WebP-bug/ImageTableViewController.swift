//
//  ImageTableViewController.swift
//  SDWebImage-WebP-bug
//
//  Created by Kenneth Krzeminski on 9/10/19.
//  Copyright © 2019 krze. All rights reserved.
//

import SDWebImage
import UIKit

final class ImageTableViewController: UITableViewController {
    private let count: Int
    private let imageURL: URL
    
    init(withImageCount imageCount: Int, url: URL, style: UITableView.Style) {
        count = imageCount
        imageURL = url
        super.init(style: style)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.rowHeight = 400
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell else {
            fatalError()
        }
        
        cell.setup(with: imageURL)
        return cell
    }
}
