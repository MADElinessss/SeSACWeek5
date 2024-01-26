//
//  CodeViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/25/24.
//

import UIKit

// MARK: How to make Code Based UI - FrameBased 편 🛒
// 1. 뷰 객체 프로퍼티 선언(클래스 인스턴스 생성) + addSubView
// 2. 크기와 위치 정의
// 3. 디자인 - 속성 설정
// 속성 관련 키워드
// AutoResizingMask, AutoLayout
// - 부모뷰에 따라 자식뷰의 크기 위치를 조정
// - AutoResizingMask 설정한 레이아웃들이 Constraints 형태로 반환
// - 이미 Constraints 설정된 상태이기 때문에, 이후에 제약 조건을 추가 수정하는 것이 불가능!
// NSLayoutConstraints
// - isActive
// - addConstraints
// NSLayoutAnchor

class CodeViewController: UIViewController {

    // 1. 상수로 선언 - 인스턴스 생성
    let emailTextField = UITextField()
    let redView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.🔥 순서대로 바닥에 쌓임
        view.addSubview(emailTextField)
        
        view.addSubview(blueView)
        view.addSubview(redView)
        blueView.addSubview(yellowView)
        
        // 2. -> frame based layout
        emailTextField.frame = CGRect(x: 50, y: 50, width: UIScreen.main.bounds.width - 100, height: 50)

        redView.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        blueView.frame = CGRect(x: 200, y: 200, width: 150, height: 150)
        yellowView.frame = CGRect(x: 10, y: 10, width: 200, height: 50) // 속해있는 뷰 기준!
        
        // 3.
        view.backgroundColor = .white
        
        emailTextField.backgroundColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.placeholder = "이메일을 입력해주세요."
        emailTextField.textColor = .white
        emailTextField.borderStyle = .none
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        yellowView.backgroundColor = .yellow
        
    }
}
