//
//  Pastry.swift
//  PastryKit
//
//  Created by Rob Fahrni on 3/21/15.
//  Copyright (c) 2015 Robert R. Fahrni. All rights reserved.
//

import Foundation

public class Pastry : NSObject
{
    var pubDateReal: Double!
    var pubDate: NSDate!
    var date: String!
    var niceDate: String!
    var title: String!
    var thought: String!
    var twitterAnnouncement: String!
    var role: String!
    var realName: String!
    var slug: String!
    var permaLink: String!
    var photo: String!
    
    init(ingredientsDictionary: NSDictionary) {
        let dateString: String = ingredientsDictionary["pubdate"] as String
        self.pubDateReal = (dateString as NSString).doubleValue
        self.pubDate = NSDate().dateByAddingTimeInterval(self.pubDateReal)
        self.date = ingredientsDictionary.objectForKey("date") as String
        self.niceDate = ingredientsDictionary.objectForKey("nicedate") as String
        self.title = ingredientsDictionary.objectForKey("title") as String
        self.thought = ingredientsDictionary.objectForKey("thought") as String
        self.twitterAnnouncement = ingredientsDictionary.objectForKey("twitter_announcement") as String
        self.role = ingredientsDictionary.objectForKey("role") as String
        self.realName = ingredientsDictionary.objectForKey("realname") as String
        self.slug = ingredientsDictionary.objectForKey("slug") as String
        self.permaLink = ingredientsDictionary.objectForKey("permalink") as String
        self.photo = ingredientsDictionary.objectForKey("photo") as String
    }
    
    func description() -> String {
        return "\(self.date)\n\(self.niceDate)\n\(self.title)\n\(self.twitterAnnouncement)\n\(self.realName)\n\(self.slug)\n\(self.permaLink)\n\(self.photo)"
    }
    
    /// pastryArrayFromNSArray
    public class func pastryArrayFromNSArray(ingredientsArray: NSArray) -> [Pastry] {
        var pastries = [Pastry]()
        for ingredientsDictionary in ingredientsArray {
            pastries.append(Pastry(ingredientsDictionary: ingredientsDictionary as NSDictionary))
        }
        return pastries;
    }
    
} // Pastry
