# To run the app:
1- run ``` flutter packages get ```  
2- To run on debug mode ```flutter run ```  
    
# How it works:
When the user open the application it's started to fetch today data from github api with page index 1 ,
and with scrolling down the app trying to get next page then next page and change state to display it on the listView,

<img src="screens shot/sc1.png" width="300"> 

The home page contain two screen , trending and setting , i but it on pageView and you can switch it with bottomNavigationBar with animation , if you go to setting screen the data on trending screen never losing .



If you click on any repository card that will open new screen it's calld RepoDetails .. in actually it not has alot of details but you can open the Repository link on browser..

<img src="screens shot/sc2.png" width="300"> 

If the app started with no internet connection or any catch will be shown  this Text

<img src="screens shot/sc3.png" width="300"> 

# Dependencies:

 ## http
 To get data from api .
 
 ## url_launcher
 To open the Repository url on web browser


Thanks  Gemography
