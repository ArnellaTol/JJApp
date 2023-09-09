//
//  DBjsonStruct.swift
//  JJApp
//
//  Created by Arnella Tolegen on 27.05.2023.
//

import Foundation
import SwiftUI


extension UIImage {
    var data: Data? {
        if let data = self.jpegData(compressionQuality: 1.0) {
            return data
        } else {
            return nil
        }
    }
}

extension Data {
    var image: UIImage? {
        if let image = UIImage(data: self) {
            return image
        } else {
            return nil
        }
    }
}



struct User: Codable{
    var last_login: String?
    var first_name: String
    var last_name: String
    var username: String
    var phone_number: String?
    var email: String?
    var status: String?
    var region: String
    var photo: String?
    var coins: Int?
    var organization: String
    var is_staff: Bool?
    
    func loadPhotoData(completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "http://34.22.215.91\(photo ?? "")") else {
                completion(nil)
                return
            }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image data: \(error)")
                completion(nil)
                return
            }
            
            completion(data)
        }
        
        task.resume()
    }

}



struct Staff: Codable{
    var last_login: String?
    var first_name: String
    var last_name: String
    var username: String
    var phone_number: String?
    var email: String?
    var region: String
    var photo: String?
    var organization: String
    var card: String?
    var cardholder_name: String? 
    
    func loadPhotoData(completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "http://34.22.215.91\(photo ?? "")") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image data: \(error)")
                completion(nil)
                return
            }
            
            completion(data)
        }
        
        task.resume()
    }
    
}

struct UserProfile: Codable{
    var user: User?
}

struct StaffProfile: Codable{
    var staff: Staff?
}

struct ResponseDataUser: Codable{
    var user: User?
}

struct ResponseDataStaff: Codable{
    var user: Staff?
}

struct Organization: Codable{
    var id: Int?
    var region: String?
    var title: String?
}

struct Reports: Codable{
    var id: Int?
    var title: String?
    var report: String?
    var photo: String?
    var action: String?
    var user_id: Int?
}

// ////////////////////////////////////////////////////////////////

struct ResponseDataSuccess: Codable{
    var success: ResponseData?
}

struct ResponseData: Codable{
    var message: String?
}

// ////////////////////////////////////////////////////////////////

struct Tokens: Codable{
    var access: String?
    var refresh: String?
    var is_staff: Bool?
}

// ////////////////////////////////////////////////////////////////

struct UserForList: Codable{
    var objects: [UserInfoList]?
    var pagination: UserPaginationList?
}

struct UserInfoList: Codable{
    var coins: Int?
    var first_name: String?
    var last_name: String?
    var rating: Int?
    var username: String?
    var id: Int?
}


struct UserPaginationList: Codable{
    var count: Int?
    var next: String?
    var previous: String?
}

// //////////////////////////////////////
// //////////////////////////////////////

struct ReportData: Codable {
    var title: String
    var report: Int
    var photo: Data
}

// //////////////////////////////////////

struct AllReportsData: Codable {
    let objects: [ObjectReportInList]
    let pagination: Pagination
}

struct ObjectReportInList: Codable {
    let approved: Bool?
    let date_upload: String
    let id: Int
    let title: String
}

struct Pagination: Codable {
    let count: Int
    let next: String?
    let previous: String?
}

// //////////////////////////////////////

struct ReportFull: Codable {
    let approved: Bool?
    let date_upload: String
    let id: Int
    let photo: String?
    let report: Int
    let title: String
    let user: String
    
    func loadPhotoData(completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "http://34.22.215.91\(photo ?? "")") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image data: \(error)")
                completion(nil)
                return
            }
            
            completion(data)
        }
        
        task.resume()
    }

}

struct ReportFullData: Codable {
    let report: ReportFull
}

// //////////////////////////////////////

struct ReportsCheck: Codable {
    let approved: Bool?
    let date_upload: String
    let id: Int
    let photo: String?
    let report: Int
    let title: String
    let user: String
    
    func loadPhotoData(completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "http://34.22.215.91\(photo ?? "")") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image data: \(error)")
                completion(nil)
                return
            }
            
            completion(data)
        }
        
        task.resume()
    }
}

struct PaginationReportСheck: Codable {
    let count: Int
    let next: String?
    let previous: String?
}

struct ReportsListCheck: Codable {
    let objects: [ReportsCheck]
    let pagination: PaginationReportСheck
}

// //////////////////////////////////////
// //////////////////////////////////////

struct CuratorForUser: Codable{
    var manager: Manager?
}

struct Manager: Codable {
    var card: String?
    var cardholder_name: String?
    var email: String?
    var first_name: String?
    var is_staff: Bool?
    var last_login: String?
    var last_name: String?
    var organization: String?
    var phone_number: String?
    var photo: String?
    var region: String?
    var username: String?
    
    func loadPhotoData(completion: @escaping (Data?) -> Void) {
            guard let url = URL(string: "http://34.22.215.91\(photo ?? "")") else {
                completion(nil)
                return
            }

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error loading image data: \(error)")
                    completion(nil)
                    return
                }

                completion(data)
            }

            task.resume()
        }
}
