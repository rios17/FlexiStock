Gem::Specification.new do |s|
  s.name        = "cancan"
  s.version     = "1.4.0.beta1"
  s.author      = "Ryan Bates"
  s.email       = "ryan@railscasts.com"
  s.homepage    = "http://github.com/ryanb/cancan"
  s.summary     = "Simple authorization solution for Rails."
  s.description = "Simple authorization solution for Rails which is decoupled from user roles. All permissions are stored in a single location."

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"]
  s.require_path = "lib"

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
