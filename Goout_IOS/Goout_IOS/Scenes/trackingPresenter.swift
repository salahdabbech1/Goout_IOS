//
//  trackingPresenter.swift
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

protocol trackingPresentationLogic
{
  func presentSomething(response: tracking.Something.Response)
}

class trackingPresenter: trackingPresentationLogic
{
  weak var viewController: trackingDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: tracking.Something.Response)
  {
    let viewModel = tracking.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
