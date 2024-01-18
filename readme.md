## Prerequisites

Before proceeding, ensure you have the following installed:
- Python 3.11
- pip (Python package manager)
- Ngrok account (for tunneling the local server)

## Installation

1. **Clone the Repository**: Clone the code repository to your local machine.

    ```bash
    git clone [repository_url]
    ```

2. **Navigate to the Project Directory**:
   
    ```bash
    cd [project_directory]
    ```

3. **Install Dependencies**: Use pip to install the required Python packages.

    ```bash
    pip install -r requirements.txt
    ```

## Configuration

- **Environment Variables**: Set necessary environment variables in `.env` file if required.

## Running the Application

1. **Start the Flask Application**:

    ```bash
    python app.py
    ```
   
    This command starts the Flask server, usually on port 5000.

2. **Set Up Ngrok**:

    - If you haven't installed Ngrok, download it from [Ngrok's website](https://ngrok.com/download) and follow their setup instructions.

    - Connect your Ngrok account:

      ```bash
      ./ngrok authtoken [your_auth_token]
      ```

    - Start an Ngrok tunnel to your Flask app:

      ```bash
      ./ngrok http 5000
      ```

    Ngrok will display a URL (e.g., `http://1234abcd.ngrok.io`). This is the public URL to access your local Flask server.

## Using the Application

- **Endpoints**:

    - **Get Recommendations**: Send a POST request to `[ngrok_url]/get-recommendation` with the required JSON body (gender, weight, height, age, activity level, target).
    
    - **Get Total Calories and Protein**: Additional endpoints for calculating calories and protein requirements are available as described in `app.py`.

- **Testing**: Use tools like Postman or curl for testing the API endpoints.

## Troubleshooting

- **Common Issues**: 
    - Ensure all dependencies are correctly installed.
    - Check if the Flask server is running on the correct port.
    - Validate Ngrok is tunneling the correct port.

## Support

For further assistance, please contact the support team or refer to the Flask and Ngrok documentation.