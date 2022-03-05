//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Solo on 04/03/2022.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    var request: URLSessionDataTask?
    let successModel = CityModel(country: "VN", name: "Ha Noi", _id: 1581130, coord: Coordinate(lon: 105.841171, lat: 21.0245))
    let specialCharModel = CityModel(country: "VN", name: "Thủ Ðô Hà Nội", _id: 1581129, coord: Coordinate(lon: 105.883331, lat: 21.116671))
    
    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        guard let jsonData = Utils.readLocalFile(name: "cities", fileExtension: ".json") else {
            return
        }
        let cityModels: [CityModel] = JSONParser().parseArray(data: jsonData) ?? []
        XCTAssert(!cityModels.isEmpty)
        let suffixHelper = SuffixSearchHelper<CityModel>(models: cityModels)
        let linearHelper = LinearSearchHelper<CityModel>(models: cityModels)
            // success case
        testEmptySearchSuccess(text: "", linearHelper: linearHelper, cityModels: cityModels)
        testOneCharSearchSuccess(text: "H", linearHelper: linearHelper, suffixHelper: suffixHelper)
        testFullSearchSuccess(text: "Ha Noi", linearHelper: linearHelper, suffixHelper: suffixHelper)
        testInsensitiveSearchSuccess(text: "ha nOI", linearHelper: linearHelper, suffixHelper: suffixHelper)
        testSpecialCharSearchSuccess(text: "Thủ Ðô Hà Nội", linearHelper: linearHelper, suffixHelper: suffixHelper)
            // fail case
        testFullSearchFail(text: "Ha Noi Ha Noi", suffixHelper: suffixHelper)
        testSpecialCharSearchFail(text: "Thủ Ðô Hà Noi", suffixHelper: suffixHelper)
        testCountrySearchFail(text: "VN", suffixHelper: suffixHelper)
            // invalid data
        let suffixInvalidHelper = SuffixSearchHelper<CityModel>(models: [])
        XCTAssert(suffixInvalidHelper.nodes.models.isEmpty)
        XCTAssert(suffixInvalidHelper.nodes.node.keys.isEmpty)
    }
    
    func testEmptySearchSuccess(text: String, linearHelper: LinearSearchHelper<CityModel>, cityModels: [CityModel]) {
        let linearResult = linearHelper.search(text: text)
        XCTAssertEqual(linearResult.count, cityModels.count)
    }
    
    func testOneCharSearchSuccess(text: String, linearHelper: LinearSearchHelper<CityModel>, suffixHelper: SuffixSearchHelper<CityModel>) {
        let linearResult = linearHelper.search(text: text)
        let suffixResult = suffixHelper.search(text: text)
        XCTAssertEqual(linearResult.count, suffixResult.count)
        XCTAssertEqual(linearResult.first?.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?._id, suffixResult.first?._id)
    }
    
    func testFullSearchSuccess(text: String, linearHelper: LinearSearchHelper<CityModel>, suffixHelper: SuffixSearchHelper<CityModel>) {
        let linearResult = linearHelper.search(text: text)
        let suffixResult = suffixHelper.search(text: text)
        XCTAssertEqual(linearResult.count, suffixResult.count)
        XCTAssertEqual(self.successModel.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?._id, suffixResult.first?._id)
    }
    
    func testInsensitiveSearchSuccess(text: String, linearHelper: LinearSearchHelper<CityModel>, suffixHelper: SuffixSearchHelper<CityModel>) {
        let linearResult = linearHelper.search(text: text)
        let suffixResult = suffixHelper.search(text: text)
        XCTAssertEqual(linearResult.count, suffixResult.count)
        XCTAssertEqual(self.successModel.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?._id, suffixResult.first?._id)
    }
    
    func testSpecialCharSearchSuccess(text: String, linearHelper: LinearSearchHelper<CityModel>, suffixHelper: SuffixSearchHelper<CityModel>) {
        let linearResult = linearHelper.search(text: text)
        let suffixResult = suffixHelper.search(text: text)
        XCTAssert(suffixResult.count == 1)
        XCTAssertEqual(linearResult.count, suffixResult.count)
        XCTAssertEqual(specialCharModel.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?.name, suffixResult.first?.name)
        XCTAssertEqual(linearResult.first?._id, suffixResult.first?._id)
    }
    
    func testSpacingSearchFail(text: String, suffixHelper: SuffixSearchHelper<CityModel>) {
        let suffixResult = suffixHelper.search(text: text)
        XCTAssert(!suffixResult.isEmpty)
    }
    
    func testFullSearchFail(text: String, suffixHelper: SuffixSearchHelper<CityModel>) {
        let suffixResult = suffixHelper.search(text: text)
        XCTAssert(!suffixResult.isEmpty)
    }
    
    func testSpecialCharSearchFail(text: String, suffixHelper: SuffixSearchHelper<CityModel>) {
        let suffixResult = suffixHelper.search(text: text)
        XCTAssert(!suffixResult.isEmpty)
    }
    
    func testCountrySearchFail(text: String, suffixHelper: SuffixSearchHelper<CityModel>) {
        let suffixResult = suffixHelper.search(text: text)
        XCTAssert(suffixResult.first(where: { $0.country.contains(text) }) != nil )
    }
}
