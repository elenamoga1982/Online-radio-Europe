# Online-radio-Europe

This is my final project for the UC San Diego "iOS programming" program.

![Alt Text](https://raw.github.com/elenamoga1982/Online-radio-Europe/master/screenshots/Online-radio-Europe1.png)

# Table of contents
### App description
### User interface
### App requirements
<br/>

## App description

This app allows the users to listen to some radios for every european country. First, the user has to choose the country he/she wants to listen a radio from; a new screen is loading with a selection of radios from the chosen country. The user can stop or pause a radio stream to play or return to the list of countries and choose another country to listen radios from. The selected country and the playing radio are displayed on the title bar of the screen. The app uses the AVPlayer to play the streams.

![Alt Text](https://raw.github.com/elenamoga1982/Online-radio-Europe/master/screenshots/Online-radio-Europe.png)

![Alt Text](https://raw.github.com/elenamoga1982/Online-radio-Europe/master/screenshots/Online-radio-Europe2.png)

## User interface
- Two main View Controllers(Online Radio Europe and Radio list Scene)
- The View Controllers mentioned above are Table View based and they are both embedded in a Navigation View Controller
- There is an active Launch Screen that loads first and it is visible on the screen up to the moment the Online Radio Europe View Controller is shown
- Every country on the first screen(Online Radio Europe) shows up its corresponding flag
- In order to switch playing to another radio, the user can either press the pause button on the right top of the screen and then select another radio or simply press the title of the new radio to be listen
- The "Back" button returns the user from the second screen(Radio list Scene) to the first screen that shows the countries and flags(Radio Online Europe)
- The selected radio is highlighted to cyan for a clear difference from th other radios on the list
- All the links connect to the corresponding stream URLs and it plays the radio stream
- All the streams are stored in a separate plist(countries.plist)

![Alt Text](https://raw.github.com/elenamoga1982/Online-radio-Europe/master/screenshots/Online-radio-Europe3.png)

![Alt Text](https://raw.github.com/elenamoga1982/Online-radio-Europe/master/screenshots/Online-radio-Europe4.png)

## App requirements
The app has no specific requirements because it uses no APIs. 
