# Laravel 5.7 ETF parser for [spdrs.com](www.spdrs.com)
This project is for parsing etf's  from website [spdrs.com](www.spdrs.com). 
## Parsed data for current ETF :  
	- Top 10 holdings
 	- Country weights
    - Sector weights  
## Installation:

	- Download git repository or just clone it  
	- Create .env file in root directory (find *project/.env.example) 
	- Set configurations

### Startup commands :
	-  $ php artisan key:generate 
	-  $ php cache:clear
	-  $ php artisan config:cache
	-  $ php artisan migrate
##### NPM (not isntalled):
	- npm install
	- npm run build
## Usage:
- In repository you can find *project/etf_2019-02-04.sql, you can import it in your database or for parsing again need to in *project/config/etf.php change:
 	``` php
  parsed => 0 or parsed => false    
- For parsing again ETF's, need to clean your config and cache again, <b>run command</b>:
 	```php
 	$ php artisan config:cache   
 - On startup system automatically parses all ETF symbols and store in database.
