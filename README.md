# Delivery System API

The Delivery System API is a backend application that provides an API for managing delivery orders. It allows users to create orders, add products to orders, and track the status of their orders. The API is built using Ruby with the Sinatra framework and utilizes a PostgreSQL database.

## Features

- User management: Create, update, and delete user accounts.
- Order management: Create, update, and delete orders.
- Product management: Create, update, and delete products.
- Order item management: Add products to orders and manage quantities.
- Order status tracking: Track the status of orders (e.g., pending, in progress, delivered).

## Technologies Used

- Ruby: The programming language used to develop the API.
- Sinatra: A lightweight web framework used to build the API routes.
- ActiveRecord: An ORM (Object-Relational Mapping) library for database interactions.
- PostgreSQL: The chosen database management system.
- JSON: The data format used for API requests and responses.

## Getting Started

To set up the Delivery System API locally, follow these steps:

1. Clone the repository:


2. Install the necessary dependencies:


3. Set up the database:

- rake db:create
- rake db:migrate
- rake db:seed


4. Start the server:

- rackup config.ru


5. The API will be accessible at `http://localhost:9292`. You can use tools like cURL or Postman to send requests to the API endpoints.

## API Documentation

The API endpoints and their usage are documented in the [API documentation](/docs/api.md) file. Please refer to the documentation for detailed information on how to use the API.

## Contributing

Contributions to the Delivery System API are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

The Delivery System API is open-source and released under the [MIT License](LICENSE).
