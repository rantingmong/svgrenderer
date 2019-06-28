Pod::Spec.new do |spec|

    spec.name                   = "libunikod"
    spec.version                = "0.0.3"
    spec.summary                = "svg unikod"
            
    spec.compiler_flags         = "-std=c++17", "-stdlib=libc++"

    spec.description            = <<-DESC
            
                                    something significant and wonderful
            
                                    DESC
            
    spec.homepage               = "http://rantingmong.net"
    spec.license                = "MIT"
            
    spec.author                 = { "Michael Ong" => "michael.ong@whitecloak.com" }
    spec.platform               = :ios, '11.0'
            
    spec.source                 = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }

    spec.public_header_files    = "libunikod/unikod/*.hpp"
    spec.source_files           = 'libunikod/unikod/*.{hpp,cpp,mm,hxx}'

    spec.header_dir             = 'unikod'

    spec.dependency             'libutki', '~> 0.0.3'

end
