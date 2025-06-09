// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import { initAnimations } from "case_study_animations";

document.addEventListener("turbo:load", () => {
  if (document.body.dataset.controller === "projects" &&
      (document.body.dataset.action === "show" || document.body.dataset.action === "show_partial")) {
    initAnimations();
  }
});
