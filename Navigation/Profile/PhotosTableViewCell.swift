//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 12/8/22.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire = "PhotosTableViewCell"
    
    lazy var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(systemName: "arrow.right")
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    lazy var stackImage: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fillEqually
            stack.spacing = 8
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
    lazy var image1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    lazy var image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    lazy var image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "3")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    lazy var image4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "4")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(photoLabel)
        contentView.addSubview(arrow)
        contentView.addSubview(stackImage)
        stackImage.addArrangedSubview(image1)
        stackImage.addArrangedSubview(image2)
        stackImage.addArrangedSubview(image3)
        stackImage.addArrangedSubview(image4)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrow.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            stackImage.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            stackImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            stackImage.heightAnchor.constraint(equalToConstant: (contentView.frame.width - 24) / 4)
        ])
    }
    
}
