import Vapor

struct Socket {
    let appId: PathComponent
    let ws: WebSocketKit.WebSocket
    
    init(appId: String, ws: WebSocketKit.WebSocket) {
        self.appId = PathComponent(stringLiteral: appId)
        self.ws = ws
    }
}

final class SocketController {
    var sockets: [Socket] = []

    func addSocket(_ socket: Socket) {
        self.sockets.append(socket)
    }
    
    func removeSocket(with appIdString: String) {
        self.sockets.removeAll { $0.appId.description == appIdString }
    }

    func sendSocketMessage(with appIdString: String, message: String) {
        let socket = sockets.first { $0.appId.description == appIdString }!
        socket.ws.send(message)
    }
}
