// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@rails/ujs"  // Import UJS
import "bootstrap" // Import Bootstrap
import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = true;  // Disable Turbo globally
