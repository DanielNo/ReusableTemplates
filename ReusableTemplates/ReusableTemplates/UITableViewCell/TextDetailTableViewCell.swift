//
//  TextDetailTableViewCell.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/18/21.
//

import UIKit

class TextDetailTableViewCell: UITableViewCell {
    static let identifier = "textDetailCell"
    
    var rightContentLabel : UILabel
    var leftContentLabel : UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        rightContentLabel = UILabel(frame: .zero)
        leftContentLabel = UILabel(frame: .zero)

        rightContentLabel.translatesAutoresizingMaskIntoConstraints = false
        leftContentLabel.translatesAutoresizingMaskIntoConstraints = false

        rightContentLabel.numberOfLines = 0
        leftContentLabel.numberOfLines = 0
        leftContentLabel.textAlignment = .center
        leftContentLabel.font = UIFont.systemFont(ofSize: 22)
        leftContentLabel.adjustsFontSizeToFitWidth = true

        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(rightContentLabel)
        self.contentView.addSubview(leftContentLabel)

        let marginGuide = contentView.layoutMarginsGuide
        let viewConstraints = [
            rightContentLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 0),
            rightContentLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 0),
            rightContentLabel.trailingAnchor.constraint(equalTo: leftContentLabel.leadingAnchor, constant: 0),
            rightContentLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 0),
            rightContentLabel.widthAnchor.constraint(equalTo: marginGuide.widthAnchor, multiplier: 0.70),
            
            leftContentLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
            leftContentLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 0),
            leftContentLabel.leadingAnchor.constraint(equalTo: rightContentLabel.trailingAnchor, constant: 0),
            leftContentLabel.widthAnchor.constraint(equalTo: marginGuide.widthAnchor, multiplier: 0.30)

        ]
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
