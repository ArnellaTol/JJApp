//
//  DataBaseTest.swift
//  JJApp
//
//  Created by Arnella Tolegen on 14.06.2023.
//

//import SwiftUI
//struct LoginUser: Codable {
//    var username: String
//    var password: String
//}
//
//struct RegistrationUser: Codable {
//    var first_name: String
//    var last_name: String
//    var username: String
//    var password: String
//    var repeat_password: String
//    var phone_number: String
//    var email: String
//    var status: String?
//    var region: String
//    var organization: String
//}
//
//struct RegistrationStaff: Codable {
//    var first_name: String
//    var last_name: String
//    var username: String
//    var password: String
//    var repeat_password: String
//    var phone_number: String
//    var email: String
//    var region: String
//    var organization: String
//    var card: String?
//}
//
//
//struct DataBaseTest: View {
//    @State var msg = "Hello world"
//    var body: some View {
//        VStack {
//            Button {
//
//            } label: {
//                Image(systemName: "globe")
//                    .resizable()
//                    .cornerRadius(50)
//                    .padding(.all, 4)
//                    .frame(width: 100, height: 100)
//                    .background(Color.black.opacity(0.2))
//                    .aspectRatio(contentMode: .fill)
//                    .clipShape(Circle())
//                    .padding(8)
//                Text(msg)
//
//            }
//            //            .task {
//            //                // await sendRequestLogin()
//            //                 //await sendRequestRegistrationUser()
//            //                 await sendRequestRegistrationStaff()
//            //             }
//
//        }
//        .padding()
//
//
//    }
    
//    func sendRequestLogin() async  {
//        var responseData = [
//            "username": "erzhtyj",
//            "password": "123456-qw"
//        ]
//        var sendingData = try! JSONEncoder().encode(responseData)
//        let URL_ADDRESS: String = "http://34.125.195.124/api-auth/login/"
//        guard let url = URL(string: URL_ADDRESS) else { return }
//        var token = "" //?
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(token, forHTTPHeaderField: "Authorization") //?
//        request.httpBody = sendingData
//        msg = "Loading..."
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                msg = "Error"
//            } else if let data = data {
//                sendDataLogin(data)
//                msg = "Success"
//            } else {
//                // Handle unexpected error
//                msg = "unexpected Error"
//            }
//        }
//        task.resume()
//    }
//
//    func sendDataLogin(_ data: Data?) {
//        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
//            var obj = try! JSONDecoder().decode(ResponseData.self, from: data)
//            print(obj.access)
//
//        } else {
//            print("=========> error")
//        }
//    }
//
//
    
    
    
//
//    func sendRequestRegistrationStaff() async  {
//        var responseData = [
//            "first_name": "Arndealla",
//            "last_name": "Tolegdaen",
//            "username": "qqqadqwee",
//            "password": "123dqwe",
//            "repeat_password": "123dqwe",
//            "phone_number": "+124167771",
//            "email": "qqwwerdtdsyhds@gmail.com",
//            "region": "Karagsandy001",
//            "organization": "somde111",
//            "card": "0000100000100000",
//        ]
//        var sendingData = try! JSONEncoder().encode(responseData)
//        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/staff-reg/"
//        guard let url = URL(string: URL_ADDRESS) else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = sendingData
//        msg = "Loading..."
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                msg = "Error"
//            } else if let data = data {
//                sendDataRegistrationStaff(data)
//            } else {
//                // Handle unexpected error
//                msg = "unexpected Error"
//            }
//        }
//        task.resume()
//    }
//
//    func sendDataRegistrationStaff(_ data: Data?) {
//        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
//            print(json)
//            var obj = try? JSONDecoder().decode(ResponseData.self, from: data)
//            print(obj)
//        } else {
//            print("=========> error")
//        }
//    }
//}
//
//
//
//
//// ---------------------
//
//
//
//struct DataBaseTest_Previews: PreviewProvider {
//    static var previews: some View {
//        DataBaseTest()
//    }
//}
//
//// Encode your JSON datalet jsonString = "{ \"command\" : \"sdm.devices.commands\", \"params\" : { \"commandName\" : \"cmdValue\" } }"
