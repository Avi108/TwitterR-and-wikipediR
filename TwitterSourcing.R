####### Twitter Data Collection ##################

require("twitteR")   
#Connect with Twitter API using below 
options(httr_oauth_cache=T)
consumer_key    = 'CQBoP5DpPJ0HafzjiO9AiuQRZ'
consumer_secret = 'eiy1li8WZqG1doTwf2M4w0t2z3K1i8d5Y3J0I2yiR8dqia5Gi1'
access_token    = '2491122936-KMUnMRsxJSXkJQdIBD2tp2a4TZhCF0RrVWiUroH'
access_secret   = 'zI0oHtpYIpjka8i73IF4kdy8apvgaPe3phgZEBF95zh35'
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

#Search Twitter with any string as 'search.string' 
search.string = "kk_Avi"
data=searchTwitter(search.string,lang="en",resultType="recent",n=200)
str(data)
data <- do.call("rbind", lapply(data, as.data.frame))
str(data)
View(data)
#################################################

#Fetch Wikipedia
library(devtools)
install.packages("dplyr")
install_github("Ironholds/WikipediR")
library(WikipediR)
library(tm.plugin.webmining)
library(stringr)

#Get Wikipedia content
wp_content <- page_content("en","wikipedia",
                           page_name = "India_national_cricket_team")


html <- wp_content$parse$text

#Parse HTML
text=extractHTMLStrip(html)
text=str_replace_all(text,"\n", " ")
text=data.frame(text)