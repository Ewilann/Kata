//
//  MastermindTests.swift
//  MastermindTests
//
//  Created by Maxime Duguet on 19/06/2019.
//  Copyright © 2019 Maxime Duguet. All rights reserved.
//

import XCTest
@testable import Mastermind

class MastermindTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMastermind() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let main = MastermindController()
        
        //test entre 2 combinaisons identiques plus ou moins longue
        main.generateRandomCombination(length: 5)
        XCTAssertEqual(main.evaluate(newCombination: main.getCombination()), [5,0])
        
        main.generateRandomCombination(length: 50)
        XCTAssertEqual(main.evaluate(newCombination: main.getCombination()), [50,0])
        
        //test avec des combinaisons différentes avec plusieurs couleurs
        main.setCombination(colorList: ["blue", "red", "green"])
        XCTAssertEqual(main.evaluate(newCombination: ["red", "green", "blue"]), [0,3])
        
        main.setCombination(colorList: ["blue", "red", "blue", "black", "white"])
        XCTAssertEqual(main.evaluate(newCombination: ["red", "green", "blue", "black", "white"]), [3,1])
        
        //test avec des majuscules
        main.setCombination(colorList: ["Blue", "red", "green"])
        XCTAssertEqual(main.evaluate(newCombination: ["red", "Green", "blue"]), [0,3])
        
        //test avec des tableaux de tailles différentes
        main.setCombination(colorList: ["blue", "red"])
        XCTAssertEqual(main.evaluate(newCombination: ["red", "green", "blue"]), [-1,-1])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
