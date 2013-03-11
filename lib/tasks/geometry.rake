# namespace :paperclip do
#   task :geometry => :environment do
#     Product.all.each do |product|
#       puts "Processing #{product.name}"
#       sizes = Hash.new
#       product.icon.styles.keys.each do |style|
#         icon_path = File.join(Rails.public_path, product.icon.url(style))
#         if File.exist? icon_path
#           geo = ::Paperclip::Geometry.from_file icon_path
#           sizes[style] = geo.to_s
#           puts "  #{style} = #{geo.to_s}"
#         end
#       end
#       product.icons_geometry = sizes.to_json
#     end
#   end
# end
