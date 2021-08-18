//
//  ImageTableViewCell.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/18/21.
//
// TableViewCell Programmatically with full sized UIImageView

import UIKit

class ImageTableViewCell: UITableViewCell,UITextViewDelegate {
    static let reuseID = "imageViewCell"
    let mainImageView : UIImageView
    weak var textViewHandlerDelegate : TextViewCellHandler?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        mainImageView = UIImageView(frame: .zero)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.mainImageView)
        self.applyConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyConstraints(){
        let constraints = [
            mainImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            mainImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
