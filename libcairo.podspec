Pod::Spec.new do |s|

    s.name                  = "libcairo"
    s.version               = "0.0.10"
    s.summary               = "Cairo library."
    s.homepage              = "https://github.com/igagis/cairo"
    s.license               = 'https://raw.githubusercontent.com/igagis/cairo/master/COPYING'
    s.author                = { "Cairo authors" => "cairographics.org" }
    s.platform              = :ios, "11.0"

    s.compiler_flags        = '-DCAIRO_NO_MUTEX=1', '-DHAVE_STDINT_H', '-DHAVE_UINT64_T', '-I${PODS_ROOT}/libpixman/libpixman/pixman', "-Wno-everything"

    s.public_header_files   = "libcairo/cairo/cairo-features.h",
                              "libcairo/cairo/cairo-deprecated.h",
                              "libcairo/cairo/cairo-version.h",
                              "libcairo/cairo/cairo.h"

    s.static_framework      = true

    s.source                = { :git => "https://github.com/rantingmong/svgrenderer.git", :tag => "#{s.version}" }

    s.source_files          = "libcairo/cairo/*.{h}",
                              "libcairo/cairo/{cairo-analysis-surface.c,cairo-arc.c,cairo-array.c,cairo-atomic.c,cairo-base64-stream.c,cairo-base85-stream.c,cairo-bentley-ottmann.c,cairo-bentley-ottmann-rectangular.c,cairo-bentley-ottmann-rectilinear.c,cairo-botor-scan-converter.c,cairo-boxes.c,cairo-boxes-intersect.c,cairo.c,cairo-cache.c,cairo-clip.c,cairo-clip-boxes.c,cairo-clip-polygon.c,cairo-clip-region.c,cairo-clip-surface.c,cairo-color.c,cairo-composite-rectangles.c,cairo-compositor.c,cairo-contour.c,cairo-damage.c,cairo-debug.c,cairo-default-context.c,cairo-device.c,cairo-error.c,cairo-fallback-compositor.c,cairo-fixed.c,cairo-font-face.c,cairo-font-face-twin.c,cairo-font-face-twin-data.c,cairo-font-options.c,cairo-freelist.c,cairo-freed-pool.c,cairo-gstate.c,cairo-hash.c,cairo-hull.c,cairo-image-compositor.c,cairo-image-info.c,cairo-image-source.c,cairo-image-surface.c,cairo-line.c,cairo-lzw.c,cairo-matrix.c,cairo-mask-compositor.c,cairo-mesh-pattern-rasterizer.c,cairo-mempool.c,cairo-misc.c,cairo-mono-scan-converter.c,cairo-mutex.c,cairo-no-compositor.c,cairo-observer.c,cairo-output-stream.c,cairo-paginated-surface.c,cairo-path-bounds.c,cairo-path.c,cairo-path-fill.c,cairo-path-fixed.c,cairo-path-in-fill.c,cairo-path-stroke.c,cairo-path-stroke-boxes.c,cairo-path-stroke-polygon.c,cairo-path-stroke-traps.c,cairo-path-stroke-tristrip.c,cairo-pattern.c,cairo-pen.c,cairo-polygon.c,cairo-polygon-intersect.c,cairo-polygon-reduce.c,cairo-raster-source-pattern.c,cairo-recording-surface.c,cairo-rectangle.c,cairo-rectangular-scan-converter.c,cairo-region.c,cairo-rtree.c,cairo-scaled-font.c,cairo-shape-mask-compositor.c,cairo-slope.c,cairo-spans.c,cairo-spans-compositor.c,cairo-spline.c,cairo-stroke-dash.c,cairo-stroke-style.c,cairo-surface.c,cairo-surface-clipper.c,cairo-surface-fallback.c,cairo-surface-observer.c,cairo-surface-offset.c,cairo-surface-snapshot.c,cairo-surface-subsurface.c,cairo-surface-wrapper.c,cairo-tag-attributes.c,cairo-tag-stack.c,cairo-time.c,cairo-tor-scan-converter.c,cairo-tor22-scan-converter.c,cairo-clip-tor-scan-converter.c,cairo-toy-font-face.c,cairo-traps.c,cairo-tristrip.c,cairo-traps-compositor.c,cairo-unicode.c,cairo-user-font.c,cairo-version.c,cairo-wideint.c}",
                              "libcairo/cairo-version.h"

    s.header_mappings_dir   = "libcairo/cairo"

    s.dependency            'libpixman', '~> 0.0.8'

end
