//
//  NasaViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/25/24.
//

import UIKit

class NasaViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        serialAsync()
        print(#function)
        print("1")
        
        DispatchQueue.main.async {
            print("2")
        }
        
        print("3")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    // 프레임 사이즈, 컬렉션뷰 사이즈가 정해지는 시점이 여기임
    // viewdidload 말고 여기에 하면 됨
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
        
        // 🛒
        present(CustomTableViewController(), animated: true)
    }
    
    
    func serialSync() {
        
        print("start", terminator: " ") //  줄바꿈 없이
        
        for item in 1...100 {
            print(item, terminator: " ")
        }
        
        DispatchQueue.main.sync {
            for item in 101...200 {
                print(item, terminator: " ")
            }
        }
        
        print("end")
    }
    
    func serialAsync() {
        print("start", terminator: " ") //  줄바꿈 없이
        
        DispatchQueue.main.async {
            for item in 1...100 {
                print(item, terminator: " ")
            }
        }
        
        for item in 101...200 {
            print(item, terminator: " ")
        }
        
        print("end")
    }
    
    func concurrentSync() {
        print("start", terminator: " ") //  줄바꿈 없이
        
        DispatchQueue.global().sync {
            for item in 1...100 {
                print(item, terminator: " ")
            }
        }
        
        for item in 101...200 {
            print(item, terminator: " ")
        }
        
        print("end")
    }
    
    func concurrentAsync() {
        print("start", terminator: " ") //  줄바꿈 없이
        
//        DispatchQueue.global().async {
//            for item in 1...100 {
//                print(item, terminator: " ")
//            }
//        }
        
        for item in 1...100 {
            DispatchQueue.global().async {
                print(item, terminator: " ")
            }
        }
        
        for item in 101...200 {
            print(item, terminator: " ")
        }
        
        print("end")
    }
    
    func syncDownloadImage(_ imageView: UIImageView, value: String) {
        print("===1\(value)===")
        let url = Nasa.photo
        print("===2\(value)===")
        do {
            //UI Freezing
            print("===3\(value)===")
            let data = try Data(contentsOf: url)
            print("===4\(value)===")
            imageView.image = UIImage(data: data)
            print("===5\(value)===")
            
        } catch {
            print("===error1\(value)===")
            imageView.image = UIImage(systemName: "star.fill")
            print("===error2\(value)===")
        }
        print("===6\(value)===")
    }
    
    
    /*
     일단 global을 만나면, 다른 알바생에게 작업을 보내고 나머지를 실행한다.
     다만 다른 알바생한테 작업 보냈는데, 작업의 양이 다 다름. 누구는 빨리 끝나고 누구는 늦게 끝날 수 있음
     언제 끝나는지 정확한 시점은 알 수 없음!!
     🔥 UI관련된 작업은 항상 메인스레드에서 진행해야 한다! 🔥
     */
    func asyncDownloadImage(_ imageView: UIImageView, value: String) {
        print("===1\(value)===", Thread.isMainThread)
        let url = Nasa.photo
        print("===2\(value)===", Thread.isMainThread)
        
        DispatchQueue.global().async {
            do {
                //UI Freezing
                print("===3\(value)===", Thread.isMainThread)
                let data = try Data(contentsOf: url)
                print("===4\(value)===", Thread.isMainThread)
                
                DispatchQueue.main.async {
                    print("==\(value)=main-1==", Thread.isMainThread)
                    imageView.image = UIImage(data: data)
                    print("==\(value)=main-2==", Thread.isMainThread)
                }
                print("===5\(value)===", Thread.isMainThread)
                
            } catch {
                print("===error1\(value)===", Thread.isMainThread)
                imageView.image = UIImage(systemName: "star.fill")
                print("===error2\(value)===", Thread.isMainThread)
            }
        }
        
        print("===6\(value)===", Thread.isMainThread)
    }
    
    // MARK: 동기, 순서대로 실행,
    @IBAction func syncButtonTapped(_ sender: UIButton) {
        print("start")
        syncDownloadImage(firstImageView, value: "one")
        syncDownloadImage(secondImageView, value: "two")
        syncDownloadImage(thirdImageView, value: "three")
        syncDownloadImage(fourthImageView, value: "four")
        print("end")
    }
    
    // Async, Sync
    // Concurrent, Serial
    // 4가지 모두 구별해서 설명할 수 있어야 함!!
    @IBAction func asyncButtonTapped(_ sender: UIButton) {
        print("START")
        asyncDownloadImage(firstImageView, value: "one")
        asyncDownloadImage(secondImageView, value: "two")
        asyncDownloadImage(thirdImageView, value: "three")
        asyncDownloadImage(fourthImageView, value: "four")
        print("END")
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        
    }

}
