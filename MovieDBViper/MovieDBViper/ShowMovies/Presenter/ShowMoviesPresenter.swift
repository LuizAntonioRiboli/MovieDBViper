//
//  ShowMoviesPresenter.swift
//  MovieDBViper
//
//  Created Pedro Enrique Sobrosa Lopes on 20/08/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

/// ShowMovies Module Presenter
class ShowMoviesPresenter {
    
    var pageCounter: Int = 1
    
    weak private var _view: ShowMoviesViewProtocol?
    private var interactor: ShowMoviesInteractorProtocol
    private var wireframe: ShowMoviesRouterProtocol
    var movies: [Movie]?
    var text: String?
    
    init(view: ShowMoviesViewProtocol, movies: [Movie]) {
        self.movies = movies
        self._view = view
        self.interactor = ShowMoviesInteractor()
        self.wireframe = ShowMoviesRouter()
    }
    
    init(view: ShowMoviesViewProtocol, text: String) {
        self.text = text
        self._view = view
        self.interactor = ShowMoviesInteractor()
        self.wireframe = ShowMoviesRouter()
    }
}

// MARK: - extending ShowMoviesPresenter to implement it's protocol
extension ShowMoviesPresenter: ShowMoviesPresenterProtocol {
    func showMovieDetails(with movie: Movie, from view: UIViewController) {
        wireframe.pushToMovieDetails(with: movie, from: view)
    }
    
    func viewDidInitAllMovies() {
        _view?.set(movies: movies!)
    }
    
    func viewDidInitSearch() {
        interactor.search(text: text!, presenter: self)
    }
    
    func requestDidFetch(movies: [Movie]?, error: Error?) {
        if error == nil && !(movies?.isEmpty ?? true) {
            _view?.set(movies: movies!)
            _view?.setNextPage(page: pageCounter)
        }
        else {
            _view?.set(movies: [])
        }
    }
    
    // mark
    func getNextPage(){
        print(pageCounter)
        pageCounter += 1
        print(pageCounter)

        interactor.nextPage(page: pageCounter, presenter: self)
        
    }
    
    func getPrevPage(){
        print(pageCounter)
        pageCounter -= 1
        print(pageCounter)

        interactor.nextPage(page: pageCounter, presenter: self)
    }
}
