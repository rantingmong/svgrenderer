def dependency_mikroxml(spec)

spec.subspec 'libmikroxml' do |subspec|

    subspec.dependency 'libsvgren/libutki'

    subspec.source_files            = 'libmikroxml/mikroxml/*.{cpp,hpp}'
    subspec.public_header_files     = "libmikroxml/mikroxml/*.hpp"

    subspec.header_dir              = 'mikroxml'

end

end
