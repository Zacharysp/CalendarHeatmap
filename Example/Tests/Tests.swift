import XCTest
@testable import CalendarHeatmap

class Tests: XCTestCase {
    
    private let startDate = Date(2020, 3, 1)
    private let endDate = Date(2020, 4, 10)
    private lazy var heatmapData: CalendarHeatmapData = {
        return CalendarHeatmapData(config: CalendarHeatmapConfig(), startDate: startDate, endDate: endDate)
    } ()
    
    func testCalendarSectionCount() {
        XCTAssertEqual(heatmapData.sectionCount, 2)
    }
    
    func testCalendarItemCount() {
        XCTAssertEqual(heatmapData.itemCountIn(section: 0), 35)
        XCTAssertEqual(heatmapData.itemCountIn(section: 1), 6)
    }
    
    func testCalendarDataItem() {
        let firstDate = Date(2020, 3, 1)
        XCTAssertEqual(heatmapData.itemAt(indexPath: IndexPath(item: 0, section: 0)), firstDate)
        let lastDate = Date(2020, 4, 10)
        XCTAssertEqual(heatmapData.itemAt(indexPath: IndexPath(item: 5, section: 1)), lastDate)
    }
}
