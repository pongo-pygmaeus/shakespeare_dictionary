require 'open-uri'

Work.destroy_all
Word.destroy_all

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
    work = Work.create(html: open(url).read, url: url, name: name)
    p "Seeding #{work.name} data"
  end
end

Work.all.each do |work|

  p "Seeding words from #{work.name}"
  html = Nokogiri::HTML(open(work.url))
  raw_words = html.text
                  .downcase
                  .gsub(/[^a-z0-9'\s]/i, '')
                  .gsub("\n"," ")
                  .gsub(/\s+/," ")
                  .split
              
  raw_words.each do |raw_word|
    # Remove possessives
    raw_word.gsub("'s","")
    word = Word.find_or_create_by(word: raw_word)
    word.increment(:word_count)
    word.save
    work.words << word

    words_work = WordsWork.find_by(word_id: word.id, work_id: work.id).increment(:word_count)
    words_work.save

    p word

  end

end

