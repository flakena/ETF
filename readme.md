# Laravel 5.7 ETF parser for [spdrs.com](www.spdrs.com)
This project is for parsing etf's  from website [spdrs.com](www.spdrs.com). 
## Parsed data for current ETF :  
	- Top 10 holdings
 	- Country weights
    - Sector weights  
## Installation:

- Download git repository or just clone it  
- Create .env file in root directory (find *project/.env.example) 
    ```php
      cp .env.example .env
      php artisan key:generate
- Fill out Database configuration fields with correct *Host*, *username* and *password*

### Startup commands :
    -  $ php composer.phar / composer install
	-  $ php artisan key:generate 
	-  $ php artisan config:cache
	-  $ php artisan migrate
##### NPM (not installed):
	- npm install
	- npm run build