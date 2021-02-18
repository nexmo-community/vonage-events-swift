import Vapor

func routes(_ app: Application) throws {
    let socketController = SocketController()
    
    app.get("") { req in
        return req.view.render("index")
    }
    
    app.get(":appId") { req -> EventLoopFuture<Vapor.View> in
        return req.view.render("app", ["appId": req.parameters.get("appId")!])
    }
    
    app.post(":appId", "clear") { (req) -> String in
        let appId = req.parameters.get("appId")!
        socketController.clearBacklog(for: appId)
        return appId
    }

    app.webSocket("ws",":appId") { req, ws in
        let appId = req.parameters.get("appId")!
        
        ws.onClose.whenComplete { _ in
            socketController.removeSocket(with: appId)
        }
        
        let socket = Socket(appId: appId, ws: ws)
        socketController.addSocket(socket)
    }

    app.post(":appId") { (req) -> String in
        let appId = req.parameters.get("appId")!
        socketController.sendSocketMessage(with: appId, message: req.body.string ?? "")
        return appId
    }
}
