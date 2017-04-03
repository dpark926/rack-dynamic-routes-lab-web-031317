class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item_instance = @@items.find{|i| i.name == item_name}
        resp.write item_instance.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
      # item_instance = nil
      # @@items.each do |each_instance|
      #   if each_instance.name == item_name
      #     resp.write item_instance.price
      #   else
      #     resp.status = 400
      #   end
      # end
      # resp.write item_instance.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end

# Shopping Cart Rack App Returns 404 for a bad route
#
# Shopping Cart Rack App /items Returns item price
# if it is in @@item
#
# Shopping Cart Rack App /items Returns an error and
# 400 if the item is not there

# class Application
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path=="/songs"
#       resp.write "You requested the songs"
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
#
#     resp.finish
#   end
# end
