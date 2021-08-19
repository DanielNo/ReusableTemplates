//
//  SupplementaryCollectionReusableView.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/19/21.
//

import UIKit

class SupplementaryCollectionReusableView: UICollectionReusableView {
    var textLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    static var identifier = "supplementaryViewIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textLabel)
        let cons = [
            textLabel.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            textLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            textLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            textLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(cons)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
