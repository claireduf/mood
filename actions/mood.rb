module Clarke
  module ActionController
    action 'ask_for_mood' do
      buttons = [
        { label: '0: Miserable, nervous', action: 'MOOD_0'},
        { label: '1: Sad, unhappy', action: 'MOOD_1'},
        { label: '2: down, worried', action: 'MOOD_2'},
        { label: '3: good, alright', action: 'MOOD_3'},
        { label: '4: happy, excited', action: 'MOOD_4'},
        { label: '5: pumped, energized', action: 'MOOD_5'}
      ]

      Clarke::Response.new(
        options[:event].sender,
        text: "How are you feeling?",
        buttons: buttons)
    end

    action 'MOOD_0' do
      Mood::Database.database[:moods].insert({
            time: Time.new,
            value: 0
            })
      [Clarke::Response.new(
        options[:event].sender,
        text: "Got it! It's marked in the books"),
      Clarke::Response.new(
        options[:event].sender,
        text: "Don't give up, you're great ;)"),
      Clarke::Response.new(
        options[:event].sender,
        text: "You may want to see some stats",
        buttons: [
          { label: "Display average", action: 'display_average' },
          { label: "Display graph", action: 'display_graph' }
        ])
      ]
    end

    action 'MOOD_1' do
      Mood::Database.database[:moods].insert({
            time: Time.new,
            value: 1
            })
      [Clarke::Response.new(
        options[:event].sender,
        text: "Got it! It's marked in the books"),
      Clarke::Response.new(
        options[:event].sender,
        text: "Take a break and it will be okay"),
      Clarke::Response.new(
        options[:event].sender,
        text: "You may want to see some stats",
        buttons: [
          { label: "Display average", action: 'display_average' },
          { label: "Display graph", action: 'display_graph' }
        ])
      ]
    end

    action 'MOOD_2' do
      Mood::Database.database[:moods].insert({
            time: Time.new,
            value: 2
            })
      [Clarke::Response.new(
        options[:event].sender,
        text: "Got it! It's marked in the books"),
      Clarke::Response.new(
        options[:event].sender,
        text: "There are dogs days sometimes"),
      Clarke::Response.new(
        options[:event].sender,
        text: "You may want to see some stats",
        buttons: [
          { label: "Display average", action: 'display_average' },
          { label: "Display graph", action: 'display_graph' }
        ])
      ]
    end

    action 'MOOD_3' do
      Mood::Database.database[:moods].insert({
            time: Time.new,
            value: 3
            })
      [Clarke::Response.new(
        options[:event].sender,
        text: "Got it! It's marked in the books"),
      Clarke::Response.new(
        options[:event].sender,
        text: "Nice!"),
      Clarke::Response.new(
        options[:event].sender,
        text: "You may want to see some stats",
        buttons: [
          { label: "Display average", action: 'display_average' },
          { label: "Display graph", action: 'display_graph' }
        ])
      ]
    end

    action 'MOOD_4' do
      Mood::Database.database[:moods].insert({
            time: Time.new,
            value: 4
            })
      [Clarke::Response.new(
        options[:event].sender,
        text: "Got it! It's marked in the books"),
      Clarke::Response.new(
        options[:event].sender,
        text: "Have a nice day!"),
      Clarke::Response.new(
        options[:event].sender,
        text: "You may want to see some stats",
        buttons: [
          { label: "Display average", action: 'display_average' },
          { label: "Display graph", action: 'display_graph' }
        ])
      ]
    end

      action 'MOOD_5' do
      Mood::Database.database[:moods].insert({
            time: Time.new,
            value: 5
            })
      [Clarke::Response.new(
        options[:event].sender,
        text: "Got it! It's marked in the books"),
      Clarke::Response.new(
        options[:event].sender,
        text: "Yeah, you rock!!!"),
      Clarke::Response.new(
        options[:event].sender,
        text: "You may want to see some stats",
        buttons: [
          { label: "Display average", action: 'display_average' },
          { label: "Display graph", action: 'display_graph' }
        ])
      ]
  end
end