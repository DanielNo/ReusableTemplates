//
//  TextViewTableViewCell.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/18/21.
//
// TableViewCell Programmatically with full sized UITextView

import UIKit

internal protocol TextViewCellHandler : AnyObject{
    func textChanged(_ str : String)
}

class TextViewTableViewCell: UITableViewCell,UITextViewDelegate {
    static let identifier = "textViewCell"
    let textView : UITextView
    weak var textViewHandlerDelegate : TextViewCellHandler?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textView.contentInsetAdjustmentBehavior = .always
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.delegate = self
        textView.autocorrectionType = .no
        self.contentView.addSubview(self.textView)
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
            textView.widthAnchor.constraint(equalTo: self.widthAnchor),
            textView.heightAnchor.constraint(equalTo: self.heightAnchor),
            textView.topAnchor.constraint(equalTo: self.topAnchor),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let text = textView.text else{
            return
        }
        textViewHandlerDelegate?.textChanged(text)
//        print("ended editing : \(textView.text)")
    }
    func textViewDidChange(_ textView: UITextView) {
//        print("editing : \(textView.text)")
        guard let text = textView.text else{
            return
        }

        textViewHandlerDelegate?.textChanged(text)

    }


}
