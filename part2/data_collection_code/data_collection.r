install.packages("rtimes")
install.packages("Rcrawler")
# Collecting articles
library("rtimes")
library (Rcrawler)


api="4a7645206171440aa6064abf7d8a764b"
article <-article[FALSE,]
y<- as_search(q="driverless car accident", begin_date = "20160101",
              end_date = '20180406', key=api)
y1 <-y$data
article <-as.data.frame(y1[,1])

article_appended<-list()
article_appended <-ContentScraper(Url =article[1,1], XpathPatterns=c("//*/p[@class='story-body-text story-content']"), PatternsName=c("article"), ManyPerPattern = TRUE) 
article_appended.df<-as.data.frame(article_appended)
for(i in 2:nrow(article))
{
  try(DATA_sample<-ContentScraper(Url =article[i,1], XpathPatterns=c("//*/p[@class='story-body-text story-content']"), PatternsName=c("article"),ManyPerPattern = TRUE)) 
  DATA_sample.df<-as.data.frame(DATA_sample)
  article_appended.df <-rbind(article_appended.df,DATA_sample.df)
}

a1<-article_appended.df
a1[] <- lapply(a1, as.character)
a2 <-iconv(a1, "latin1", "ASCII", sub="")
a2<-as.data.frame(a2)
a2[] <- lapply(a2, as.character)
a3<-gsub('http\\S+\\s*', '', a2)
a3<-as.data.frame(a3)
a3[] <- lapply(a3, as.character)
a4<-gsub("[^[:alnum:]///' ]", "", a3)
a4<-as.data.frame(a4)
a4[] <- lapply(a4, as.character)


write.table(a4,"E:\\DIC_Lab2_data\\mr2_2018cleaned.txt",sep="\t",row.names=FALSE, col.names=FALSE)






# Collecting tweets
library (twitteR) 

consumer_key <- "UztRpM22FN9TwttMeOcnN2ZEx"
consumer_secret <- "0pfEscDYrp92dN3orQqJGJSpvbfCcEYpMvDJHh04hKonBQTkGr"
access_token <- "4431681614-93f0MxilzqIIaqLuSMBoUsirj9uofjV2VsdSExv"
access_secret <- "2CeDw53zeV8pzntYE9dKB33T2Qeq9RfzRO9pMN9OHQctH"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


tweets_lab2 <- searchTwitter("#driverless OR #selfdriving OR #selfdrivinguber",n = 4500, lang = "en")
new_tweets <- strip_retweets(tweets_lab2, strip_manual = TRUE, strip_mt = TRUE)
new_tweets.df <-twListToDF(new_tweets)
#combined <-new_tweets.df
#combined.df<-as.data.frame(combined)
combined.df <-rbind(combined.df,new_tweets.df)
combined_ND.df<-combined.df[!duplicated(combined.df), ]
#write.table(combined.df$text, "E:\\DIC_Lab2_data\\mr2_tweets_car.txt",sep="\t",row.names=FALSE, col.names=FALSE)



n1 <-combined_ND.df$text
n1<-as.data.frame(n1)
n1[] <- lapply(n1, as.character)
n2 <-iconv(n1, "latin1", "ASCII", sub="")
n2<-as.data.frame(n2)
n2[] <- lapply(n2, as.character)
n3<-gsub('http\\S+\\s*', '', n2)
n3<-as.data.frame(n3)
n3[] <- lapply(n3, as.character)
n4<-gsub("[^[:alnum:]///' ]", "", n3)
n4<-as.data.frame(n4)
n4[] <- lapply(n4, as.character)

write.table(n4, "E:\\DIC_Lab2_data\\mr_tweets_car_cleaned.txt",sep="\t",row.names=FALSE, col.names=FALSE)
