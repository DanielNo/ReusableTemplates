//
//  TextTableViewCell.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/18/21.
//
//  TableViewCell Programmatically with full sized UILabel

import UIKit

class TextTableViewCell: UITableViewCell {
    static let identifier = "textLabelTableViewCell"
    let contentLabel : UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        contentLabel = UILabel(frame: .zero)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentLabel.font = UIFont.systemFont(ofSize: 20)
        self.contentView.addSubview(self.contentLabel)
        self.applyConstraints()
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyConstraints(){
        let constraints = [
            contentLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            contentLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
