# To run the app :
1- run ``` flutter packages get ```  
2 - ```flutter run ``` to run on debug mode 
    
# how it work :
when the user open the application it's started to fetch today data from github api with page index 1 ,
and with scrolling down the app trying to get next page then next page and change state to display it on the listView,

<img src="screens shot/sc1.jpg" width="300"> 

the home page contain two screen , trending and setting , i but it on pageView and you can switch it with bottomNavigationBar with animation , if you go to setting screen the data on trending screen never losing .



if you click on any repository card that will open new screen it's calld RepoDetails .. in actually it not has alot of details but you can open the Repository link on browser..

<img src="screens shot/sc2.jpg" width="300"> 

if the app started with no internet connection will be shown  this Text

<img src="screens shot/sc3.jpg" width="300"> 

# the used dependencies  :

 ## http
 to get data from api .
 
 ## url_launcher
 to open the Repository url on web browser


thanks  Gemography
