//
//  trackingInteractor.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 16/11/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol trackingBusinessLogic
{
  func doSomething(request: tracking.Something.Request)
}

protocol trackingDataStore
{
  //var name: String { get set }
}

class trackingInteractor: trackingBusinessLogic, trackingDataStore
{
  var presenter: trackingPresentationLogic?
  var worker: trackingWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: tracking.Something.Request)
  {
    worker = trackingWorker()
    worker?.doSomeWork()
    
    let response = tracking.Something.Response()
    presenter?.presentSomething(response: response)
  }
}