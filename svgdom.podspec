Pod::Spec.new do |spec|

  spec.name                 = "libsvgdom"
  spec.version              = "0.0.1"
  spec.summary              = "svgdom, c++ svg parser."

  spec.description          = <<-DESC

  SVG DOM parser written in C++ by igagis.

                              DESC

  spec.homepage             = "http://rantingmong.net"

  spec.license              = "MIT"
 
  spec.author               = { "Michael Ong" => "michael.ong@whitecloak.com" }
  spec.platform             = :ios, '11.0'

  spec.static_framework     = true

  spec.source               = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }

  spec.source_files         = 'libsvgdom/**/*.{cpp,hpp}'

  spec.public_header_files  = 'libsvgdom/**/*.hpp'
  spec.header_mappings_dir  = 'libsvgdom'

  spec.xcconfig             = {
    'HEADER_SEARCH_PATHS' => [ '$(SRCROOT)/../libunikod', '$(SRCROOT)/../libmikroxml', '$(SRCROOT)/../libpapki', '$(SRCROOT)/../libutki' ]
  }

end
