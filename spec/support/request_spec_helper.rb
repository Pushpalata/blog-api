module RequestSpecHelper
  def parse_response
    JSON.parse(response.body)
  end
end