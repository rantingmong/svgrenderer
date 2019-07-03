Pod::Spec.new do |s|
    s.name                  = "libsvgren"
    s.version               = "0.0.10"
    s.summary               = "C++ cross-platform SVG render library."
    s.homepage              = "https://github.com/igagis/svgren"
    s.license               = 'MIT'
    s.author                = { "Ivan Gagis" => "igagis@gmail.com" }
    s.platform              = :ios, "11.0"

    s.static_framework      = true

    s.source                = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => s.version }

    s.source_files          = "libsvgren/svgren/*.{hpp,hxx,cpp}"
    s.header_mappings_dir   = "libsvgren/svgren"

    s.header_dir            = 'svgren'

    s.dependency 'libsvgdom', '~> 0.0.8'
    s.dependency 'libcairo' , '~> 0.0.9'
end
