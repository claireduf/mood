module Clarke::ActionController
  action 'display_average'
    avg = Mood::Database.database[:moods].where(:messenger_id => options[:event].sender).avg(:value).to_f.round(2)
    Clarke::Response.new(
      options[:event].sender,
      text: "The average rate is: #{avg}")
  end

  action 'display_graph'
    file = Tempfile.new("graph")
    file_path = "#{file.path}.png"
    moods = Mood::Database.database[:moods].where(:messenger_id => options[:event].sender)

    g = Gruff::Line.new
    g.title = "Your mood"
    g.theme = {
      background_colors: %w(#eeeeee #eeeeee),
      background_direction: :top_bottom,
      }
    g.data(:mood, moods.collect { |m| m[:value] })
    g.write(file_path)

    Clarke::Response.new(
      options[:event].sender,
      image: Faraday::UploadIO.new(file_path, 'image/png')
  end
end