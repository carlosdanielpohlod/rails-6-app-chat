import consumer from "./consumer"


var selectedRoom = "geral";


consumer.subscriptions.create({channel:"RoomChannel", room:`${selectedRoom}`}, {
    constructor(){
      let rooms = document.getElementById("rooms");
      rooms.addEventListener('click', function(e) {selectedRoom = e.target.id})
    },
    connected() {
      
      console.log('conectado ao', selectedRoom)
    },
    received(data) {
      this.appendLine(data)
    },
    disconnected() {
      console.log("disconectado")
    },
    createLine(data){
  
      return `
        <div class="baloon">
          <span class="sender"><b> ${data["sender_name"]} </b></span>
          <span class="body">${data["content"]}</span>
        </div>
      `
    },
    appendLine(data) {
 
      const html = this.createLine(data)
      const element = document.querySelector("[data-chat-room='Best Room']")
      element.insertAdjacentHTML("beforeend", html)
    
    }
  });
  


