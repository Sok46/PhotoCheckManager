//
//  LabelTableViewCell.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    
    static let identifier = "LabelTableViewCell"

    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.backgroundColor = .white
        picture.image = #imageLiteral(resourceName: "zaglushka (1).png")
        picture.layer.cornerRadius = 40
        picture.contentMode = .scaleAspectFit
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()

    let txtPole: UILabel = {
       let txt = UILabel()
        txt.textColor = .black
        txt.layer.cornerRadius = 20
        txt.text = "default pole"
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.numberOfLines = 0
        return txt
    }()
    
    let backgroundLabel: UIView = {
        let background = UIView()
        background.layer.cornerRadius = 20
        background.backgroundColor = .white
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = .orange
        constraints()
        
        // Configure the view for the selected state
    }


   func textViewDidEndEditing(_ textView: UITextView) {
        let item = Item()
            item.name = txtPole.text!
        let text = txtPole.text
        print(text!)
        
        
    }
    

    

  
    func constraints(){
        contentView.addSubview(backgroundLabel)
        contentView.addSubview(txtPole)
        contentView.addSubview(picture)

        NSLayoutConstraint.activate([
            txtPole.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 15),
            txtPole.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            txtPole.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            txtPole.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            backgroundLabel.topAnchor.constraint(equalTo: picture.bottomAnchor,constant: 10),
            backgroundLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backgroundLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backgroundLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            
            picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            picture.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            picture.heightAnchor.constraint(equalToConstant: 75),
            picture.widthAnchor.constraint(equalToConstant: 150)
            
            
            
        
        ])
    }

}

