require 'open-uri'

Work.destroy_all

# Get the MIT Complete Works of WS landing page
doc = Nokogiri::HTML(open(SHAKESPEARE_WORKS_SOURCE))
works = []

# Get all the links 
doc.css("table").css("a").each do |link|
  # Remove some characters we don't want
  name = link.children.text.gsub("\n","")
  # Get the URL of the work
  url  = link.attributes['href'].value

  # Filter out external links
  if !url.include?("http")
    # If we're not accessing a poem (i.e. a play),
    # we need to go one level farther down the 
    # tree to get the full play
    if !url.include?("Poetry")
      url.gsub!("index","full")
    end

    url = "#{SHAKESPEARE_WORKS_SOURCE}/#{url}"
    # Go get the html source of the work
    Work.create(html: open(url).read, url: url, name: name)
  end
end