xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Watchtower"
    xml.description "Logged exceptions"
    xml.link watchtower_index_url

    for watched_exception in @watched_exceptions
      xml.item do
        xml.title watched_exception.name
        xml.description watched_exception.message
        xml.pubDate watched_exception.created_at.to_s(:rfc822)
        xml.link watchtower_url(watched_exception)
        xml.guid watchtower_url(watched_exception)
      end
    end
  end
end