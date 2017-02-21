//
//  LoginViewController.swift
//  bu
//
//  Created by mlibai on 2017/1/13.
//  Copyright © 2017年 yang. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
//import SwiftyJSON

class LoginViewController: UIViewController {
    static let  BUURL = "http://out.bitunion.org"
    
    static var session = [String:Any];


    @IBAction func sendPost(_ sender: UIButton) {
        let url = "http://out.bitunion.org/open_api/bu_logging.php"
        
        
//            {
//                "action":"login",
//                "username":"username",
//                "password":"password"
//        }
        let parameters: Parameters = [
            "action": "login",
            "username":"soul11201",
            "password":"@sdfghjkl"

//            "bar": [
//                "baz": "qux"
//            ]
        ]

//        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding, headers: HTTPHeaders?)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding(options: [])).responseJSON{
            response in
            
            print("Request: \(response.request?.httpBody)")
            print("Request: \(response.data)")
            print("Response: \(response.response)")
            print("result: \(response.result)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
                LoginViewController.BUURL = JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions)
            }
        }
        
        
        
        
        
        
        
        
//        Alamofire.request(url,.post, parameters: parameters, encoding: JSONEncoding);
        
        // Both calls are equivalent
//        Alamofire.request(url,).response { response in
//            print("Request: \(response.request)")
//            print("Response: \(response.response)")
//            print("Error: \(response.error)")
//            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
//        }
//        
        
        
//        ret.responseData(completionHandler: (DataResponse<Data>) -> Void)
//        NSLog("%@", ret);
//        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding(options: []))

        
        
    }
    
    
    func bu_thread(){
        let uri = LoginViewController.BUURL + "/open_api/bu_thread.php";
        
        let parameters = [
                "action":"thread",
                "username":"username",
                "session":"session",
                "fid":"论坛id",
                "from":"帖子起始编号，最新帖子编号为0",
                "to":"帖子结束编号"
            ]
        
        print(uri)
        
        Alamofire.request(uri, method: .post, parameters: parameters, encoding: JSONEncoding(options: [])).responseJSON{
            response in
            
            print("Request: \(response.request?.httpBody)")
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                SwiftyJson.
                print("Data: \(utf8Text)")
            }
        }


        
        
//
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
