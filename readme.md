# Ports And Adapters Golang Project

This is a Golang project that follows the principles of Ports and Adapters Architecture.

## Description

This project is structured around the DDD methodology, which focuses on core domain logic and complex business rules. It uses a rich, expressive, and evolving model to tackle complexity in the heart of the software.

The project also adheres to the principles of TDD, where tests are written before the actual code. This ensures that the codebase is thoroughly tested and that each component works as expected.

## Getting Started

* Clone the repository: `git clone https://github.com/RaphaelMarquesMartorella/ports-and-adapters-go.git`
* Follow the right path: `cd ports-and-adapters-go` 
* Run Docker-Compose: `docker-compose up -d --build`
* Join container: `docker exec -it appproduct bash`
* Install dependencies: `go get -u`

### Dependencies

* Go
* Docker
* Sqlite3
* Cobra
* Mux
* Negroni
* Testify (for testing)

## Database Setup

This project uses SQLite3 as its database. Here's how to set it up:

1. Open a new container bash and create a new SQLite database file:

```bash
touch sqlite.db
```

Open the SQLite interactive shell:

```bash
sqlite3 sqlite.db
```

Once inside the SQLite shell, create the products table:

```bash
CREATE TABLE products(
    id STRING,
    name STRING,
    price FLOAT,
    status STRING
);
```

### Compile program

* Compile Go code: `go build`

## Running Tests

Run tests using the command: `go test ./...`

## CLI Commands

This project uses the Cobra library to create a command-line interface (CLI). The main command is `cli`, and it has several flags that can be used to modify its behavior:

### Flags

1. `--action` or `-a`: This flag is used to specify the action to be performed. The default value is "enable". The available actions are "create", "enable", "disable", and getting a product's details (default action).

2. `--id` or `-i`: This flag is used to specify the product ID. There is no default value, so it must be provided if the chosen action requires it.

3. `--product` or `-n`: This flag is used to specify the product name. There is no default value, so it must be provided if the chosen action requires it.

4. `--price` or `-p`: This flag is used to specify the product price. The default value is 0, so it must be provided if the chosen action requires it.

### Usage

To use the CLI, you need to run the main Go file with the `cli` command and any flags you want to use. Here's an example:

```bash
go run main.go cli --action create --product "Product Name" --price 99.99
```

Or using the short versions of the flags:

```bash
go run main.go cli -a create -n "Product Name" -p 99.99
```

To enable a product:

```bash
go run main.go cli --action enable --id 123
```

To disable a product:

```bash
go run main.go cli --action disable --id 123
```

To get a product's details:

```bash
go run main.go cli --id 123
```

## Web Server Endpoints

The web server is set up using Cobra, Mux and Negroni. This function registers several HTTP endpoints related to product management.

To initialize the web server, run the following command:

```bash
go run main.go http
```

The application is configured to run on port 9000.

Here's a list of the available endpoints:

1. `PUT /product/{id}/enable`: This endpoint enables a product. The product ID is provided as a path parameter.

2. `PUT /product/{id}/disable`: This endpoint disables a product. The product ID is provided as a path parameter.

3. `GET /product/{id}`: This endpoint retrieves the details of a product. The product ID is provided as a path parameter.

4. `POST /product`: This endpoint creates a new product. The product details are provided in the request body.

All endpoints also support the `OPTIONS` method for CORS preflight requests.

## Data Format for Endpoints

The data sent to and received from the endpoints should be in JSON format. Here's the format for each endpoint:

### POST /product

To create a new product, send a JSON object with the following fields:

- `name`: The name of the product. This should be a string.
- `price`: The price of the product. This should be a number.

Example:

```json
{
    "name": "Testing",
    "price": 25.99
}
```

## Help

If you encounter any problems, please open an issue in the GitHub repository.

## Authors

Raphael Martorella 
raphael.martorella@homail.com


This project was initially created as part of a class from Plataforma Full Cycle.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the LICENSE.md file for details.

## Acknowledgments

This project was initially created as part of a class from [Plataforma Full Cycle](https://github.com/codeedu/fc2-arquitetura-hexagonal).

Other inspirations and code snippets:
* [FullCycle-BaseCode](https://github.com/codeedu)
* [Awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)