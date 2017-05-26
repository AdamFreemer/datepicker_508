require 'rails/generators/base'

class DatepickerGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  def modify_application_js
    js_file
    assets = ['datepicker', 'jquery.mask']
    assets.each do |asset|
      if File.open(js_root_path + js_file).grep(/(\/\/= require #{asset})/).size > 0
        puts "//= require #{asset} already exists in #{js_file}..."
      else
        open(js_root_path + js_file, 'a') do |file|
          file << "//= require #{asset}\n"
        end
        puts "//= require #{asset} added to #{js_file}..."
      end
    end
  end

  def modify_application_css
    style_file
    text = File.read(style_root_path + style_file) unless style_file.nil?
    if File.readlines(style_root_path + style_file).grep(/(\*\= require datepicker)/).size > 0
      puts "*= require datepicker already exists in #{style_file}..."
    else
      if File.readlines(style_root_path + style_file).grep(/(\*\= require_tree \.)/).size > 0
        new_file_contents = text.gsub(/(\*\= require_tree \.)/, "*= require datepicker\n *= require_tree .")
      else
        new_file_contents = text.gsub(/(\*\/)/, " *= require datepicker\n*/")
      end
      File.open(style_root_path + style_file, "w") { |file| file.puts new_file_contents }
      puts "*= require datepicker added to #{style_file}..."
    end
  end

  def finish
    puts "Done."
  end

  private

  def style_file
    css = 'application.css'
    scss = 'application.scss'
    if File.file?(style_root_path + css)
      css
    elsif File.file?(style_root_path + scss)
      scss
    else
      nil
    end
  end

  def js_file
    js = 'application.js'
    File.file?(js_root_path + js) ? js : nil
  end

  def style_root_path
    'app/assets/stylesheets/'
  end

  def js_root_path
    'app/assets/javascripts/'
  end
end
