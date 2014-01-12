class TagSuggestions
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == "/tag_suggestions"
      request = Rack::Request.new(env)
      suggestions = Tag.suggestions_for(request.params["term"])
      [200, {"Content-Type" => "application/json"}, [suggestions.to_json]]
    else
      @app.call(env)
    end
  end
end
