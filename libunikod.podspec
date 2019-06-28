Pod::Spec.new do |spec|

    spec.name                   = "libunikod"
    spec.version                = "0.0.5"
    spec.summary                = "svg unikod"

    spec.static_framework       = true

    spec.description            = <<-DESC
            
                                    something significant and wonderful
            
                                    DESC
            
    spec.homepage               = "http://rantingmong.net"
    spec.license                = "MIT"
            
    spec.author                 = { "Michael Ong" => "michael.ong@whitecloak.com" }
    spec.platform               = :ios, '11.0'
            
    spec.source                 = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }

    spec.public_header_files    = "libunikod/unikod/*.hpp"
    spec.source_files           = 'libunikod/unikod/*.{hpp,mm,hxx}'

    spec.pod_target_xcconfig    = { 'OTHER_CPLUSPLUSFLAGS' => [ "-std=c++17", "-stdlib=libc++", "-fcxx-modules", "$(OTHER_CFLAGS)" ] }


    spec.dependency             'libutki', '~> 0.0.3'

end
