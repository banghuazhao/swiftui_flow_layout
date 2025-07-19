import XCTest
@testable import SwiftUIFlowLayout

final class FlowLayoutTests: XCTestCase {
    func testInit() {
        let items = [1, 2, 3]
        let layout = FlowLayout(items: items) { item in
            Text("\(item)")
        }
        XCTAssertNotNil(layout)
    }
} 