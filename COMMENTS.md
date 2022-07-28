* I choose Flutter to expore the current potential to create multiplatform apps. 
* I use the exact same design in all supported platforms because I run our of time to add some customization based on the current platform.
* Initially I wanted to use Hive to test it but it ends-up being really paintfull to query and store complex objects, so I switch back to the good and old sqlite3 database using Drift as ORM. I'm not 100% sure what it uses on Web but should be some local database supported by the browser.
* Probably this will only work on Chrome and Firefox for the web version
* I've implemented eveything using Flutter Hooks and Provider, that makes less code to be written and manage state easily.
* HTML fetching works partially. Not good result because needs more work on style the widgets properly to show a nice HTML inline.
* Also, HTML fetching on Web will not work 100% due CORS problems (e.g. it will not fetch images). It's more a PoC to showcase what we can do.