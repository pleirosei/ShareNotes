//
//  FriendShip.swift
//  ShareNotes
//
//  Created by Sean Livingston on 4/18/15.
//  Copyright (c) 2015 Sean Livingston. All rights reserved.
//

import Foundation

class Friendship: PFObject, PFSubclassing {
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "Friendship"
    }
    
    override init() {
        super.init()
    }
    
    var currentUser: NoteUser {
        get { return objectForKey("currentUser") as! NoteUser }
        set { setObject(newValue, forKey: "currentUser") }
    }
    
    var theFriend: NoteUser {
        get { return objectForKey("theFriend") as! NoteUser }
        set { setObject(newValue, forKey: "theFriend") }
    }
    
    
}