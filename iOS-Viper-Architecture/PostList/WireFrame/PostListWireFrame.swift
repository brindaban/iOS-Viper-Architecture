//
//  PostListWireFrame.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostListWireFrame: PostListWireFrameProtocol {
    
    class func createPostListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PostsNavigationController")
        if let view = navController.childViewControllers.first as? PostListView {
            let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
            let interactor: PostListInteractorInputProtocol = PostListInteractor()
            let localDataManager: PostListLocalDataManagerInputProtocol = PostListLocalDataManager()
            let remoteDataManager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
            let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentPostDetailScreen(from view: PostListViewProtocol) {
        
    }
    
}
