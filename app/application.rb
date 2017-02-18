class Application

  @@items = []

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      request = req.path.split("/items/").last

      index = @@items.index {|x| x.name == request}

      if index
        resp.write @@items[index].name + ": " + @@items[index].price.to_s
      else
        resp.write "Item not found #{request}"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
