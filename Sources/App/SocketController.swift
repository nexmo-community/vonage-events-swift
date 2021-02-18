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
    var backlog: [String: [String]] = [:]

    func addSocket(_ socket: Socket) {
        self.sockets.append(socket)
    }
    
    func removeSocket(with appIdString: String) {
        self.sockets.removeAll { $0.appId.description == appIdString }
    }

    func sendSocketMessage(with appIdString: String, message: String) {
        if let socket = sockets.first(where: { $0.appId.description == appIdString }) {
            if let backlogMessages = backlog[appIdString] {
                for backlogMessage in backlogMessages {
                    socket.ws.send(backlogMessage)
                    backlog[appIdString] = nil
                }
            }
            socket.ws.send(message)
        } else {
            var backlogMessages: [String] = backlog[appIdString] ?? []
            backlogMessages.append(message)
            backlog[appIdString] = backlogMessages
        }
    }
}
