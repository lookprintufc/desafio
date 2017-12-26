# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

#CSS
Rails.application.config.assets.precompile += %w( login.css dashboard.css )
#JS
Rails.application.config.assets.precompile += %w( login.js dashboard.js dashboard_footer.js )
