//
//  PastryKit.swift
//  PastryKit
//
//  Created by Rob Fahrni on 3/21/15.
//  Copyright (c) 2015 Robert R. Fahrni. All rights reserved.
//

import Foundation

/// The base URL for the Pastry Box API [see https://the-pastry-box-project.net/api-and-content-preservation]
private let PastryBoxUrl = "https://the-pastry-box-project.net/api/v1/consume/thoughts"

//typealias CompleteHandlerBlock = (([Pastry]!, NSError!) -> Void?)

public class PastryKit : NSObject, NSURLSessionTaskDelegate
{
    let pastryBoxIngredientDateFormatter = NSDateFormatter()
    
    override init() {
        super.init()
        
        // PastryBox date arguments are always in the format dd-MM-yyy.
        pastryBoxIngredientDateFormatter.dateFormat = "dd-MM-yyyy"
    }
    
    /// thoughtByDay - Any thoughts published on the given day.
    public func thoughtByDay(date: NSDate, completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        self.getWithIngredient("?day=" + self.pastryBoxIngredientDateFormatter.stringFromDate(date), completionHandler: completionHandler)
    }
    
    /// thoughtByDay - Any thoughts published on the given day, plus previous X number of days.
    public func thoughtByDay(date: NSDate, previous: Int, completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        self.getWithIngredient("?day=" + self.pastryBoxIngredientDateFormatter.stringFromDate(date) + "&previous=\(previous)", completionHandler: completionHandler)
    }

    /// thoughtByDay - Any thoughts published on the given day, plus next X number of days.
    public func thoughtByDay(date: NSDate, next: Int, completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        self.getWithIngredient("?day=" + self.pastryBoxIngredientDateFormatter.stringFromDate(date) + "&next=\(next)", completionHandler: completionHandler)
    }

    /// thoughtByDay - Any thoughts published from a given day to a given day
    public func thoughtByDay(from: NSDate, to: NSDate, completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        self.getWithIngredient("?from=" + self.pastryBoxIngredientDateFormatter.stringFromDate(from) + "&to=" + self.pastryBoxIngredientDateFormatter.stringFromDate(to), completionHandler: completionHandler)
    }

    /// thoughtsByBaker - An array of thoughts by a baker(author)
    public func thoughtsByBaker(baker: String, completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        self.getWithIngredient("?baker=\(baker)", completionHandler: completionHandler)
    }
    
    /// allThoughts - Grab all the thoughts
    public func allThoughts(completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        self.getWithIngredient(nil, completionHandler: completionHandler)
    }
    
    /// getWithIngredient - worker method that does all gets
    private func getWithIngredient(ingredient: String?, completionHandler: (([Pastry]!, NSError!) -> Void)?) {
        let url = ((ingredient) != nil) ? NSURL(string: PastryBoxUrl + ingredient!) : NSURL(string: PastryBoxUrl)
        let request = NSURLRequest(URL: url!)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)

        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            if error != nil {
                completionHandler!(nil, error)
                return
            }
            
            do {
                let ingredientsArray: NSArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
                let pasteries = Pastry.pastryArrayFromNSArray(ingredientsArray)
                completionHandler!(pasteries, nil)
            } catch let error as NSError {
                completionHandler!(nil, error)
            }
        })
        task.resume()
    }
} // class PastryKit