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

        this.fullAnswer = "";
        this.linkSet = false;
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
        this.fullAnswer += parsedData.message;
        this.currentPre.innerHTML += parsedData.message;
        this.conversationTarget.scrollTop = this.conversationTarget.scrollHeight;
        if (!this.linkSet) {
            const match = this.fullAnswer.match(/\/(movies|series|actors)\/\d+/);
    
            if (match) {
                const path = match[0];
                const fullUrl = `http://localhost:3000${path}`;
    
                this.currentPre.style.cursor = 'pointer';
                this.currentPre.onclick = () => {
                    window.open(fullUrl, '_blank');
                };
    
                this.linkSet = true;
            }
        }
    }

    #handleError(event) {
        if (event.eventPhase === EventSource.CLOSED) {
            this.eventSource.close();
        }
    }
}
