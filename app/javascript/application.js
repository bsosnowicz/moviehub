// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "search";

document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".rating input").forEach(input => {
      input.addEventListener("change", function() {
        console.log("Selected rating:", this.value);
      });
    });
  });