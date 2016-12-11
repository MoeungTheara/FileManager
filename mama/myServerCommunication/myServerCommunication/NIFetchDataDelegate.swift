//
//  NIFetchDataDelegate.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/7/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

@objc public  protocol NIFetchDataDelegate{
    @objc optional func FetchDataResponseSuccess(responseData: Array<AnyObject>)
    @objc optional func FetchErrorFromClient(errorMessage:NSError)
    @objc optional func FetchDataResponseHTTPEroro(responseError:HTTPURLResponse)
}
