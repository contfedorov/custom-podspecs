Pod::Spec.new do |s|
    s.name = "ArcGIS-Maps-SDK-Swift-Toolkit-2"
    s.platform = :ios, '15.0'
    s.version = "200.3.0"
    s.summary = "An unofficial deployment of ArcGIS Maps SDK for Swift Toolkit to Cocoapods."
    s.description = <<-DESC
    Currently ArcGIS Maps SDK for Swift Toolkit is available only as SwiftPM package (https://github.com/Esri/arcgis-maps-sdk-swift-toolkit). This deployment makes it possible to consume it via Cocoapods. No warranties, just my word of honor.
    ArcGIS Maps SDK for Swift offers an open source toolkit that contains ready-made UI components to simplify the development of mapping and GIS apps in Swift.
    DESC
    s.homepage = "https://developers.arcgis.com/swift/toolkit/"
    s.license = { :type => "Apache-2.0", :file => "LICENSE" }
    s.author = { "Esri" => "iOSDevelopmentTeam@esri.com" }
    s.source = { :git => "https://github.com/Esri/arcgis-maps-sdk-swift-toolkit.git", :tag => "200.3.0" }

    s.dependency "ArcGIS-Swift-2", "200.3.0"
    s.dependency "CoreArcGIS-Swift-2", "200.3.0"

    s.module_name = 'ArcGISToolkit'
    s.source_files = "Sources/ArcGISToolkit/**/*.swift"
    s.resource_bundles = {
        "com.esri.ArcGISToolkit" => [
            "Sources/ArcGISToolkit/Resources/**/*.{xcassets,strings}",
            "Sources/ArcGISToolkit/PrivacyInfo.xcprivacy"
        ]
    }

    s.swift_version = "5.7"

end
