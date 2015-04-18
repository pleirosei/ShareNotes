//
//  NoteUser.swift
//  ShareNotes
//
//  Created by Sean Livingston on 4/18/15.
//  Copyright (c) 2015 Sean Livingston. All rights reserved.
//

import Foundation

class NoteUser: PFUser, PFSubclassing {
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    
}