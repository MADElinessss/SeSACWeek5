//
//  ConstraintsViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/26/24.
//

import UIKit

/*
 NSLayoutConstraints
 - isActive
 NSLayoutAnchor
 */

class ConstraintsViewController: UIViewController {
    // 1. 뷰 객체 인스턴스 생성
    let nameTextField = UITextField()
    let okayButton = UIButton()
    let helpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // 2. 뷰 객체 -> rootView에 추가
        view.addSubview(nameTextField)
        view.addSubview(okayButton)
        view.addSubview(helpButton)
        
        //3. translatesAutoresizingMaskIntoConstraints 끄기
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        okayButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        // autoresizing이 기본으로 갖는 constraints 안쓰겠다!
        
        // 4. 디자인 및 속성
        nameTextField.backgroundColor = .yellow
        nameTextField.placeholder = "이름을 입력해주세요."
        okayButton.backgroundColor = .orange
        okayButton.setTitle("알았어여ㅛㅇ!!!!", for: .normal)
        okayButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        helpButton.setTitle("도와줘", for: .normal)
        helpButton.backgroundColor = .blue
        helpButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        // 5. 위치와 크기 => layout 잡기
        NSLayoutConstraint(
            item: nameTextField,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1,
            constant: 24
        ).isActive = true
        
        NSLayoutConstraint(
            item: nameTextField,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 24
        ).isActive = true
        
        NSLayoutConstraint(
            item: nameTextField,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant: -24 // 왼쪽으로 옮기는거면 -
        ).isActive = true
        
        NSLayoutConstraint(
            item: nameTextField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil, // 비교대상 없고 높이 고정시킬거임
            attribute: .height,
            multiplier: 1,
            constant: 50
        ).isActive = true
        
        let leading = NSLayoutConstraint(
            item: okayButton,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 24
        )
        
        let trailing = NSLayoutConstraint(
            item: okayButton,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant: -24
        )
        
        let top = NSLayoutConstraint(
            item: okayButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: nameTextField,
            attribute: .bottom,
            multiplier: 1,
            constant: 24
        )
        
        let height = NSLayoutConstraint(
            item: okayButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1,
            constant: 44
        )
        
        view.addConstraints([leading, trailing, height, top])
        
        // MARK: Anchor
        NSLayoutConstraint.activate([
            // 바탕 뷰의 x축과 맞추기
            helpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helpButton.widthAnchor.constraint(equalToConstant: 300),
            helpButton.heightAnchor.constraint(equalToConstant: 50),
            helpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
