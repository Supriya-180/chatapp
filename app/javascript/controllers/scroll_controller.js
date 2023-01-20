import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

    connect() {
        console.log("Connected");
        const messages = document.getElementById("messages");
        messages.addEventListener("DOMNodeInserted", this.resetScroll);
        this.resetScroll(messages);
    }

    disconnect() {
        console.log("Disconnect");
    }

    resetScroll() {
        messages.scrollTop = messages.scrollHeight - messages.clientHeight;
    }
}





// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
// 	/* on start */
// 	 connect() {
//         this.element.scrollIntoView()
        
//     }

// 	// /* on stop */
// 	// disconnect() {
// 	// 	console.log("disconnected");
// 	// }

// 	// 	/* custom method */
// 	// resetScroll() {
// 	// 	debugger
// 	// 	messages.scrollTop = messages.scrollHeight - messages.clientHeight;
// 	// }
// }