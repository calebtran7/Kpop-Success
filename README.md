# “Oh my Oh my God” - An Exploration on the Success of K-Pop Groups 


Source: 뜨레모아

By: Katherine Huynh (Project Lead), Disha Beeraladinni, Sumedha Goyal, Tommy Tan, Caleb Tran

## Introduction

	Recently, it has become almost impossible to open up TikTok without encountering some type of K-Pop related post. Whether it be JYP’s Groove Back, Seventeen’s Fighting, or Le Sserafim’s Antifragile, users are almost guaranteed to be exposed to K-Pop. 
	However, with each K-Pop group’s seemingly instantaneous climb to success, one cannot help but wonder why there are certain groups that are able to succeed after two songs while other, more experienced groups are unable to. Perhaps, these K-Pop group’s success is based on some secret mixture of visuals, dancing, and singing. Or, perhaps it’s just simply luck. 
	To this end, our group set out to investigate what variables could constitute the success of K-Pop groups. 

#Data Processing 
Our team utilized and cleaned 3 datasets. First, we used Spotify’s API to gather data about the top 10 groups on Spotify (BTS, Blackpink, Twice, Stray Kids, Seventeen, Tomorrow by Together, (G)-I-DLE, Red Velvet, and Enhypen) and New Jeans from February 2023; we decided to include New Jeans as well because of their recent rise in popularity. From Spotify, we collected a variety of data on every song under each band’s discography such as the danceability, energy, duration, tempo, etc. However, one problem we encountered was that there are many groups that released a song multiple times in repackage albums or as a digital single. To account for this factor, we eliminated as many duplicates as possible. Additionally, we also utilized Kworb’s collection of the top 300 most viewed K-Pop songs on Youtube from February 2023. Lastly, we utilized censuses on r/kpop by various users, such as u/alleybetwixt and u/hubwub. 


## Exploratory Data Analysis 

Figure 1 
 


In figure 1, the graph represents how much of the top 10 spotify groups (from BTS as number 1 to Red Velvet as number 10 in a counterclockwise direction) dominate the top 300 for Kpop youtube videos. As a side note, Enhypen and New Jeans do not compose any element in the graphs because of how recent these two groups are. Specifically, with Enhypen debuting in 2020 and New Jeans in 2022, these two groups have not had enough time to grow their fanbase and enter the top 300 songs as the other groups in the pie chart. 

Aside from this, we can find that the top 10 compose about fifty percent of the top 300 kpop songs on Youtube. We can also note that girl groups tend to take a slightly bigger proportion of the top 300 songs compared to boy groups. This comparison becomes more evident when we subtract the outlier of BTS and Blackpink. 

One possible explanation for this phenomenon is that girl groups, in having higher Youtube streams than boy groups, have a higher emphasis on visual factors over sound quality compared to their male counterparts. 

We were able to arrive at this conclusion based on how, if K-Pop groups’ success had no correlation with visuals, their audio streams on Spotify would match their Youtube views. But, since girl groups tend to have higher Youtube streams than boys, we can conclude that there seems to be some correlation between visual aesthetics and the success of girl groups. Therefore, whether it be the aesthetics of the music video, outfits, or physical appearance, there seems to be some inherent factor of visuals that affect the success of K-Pop girl groups, a variable that does not seem to be as widespread amongst boy groups. 


Figure 2 

Looking at the top groups in Spotify leads us to wonder which groups of people make up the listeners of Kpop groups. To do this, we scraped through the past censuses on r/kpop by users u/alleybetwixt, u/hubwub, etc. Our results are displayed in this line graph below. Based on the figure, we can conclude that there is an increasing number of LGBTQ+ people in the Kpop community, specifically those who identify as bisexual. In 2015, about 80% of the fans identified as straight, but in the most recent 2022 census, that number has dropped to below 60%.  This uptick in LGBTQ+ fans in the Kpop community signifies them feeling more accepted, or seen in Korean media. An example of this is how masculinity is perceived in Korea. Many fans ship members in the same group, which are not usually co-ed. In addition to this, Kpop music videos display gender fluidity, and men are many times portrayed as soft and feminine, not always very masculine, as in Western media. These trends in Korean media and the census itself show that Kpop may make people in the LGTBQ+ community feel accepted, even though Korea itself can have conservative views on sexuality.

Although the graph shows a big increase in the number of LGBTQ+ fans in the Kpop-community, the data is biased towards non-Americans, because the census was taken from r/kpop users on Reddit, which is an American social media platform. It does not accurately represent international K-pop fans. In addition to this, because of inconsistencies of question responses, not every sexuality is displayed, and numbers had to be left out. The data was not taken from a random sample, so there is volunteer bias, and not everyone that is even active in r/kpop participated in the census. The graph may also inaccurately represent those who are still unsure of their sexuality, possibly leading to lower numbers of LGTBQ+ fans.


Figure 3 


We wish to compare the average track statistics amongst the top 11 K-Pop groups in 2023  using the help of Tableau and Python. The 4 track statistics we examined include: danceability, liveliness, energy, and acousticness. Danceability is measured on a scale from 0.0 to 1.0 indicating how well-suited the K-Pop track is for dancing, taking into account of tempo, rhythm, strength of beat, and overall consistency. Energy measures the intensity and activity of the track in order to get a fast feel track. e Acousticness is the confidence measure of a scale from 0.0 to 1.0 stating whether the track is acoustic. Liveliness measures the instrumentation and vocal delivery of the track. Based on our visualization, we can see that the track energy and track danceability are significantly higher, meanwhile track acousticness is relatively lower. BTS, Stray Kids, and TWICE were the top groups with a higher track danceability and track energy value and low track acousticness value. As BTS starting off as a K-Pop band and becoming global renowned artists, they have proven their success in ruling the music industry with their dance skills and energy levels. Meanwhile, (G)-IDLE, Enhypen, Tomorrow X Together and New Jeans included a lower track danceability and track energy, as these groups have been recently banded. This shows that the main objective of the top kpop songs involves a hook step with a catchy instrumentation of beats is their formula for success and attracting a broad array of listeners. However, other track statistics that were not examined, the visualization provides us a generalization of the main components to a successful K-Pop track. 


Figure 4


The pair of pie charts highlights the distribution of time signatures across the top Kpop songs and the top songs in general (not restricted to KPop). Regarding the Kpop data, we included all the tracks of the 10 Kpop groups with the most Spotify monthly listeners. For the data of songs not restricted to Kpop, we included tracks from the Spotify database that held a popularity rating of greater than 40. It can be observed that the overwhelming majority of the top Kpop tracks possess a time signature of 4 beats per measure (96.3%). This time signature significantly overpowers other less popular time signatures such as 1 beat per bar (.259%), 3 beats per bar (3.05%), and 5 beats per bar (.389%). While 4 beats per bar is also the most popular time signature for the top non Kpop songs, the skew is less extreme. This trend may be explained by how the 4/4 time signature provides a steady rhythm that is often perceived as “catchy” and is easy to bop your head to. With Kpop’s generally upbeat energy, it makes sense why many of the most successful tracks are in a 4/4 time signature. 

Figure 5

These two visualizations show the occurrences of a certain tempo in k-pop songs, separated by gender. The tempo of each song is typically in the decimals, so each tempo was rounded to the nearest whole number. The selected songs are all the songs released by the top ten K-Pop groups in Spotify. While both boy and girl groups have a variety of songs spanning from a tempo of 80 to 200 beats per minute, it seems that the majority of the songs in girl groups have a lower tempo than 140 beats per minute and in guy groups there appears to be a more even spread of tempos. Another observation is that the top tempo with the most occurrences in both girl and boy groups seems to be around 120 beats. 

## Conclusions

The Kpop craze evidently remains on the rise and there are no signs of its popularity diminishing soon. Finding the “recipe” to a successful Kpop group is far from easy, but our analysis suggests that variables such as high energy, high danceability, a speedy tempo and steady time signature of 4/4 are all associated with the most popular tracks. Diverse sexualities in the fanbase as well as an emphasis on visuals for girl groups and an emphasis of song quality for boy groups are all attributes that uniquely characterize the Kpop genre. While we only explored specific factors of the success of K-Pop groups, we hope our findings provided further insight into why certain K-Pop groups seemed to rise to fame while others seemed to fade into the background. 

Sources 
https://developer.spotify.com/documentation/web-api/
https://kworb.net/youtube/topvideos_korean.html
https://www.reddit.com/r/kpop/wiki/census/
https://www.kaggle.com/datasets/zaheenhamidani/ultimate-spotify-tracks-db


