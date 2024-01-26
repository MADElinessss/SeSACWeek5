//
//  SnapViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/26/24.
//

import SnapKit
import UIKit

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let blackView = UIView()
    let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        
        redView.snp.makeConstraints { make in
            // 1.
//            make.width.equalTo(200)
//            make.height.equalTo(200)
            // 2. 1번이랑 동일함
            make.width.height.equalTo(200)
            // 2번과 동일함
            make.size.equalTo(200)
            
            // 1.
//            make.centerX.equalTo(view)
//            make.centerY.equalTo(view)
            // 2. 1번과 동일함
            make.center.equalTo(view)
        }
        
        view.addSubview(blackView)
        blackView.backgroundColor = .black
        
        blackView.snp.makeConstraints { make in
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
            
//            make.height.greaterThanOrEqualTo(100)
//            make.height.lessThanOrEqualTo(50)
        }
        
        redView.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            // 네 가지 면 다 0으로 맞춤
//            make.horizontalEdges.equalTo(redView)
//            make.verticalEdges.equalTo(redView)
            // 한줄로 쓸 수 있찌
//            make.edges.equalTo(redView)
            // 같은말 <- redView.addSubview(blueView)
            make.edges.equalToSuperview().offset(-20)
//            make.edges.equalToSuperview().inset(20)
            make.left.equalTo(view.safeAreaLayoutGuide)
            /*
             leading vs left?
             뭐가 달라?
             
             우리가 구현할때는 차이가 없어. 우리는 왼->오지만 오->왼 글자들
             RTL : Right To Left
             */
        }
        
        
        
    }
    
}
