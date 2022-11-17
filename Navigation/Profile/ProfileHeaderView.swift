//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 11/15/22.
//

import UIKit

class ProfileHeaderView: UIView {
    private func getLabel() -> UILabel {
        let labelFrame = CGRect(x: 160, y: 127, width: 200, height: 20)
        let label = UILabel(frame: labelFrame)
        label.text = "Дмитрий Горбунов"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }
    
    private func getAvatar() -> UIImageView {
        let imageFrame = CGRect(x: 16, y: 116, width: 130, height: 130)
        let image = UIImage(named: "Man_with_bowler_hat_and_overcoat_generated")
        let imageView = UIImageView(image: image)
        imageView.frame = imageFrame
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.frame = imageFrame
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return imageView
    }

    private func getStatusLabel() -> UILabel {
        let labelFrame = CGRect(x: 160, y: 224, width: 200, height: 14)
        let label = UILabel(frame: labelFrame)
        label.text = "Напишите что-нибудь"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }
    
    private func getShowStatusButton() -> UIButton {
        let buttonFrame = CGRect(x: 16, y: 272, width: 398, height: 50)
        let button = UIButton(frame: buttonFrame)
        button.layer.cornerRadius = 14
        // если я делаю cornerRadius = 4, как указано в макете, то выглядит совсем не так, как в макете
        button.backgroundColor = .blue
        button.setTitle("Показать статус", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
    @objc func buttonPressed() {
        print(getStatusLabel().text)
    }
    
    override init(frame: CGRect) {
        super.init (frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(getLabel())
        addSubview(getAvatar())
        addSubview(getStatusLabel())
        addSubview(getShowStatusButton())
    }
}
