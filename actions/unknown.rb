module Clarke
  module ActionController
    action 'unknown' do
      user = options[:user]

      [
        Clarke::Response.new(sender, text: "Sorry, I didn't understand"),
        Clarke::Response.new(
          sender,
          text: "What do you want to do?",
          buttons: [
            { label: "Display average", action: 'display_average' },
            { label: "Display graph", action: 'display_graph' },
            { label: "Tell me about your mood", action: 'ask_for_mood'}
          ]
        )
      ]
    end
end
