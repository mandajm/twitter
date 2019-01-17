



 # ligne très importante qui appelle la gem.
 require 'twitter'
    
 require 'dotenv'

     Dotenv.load

# n'oublie pas les lignes pour Dotenv ici…

# quelques lignes qui appellent les clés d'API de ton fichier .env
client = Twitter::REST::Client.new do |config|
 config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
 config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
 config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
 config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end


p client

journalist = ["@SantatrAsf", "@RandriambaoMan1"]


   journalist.delete("@")


client.search("#learntocode", lang: "fr").take(10).each do |tweet|
   puts "#{tweet.user.screen_name}: #{tweet.text}"
   client.favorite(tweet)
   client.update("@#{tweet.user.screen_name}: #{tweet.text} Tu veux apprendre à coder GRATUITEMENT ? C'est possible avec thehackingproject.org",
       in_reply_to_status_id: tweet.id)
 end


 client.search("Web").take(15).each do |tweet|
   if tweet.user(journalists)
     client.favorite(tweet)
   end
 end
