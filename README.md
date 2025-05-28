# MCP Python Interpeter with Docker

Fork of [this](https://github.com/yzfly/mcp-python-interpreter/) project which was modified to run inside Docker container.

## Prerequisites

- Docker installed on your system

## Features

- **Environment Management**: List and use different Python environments (system and conda)
- **Code Execution**: Run Python code or scripts in any available environment
- **Package Management**: List installed packages and install new ones
- **File Operations**: 
  - Read files of any type (text, source code, binary)
  - Write text and binary files
- **Python Prompts**: Templates for common Python tasks like function creation and debugging

## Installation

### Run the Docker container

This will start the MCP server inside a Docker container and expose it on port 8050.
All neccessary data are stored in the `data` folder.

```
bash
docker compose up -d
```
Once the server is running, you can run the simple client in a separate terminal to test that server is running:

```bash
python client.py
```
The client will connect to the server and list available tools, list files in the `data` directory and read `test.py` file.

### Stop the Docker container

```
bash
docker compose down
```

## Available Tools

The Python Interpreter provides the following tools:

### Environment and Package Management
- **list_python_environments**: List all available Python environments (system and conda)
- **list_installed_packages**: List packages installed in a specific environment
- **install_package**: Install a Python package in a specific environment

### Code Execution
- **run_python_code**: Execute Python code in a specific environment
- **run_python_file**: Execute a Python file in a specific environment

### File Operations
- **read_file**: Read contents of any file type, with size and safety limits
  - Supports text files with syntax highlighting
  - Displays hex representation for binary files
- **write_file**: Create or overwrite files with text or binary content
- **write_python_file**: Create or overwrite a Python file specifically
- **list_directory**: List Python files in a directory (by default it's `data` directory)

## Available Resources

- **python://environments**: List all available Python environments
- **python://packages/{env_name}**: List installed packages for a specific environment
- **python://file/{file_path}**: Get the content of a Python file
- **python://directory/{directory_path}**: List all Python files in a directory

## Prompts

- **python_function_template**: Generate a template for a Python function
- **refactor_python_code**: Help refactor Python code
- **debug_python_error**: Help debug a Python error

## Example Usage

Here are some examples of what you can ask LLM to do with this MCP server:

- "Show me all available Python environments on my system"
- "Run this Python code in my conda-base environment: print('Hello, world!')"
- "Create a new Python file called 'hello.py' with a function that says hello"
- "Read the contents of my 'data.json' file"
- "Write a new configuration file with these settings..."
- "List all packages installed in my system Python environment"
- "Install the requests package in my system Python environment"
- "Run data_analysis.py with these arguments: --input=data.csv --output=results.csv"

## File Handling Capabilities

The MCP Python Interpreter now supports comprehensive file operations:
- Read text and binary files up to 1MB
- Write text and binary files
- Syntax highlighting for source code files
- Hex representation for binary files
- Strict file path security (only within the working directory)