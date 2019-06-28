Pod::Spec.new do |spec|

    spec.name                   = "libutki"
    spec.version                = "0.0.3"
    spec.summary                = "svg utki"
            
    spec.description            = <<-DESC
            
                                  something significant and wonderful
            
                                  DESC
            
    spec.homepage               = "http://rantingmong.net"
    spec.license                = "MIT"
            
    spec.author                 = { "Michael Ong" => "michael.ong@whitecloak.com" }
    spec.platform               = :ios, '11.0'
            
    spec.source                 = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }
  
    spec.public_header_files    = "libutki/utki/*.hpp"
    spec.source_files           = 'libutki/utki/*.hpp'

    spec.header_dir             = 'utki'

  end
  