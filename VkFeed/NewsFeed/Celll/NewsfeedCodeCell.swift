//
//  NewsfeedCodeCell.swift
//  VkFeed
//
//  Created by Ivan0v42 on 16.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

final class NewsfeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCodeCell"
    
    //первый слой
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false // разрешает компилятору закреплять View на экране
        return view
    }()
    
    //второй слой
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       // view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.postLabelFont
        //label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let galleryCollectionView = GalleryCollectionView()
    
    let postImageView: WebImageView = {
        let imageView = WebImageView()
        //imageView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
       // view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    // Третий слой
    
    let iconImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Constants.topViewHeight / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let dateLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = UIFont.systemFont(ofSize: 12)
          label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
          return label
      }()
    
    // Третий слой на bottomView
    
    let likesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sharesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Четвертый слой на bottomView
    
    let likesImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "like")
        return imageView
    }()
    
    let commentsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "comment")
        return imageView
    }()
    
    let sharesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "share")
        return imageView
    }()
    
    let viewsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "eye")
        return imageView
    }()
    
    let likesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let sharesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cardView)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //cardView constraints
        
        overlayFirstLayer()
        overlaySecondLayer()
        overlayThirdLayerOnTopView()
        overlayThirdLayerOnBottomView()
        overlayFourthLayerOnBottomViewViews()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: FeedCeelViewModel){
          iconImageView.set(imageURL: viewModel.iconUrlString)
             nameLabel.text = viewModel.name
             dateLabel.text = viewModel.date
             postLabel.text = viewModel.text
             likesLabel.text = viewModel.likes
             commentsLabel.text = viewModel.comments
             sharesLabel.text = viewModel.shares
             viewsLabel.text = viewModel.views
             postLabel.frame = viewModel.sizes.postLabelFrame
             bottomView.frame = viewModel.sizes.bottomViewFrame
             
        if let photoAttachment = viewModel.photoAttachments.first, viewModel.photoAttachments.count == 1 {
                 postImageView.isHidden = false
                 galleryCollectionView.isHidden = true
                 postImageView.set(imageURL: photoAttachment.photoUrlString)
                 postImageView.frame = viewModel.sizes.attachmentFrame
        } else if viewModel.photoAttachments.count > 1 {
                 postImageView.isHidden = true
                 galleryCollectionView.isHidden = false
                 galleryCollectionView.frame = viewModel.sizes.attachmentFrame
                 galleryCollectionView.set(photos: viewModel.photoAttachments)
             }
             else {
                 postImageView.isHidden = true
                 galleryCollectionView.isHidden = true
             }
    }
    
    
    
    private func overlayFirstLayer() {
        
        addSubview(cardView)
        
        //cardview constraints
        
        cardView.fillSuperview(padding: Constants.cardInsets)
    }
    
    
    private func overlaySecondLayer() {
    
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(galleryCollectionView)
        cardView.addSubview(bottomView)
          
          // constraints
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
      }
    
    private func overlayThirdLayerOnTopView(){
        
        topView.addSubview(iconImageView)
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        
        // iconImageView constraints
        iconImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        // nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.topViewHeight / 2 - 2).isActive = true
        
        // dateLabel constraints
        dateLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
    }
    
    private func overlayThirdLayerOnBottomView() {
           bottomView.addSubview(likesView)
           bottomView.addSubview(commentsView)
           bottomView.addSubview(sharesView)
           bottomView.addSubview(viewsView)
           
           // likesView constraints
           likesView.anchor(top: bottomView.topAnchor,
                            leading: bottomView.leadingAnchor,
                            bottom: nil,
                            trailing: nil,
                            size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
           
           // commentsView constraints
           commentsView.anchor(top: bottomView.topAnchor,
                            leading: likesView.trailingAnchor,
                            bottom: nil,
                            trailing: nil,
                            size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
           
           // sharesView constraints
           sharesView.anchor(top: bottomView.topAnchor,
                               leading: commentsView.trailingAnchor,
                               bottom: nil,
                               trailing: nil,
                               size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
           
           // viewsView constraints
           viewsView.anchor(top: bottomView.topAnchor,
                             leading: nil,
                             bottom: nil,
                             trailing: bottomView.trailingAnchor,
                             size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
       }
    
    private func overlayFourthLayerOnBottomViewViews() {
         likesView.addSubview(likesImage)
         likesView.addSubview(likesLabel)
         
         commentsView.addSubview(commentsImage)
         commentsView.addSubview(commentsLabel)
         
         sharesView.addSubview(sharesImage)
         sharesView.addSubview(sharesLabel)
         
         viewsView.addSubview(viewsImage)
         viewsView.addSubview(viewsLabel)
         
         helpInFourthLayer(view: likesView, imageView: likesImage, label: likesLabel)
         helpInFourthLayer(view: commentsView, imageView: commentsImage, label: commentsLabel)
         helpInFourthLayer(view: sharesView, imageView: sharesImage, label: sharesLabel)
         helpInFourthLayer(view: viewsView, imageView: viewsImage, label: viewsLabel)
     }
    
    private func helpInFourthLayer(view: UIView, imageView: UIImageView, label: UILabel) {
          
          // imageView constraints
          imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
          imageView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewsIconSize).isActive = true
          imageView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewsIconSize).isActive = true
          
          // label constraints
          label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4).isActive = true
          label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      }
   
    
}

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = .scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true

   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
   self.image = anyImage
  }
}
