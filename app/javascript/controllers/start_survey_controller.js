import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["intro_message", "template_message", "start_button"];

  start(event) {
    this.hide_start_button(event)
    this.send_start(event)
  }

  send_start(event){
    var content = this.template_messageTarget.innerHTML
    this.intro_messageTarget.insertAdjacentHTML("afterend", content);
  }

  hide_start_button(event){
    this.start_buttonTarget.classList.add("hidden");
  }

}
