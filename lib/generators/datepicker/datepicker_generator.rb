require 'rails/generators/base'

class DatepickerGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  def modify_application_js
    js_file
    assets = ['datepicker', 'jquery.mask']
    file = File.open(js_root_path + js_file, 'a')
    file << "\n"
    assets.each do |asset|
      if asset_already_required_in_manifest?(asset, js_file, js_root_path)
        puts "#{check_last_line_is_blank}//= require #{asset} already exists in #{js_file}..."
      else
        file << "//= require #{asset}\n"
        puts "//= require #{asset} added to #{js_file}..."
      end
    end
    file.close
  end

  def modify_application_css
    if asset_already_required_in_manifest?('datepicker', style_file, style_root_path)
      puts "*= require datepicker already exists in #{style_file}..."
    else
      require_tree_exists? ? content_to_add = include_tree?(true) : content_to_add = include_tree?(false)
      File.open(style_root_path + style_file, "w") { |file| file.puts content_to_add }
      puts "*= require datepicker added to #{style_file}..."
    end
  end

  def finish
    puts "Done."
  end

  private

  def require_tree_exists?
    File.readlines(style_root_path + style_file).grep(/(\*\= require_tree \.)/).size > 0
  end

  def include_tree?(exists)
    if exists
      text.gsub(/(\*\= require_tree \.)/, "*= require datepicker\n *= require_tree .")
    else
      text.gsub(/(\*\/)/, " *= require datepicker\n*/")
    end
  end

  def text
    File.read(style_root_path + style_file) unless style_file.nil?
  end

  def style_file
    css_file = 'application.css'
    scss_file = 'application.scss'
    return css if File.file?(style_root_path + css_file)
    File.file?(style_root_path + scss_file) ? scss_file : nil
  end

  def js_file
    js_file = 'application.js'
    File.file?(js_root_path + js_file) ? js_file : nil
  end

  def style_root_path
    'app/assets/stylesheets/'
  end

  def js_root_path
    'app/assets/javascripts/'
  end

  def asset_already_required_in_manifest?(asset, file, path)
    file_to_check = File.open(path + file, "r")
    if file.include? "js"
      file_to_check.grep(/(\/\/= require #{asset})/).size > 0
    elsif file.include? "css"
      file_to_check.grep(/(\*\= require #{asset})/).size > 0
    end
  end
end
