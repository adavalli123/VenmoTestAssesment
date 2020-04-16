//
//  AlbumTableViewCell.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell {
    private (set) var albumImageView = UIImageView()
    private (set) var artistLabel = UILabel()
    private (set) var albumLabel = UILabel()
    private (set) var songLabel = UILabel()
    
    func configure(url: String, artist: String, song: String, album: String) {
        self.selectionStyle = .none
        albumImageView = UIImageView.updateAlbumImage(url: url, height: 100, width: 100)

        let mainStackView = addStackViewToSuperView()
        let childStackView = UIStackView.configureStackView()
        
        mainStackView.addArrangedSubViews([
            albumImageView,
            childStackView
        ])
        
        artistLabel = UILabel.createLabel(from: artist)
        albumLabel = UILabel.createLabel(from: album)
        songLabel = UILabel.createLabel(from: song)
        
        childStackView.addArrangedSubViews([
            artistLabel,
            songLabel,
            albumLabel,
            UIView()
        ])
    }
    
    func addStackViewToSuperView() -> UIStackView {
        let mainStackView = UIStackView.configureStackView(spacing: 15, axis: .horizontal)
        addSubview(mainStackView)
        mainStackView.addConstaintsToSuperview(leadingOffset: Constants.Constraints.stackView.leadingOffset,
                                           trailingOffset: Constants.Constraints.stackView.trailingOffset,
                                           topOffset: Constants.Constraints.stackView.topOffset,
                                           bottomOffset: Constants.Constraints.stackView.bottomOffset)
        
        return mainStackView
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        artistLabel.text = nil
        albumLabel.text = nil
        songLabel.text = nil
        imageView?.image = nil
    }
}

private extension AlbumTableViewCell {
    enum Constants {
        enum Constraints {
            static let stackView = (leadingOffset: CGFloat(15),
                                    trailingOffset: CGFloat(15),
                                    topOffset: CGFloat(15),
                                    bottomOffset: CGFloat(15))
        }
    }
}

