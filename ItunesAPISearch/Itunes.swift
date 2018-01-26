//
//  Itunes.swift
//  ItunesAPISearch
//
//  Created by james rochabrun on 12/18/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

//ITUNES IS THE MAIN OBJECT FOR CREATION URL
//ItunesMedia is the main object for Itunes media search

//MARK: Itunes enum to help endpoint creation
enum Itunes {

    //this case is just for the search path
    case search(term: String, media: ItunesMedia?)
    case lookUP(id: Int, entity: ItunesEntity?) //this endpoint asks for an id and an optional entity, here we put the protocol type so it can be any entity
}

//MARK: itunes conforming to endpoint, here is where the url is constructed
extension Itunes: Endpoint {
    
    var base: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        //switch on the cases of Itunes
        switch self {
        case .search: return "/search"
        case .lookUP: return "/lookup"
        }
    }
    
    var queryItems: [URLQueryItem] {
        
        var result = [URLQueryItem]()
        switch self {
        case .search(let term, let media):
            let searchItem = URLQueryItem(name: "term", value: term)
            result.append(searchItem)
            if let media = media {
                let mediaItem = URLQueryItem(name: "media", value: media.description)//description is a variable in the enum ItunesMedia
                result.append(mediaItem)
                
                if let entityQueryItem = media.entityQueryItem {//if exists add it to the array
                    result.append(entityQueryItem)
                }
                if let attributeQueryItem = media.attributeQueryItem {//if exists add it to the array
                    result.append(attributeQueryItem)
                }
            }
        case .lookUP(let id,let entity):
            let attributeID = URLQueryItem(name: "id", value: id.description)//textual representation of the integer
            let attributeEntity = URLQueryItem(name: "entity", value: entity?.entityName)
            result = [attributeID, attributeEntity]
        }
        return result
    }
    
 
}

