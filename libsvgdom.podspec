Pod::Spec.new do |s|
    s.name                  = "libsvgdom"
    s.version               = "0.0.8"
    s.summary               = "C++ cross-platform SVG DOM library."
    s.homepage              = "https://github.com/igagis/svgdom"
    s.license               = 'MIT'
    s.author                = { "Ivan Gagis" => "igagis@gmail.com" }
    s.platform              = :ios, "11.0"
    
    s.static_framework      = true

    s.source                = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => s.version }
  
    s.source_files          = "libsvgdom/**/*.{hpp,hxx,cpp}"
    s.header_mappings_dir   = "libsvgdom"

    s.header_dir            = 'svgdom'

    s.dependency            'libutki'       , '~> 0.0.3'
    s.dependency            'libpapki'      , '~> 0.0.8'
    s.dependency            'libmikroxml'   , '~> 0.0.6'
  end
