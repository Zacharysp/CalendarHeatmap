import XCTest
@testable import CalendarHeatmap

class TestCalendarData: XCTestCase {
    
    private let startDate = Date.dateOf(2020, 3, 1)!
    private let endDate = Date.dateOf(2020, 4, 10)!
    private lazy var heatmapData: CalendarHeatmapData = {
        return CalendarHeatmapData(config: CalendarHeatmapConfig(), startDate: startDate, endDate: endDate)
    } ()
    
    func testCalendarDayCount() {
        XCTAssertEqual(heatmapData.daysCount, 41)
    }
    
    func testCalendarDataHeader() {
        XCTAssertEqual(heatmapData.headerData.first!.month, 3)
        XCTAssertEqual(heatmapData.headerData.last!.month, 4)
    }
    
    func testCalendarDataItem() {
        XCTAssertEqual(heatmapData.itemAt(indexPath: IndexPath(item: 0, section: 0)), startDate)
        XCTAssertEqual(heatmapData.itemAt(indexPath: IndexPath(item: 40, section: 0)), endDate)
    }
}
