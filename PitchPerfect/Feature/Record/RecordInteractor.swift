//
//  RecordInteractor.swift
//  PitchPerfect
//
//  Created by prongbang on 8/4/2562 BE.
//  Copyright (c) 2562 prongbang. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RecordBusinessLogic
{
    func doSomething(request: Record.Something.Request)
    func currentAudioURL(audioUrl: URL?)
}

protocol RecordDataStore
{
    var url: URL? { get set }
}

class RecordInteractor: RecordBusinessLogic, RecordDataStore
{
    
    var url: URL?
    
    var presenter: RecordPresentationLogic?
    var worker: RecordWorker?
    
    // MARK: Do something
    
    func currentAudioURL(audioUrl: URL?) {
        self.url = audioUrl
    }
    
    func doSomething(request: Record.Something.Request)
    {
        worker = RecordWorker()
        worker?.doSomeWork()
        
        let response = Record.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
