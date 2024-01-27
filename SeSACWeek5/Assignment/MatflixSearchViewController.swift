//
//  MatflixSearchViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/27/24.
//

import UIKit

class MatflixSearchViewController: UIViewController {
    
    let titleLabel = UILabel()
    let searchBar = UISearchBar()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let emptyTitle = UILabel()
    let emptySubTitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureHierarchy()
        setupConstraints()
        
    }
    
    func configureView() {
        view.backgroundColor = .black
        
        titleLabel.text = "NEW & HOT 검색"
        titleLabel.textColor = .accent
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        
        searchBar.searchTextField.backgroundColor = .darkGray
        searchBar.barTintColor = .clear
        searchBar
            .searchTextField
            .attributedPlaceholder = NSAttributedString(
                string: "게임, 시리즈, 영화를 검색하세요...",
                attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray]
            )
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        
        button1.setTitle("공개 예정", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button1.setImage(UIImage(named: "blue"), for: .normal)
        button1.backgroundColor = .white
        button1.clipsToBounds = true
        button1.layer.cornerRadius = 18
        
        button2.setTitle("모두의 인기 콘텐츠", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button2.setImage(UIImage(named: "turquoise"), for: .normal)
        button2.backgroundColor = .black
        button2.clipsToBounds = true
        button2.layer.cornerRadius = 15
        
        button3.setTitle("TOP 10 시리즈", for: .normal)
        button3.setTitleColor(.white, for: .normal)
        button3.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button3.setImage(UIImage(named: "pink"), for: .normal)
        button3.backgroundColor = .black
        button3.clipsToBounds = true
        button3.layer.cornerRadius = 15
        
        emptyTitle.text = "이런! 찾으시는 작품이 없습니다."
        emptyTitle.textColor = .accent
        emptyTitle.font = .systemFont(ofSize: 24, weight: .bold)
        
        emptySubTitle.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        emptySubTitle.textColor = .lightGray
        emptySubTitle.font = .systemFont(ofSize: 16, weight: .regular)
        
    }
    
    func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(emptyTitle)
        view.addSubview(emptySubTitle)
        
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        button1.snp.makeConstraints { make in
            
            make.top.equalTo(searchBar.snp.bottom).inset(-16)
            make.width.equalTo(100)
            make.height.equalTo(32)
        }
        
        button2.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).inset(-16)
            make.leading.equalTo(button1.snp.trailing).inset(-16)
            make.width.equalTo(130)
            make.height.equalTo(32)
        }
        
        button3.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).inset(-16)
            make.leading.equalTo(button2.snp.trailing).inset(-16)
            make.width.equalTo(130)
            make.height.equalTo(32)
        }
        
        emptyTitle.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        emptySubTitle.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(emptyTitle.snp.bottom).inset(-4)
        }
    }

}

#Preview {
    MatflixSearchViewController()
}
