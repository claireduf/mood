module Clarke
  module RequestsBuilder
    module FallbackBuilder
      class << self
        def valid?(_event)
          true
        end

        def build_requests(event)
          Clarke::ActionRequest.new('unknown', event)
        end
      end
    end
  end
end