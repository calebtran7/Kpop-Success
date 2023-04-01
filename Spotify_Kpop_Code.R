# install.packages("httr")
#Artist$followers$total

library(httr)
#replace this with yours
clientID = "ea0fcd01a7b64d6d9188812a8059bbbc"
secret = "f35f46e8249d481f97a71572661a1e10"
response = POST(
  'https://accounts.spotify.com/api/token',
  accept_json(),
  authenticate(clientID, secret),
  body = list(grant_type = 'client_credentials'),
  encode = 'form',
  verbose()
)
mytoken = content(response)$access_token
HeaderValue = paste0('Bearer ', mytoken)


### For a specific artist 
artistID = "6HvZYsbFfjnjFrWF950C9d"
URI = paste0('https://api.spotify.com/v1/artists/', artistID)
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Artist = content(response2)


# For album: 
albumID = "1HMLpmZAnNyl9pxvOnTovV"
track_URI = paste0('https://api.spotify.com/v1/albums/', albumID,'/tracks')
track_response = GET(url = track_URI, add_headers(Authorization = HeaderValue))
tracks = content(track_response)

# Get the info 
ntracks = length(tracks$items)
tracks_list<-data.frame(
  name=character(ntracks),
  id=character(ntracks),
  artist=character(ntracks),
  disc_number=numeric(ntracks),
  track_number=numeric(ntracks),
  duration_ms=numeric(ntracks),
  stringsAsFactors=FALSE
)

# ask val 

# For looping through the data frame 
for(i in 1:ntracks){
  tracks_list[i,]$id <- tracks$items[[i]]$id
  tracks_list[i,]$name <- tracks$items[[i]]$name
  tracks_list[i,]$artist <- tracks$items[[i]]$artists[[1]]$name
  tracks_list[i,]$disc_number <- tracks$items[[i]]$disc_number
  tracks_list[i,]$track_number <- tracks$items[[i]]$track_number
  tracks_list[i,]$duration_ms <- tracks$items[[i]]$duration_ms
}

print(tracks_list)

# More specific info 
for(i in 1:nrow(tracks_list)){
  Sys.sleep(0.10)
  track_URI2 = paste0('https://api.spotify.com/v1/audio-features/',   
                      tracks_list$id[i])
  track_response2 = GET(url = track_URI2, 
                        add_headers(Authorization = HeaderValue))
  tracks2 = content(track_response2)
  
  tracks_list$key[i] <- tracks2$key
  tracks_list$mode[i] <- tracks2$mode
  tracks_list$time_signature[i] <- tracks2$time_signature
  tracks_list$acousticness[i] <- tracks2$acousticness
  tracks_list$danceability[i] <- tracks2$danceability
  tracks_list$energy[i] <- tracks2$energy
  tracks_list$instrumentalness[i] <- tracks2$instrumentalness
  tracks_list$liveliness[i] <- tracks2$liveness
  tracks_list$loudness[i] <- tracks2$loudness
  tracks_list$speechiness[i] <- tracks2$speechiness
  tracks_list$valence[i] <- tracks2$valence
  tracks_list$tempo[i] <- tracks2$tempo
}


return(list(
  "albums"=albums_list,
  "tracks"=tracks_list
))


# Function: 
get_artist_data<-function(artistID = '0qlWcS66ohOIi0M8JZwPft'){
  
  URI = paste0('https://api.spotify.com/v1/artists/', artistID)
  response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
  Artist = content(response2)
  Artist
  
  # Get albums
  album_URI = paste0('https://api.spotify.com/v1/artists/', artistID,'/albums')
  album_response = GET(url = album_URI, add_headers(Authorization = HeaderValue))
  albums = content(album_response)
  
  nalbums = length(albums$items)
  albums_list<-data.frame(name=character(nalbums),id=character(nalbums),
                          type=character(nalbums),
                          total_tracks=character(nalbums),
                          release_date=character(nalbums),stringsAsFactors=FALSE)
  for(i in 1:nalbums){
    albums_list[i,]$id <- unlist(albums$items[[i]]$id)
    albums_list[i,]$name <- unlist(albums$items[[i]]$name)
    albums_list[i,]$type<- unlist(albums$items[[i]]$type)
    albums_list[i,]$total_tracks <- unlist(albums$items[[i]]$total_tracks)
    albums_list[i,]$release_date <- unlist(albums$items[[i]]$release_date)
  }
  
  # Get Tracks and Album Information
  tracks_list<-data.frame(name=character(0),id=character(0),
                          artist=character(0),disc_number=numeric(0),
                          track_number=numeric(0),duration_ms=numeric(0),
                          explicit=character(0),album=character(0),
                          stringsAsFactors=FALSE)
  
  for(albumID in albums_list$id){
    track_URI = paste0('https://api.spotify.com/v1/albums/', albumID,'/tracks')
    track_response = GET(url = track_URI, add_headers(Authorization = HeaderValue))
    tracks = content(track_response)
    
    ntracks = length(tracks$items)
    tracks_list1<-data.frame(name=character(ntracks),id=character(ntracks),
                             artist=character(ntracks),disc_number=numeric(ntracks),
                             track_number=numeric(ntracks),duration_ms=numeric(ntracks),
                             explicit=character(ntracks),album=character(ntracks),
                             stringsAsFactors=FALSE)
    
    for(i in 1:ntracks){
      tracks_list1[i,]$id <- unlist(tracks$items[[i]]$id)
      tracks_list1[i,]$name <- unlist(tracks$items[[i]]$name)
      tracks_list1[i,]$album <- albums_list[albums_list$id==albumID,]$name
      tracks_list1[i,]$artist <- unlist(tracks$items[[i]]$artists[[1]]$name)
      tracks_list1[i,]$disc_number <- unlist(tracks$items[[i]]$disc_number)
      tracks_list1[i,]$track_number <- unlist(tracks$items[[i]]$track_number)
      tracks_list1[i,]$duration_ms <- unlist(tracks$items[[i]]$duration_ms)
    }
    
    tracks_list<-rbind(tracks_list,tracks_list1)
  }
  
  # Get Additional Track Details
  for(i in 1:nrow(tracks_list)){
    Sys.sleep(0.10)
    track_URI2 = paste0('https://api.spotify.com/v1/audio-features/', tracks_list$id[i])
    track_response2 = GET(url = track_URI2, add_headers(Authorization = HeaderValue))
    tracks2 = content(track_response2)
    
    tracks_list$key[i] <- tracks2$key
    tracks_list$mode[i] <- tracks2$mode
    tracks_list$time_signature[i] <- tracks2$time_signature
    tracks_list$acousticness[i] <- tracks2$acousticness
    tracks_list$danceability[i] <- tracks2$danceability
    tracks_list$energy[i] <- tracks2$energy
    tracks_list$instrumentalness[i] <- tracks2$instrumentalness
    tracks_list$liveliness[i] <- tracks2$liveness
    tracks_list$loudness[i] <- tracks2$loudness
    tracks_list$speechiness[i] <- tracks2$speechiness
    tracks_list$valence[i] <- tracks2$valence
    tracks_list$tempo[i] <- tracks2$tempo
  }
  
  # Return Data
  return(list(
    "albums"=albums_list,
    "tracks"=tracks_list
  ))
}

new_jeans <- get_artist_data("6HvZYsbFfjnjFrWF950C9d")

album <- data.frame(new_jeans[1])
track <- data.frame(new_jeans[2])



write.csv(album, "C:\\Users\\katherinehuynh\\Desktop\\Kpop\\nj_album.csv")
write.csv(track, "C:\\Users\\katherinehuynh\\Desktop\\Kpop\\nj_track.csv")

artist_data <- function(artist) {
  album <- data.frame(artist[1])
  track <- data.frame(artist[2])
  write.csv(album, "C:\\Users\\katherinehuynh\\Desktop\\Kpop\\album.csv")
  write.csv(track, "C:\\Users\\katherinehuynh\\Desktop\\Kpop\\track.csv")
}

# new Jeans
new_jeans <- get_artist_data("6HvZYsbFfjnjFrWF950C9d")
artist_data(new_jeans)

# Bts
bts <- get_artist_data("3Nrfpe0tUJi4K4DXYWgMUX")
artist_data(bts)

# Twice
twice <- get_artist_data("7n2Ycct7Beij7Dj7meI4X0") # here
artist_data(twice)

# Blackpink
blackpink <- get_artist_data("41MozSoPIsD1dJM0CLPjZF")
artist_data(blackpink)

# TXT 
tom_x_tog <- get_artist_data("0ghlgldX5Dd6720Q3qFyQB")
artist_data(tom_x_tog)

# Stray kids 
stray_kids <- get_artist_data("2dIgFjalVxs4ThymZ67YCE")
artist_data(stray_kids)

# Seventeen
seventeen <- get_artist_data("7nqOGRxlXj7N2JYbgNEjYH")
artist_data(seventeen)

# enhyphen 
enhyphen <- get_artist_data("5t5FqBwTcgKTaWmfEbwQY9")
artist_data(enhyphen)

# Itzy 
itzy <- get_artist_data("2KC9Qb60EaY0kW4eH68vr3")
artist_data(itzy)

# gidle 
gidle <- get_artist_data("2AfmfGFbe0A0WsTYm0SDTx")
artist_data(gidle)

# red velvet 
red_velvet <- get_artist_data("1z4g3DjTBBZKhvAroFlhOM")
artist_data(red_velvet)

youtube <- read.csv(file.choose())


library(stringr)
# number of each group 

num_group <- function(string) {
  sum(grepl(string, youtube$Songs, fixed = TRUE))
}


bts <- num_group("BTS")
new_jeans <- num_group("NewJeans")
twice <- num_group("TWICE")
blackpink <- num_group("BLACKPINK")
txt <- num_group("TXT")
stray_kids <- num_group("Stray Kids")
seventeen <- num_group("SEVENTEEN")
enhyphen <- num_group("ENHYPHEN")
itzy <- num_group("ITZY")
gidle <- num_group("(G)I-DLE")
red_velvet <- num_group("Red Velvet")
other <- 300 - bts - new_jeans - twice - blackpink - txt - stray_kids - seventeen - enhyphen - itzy - gidle - red_velvet


# new jeans and enhyphen = 0
# ordered values that are 
values <- c(bts, stray_kids, twice, seventeen, blackpink, txt, itzy, gidle, red_velvet, other)
ppl <- c("BTS","Stray Kids", "Twice", "Seventeen","Blackpink", "Tomorrow x Together", "ITZY", "(G)-I-DLE", "Red Velvet", "Other")
pie(values, labels = ppl, border = "black")

# ended up using this one 
# ordered values from top 10 
par(mfrow = c(1, 2))

par(mfrow = c(1, 1))

pretty <- function(number) {
  paste(format((100*(number/300)), digits = 2), "%", sep = "") 
}

pretty(bts)

values2 <- c(bts, blackpink, twice, stray_kids, seventeen, txt, itzy, gidle, red_velvet, other)
ppl2 <- c("BTS", "Blackpink", "Twice", "SKZ", "SVT", "TXT", "ITZY", "(G)-I-DLE", "Red Velvet", "Other")

dev.new(width=5, height=4)
pie(values2, width = 600, height = 600, labels = ppl2, border = "black", cex.lab = 2, cex = 0.5, col = c("blue", "pink", "pink", "blue", "blue", "blue", "pink", "pink", "pink", "purple"), main =  "Proportion of Top 300 K-Pop Youtube Videos")


legend("topleft", cex = 0.85, c("Boy groups", "Girl Groups", "Other"), fill = c("blue", "pink", "purple"))

legend("bottomleft", cex = 0.85, c(paste("BTS", pretty(bts), sep = " - "), paste("Blackpink", pretty(blackpink), sep = " - "), 
                    paste("Twice", pretty(twice), sep = " - "), 
                    paste("Stray Kids (SKZ)", pretty(stray_kids), sep = " - "), 
                    paste("Seventeen (SVT)", pretty(seventeen), sep = " - "), 
                    paste("Tomorrow x Together (TXT)", pretty(txt), sep = " - "), 
                    paste("ITZY", pretty(itzy), sep = " - "), 
                    paste("(G)-I-DLE", pretty(gidle), sep = " - " ), 
                    paste("Red Velvet", pretty(red_velvet), sep = " - "),
                    paste("Other",pretty(other), sep = " - ")))

? pie
