//
//  ColorPaletteView.swift
//  oekanPW2
//
//  Created by Ольга on 02.11.2022.
//

import UIKit

final class ColorPaletteView: UIControl {
    private var stackView = UIStackView();
    private(set) var chosenColor = UIColor.systemGray6
    
    init() {
        super.init(frame: .zero)
        
        setupView();
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) had not been implemented")
    }
    
    public func getCurrentColor() -> UIColor {
        return chosenColor
    }
    
    private func setupView() {
        let redControl = subView(colorLabel: "R", value: chosenColor.rgba.red, tag: 0)
        let greenControl = subView(colorLabel: "G", value: chosenColor.rgba.green, tag: 1)
        let blueControl = subView(colorLabel: "B", value: chosenColor.rgba.blue, tag: 2)
        
        stackView = UIStackView(arrangedSubviews: [redControl, greenControl, blueControl])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        stackView.pinCenter(to: self)
        stackView.pinLeft(to: self.leadingAnchor)
        stackView.pinBottom(to: self.bottomAnchor)
    }
    @objc
    private func sliderMoved(slider: UISlider) {
        switch slider.tag {
        case 0:
            chosenColor = UIColor(
                red: CGFloat(slider.value),
                green: chosenColor.rgba.green,
                blue: chosenColor.rgba.blue,
                alpha: chosenColor.rgba.alpha
            )
        case 1:
            chosenColor = UIColor(
                red: chosenColor.rgba.red,
                green: CGFloat(slider.value),
                blue: chosenColor.rgba.blue,
                alpha: chosenColor.rgba.alpha
            )
        default:
            chosenColor = UIColor(
                red: chosenColor.rgba.red,
                green: chosenColor.rgba.green,
                blue: CGFloat(slider.value),
                alpha: chosenColor.rgba.alpha
            )
        }
        sendActions(for: .touchDragInside)
    }
    
    private func subView(colorLabel: String, value: CGFloat, tag: Int) -> UIStackView {
        let slider = UISlider()
        let label = UILabel()
        let subStackView = UIStackView(arrangedSubviews: [label, slider])
        subStackView.addSubview(label)
        subStackView.addSubview(slider)
        subStackView.spacing = 20
        subStackView.axis = .horizontal
        label.text = colorLabel
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.pinLeft(to: subStackView.leadingAnchor, 15)
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = Float(value)
        slider.tag = tag
        slider.addTarget(self, action: #selector(sliderMoved), for: .touchDragInside)
        return subStackView
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
