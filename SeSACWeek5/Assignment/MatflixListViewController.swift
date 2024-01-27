//
//  MatflixListViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/27/24.
//

import UIKit

class MatflixListViewController: UIViewController {
    
    let titleLabel = UILabel()
    let emptyTitle = UILabel()
    let emptySubTitle = UILabel()
    let exampleImage = UIImageView()
    let settingButton = UIButton()
    let viewContentsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureHierarchy()
        setConstraints()
    }
    
    func configureView() {
        
        view.backgroundColor = .black
        
        titleLabel.text = "저장한 콘텐츠 목록"
        titleLabel.textColor = .accent
        titleLabel.font = .systemFont(
            ofSize: 22,
            weight: .bold
        )
        
        emptyTitle.text = "'나만의 자동 저장' 기능"
        emptyTitle.textColor = .accent
        emptyTitle.font = .systemFont(
            ofSize: 20,
            weight: .bold
        )
        
        emptySubTitle.text = """
        취향에 맞는 영화의 시리즈를 자동으로 저장해 드립니다.
디바이스에 언제나 시펑할 콘텐츠가 준비되니 지루할 틈이
없어요.
"""
        emptySubTitle.numberOfLines = 0
        emptySubTitle.textAlignment = .center
        emptySubTitle.textColor = .lightGray
        emptySubTitle.font = .systemFont(
            ofSize: 14,
            weight: .medium
        )
        
        exampleImage.image = UIImage(named: "dummy")
        exampleImage.contentMode = .scaleAspectFit
        
        settingButton.backgroundColor = UIColor(
            named: "purpleButton"
        )
        settingButton.setTitle(
            "설정하기",
            for: .normal
        )
        settingButton.setTitleColor(
            .white,
            for: .normal
        )
        settingButton.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .bold
        )
        settingButton.clipsToBounds = true
        settingButton.layer.cornerRadius = 10
        
        viewContentsButton.backgroundColor = .white
        viewContentsButton.setTitle(
            "저장 가능한 콘텐츠 살펴보기",
            for: .normal
        )
        viewContentsButton.setTitleColor(
            .black,
            for: .normal
        )
        viewContentsButton.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .bold
        )
        viewContentsButton.clipsToBounds = true
        viewContentsButton.layer.cornerRadius = 10
    }
    
    func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(emptyTitle)
        view.addSubview(emptySubTitle)
        view.addSubview(exampleImage)
        view.addSubview(settingButton)
        view.addSubview(viewContentsButton)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(
                view.safeAreaLayoutGuide
            )
            make.centerX.equalTo(
                view
            )
        }
        
        emptyTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-100)
            make.centerX.equalTo(view)
        }
        
        emptySubTitle.snp.makeConstraints { make in
            make.top.equalTo(emptyTitle.snp.bottom).inset(-20)
            make.centerX.equalTo(view)
        }
        
        exampleImage.snp.makeConstraints { make in
            make.top.equalTo(emptySubTitle.snp.bottom).inset(-8)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(exampleImage.snp.bottom).inset(-24)
            make.centerX.equalTo(view)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.height.equalTo(44)
        }
        
        viewContentsButton.snp.makeConstraints { make in
            make.top.equalTo(settingButton.snp.bottom).inset(-20)
            make.centerX.equalTo(view)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.height.equalTo(38)
        }
    }
    
}

#Preview {
    MatflixListViewController()
}
