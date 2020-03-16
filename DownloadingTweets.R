## Simple code to download thousands of tweets. 

library(rtweet)
# Visit this link to get your own API access: https://developer.twitter.com/

# Your twitter app name
appname <- "ExampleName"

## api key (please copy from twitter)
key <- "ABCDEFGH"

## api secret (please copy from twitter)
secret <- "ABCDEFGH2345678"

twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret,
  access_token = "14525356-abcdefgh",# copy this info from twitter
  access_secret = "abcdefghijk") #copy this info from twitter

#The below code can take a while depending on "n"; up to 18000 tweets it is pretty fast 
df_tweets <- search_tweets(q = "#bitcoin", #Use the hashtag you want to explore
                           n = 1000000, retryonratelimit=TRUE) #retryonratelimit is the magic variable. It should be set to TRUE to download a large amount of tweets.
#convert to character
df_tweets = data.frame(lapply(df_tweets, as.character), stringsAsFactors=FALSE)

#Save your data for future
write.csv(df,"BTCTwitter.csv")
