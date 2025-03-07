// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "search";

document.addEventListener("DOMContentLoaded", function() {
  const openSearchBar = document.querySelector("#searchButton");
  const searchField = document.querySelector(".searchBar");
  const closeChatButton = document.querySelector(".chatCloseIcon")
  const openChatButton = document.querySelector(".chatOpenContainer")
  const chatBox = document.querySelector(".chatContainer")

  openSearchBar.addEventListener("click", () => {
    searchField.classList.toggle("active");
  });

  document.querySelectorAll(".rating input").forEach(input => {
      input.addEventListener("change", function() {
          console.log("Selected rating:", this.value);
      });
  });

  closeChatButton.addEventListener("click", ()=>{
    chatBox.style.display = "none"
    openChatButton.style.display = "flex"
  })

  openChatButton.addEventListener("click", ()=>{
    chatBox.style.display = "flex"
    openChatButton.style.display = "none"
  })

});
