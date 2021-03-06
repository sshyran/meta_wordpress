module MetaWordpress
  module BootstrapActions

    def copy_gem_file
      copy_file source_path('Gemfile'), 'Gemfile', :verbose => false
    end

    def copy_guard_file
      copy_file source_path('Guardfile'), 'Guardfile', :verbose => false
    end

    def create_asset_folders
      %w(javascripts stylesheets).each do |folder|
        empty_directory folder, :verbose => false
        inside folder do
          empty_directory 'source', :verbose => false
          create_file 'source/.gitkeep', :verbose => false
          empty_directory 'compiled', :verbose => false
          create_file 'compiled/.gitkeep', :verbose => false
        end
      end
    end

    def create_views_folder
      empty_directory 'views', :verbose => false
    end

    def create_view_helpers
      copy_file source_path('view_helpers.rb'), 'view_helpers.rb', :verbose => false
    end

    def copy_functions_php
      copy_file source_path('functions.php'), 'functions.php', :verbose => false
    end

    def copy_screenshot
      copy_file source_path('screenshot.png'), 'screenshot.png', :verbose => false
    end

    def copy_php_lib
      directory source_path('lib'), 'lib', :verbose => false
    end

    def ask_for_theme_details
      say "Please provide some details on the theme:"
      default_theme_name = @theme_folder.humanize
      @theme_name        = ask("Theme name (default: '#{default_theme_name}'):\n      > ")
      @theme_name        = default_theme_name if @theme_name.empty?
      @theme_uri         = ask("Theme URL:\n      > ")
      @theme_author      = ask("Author(s):\n      > ")
      @theme_author_uri  = ask("Author(s) URL:\n      > ")
      @theme_description = ask("Description:\n      > ")
      @theme_version     = ask("Version:\n      > ") || "0.1"
      @theme_license     = ask("License:\n      > ")
      @theme_license_uri = ask("License URL:\n      > ")
      @theme_tags        = ask("Tags (comma separated):\n      > ")
      @theme_text_domain = ask("Text domain:\n      > ")
    end

    def create_stylesheet
      template source_path('style.tt'), 'style.css', :verbose => false
    end

    def copy_theme
      if @skip_theme
        inside('views') { create_file('.gitkeep', :verbose => false) }
      else
        directory source_path('theme'), 'views', :verbose => false
      end
    end

  end
end
