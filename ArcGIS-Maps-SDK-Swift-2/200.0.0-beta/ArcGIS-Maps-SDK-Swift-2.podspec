Pod::Spec.new do |s|
    s.name = "ArcGIS-Maps-SDK-Swift-2"
    s.platform = :ios, '15.0'
    s.version = "200.0.0-beta"    
    s.summary = "An unofficial deployment of ArcGIS Maps SDK for Swift Beta to Cocoapods."
    s.description = <<-DESC
    Currently ArcGIS Maps SDK for Swift Beta is available only as SwiftPM package (https://github.com/Esri/arcgis-maps-sdk-swift). This deployment makes it possible to consume it via Cocoapods. No warranties, just my word of honor.
    With ArcGIS you can: Create thematic interactive 2D maps & 3D scenes that allow your users to explore and understand their geographic data.\nSearch for places and addresses and display them on your map.\nGenerate directions, optimal routes and calculate drive time areas.\nChoose from a collection of ready-to-use basemaps, demographic maps, and imagery and make interactive maps with your data.\nEnrich your existing data with demographic variables for a given study area.\nAnalyze your data spatially to detect patterns, assess trends, and make decisions.\nAccess ArcGIS Online image services (basemap, multispectral, event and temporal) to visualize and analyze change.\nCreate custom REST endpoints to store and visualize your content.\nTake your maps and data offline to view, edit, search and find routes. And much more...
    DESC
    s.homepage = "https://developers.arcgis.com/swift/"
    s.license = { :type => 'Commercial' }
    s.author = { "Esri" => "iOSDevelopmentTeam@esri.com" }

    s.source = {
        :http => "https://github.com/contfedorov/ArcGIS-Maps-SDK-Swift-2-Distribution/releases/download/200.0.0-beta/ArcGIS-Maps-SDK-Swift-2-Distribution-200.0.0.Beta.zip"
    }

    s.vendored_frameworks = "ArcGIS.xcframework", "CoreArcGIS.xcframework"
        
    s.swift_version = "5.7"
    
end