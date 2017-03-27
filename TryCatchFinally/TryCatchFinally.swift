//
//  TryCatchFinally.swift
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

import Foundation

func `trap`(`trap`:@escaping ()->())->TryCatchFinally {
    return TryCatchFinally(`trap`)
}
class TryCatchFinally {
    let tryFunc : ()->()
    var catchFunc = { (e:NSException!)->() in return }
    var finallyFunc : ()->() = {}
    
    init(_ `trap`:@escaping ()->()) {
        tryFunc = `trap`
    }
    
    func `handle`(`handle`:@escaping (NSException)->())->TryCatchFinally {
        // objc bridging needs NSException!, not NSException as we'd like to expose to clients.
        catchFunc = { (e:NSException!) in `handle`(e) }
        return self
    }
    
    func finally(finally:@escaping ()->()) {
        finallyFunc = finally
    }
    
    deinit {
//        tryCatchFinally(tryFunc, catchFunc, finallyFunc)
    }
}
