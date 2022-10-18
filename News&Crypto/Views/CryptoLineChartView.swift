import UIKit
import Charts

final class CryptoLineChartView: UIView {
    
    private let chartView = LineChartView()
    
    struct ViewModel {
        let data: [Double]
        let showLegend: Bool
        let showAxis: Bool
        let fillColor: UIColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(model: ViewModel) {
        var entries = [ChartDataEntry]()
        
        for (index, value) in model.data.enumerated() {
            entries.append(.init(x: Double(index), y: value))
        }
        
        chartView.rightAxis.enabled = model.showAxis
        chartView.legend.enabled = model.showLegend
        
        let dataSet = LineChartDataSet(entries: entries, label: "7 days")
        
        dataSet.drawFilledEnabled = true
        dataSet.drawIconsEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false
        dataSet.setColor(model.fillColor)
        
        let gradientColors = [model.fillColor.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [0.8, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)
        dataSet.fill = LinearGradientFill(gradient: gradient!, angle: 90.0)
        dataSet.drawFilledEnabled = true
        let data = LineChartData(dataSet: dataSet)
        chartView.data = data
    }
    
    private func addSubviews() {
        addSubview(chartView)
    }
    
    private func addSetups() {
        chartView.setScaleEnabled(true)
        chartView.xAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.legend.enabled = false
    }
}
