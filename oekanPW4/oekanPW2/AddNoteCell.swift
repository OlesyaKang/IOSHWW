//
//  AddNoteCell.swift
//  oekanPW2
//
//  Created by Ольга on 25.11.2022.
//

import Foundation
import UIKit

final class AddNoteCell: UITableViewCell {
    static var reuseIdentifier = "AddNoteCell"
    private var textView = UITextView()
    public var addButton = UIButton()
    public var delegate: AddNoteDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    private func setupView() {
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .tertiaryLabel
        textView.backgroundColor = .clear
        textView.setHeight(140)
        
        addButton.setTitle("AddNewNote", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.backgroundColor = .black
        addButton.setHeight(44)
        addButton.layer.cornerRadius = 8
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        addButton.isEnabled = false
        addButton.alpha = 0.5
        
        let stackView = UIStackView(arrangedSubviews: [textView,addButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        
        contentView.addSubview(stackView)
        stackView.pinRight(to: contentView, 16)
        stackView.pinTop(to: contentView, 16)
        stackView.pinLeft(to: contentView, 16)
        stackView.pinBottom(to: contentView, 16)
        contentView.backgroundColor = .systemGray5
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        delegate?.newNoteAdded(note: ShortNote(text: textView.text))
        textView.text = ""
    }
}

extension AddNoteCell: UITextViewDelegate {}
