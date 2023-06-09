# Geo-Deliver Backend README

This repository contains a Sinatra application that serves as a backend server for handling API requests and managing various resources. The application utilizes controllers to handle different routes and performs CRUD operations on users, orders, order items, and products.

## Prerequisites

Make sure you have the following installed:

- Ruby
- Bundler (Ruby Gem Manager)

## Getting Started

To get started with the Sinatra application, follow these steps:

1. Clone this repository to your local machine using the following command:

   ```bash
   git clone (https://github.com/Denisomondi/GeoDeliver-Backend/blob/main/README.md)
   ```

2. Navigate to the project directory:

   ```bash
   cd repository-directory
   ```

3. Install the dependencies by running the command:

   ```bash
   bundle install
   ```

4. Start the server with the command:

   ```bash
   ruby app.rb
   ```

5. Open your browser and visit `http://localhost:4567` to see the application.

## Project Structure

The project structure is organized as follows:

```
.
├── app.rb
├── config.ru
├── controllers
│   ├── users_controller.rb
│   ├── orders_controller.rb
│   ├── order_items_controller.rb
│   └── products_controller.rb
├── models
│   ├── user.rb
│   ├── order.rb
│   ├── order_item.rb
│   └── product.rb

├── db
│   ├── migrate
│   └── seed.rb
└── README.md
```

## Functionality

Before using the application, make sure to set up the database by running the following commands:

```bash
rake db:create
rake db:migrate
rake db:seed
```

This will create the necessary database tables and populate them with seed data.

## Customization and Extension

If you need to customize or extend the application, you can modify the controllers, models, views, and public assets according to your requirements. Additionally, you can configure additional routes in the `config.ru` file.

To run the application using `rackup`, use the following command:

```bash
rackup config.ru
```

To run the application using `ruby`, use the following command:

```bash
ruby app.rb
```

## Deployment

To deploy the Sinatra application, you can use various hosting platforms such as Heroku, AWS, or DigitalOcean. Follow the deployment instructions provided by your chosen hosting platform to deploy the application and ensure it is accessible to the frontend.

## Using Rerun for Automatic Server Restart

To streamline your development process and automatically restart the Sinatra backend whenever changes are made, you can use `rerun`. Follow these additional steps to set it up:

1. Install `rerun` using RubyGems:

   ```bash
   gem install rerun
   ```

   `rerun` is a Ruby gem that monitors changes in your application files and automatically restarts the server when necessary.

2. Configure the application if necessary. This may involve setting environment variables or updating configuration files. Refer to the application's documentation for specific instructions.

3. Start the Sinatra server using `rerun`:

   ```bash
   rerun 'ruby app.rb'
   ```

   This command will start the server and monitor your application files for changes. Whenever a file is modified, `rerun` will automatically restart the server, allowing you to see the changes

 immediately.

4. Open a web browser and navigate to `http://localhost:4567` to see the running application.

5. Press `Ctrl + C` in the terminal to stop the server when you're done.

## API Documentation

The API endpoints and their usage are documented in the [API documentation](/docs/api.md) file. Please refer to the documentation for detailed information on how to use the API.

## Contributing

Contributions to the Sinatra Application are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

The Sinatra Application is open-source and released under the [MIT License](LICENSE).
