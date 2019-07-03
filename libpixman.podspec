Pod::Spec.new do |spec|

    spec.name                   = "libpixman"
    spec.version                = "0.0.11"
    spec.summary                = "svg pixman"

    spec.static_framework       = true

    spec.description            = <<-DESC
            
                                    something significant and wonderful
            
                                    DESC
            
    spec.homepage               = "http://rantingmong.net"
    spec.license                = "MIT"
            
    spec.author                 = { "Michael Ong" => "michael.ong@whitecloak.com" }
    spec.platform               = :ios, '11.0'
            
    spec.source                 = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{spec.version}" }

    spec.public_header_files    = "libpixman/pixman/config.h",
                                  "libpixman/pixman/pixman.h",
                                  "libpixman/pixman/pixman-version.h"

    spec.source_files           = "libpixman/**/pixman-{access-accessors.c,access.c,arm-asm.c,arm-neon.c,arm-simd.c,arm.c,bits-image.c,combine-float.c,combine32.c,conical-gradient.c,edge-accessors.c,edge.c,fast-path.c,filter.c,general.c,gradient-walker.c,image.c,implementation.c,linear-gradient.c,matrix.c,mips.c,noop.c,ppc.c,radial-gadient.c,region16.c,region32.c,solid-fill.c,timer.c,trap.c,utils.c,x86.c}",
                                  "libpixman/**/pixman.c",
                                  "libpixman/**/pixman-*.h",
                                  "libpixman/**/config.h",
                                  "libpixman/pixman/pixman.h"

    spec.preserve_paths         = "libpixman/pixman/pixman-region.c"

    spec.header_mappings_dir    = "libpixman/pixman"

    spec.header_dir             = 'pixman'

    spec.compiler_flags         = "-DHAVE_CONFIG_H", "-Wno-everything"

end
