//
//  CustomTableViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/26/24.
//

import UIKit

class CustomTableViewController: UIViewController {

    let testTextField = UITextField()
    let tableView = UITableView()
    
    let profileImage = UIImageView()
    
//    let collectionView = UICollectionView()
    // 컬렉션뷰 관려해서 뭐가 잘 안된다면 아래ㅐ처럼 해보세여
//    let collectionView = UICollectionView(frame: <#T##CGRect#>, collectionViewLayout: layout)
//    
//    func layout() -> UICollectionViewLayout {
//        let a = UICollectionViewFlowLayout()
//        a.itemSize
//        a.minimumLineSpacing
//        a.sectionInset
//        
//        collectionView.collectionViewLayout = a
//    }
    // 강의자료 참고할 것!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureHierarchy()
        setupConstraints()
    }
    
    func configureHierarchy() {
        view.addSubview(testTextField)
        view.addSubview(tableView)
        view.addSubview(profileImage)
    }

    func configureView() {
        view.backgroundColor = .white
        testTextField.borderStyle = .none
        testTextField.placeholder = "제목 쓰셈"
        testTextField.backgroundColor = .orange
        testTextField.textAlignment = .center
        testTextField.font = .boldSystemFont(ofSize: 15)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        /*
         delegate.self, self.Label: 클래스의 인스턴스를 의미함
         self.tableView <- 이 클래스에 있는 테이블뷰야
         근데 UITableViewCell.self: 리캡에서 네트워크 디코딩했을 때 모델 이름이 Shopping.self, Lotto.self
         => swift의 메타 타입(Meta Type) 
         */
        
        profileImage.backgroundColor = .black
        profileImage.image = UIImage(systemName: "pencil")
    }
    
    func setupConstraints() {
        testTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        profileImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(100)
        }
        
        tableView.snp.makeConstraints { make in
            // 뷰에 꽉차게
//            make.edges.equalToSuperview()
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(150)
        }
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.label.text = "CELL"
        cell.button.setTitle("Button", for: .normal)
        cell.button.tintColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
