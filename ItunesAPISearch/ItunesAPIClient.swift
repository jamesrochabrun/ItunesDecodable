//
//  ItunesAPIClient.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/29/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import PromiseKit


class ItunesAPIClient: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    //typealias ArtistsCompletionHandler = (Result<ArtistsResult?, APIError>) -> ()
    
    func searchForArtists(withTerm term: String) -> Promise<ArtistsResult?> {
        
        let endpoint = Itunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        print("ARTISTS REQUEST \(endpoint.request)")
        
           return fetch(with: endpoint.request, decode: { genericModel ->  ArtistsResult? in
                guard let artistsResult = genericModel as? ArtistsResult else { return nil }
                return artistsResult
            })
    }
    
//        performRequest(with: endpoint) { (results, error) in
//
//            guard let results = results else {
//                completion([], error)
//                return
//            }
//            let artists = results.flatMap{ Artist(json: $0) }
//            completion(artists, nil)
//        }
    
  //  typealias ArtistCompletionHandler = (Result<AlbumsResult?, APIError>) -> ()
    
    func lookUpAlbumsFromArtist(with id: Int) -> Promise<AlbumsResult?> {
        
        let endpoint = Itunes.lookUP(id: id, entity: MusicEntity.album)
        
        print("Albums REQUEST \(endpoint.request)")
        
        return fetch(with: endpoint.request, decode: { genericModel -> AlbumsResult? in
            guard let albumResult = genericModel as? AlbumsResult else { return nil }
            return albumResult
        })
        
//        performRequest(with: endpoint) { (results, error) in
//
//            guard let results = results else {
//                completion(nil, error)
//                return
//            }
//            guard let artistInfo = results.first else {
//                completion(nil, .jsonParsingFailure(message: "Results does not contain artist info"))
//                return
//            }
//            guard let artist = Artist(json: artistInfo) else {
//                completion(nil, .jsonParsingFailure(message: "Could not parse artist info"))
//                return
//            }
//            let albumResults = results[1..<results.count] //0 index shows artits info, 1 and beyond album info
//            let albums = albumResults.flatMap{ Album(json: $0) }
//            artist.albums = albums
//            completion(artist, nil)
        
        }
    
    //typealias AlbumCompletion = (Result<SongsResult?, APIError>) -> ()
    func lookUpsongsFromAlbum(with id: Int)  -> Promise<SongsResult?> {
        
        let endpoint = Itunes.lookUP(id: id, entity: MusicEntity.song)
        print("Album \(endpoint.request)")

        return fetch(with: endpoint.request, decode: { genericModel -> SongsResult? in
            guard let songResult = genericModel as? SongsResult else { return nil }
            return songResult
        })
        
//        performRequest(with: endpoint) { (results, error) in
//            guard let results = results else {
//                completion(nil, error)
//                return
//            }
//            guard let albumInfo = results.first else {
//                completion(nil, .jsonParsingFailure(message: "results does not contain album info"))
//                return
//            }
//            guard let album = Album(json: albumInfo) else {
//                completion(nil, .jsonParsingFailure(message: "could not parse album info"))
//                return
//            }
//            let songResults = results[1..<results.count]
//            let songs = songResults.flatMap{ Song(json: $0) }
//            album.songs = songs
//            completion(album, nil)
//        }
    }
}

//MARK: - HELPER METHODS
//extension ItunesAPIClient {
//
//    typealias Results = [[String: Any]]
//    typealias RequestCompletion = (Results?, ItunesError?) -> ()
//
//    func performRequest(with endpoint: Endpoint, completion: @escaping RequestCompletion) {
//        let task = downloader.jsonTask(with: endpoint.request) { (json, error) in
//            DispatchQueue.main.async {
//                guard let json = json else {
//                    completion(nil, error)
//                    return
//                }
//                guard let results = json["results"] as? [[String: Any]] else {
//                    completion(nil, .jsonParsingFailure(message:"json does not contain results"))
//                    return
//                }
//                completion(results, nil)
//            }
//        }
//        task.resume()
//    }
//}
//









