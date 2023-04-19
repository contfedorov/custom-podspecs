Pod::Spec.new do |s|
    s.name = "CoreArcGIS-Swift-2"
    s.platform = :ios, '15.0'
    s.version = "200.0.0-beta"    
    s.summary = "An unofficial deployment of Core ArcGIS Swift Beta to Cocoapods."
    s.description = <<-DESC
    Currently ArcGIS Maps SDK for Swift Beta is available only as SwiftPM package (https://github.com/Esri/arcgis-maps-sdk-swift). This pod makes it possible to consume it via Cocoapods. Works in conjunction with 'ArcGIS-Swift-2' pod (same repo). No warranties, just my word of honor.
    With ArcGIS you can: Create thematic interactive 2D maps & 3D scenes that allow your users to explore and understand their geographic data.\nSearch for places and addresses and display them on your map.\nGenerate directions, optimal routes and calculate drive time areas.\nChoose from a collection of ready-to-use basemaps, demographic maps, and imagery and make interactive maps with your data.\nEnrich your existing data with demographic variables for a given study area.\nAnalyze your data spatially to detect patterns, assess trends, and make decisions.\nAccess ArcGIS Online image services (basemap, multispectral, event and temporal) to visualize and analyze change.\nCreate custom REST endpoints to store and visualize your content.\nTake your maps and data offline to view, edit, search and find routes. And much more...
    DESC
    s.homepage = "https://developers.arcgis.com/swift/"
    s.license = { :type => 'Commercial' }
    s.author = { "Esri" => "iOSDevelopmentTeam@esri.com" }

    s.source = {
        :http => "https://gisupdates.esri.com/ArcGIS_MapsSDK/200.0.0/CoreArcGIS-Swift-v200.0.xcframework.zip",
        :sha256 => "620bd5af91896aa2ac5051bca077fc668b02cfea80fa15f8a3a326976dfa8870"
    }

    s.vendored_frameworks = "CoreArcGIS.xcframework"
        
    s.swift_version = "5.7"
    
end