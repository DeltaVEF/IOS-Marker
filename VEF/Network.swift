//
//  Network.swift
//  VEF
//
//  Created by Colin Rosen on 4/19/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SocketIOClientSwift

public class Network {

    public typealias Callback = (Int) -> Void
    
    // TODO: Connect to backend
    private static let url = "http://192.168.27.126/api"
    
    public static func request (method: Alamofire.Method, args: [String: String], view: UIViewController, callback: Callback) -> Void {
        self.request(method, args: args, view: view, showError: true) {
            (code : Int ) in
            callback(code)
        }
    }
    
    public static func request (method: Alamofire.Method, args: [String: String], view: UIViewController, showError: Bool, callback: Callback) -> Void {
        // Generate parameter string
        // Alamofire can also do this, however it'll add the parameters in a ?[key]=[value]&[key]=[value]... format
        let argString = argsToString(args)
        
        print(argString)
        
        // Do request
        Alamofire.request(method, "\(url)\(argString)")
            .responseJSON { response in
                var code = response.response?.statusCode
                
                if showError {
                    // Show appropriate error
                    if code == 401 {
                        Utils.alert("Error", message: "You don't have permission to perform this request", view: view)
                    }
                    else if code == 400 {
                        Utils.alert("Error", message: "Bad request", view: view)
                    }
                    else if code == 404 {
                        Utils.alert("Error", message: "Incorrect url, requested resource not found", view: view)
                    } else if code != 200 {
                        Utils.alert("Error", message: "Unkown error", view: view)
                    }
                }
                
                // Call callback with code
                if code == nil {
                    code = 0
                }
                
                callback(code!)
            }
    }
    
    // Converts dictionary to parameter string
    private static func argsToString(args: [String: String]) -> String {
        var output = ""
        
        // TODO: Change to work for backend protocol
        for arg in args.reverse() {
            if output != "" {
                output = "\(output)/"
            }
            
            output = "\(output)\(arg.0)"
            
            /*
            // ?[KEY]=[VALUE] format
            if output == ""{
                output = "\(output)?\(arg.0)"
            } else {
                output = "\(output)&\(arg.0)"
            }
            
            if arg.1 != "" {
                output = "\(output)=\(arg.1)"
            }
            */
        }
        
        return output
    }
    
    
    public static func socketConnect(){
        let url = NSURL(fileURLWithPath: self.url)
        let socket = SocketIOClient(socketURL: url)
        socket.on("[EVENT NAME]") {data, ack in
            print(data)
        }
        socket.connect()
    }
}











