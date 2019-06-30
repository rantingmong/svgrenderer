Pod::Spec.new do |spec|

    spec.name                   = "libpapki"
    spec.version                = "0.0.8"
    spec.summary                = "svg papki"

    spec.static_framework       = true

    spec.description            = <<-DESC
            
                                  something significant and wonderful
            
                                  DESC
            
    spec.homepage               = "http://rantingmong.net"
    spec.license                = "MIT"
            
    spec.author                 = { "Michael Ong" => "michael.ong@whitecloak.com" }
    spec.platform               = :ios, '11.0'
            
    spec.source                 = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }
  
    spec.public_header_files    = "libpapki/papki/*.hpp"
    spec.source_files           = 'libpapki/papki/*.{hpp,mm,hxx}'

    spec.header_dir             = 'papki'

    spec.pod_target_xcconfig    = { 'OTHER_CPLUSPLUSFLAGS' => [ "-std=c++17", "-stdlib=libc++", "-fcxx-modules", "$(OTHER_CFLAGS)" ] }

    spec.dependency             'libutki'   , '~> 0.0.3'

  end
