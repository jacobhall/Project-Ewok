//
//  ViewController.swift
//  ewok
//
//  Created by Jacob Hall on 8/2/16.
//  Copyright © 2016 ASAP. All rights reserved.
//

import UIKit

import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    var lm:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        lm = CLLocationManager()
        lm.delegate = self
        
        lm.startUpdatingHeading()
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!) {
        print(newHeading.magneticHeading)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button(sender: AnyObject) {
        
        let requestURL: NSURL = NSURL(string: "http://chitna.asap.um.maine.edu/projectcrowdsource/public/api/geolocations")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            
            
            if let httpResponse = response as? NSHTTPURLResponse{
                
                
                let statusCode = httpResponse.statusCode
                
                do {
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    print(json)
                    
                    
                } catch {
                    
                    print("failed")
                }
            
            
            }
            
        }
        
        task.resume()

        
    }
    
    
    @IBAction func compass(sender: AnyObject) {
            
        

        

    }
    
    

}

