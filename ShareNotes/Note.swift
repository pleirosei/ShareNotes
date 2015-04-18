//
//  Note.swift
//  ShareNotes
//
//  Created by Sean Livingston on 4/18/15.
//  Copyright (c) 2015 Sean Livingston. All rights reserved.
//

import Foundation

class Note: PFObject, PFSubclassing {
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "Note"
    }
    
    var title : String {
        get { return objectForKey("title") as? String ?? "" }
        set {
            setObject(newValue, forKey: "title")
            setObject(newValue.lowercaseString, forKey: "lowercaseTitle")
        }
    }
    
    var text : String {
        get { return objectForKey("text") as? String ?? "" }
        set { setObject(newValue, forKey: "text")
            setObject(newValue.lowercaseString, forKey: "lowercaseText")
        }
    }
    
    var date : NSDate {
        get { return objectForKey("createdAt") as? NSDate ?? NSDate()}
        set { setObject(newValue, forKey: "date") }
    }
    
    var shortDate: String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.stringFromDate(createdAt!)
    }
    
    var fromUser: NoteUser {
        get { return objectForKey("fromUser") as! NoteUser }
        set { setObject(newValue, forKey: "fromUser") }
    }
    
    var sharedNote: Bool = false
    

    
}