Lab | GNOD Project

This project is a Spotify song recommender. 

I made a pipeline to:
                         -ask the user to input a song and artist
                         -check whether or not the song is in the Top 100 Songs.
                         -if the song is in the Top 100 Songs list, then return a random song from that list.
                                                    
                         -if the song is not in the Top 100 Songs list:
                            -collect the audio features from the Spotify API.
                            -send the Spotify audio features of the submitted song to the clustering model
                            -compare song to closest cluster
                            -pick a random song from the closest cluster
                            -return the recommended song back to the user
Images:

![](images/prototype2.0.png)

❮img src="images/prototype2.0.png" ❯
❮img src="images/prototype2.1.png" ❯


<p align="center">
  <img src="images/prototype2.0.png" width="350" title="hover text">
  <img src="images/prototype2.1.png" width="350" alt="accessibility text">
</p>