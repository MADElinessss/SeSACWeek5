//
//  EndPoint.swift
//  SeSACWeek5
//
//  Created by Madeline on 1/25/24.
//

import Foundation

// EndPoint == 최종 도달할 링크
//enum Nasa: String, CaseIterable {
//    // 인스턴스 없음, 타입 프로퍼티 사용!
//    static let baseURL = "naver.com/"
//    
//    case cafe = "cafe"
//    case news = "news"
//    
////    URL(string: Nasa.baseURL + cafe)
//    
//    static var photo: URL {
//        return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
//    }
//}

enum Nasa: String, CaseIterable {
    
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
    
    static var photo: URL {
        // allCases: [one, two, three, ...] <- 배열 형태로
        return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
    }
}

