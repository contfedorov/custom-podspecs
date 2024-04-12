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
    s.source_files = "Sources/ArcGISToolkit/**/*.swift" #, "${SRCROOT}/ArcGIS-Maps-SDK-Swift-Toolkit-2/Sources/ArcGISToolkit/resource_bundle_accessor.swift"
    s.resource_bundles = {
        "arcgis-maps-sdk-swift-toolkit_ArcGISToolkit" => [
            "Sources/ArcGISToolkit/Resources/**/*.{xcassets,strings}",
            "Sources/ArcGISToolkit/PrivacyInfo.xcprivacy"
        ]
    }

	# Attempt to generate required file via shell script. File was generated and put to appropriate place,
	# but not consumed by XCode

	script = <<-SCRIPT
	touch ${DERIVED_FILE_DIR}/resource_bundle_accessor.swift
	echo "import class Foundation.Bundle
          import class Foundation.ProcessInfo
          import struct Foundation.URL

          private class BundleFinder {}

          extension Foundation.Bundle {
              /// Returns the resource bundle associated with the current Swift module.
              static let module: Bundle = {
                  let bundleName = \\"arcgis-maps-sdk-swift-toolkit_ArcGISToolkit\\"

                  let overrides: [URL]
                  #if DEBUG
                  // The 'PACKAGE_RESOURCE_BUNDLE_PATH' name is preferred since the expected value is a path. The
                  // check for 'PACKAGE_RESOURCE_BUNDLE_URL' will be removed when all clients have switched over.
                  // This removal is tracked by rdar://107766372.
                  if let override = ProcessInfo.processInfo.environment[\\"PACKAGE_RESOURCE_BUNDLE_PATH\\"]
                                 ?? ProcessInfo.processInfo.environment[\\"PACKAGE_RESOURCE_BUNDLE_URL\\"] {
                      overrides = [URL(fileURLWithPath: override)]
                  } else {
                      overrides = []
                  }
                  #else
                  overrides = []
                  #endif

                  let candidates = overrides + [
                      // Bundle should be present here when the package is linked into an App.
                      Bundle.main.resourceURL,

                      // Bundle should be present here when the package is linked into a framework.
                      Bundle(for: BundleFinder.self).resourceURL,

                      // For command-line tools.
                      Bundle.main.bundleURL,
                  ]

                  for candidate in candidates {
                      let bundlePath = candidate?.appendingPathComponent(bundleName + \\".bundle\\")
                      if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                          return bundle
                      }
                  }
                  fatalError(\\"unable to find bundle named arcgis-maps-sdk-swift-toolkit_ArcGISToolkit\\")
              }()
          }
" > ${DERIVED_FILE_DIR}/resource_bundle_accessor.swift
	SCRIPT

# ${SRCROOT}/ArcGIS-Maps-SDK-Swift-Toolkit-2/Sources/ArcGISToolkit/resource_bundle_accessor.swift
	s.script_phase = {
    	:name => 'Generate resource_bundle_accessor.swift',
    	:script => script,
    	:execution_position => :before_compile,
    	#:shell_path => '/usr/bin/ruby' # need?
    	#:output_files => ["#{product_folder}/release/SwiftyArchitectureMacros"],
    	:output_files => ["${DERIVED_FILE_DIR}/resource_bundle_accessor.swift"]
#     	:output_files => ["${SRCROOT}/ArcGIS-Maps-SDK-Swift-Toolkit-2/Sources/ArcGISToolkit/resource_bundle_accessor.swift"]
#     	:output_files => ["/Users/efedorov/Downloads/r_b_a.test_sample"]
    }

    s.swift_version = "5.7"

end
