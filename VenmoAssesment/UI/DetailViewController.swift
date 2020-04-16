//
//  DetailViewController.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit
import SafariServices

final class DetailViewController: UIViewController {
    var result: AlbumResults?
    
    init(result: AlbumResults?) {
        super.init(nibName: nil, bundle: nil)
        self.result = result
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = getAlbumDetailsTitle()
        
        guard let result = result else { return }
        configureDetailView(from: result)
    }
    
    func getAlbumDetailsTitle() -> String {
        return "Album Details"
    }
    
    func configureDetailView(from result: AlbumResults) {
        let mainScrollView = configureScrollView()
        let mainStackView = configureMainStackView(scrollView: mainScrollView)
        let buttonStackView = createGoToAlbumButtonStackView()
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.safeAreaInsets.bottom)
        ])
        
        let albumImageView = UIImageView.updateAlbumImage(url: result.artworkUrl100, height: 400)
        let copyRightLabel = UILabel.createLabel(from: result.copyright, numberOfLines: 0)
        let albumNameLabel = createLabelStackView(from: Constants.album, subTitle: result.collectionName)
        
        
        mainStackView.addArrangedSubViews([
            albumImageView,
            createLabelStackView(from: Constants.artist, subTitle: result.artistName),
            createLabelStackView(from: Constants.song, subTitle: result.name),
            albumNameLabel,
            copyRightLabel
        ])
        
        mainStackView.setCustomSpacing(30, after: albumImageView)
        mainStackView.setCustomSpacing(30, after: albumNameLabel)
    }
    
    func configureScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.addConstaintsToSuperview()
        scrollView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        return scrollView
    }
    
    func configureMainStackView(scrollView: UIScrollView) -> UIStackView {
        let mainStackView = UIStackView.configureStackView()
        scrollView.addSubview(mainStackView)
        mainStackView.addConstaintsToSuperview(leadingOffset: 15, trailingOffset: 15, topOffset: 15, bottomOffset: 20)
        mainStackView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-30).isActive = true
        return mainStackView
    }
    
    func createLabelStackView(from title: String, subTitle: String) -> UIStackView {
        let stackView = UIStackView.configureStackView(spacing: 0, axis: .horizontal)
        stackView.addArrangedSubViews([
            UILabel.createLabel(from: title, enableBoldFont: true),
            UILabel.createLabel(from: subTitle),
            UIView()
        ])
        
        return stackView
    }
    
    func createGoToAlbumButtonStackView() -> UIStackView {
        let stackView = UIStackView.configureStackView(spacing: 0)
        
        let buttonView = UIView()
        buttonView.backgroundColor = .systemGroupedBackground
        let goToAlbumButton = createGoToAlbumButton()
        buttonView.addSubview(goToAlbumButton)
        
        goToAlbumButton.addConstaintsToSuperview(leadingOffset: 20,
                                                 trailingOffset: 20,
                                                 topOffset: 20,
                                                 bottomOffset: 20)
        
        stackView.addArrangedSubViews([
            createSinglePixel(),
            buttonView
        ])
        
        stackView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        
        return stackView
    }
    
    func createSinglePixel() -> UIView {
        let singlePixelView = UIView()
        singlePixelView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        singlePixelView.backgroundColor = .systemGray
        return singlePixelView
    }
    
    func createGoToAlbumButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(goToAlbumMusic), for: .touchUpInside)
        button.setTitle(Constants.goToAlbumButtonTitle, for: .normal)
        button.accessibilityIdentifier = Constants.goToAlbumButtonTitle
        button.setTitleColor(.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }
    
    @objc func goToAlbumMusic() {
        guard
            let urlString = self.result?.url,
            let url = URL(string: urlString) else { return }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}

private extension DetailViewController {
    enum Constants {
        static let album = "Album: "
        static let artist = "Artist: "
        static let song = "Song: "
        static let goToAlbumButtonTitle = "Go to Albums page"
    }
}


