module Clarke::RequestsBuilder::DisplayBuilder
  class << self
    def valid? (event)
      event.class.include?(Clarke::Events::TextMessage) && ['/average', '/graph'].include?(event.text)
    end

    def build_requests (event)
      action = case event.text
                when '/average'
                  'display_average'
                when '/graph'
                  'display_graph'
                end
      [Clarke::ActionRequest.new(action, event)]
    end
  end
end