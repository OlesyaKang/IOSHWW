//
//  NoteCell.swift
//  oekanPW2
//
//  Created by Ольга on 25.11.2022.
//

import Foundation
import UIKit

final class NoteCell: UITableViewCell {
    static let reuseIdentifier = "NoteCell"
    private var txtLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupView()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        txtLabel.font = .systemFont(ofSize: 16, weight: .regular)
        txtLabel.textColor = .label
        txtLabel.numberOfLines = 0
        txtLabel.backgroundColor = .clear
        
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(txtLabel)
        txtLabel.pinLeft(to: contentView, 16)
        txtLabel.pinTop(to: contentView, 16)
        txtLabel.pinRight(to: contentView, 16)
        txtLabel.pinBottom(to: contentView, 16)
    }
    
    public func configure(_ note: ShortNote) {
        txtLabel.text = note.text
    }
}
