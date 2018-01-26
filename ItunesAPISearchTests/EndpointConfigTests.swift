//
//  EndpointConfigTests.swift
//  ItunesAPISearchTests
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ItunesAPISearch

class EndpointConfigSpec: QuickSpec {
    
    override func spec() {
        var subject: Itunes!
        describe("Itunes") {
            beforeEach {
                subject = Itunes.search(term: "rolling stones", media: .music(entity: .musicArtist, attribute: .artistTerm))
//                /// this is like calling viewdidload
//                _ = subject.view
            }
            context("Just by passing this cases") {
                it("will look equal") {
                    expect(String(describing:subject.request)).to(equal("https://itunes.apple.com/search?term=rolling%20stones&media=music&entity=musicArtist&attribute=artistTerm"))
                }
            }
        }
    }
}








