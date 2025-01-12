//
//  ShowMoviesContracts.swift
//  MovieDBViper
//
//  Created Pedro Enrique Sobrosa Lopes on 20/08/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// ShowMovies Module View Protocol
protocol ShowMoviesViewProtocol: class {
    func set(movies: [Movie])
    
    func setNextPage(page: Int)
}

//MARK: Interactor -
/// ShowMovies Module Interactor Protocol
protocol ShowMoviesInteractorProtocol {
    func search(text: String, presenter: ShowMoviesPresenterProtocol)
    
    func nextPage(page: Int ,presenter: ShowMoviesPresenterProtocol)
}

//MARK: Presenter -
/// ShowMovies Module Presenter Protocol
protocol ShowMoviesPresenterProtocol {
    func viewDidInitAllMovies()
    
    func showMovieDetails(with movie: Movie, from view: UIViewController)
    
    func requestDidFetch(movies: [Movie]?, error: Error?)
    
    func getNextPage() // mark
    
    func getPrevPage() // mark
}


//MARK: Router (aka: Wireframe) -
/// ShowMovies Module Router Protocol
protocol ShowMoviesRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    func pushToMovieDetails(with movie: Movie, from view: UIViewController)
}
