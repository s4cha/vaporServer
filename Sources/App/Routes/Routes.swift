import Vapor

extension Droplet {
    
    func setupRoutes() throws {
    
        
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            try json.set("userID", 12)
            return json
        }

        get("plaintext") { req in
            return "Hello, you!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        
        
         get("banana") { req in
            self.log.warning("o")
            self.log.error("Dayum")
            self.log.fatal("FATALLLLL")
            
            self.log.info("Informational log")
            
            let digest = try self.hash.make("vapor")
            return digest.makeString()
            
        }
        
        try resource("posts", PostController.self)
    }
}
