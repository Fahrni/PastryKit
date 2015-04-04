//
//  ViewController.swift
//  PastryTest
//
//  Created by Rob Fahrni on 3/22/15.
//  Copyright (c) 2015 Robert R. Fahrni. All rights reserved.
//

import UIKit
//import PastryKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var actionSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goButtonHandler(sender: AnyObject) {
        var pk = PastryKit();
        var today = NSDate().dateByAddingTimeInterval(NSDate().timeIntervalSince1970);
        
        switch (self.actionSegmentedControl.selectedSegmentIndex) {
        case 0:
            pk.thoughtByDay(NSDate(), completionHandler:{(pasteries, error) in
                if (nil != error) { println(error) }
                if (nil != pasteries) { println(pasteries) }
            });
        case 1:
            pk.thoughtByDay(NSDate(), previous:5, completionHandler:{(pasteries, error) in
                if (nil != error) { println(error) }
                if (nil != pasteries) { println(pasteries) }
            });

        case 2:
            pk.thoughtByDay(NSDate(), next:5, completionHandler:{(pasteries, error) in
                if (nil != error) { println(error) }
                if (nil != pasteries) { println(pasteries) }
            });

        case 3:
            pk.thoughtByDay(NSDate(), to:NSDate(), completionHandler:{(pasteries, error) in
                if (nil != error) { println(error) }
                if (nil != pasteries) { println(pasteries) }
            });

        case 4:
            self.showPastryBaker();
        
        case 5:
            pk.allThoughts({(pasteries, error) in
                if (nil != error) { println(error) }
                if (nil != pasteries) { println(pasteries) }
            });
            
        default:
            pk.thoughtByDay(NSDate(), completionHandler:{(pasteries, error) in
                if (nil != error) { println(error) }
                if (nil != pasteries) { println(pasteries) }
            });
        }
    }
    
    private func showPastryBaker() {
        var pastryKit = PastryKit();
        pastryKit.thoughtsByBaker("mike-monteiro", completionHandler:{(pasteries, error) in
            if (nil != error) { println(error) }
            if (nil != pasteries) { println(pasteries) }
        });
    }
}

