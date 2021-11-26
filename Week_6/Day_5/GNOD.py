{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "a50a9ec4-5905-4d1c-8b5d-1c2444a0492f",
   "metadata": {},
   "outputs": [
    {
     "name": "stdin",
     "output_type": "stream",
     "text": [
      "Enter a song:  ds\n",
      "Enter an artist:  dfds\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "The GNOD algorythm picked this song for you :  I Wish We'd All Been Ready  by  Larry Norman\n",
      "\n"
     ]
    },
    {
     "name": "stdin",
     "output_type": "stream",
     "text": [
      "Try again? Press (Y) for yes or (N) for no. N\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "import numpy as np\n",
    "import matplotlib.pyplot as plt\n",
    "from sklearn import cluster, datasets\n",
    "from sklearn.cluster import KMeans\n",
    "from sklearn.preprocessing import StandardScaler\n",
    "from matplotlib.lines import Line2D\n",
    "import pickle\n",
    "import random\n",
    "import spotipy\n",
    "from spotipy.oauth2 import SpotifyClientCredentials\n",
    "\n",
    "confidential = open(\"spotify_eddie_confidential.txt\",\"r\")\n",
    "string = confidential.read()\n",
    "st = string.split('\\n')\n",
    "secrets_dict={}\n",
    "for line in string.split('\\n'):\n",
    "    if len(line) > 0:\n",
    "        secrets_dict[line.split(':')[0]]=line.split(':')[1]\n",
    "sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=secrets_dict['cid'],\n",
    "                                                           client_secret=secrets_dict['csecret']))\n",
    "\n",
    "topsongs = pd.read_csv('C:\\\\Users\\\\eddie\\\\Desktop\\\\Ironhack\\\\week6\\\\week6 day3\\\\songs_top_100.csv').drop(['Unnamed: 0'],axis=1)\n",
    "my_songs_list =  pd.read_csv('C:\\\\Users\\\\eddie\\\\Desktop\\\\Ironhack\\\\week6\\\\week6 day3\\\\final_one_list.csv').drop(['Unnamed: 0'],axis=1)\n",
    "\n",
    "\n",
    "\n",
    "scaler = pickle.load(open('scaler_saved.pkl','rb'))\n",
    "kmeans = pickle.load(open('kmeans_saved.pkl','rb'))\n",
    "\n",
    "#--------------------------------------------------------gnod randomizer------------------------------------------------------------------------------------------------------\n",
    "run = 'Y'\n",
    "while run == 'Y':\n",
    "    new_song = input(\"Enter a song: \")\n",
    "    new_artist = input(\"Enter an artist: \")\n",
    "    title = new_song\n",
    "    if (new_song in topsongs['title'].values) & (new_artist in topsongs['artist'].values):\n",
    "        while title == new_song :\n",
    "            rand = randint(1, len(topsongs))\n",
    "            title = topsongs['title'][rand]\n",
    "            artist = topsongs['artist'][rand]\n",
    "        print('This song is LIT! You might be intereted in this song: ', title,' by ',artist)   \n",
    "    else:\n",
    "        #try:\n",
    "            new_search = sp.search(q=new_song + ' ' + new_artist, type=\"track\", market=\"US\", limit=1)     #andi suggested to do US search only\n",
    "            #get features\n",
    "            features_new = sp.audio_features(new_search['tracks']['items'][0]['uri'])\n",
    "            #create features dataframe, convert to numeric \n",
    "            features_df = pd.DataFrame(features_new) \n",
    "            features_df_numeric = features_df.drop(['type','id','uri','track_href','analysis_url','duration_ms','time_signature'], axis=1)\n",
    "            #feed features_numeric into the scaler\n",
    "            song_prepare = scaler.transform(features_df_numeric)\n",
    "            cluster_predict = kmeans.predict(song_prepare)[0]\n",
    "            picked = my_songs_list[my_songs_list['cluster'] == cluster_predict].sample(1)   #picked song in cluster \n",
    "            #assign title and artist, values indexed at zero, without this sample(1) will not work\n",
    "            picked_title = picked['name'].values[0]\n",
    "            picked_artist = picked['artist'].values[0]\n",
    "            print('The GNOD algorythm picked this song for you : ', picked_title,' by ', picked_artist)\n",
    "        #except:\n",
    "            #print('Cannot find this song.')\n",
    "    print()\n",
    "    run = input('Try again? Press (Y) for yes or (N) for no.')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "288c60ea-21ff-4376-9c56-3e28b13ef31a",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "a5d13b38-5020-49e6-ba0b-50c87daa7f10",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.8"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
