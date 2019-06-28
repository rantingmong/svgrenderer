Pod::Spec.new do |spec|

    spec.name                   = "libmikroxml"
    spec.version                = "0.0.6"
    spec.summary                = "svg mikroxml"

    spec.static_framework       = true

    spec.description            = <<-DESC
            
                                  something significant and wonderful
            
                                  DESC
            
    spec.homepage               = "http://rantingmong.net"
    spec.license                = "MIT"
            
    spec.author                 = { "Michael Ong" => "michael.ong@whitecloak.com" }
    spec.platform               = :ios, '11.0'
            
    spec.source                 = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }
  
    spec.public_header_files    = "libmikroxml/mikroxml/*.hpp"
    spec.source_files           = 'libmikroxml/mikroxml/*.{hpp,mm,hxx}'

    spec.header_dir             = 'mikroxml'

    spec.pod_target_xcconfig    = { 'OTHER_CPLUSPLUSFLAGS' => [ "-std=c++17", "-stdlib=libc++", "-fcxx-modules", "$(OTHER_CFLAGS)" ] }

    spec.dependency             'libutki'   , '~> 0.0.3'
    spec.dependency             'libunikod' , '~> 0.0.6'

  end
