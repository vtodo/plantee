beta = require('./beta.coffee')
class SocketClient
    constructor:->
        
        go = document.getElementById("submit")
        go.addEventListener "click", ()=>
            ws.send(document.getElementById("message").value)
            document.getElementById("message").value = ""
       
        console.log "Woah!"
        host = window.location.host
        ws = new WebSocket('ws://'+host+'/ws')
        ws.onopen = ()=>
            console.log "Connected"
        ws.onclose = ()=>
            console.log "Close"
        ws.onerror = ()=>
            console.log "Error"
        ws.onmessage = (message)=>
            document.getElementById("log").appendChild(document.createTextNode message.data)
            document.getElementById("log").appendChild(document.createElement 'br')
        

client = new SocketClient()