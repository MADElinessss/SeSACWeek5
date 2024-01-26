//
//  ViewController.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/23/24.
//

import CoreLocation
import MapKit
import UIKit

/*
 MARK: How to Use CoreLocation
 1. import CoreLocation
 2. CLLocationManager: 위치에 대한 대부분을 담당하는 매니저
 대부분의 프레임워크들은 매니저와 같은 중심부가 구현되어있음
 3. 위치 프로토콜 선언 - 머식이 Delegate
 4. 위치 프로토콜 - Delegate 연결
 5. didUpdateLocations: 사용자의 위치를 성공적으로 가져온 경우 실행됨!
 locations - 배열로 들어옴(무슨 해양,, 그런거까지 정보가 많음)
 6. didFailWithError: 실패했을 때에는 디폴트 위치 or 에러 메세지를 띄워야 함
 7. info.plist - 위치 권한 privacy 등록
 Privacy - Location When In Use Usage Description -> 앱 사용하는 동안 허용하겠다
 보통 얘를 디폴트로 사용함

 8. 권한 설정 - 사용자에게 권한 요청하기 위해 iOS 위치 서비스 활성화여부 체크
 9. 사용자 위치 권한 상캐 확인 후에 권한 요청fi
 */

class ViewController: UIViewController {

    @IBOutlet weak var nasaImageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        checkDeviceLocationAuthorization()
        
    }

    @IBAction func imageButtonClicked(_ sender: UIButton) {
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2401/SeagullToCalifornia_Symon_2000.jpg")!
        
        //String -> Data -> Struct
        //URL -> Data -> UIImage
        
        // 다른 알바생한테 일 시킴
        DispatchQueue.global().async {
            
            do {
                //UI Freezing
                let data = try Data(contentsOf: url)
                
                // 메인 알바생한테 시킴
                DispatchQueue.main.async {
                    self.nasaImageView.image = UIImage(data: data)
                    
                }
                
            } catch {
                self.nasaImageView.image = UIImage(systemName: "star.fill")
            }
            
        }
    }
}

extension ViewController {
    // 8. 위치 권한 언제 띄울지 정하기 - 사용자에게 권한 요청하기 위해 iOS 위치 서비스 활성화여부 체크
    // viewDidLoad, 버튼 액션, ...
    func checkDeviceLocationAuthorization() {
        // 위치권한 혀용여부 확인
        
        // 다른 알바생보고 일 시킴
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() { // <- 타입메서드로 정의되어있어서 인스턴스로 접근 안됨ㅠㅠ그래서 locationmanager. 이렇게 안씀
                
                // 현재 사용자의 권한 허용 상태
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                // ui 바뀌는거부터는 다시 메인한테 시켜야돼
                DispatchQueue.main.async {
                    print("현재 사용자의 authorization status: \(authorization)")
                    self.checkCurrentLocationAuthorization(authorization)
                }
                
            } else {
                print("위치 권한 허용 꺼져있음")
            }
        }
    }
    
    // 9. 사용자 위치 권한 상태 확인 후에 권한 요청하기
    func checkCurrentLocationAuthorization(_ status: CLAuthorizationStatus) {
        // 동의, 거부, 한번 허용, 미결정인지 확인한 후 -> 동의 했다면 위치정보 가져오고
        // 미결정이라면 권한 요청하고
        // 거부했었다면 허용해달라고 알럿을 띄우거나,,
        // 상태에 따라 다양한 경우를 처리해줘야됨
        
        switch status {
        case .notDetermined:
            // 권한 요청
            print("notDetermined")

            // 어느정도 정확한 위치정보 가져올지?
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // 우리가 info.plist에서 선언해놓은 애랑 같은애여야돼
            // 거기에는 always로 해놓고 여기다가 when in use로 하면 안떠
            locationManager.requestWhenInUseAuthorization()
            
        case .denied:
            // 허용해달라고 알럿을 띄워
            // 설정으로 이동해보자
            showLocationSettingAlert()
            print("denied")
        case .authorizedAlways:

            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            
            // 사용할때만 허용했다면,
            locationManager.startUpdatingLocation()

        default:
            print("나 제한이랑 옛날거 안쓸거야 -> 나머지 경우 차단")
        }
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정->개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            // 아이폰 설정으로 이동
            // 한번도 직접 설정->앱 설정페이지로 들어간적이 없다면,
            // 막 다운받은 앱이라 시스템적으로 상세페이지까지 정보가 없다면, 설정까지 가지 않을 수 있다.
            // 꼭 두세번해봐야 가지더라
            if let setting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(setting)
            } else {
                print("설정으로 가줘")
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func setRegionAndAnnotation(_ center: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
    }
}

extension ViewController: CLLocationManagerDelegate {
    // 사용자의 위치를 성공적으로 가져온 경우 실행됨!
    // 한번만 호출되는게 아니라 값이 변경될때마다 호출됨
    // 대략적으로 kCLLocationAccuracyLilometer - 킬로미터가 변경될때마다 호출됨
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            print(coordinate.latitude)
            print(coordinate.longitude)
            
            let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            setRegionAndAnnotation(center)
        }
        
        locationManager.stopUpdatingLocation()
    }
    // 실패했을 때에는 디폴트 위치 or 에러 메세지를 띄워야 함
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    // 사용자가 권한 상태가 바뀔 때를 알려줌 - iOS 14+
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // 거부했다가 설정에서 허용으로 바꾸거나, notDetermined에서 허용을 했거나, 허용해서 위치 갖고 오는 도중에 다시 설정에서 거부하거나,,
        // 경우의 수가 짱 많음
        
        checkDeviceLocationAuthorization() // 예외처리용 다시 검사
    }
    // ~ iOS 14 같은 기능임
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}

