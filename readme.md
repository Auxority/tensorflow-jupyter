## Setup
Before you begin, make sure you have WSL, Docker, and NVIDIA drivers installed.

1. Follow the instructions [here](https://learn.microsoft.com/en-us/windows/wsl/install) to install WSL.

2. Follow the instructions [here](https://docs.docker.com/desktop/install/windows-install/) to install Docker Desktop for Windows.

3. Follow the instructions [here](https://www.nvidia.com/Download/index.aspx) to install NVIDIA drivers.

## Usage
Now we're ready to setup the Jupyter Server in the Docker container using WSL.

1. Start by cloning this repository to your local machine.

    ```sh
    # Clone this repository
    git clone https://github.com/Auxority/tensorflow-jupyter.git
    ```

2. Open your favorite terminal and run `wsl install` to create a new WSL instance. Just follow the prompts and you should be good to go.

    ```sh
    # Create a new WSL instance
    wsl install
    ```

    *Note: If you run into any issues, you can use `wsl --shutdown` followed by `wsl -l` and `wsl --unregister <distro>` to shutdown, list, and delete WSL instances respectively.*

3. Once you are in your WSL instance, navigate to this repository. Make sure to replace the path with the path to your repository. You can use the `/mnt/c` prefix to access files on your C drive.

    ```
    # Navigate to the repository
    cd /mnt/c/Users/<username>/Documents/GitHub/tensorflow-jupyter
    ```

4. Run `make init` to initialize your `.env` file.
        
    ```sh
    # Initialize your .env file
    make init
    ```

5. Open the `.env` file you just created and configure your token there. You will need this token later.

6. Run `docker compose up` to start the Docker container. This will take a while the first time you run it, but subsequent runs will be much faster.

    ```sh
    # Start the Docker container
    docker compose up
    ```

7. Once the container is running, you can access Jupyter Notebook by navigating to `localhost:8888?token={YOUR_TOKEN}` in your browser. Make sure to replace `{YOUR_TOKEN}` with the actual token you set in your `.env` file during step 5.

8. You can now start coding! You can find some example notebooks in the `notebooks` folder.
