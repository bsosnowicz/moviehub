import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["prompt", "conversation"];

    disconnect() {
        if (this.eventSource) {
            this.eventSource.close();
        }
    }

    generateResponse(event) {
        event.preventDefault();

        this.#createMessageBlock(this.promptTarget.value, 'chatMessagePrompt');
        this.currentPre = this.#createMessageBlock('', 'chatMessageAnswer', true);

        this.#setupEventSource();
        this.promptTarget.value = "";
    }

    #createMessageBlock(messageText, messageClass, addIcon = false) {
        const liElement = document.createElement('li');
        liElement.classList.add('chatMessageContainer');
    
        if (addIcon) {
            const icon = document.createElement('img');
            icon.src = "/assets/chat-ddaa28e1.svg";
            icon.classList.add('chatIcon');
            liElement.appendChild(icon);
        }
    
        const preElement = document.createElement('pre');
        preElement.classList.add(messageClass);
        preElement.innerHTML = messageText;
    
        liElement.appendChild(preElement);
        this.conversationTarget.appendChild(liElement);
    
        return preElement;
    }

    #setupEventSource() {
        this.eventSource = new EventSource(`/search_responses?query=${encodeURIComponent(this.promptTarget.value)}`);
        this.eventSource.addEventListener("message", this.#handleMessage.bind(this));
        this.eventSource.addEventListener("error", this.#handleError.bind(this));
    }

    #handleMessage(event) {
        const parsedData = JSON.parse(event.data);
        this.currentPre.innerHTML += parsedData.message;
        this.conversationTarget.scrollTop = this.conversationTarget.scrollHeight;
    }

    #handleError(event) {
        if (event.eventPhase === EventSource.CLOSED) {
            this.eventSource.close();
        }
    }
}
