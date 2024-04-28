# Node.js Express TypeScript App

This is a simple Node.js application using the Express framework and written in TypeScript. It also utilizes environment variables for configuration.

## Technologies Used

- **Node.js**: The runtime environment for running the JavaScript code.
- **Express.js**: The web application framework for Node.js.
- **TypeScript**: A superset of JavaScript that adds static types.
- **dotenv**: A module to load environment variables from a `.env` file.

## Building and Running the Docker Image

### Build the Image

To build the Docker image for this project, run the following command:

```bash
docker build -t node-js-app .
```

This command will create a Docker image named `node-js-app` based on the contents of the current directory and the `Dockerfile`.

### Run the Container

To run the application in a Docker container, use the following command:

```bash
docker run -d -p 3000:3000 -e PORT=3000 node-js-app
```

This will start a container in detached mode, map port 3000 of the container to port 3000 on the host, and set the `PORT` environment variable to `3000`.

After running the container, you can access the application by visiting `http://localhost:3000` in your web browser.
