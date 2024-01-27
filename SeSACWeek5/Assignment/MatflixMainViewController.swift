//
//  MatflixMainViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/26/24.
//

import SnapKit
import UIKit

class MatflixMainViewController: UIViewController {
    
    let titleLabel = UILabel()
    let mainImage = UIImageView()
    let keywordLabel = UILabel()
    let playButton = UIButton()
    let addButton = UIButton()
    let hotLabel = UILabel()
    let movie1ImageView = UIImageView()
    let movie2ImageView = UIImageView()
    let movie3ImageView = UIImageView()
    
    let width = UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureHierarchy()
        setupConstraints()

    }
    
    func configureView() {
        view.backgroundColor = UIColor(named: "background")
        titleLabel.text = "고래밥님"
        titleLabel.textColor = .accent
        titleLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        
        mainImage.image = UIImage(named: "명량")
        mainImage.contentMode = .scaleToFill
        mainImage.clipsToBounds = true
        mainImage.layer.cornerRadius = 20
        
        keywordLabel.text = "응원하고픈 · 흥미진진 · 사극 · 전추 · 한국 작품"
        keywordLabel.font = .systemFont(ofSize: 14, weight: .medium)
        keywordLabel.textColor = .accent
        
        playButton.setTitle("재생", for: .normal)
        playButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        playButton.setTitleColor(.black, for: .normal)
        playButton.backgroundColor = .accent
        playButton.layer.cornerRadius = 5
        playButton.setImage(UIImage(named: "play"), for: .normal)
        
        addButton.setTitle("내가 찜한 리스트", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        addButton.setTitleColor(.accent, for: .normal)
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 5
//        addButton.setImage(UIImage(named: "play"), for: .normal)
        
        hotLabel.text = "지금 뜨는 콘텐츠"
        hotLabel.textColor = .accent
        hotLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        movie1ImageView.image = UIImage(named: "아바타")
        movie1ImageView.contentMode = .scaleToFill
        movie1ImageView.clipsToBounds = true
        movie1ImageView.layer.cornerRadius = 20
        
        movie2ImageView.image = UIImage(named: "알라딘")
        movie2ImageView.contentMode = .scaleToFill
        movie2ImageView.clipsToBounds = true
        movie2ImageView.layer.cornerRadius = 20
        
        movie3ImageView.image = UIImage(named: "도둑들")
        movie3ImageView.contentMode = .scaleToFill
        movie3ImageView.clipsToBounds = true
        movie3ImageView.layer.cornerRadius = 20
    }
    
    func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(mainImage)
        view.addSubview(keywordLabel)
        view.addSubview(playButton)
        view.addSubview(addButton)
        view.addSubview(hotLabel)
        view.addSubview(movie1ImageView)
        view.addSubview(movie2ImageView)
        view.addSubview(movie3ImageView)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(500)
        }
        
        keywordLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainImage.snp.bottom).inset(80)
            make.centerX.equalTo(view)
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(mainImage.snp.bottom).inset(24)
            make.trailing.equalTo(-40)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(mainImage.snp.bottom).inset(24)
            make.leading.equalTo(40)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        hotLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).inset(16)
            make.top.equalTo(mainImage.snp.bottom).inset(-16)
        }
        
        let imageWidth = (width - 60) / 3
        
        movie1ImageView.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.top.equalTo(hotLabel.snp.bottom).inset(-8)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageWidth * 1.5)
        }
        
        movie2ImageView.snp.makeConstraints { make in
            make.leading.equalTo(movie1ImageView.snp.trailing).inset(-8)
            make.top.equalTo(hotLabel.snp.bottom).inset(-8)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageWidth * 1.5)
        }
        
        movie3ImageView.snp.makeConstraints { make in
            make.leading.equalTo(movie2ImageView.snp.trailing).inset(-8)
            make.trailing.equalTo(-24)
            make.top.equalTo(hotLabel.snp.bottom).inset(-8)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageWidth * 1.5)
        }
    }

}

#Preview {
    MatflixMainViewController()
}
