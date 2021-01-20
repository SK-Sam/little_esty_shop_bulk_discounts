<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

### Created For B2 Final Project 

   - Practicing complex associations and applying calculations via joins and relations.
   - This project has been scaled to take in any user input and be able to handle errors
   - Discounts are the main part of this project and applying them onto existing orders
   - Please create a few discounts to see the changes on either Admin Merchant side of the site OR Merchant side.
      - You will dynamically see invoices update their price along with Invoice Total Revenue based on Discount requirements.


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/SK-Sam/little_esty_shop_bulk_discounts
   ```
2. run `rails db:{create,migrate}`, and run `rake import` afterwards to plant the initial data.
   
3. Launch Server
   ```sh
   rails server
   ```
4. Visit `localhost:3000/` to see the welcome page.


