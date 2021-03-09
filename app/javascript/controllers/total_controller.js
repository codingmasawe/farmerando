import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'result' ];

  connect() {
    console.log(this.resultTarget);
  }

  refresh() {
    console.log("Hello");
  }
}
