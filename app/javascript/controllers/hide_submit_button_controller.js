import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["submit_button"];

  hide_submit_button(event) {
    this.submit_buttonTarget.classList.add("hidden");
  }
}
