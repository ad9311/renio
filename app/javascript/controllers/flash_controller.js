import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["notice", "alert", "noticeText", "alertText"];

  time = 3000;

  toggleAlert() {
    this.alertTarget.classList.toggle("hidden");
  }

  toggleNotice() {
    this.noticeTarget.classList.toggle("hidden");
  }

  connect() {
    if (this.noticeTextTarget.innerHTML) {
      this.toggleNotice();
      setTimeout(() => {
        this.toggleNotice();
      }, this.time);
    }

    if (this.alertTextTarget.innerHTML) {
      this.toggleAlert();
      setTimeout(() => {
        this.toggleAlert();
      }, this.time);
    }
  }
}
