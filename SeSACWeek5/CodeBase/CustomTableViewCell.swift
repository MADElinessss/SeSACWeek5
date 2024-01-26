//
//  CustomTableViewCell.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/26/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton()

    // Nib == Xib <- xib 짤때만 가능, 스토리보드 기반일때만 실행되는 메서드임
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    // init 치면됨
    // 스토리보드가 아니라, 코드로 구성할 때, 실행되는 초기화 구문
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(button)
        
        label.backgroundColor = .orange
        button.backgroundColor = .blue
        
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
