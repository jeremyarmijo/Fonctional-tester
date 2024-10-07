# Fonctional-tester
This functional tester is a simple script-based framework that automates the testing of various executable files and scripts. It ensures that the outputs and return values of the tested commands meet expectations. The framework can be used to validate return values, compare outputs, and measure execution times of shell scripts or binaries.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Features](#features)
    - [Return Value Test](#return-value-test)
    - [Return Value Test with File](#return-value-test-with-file)
    - [Compare Output](#compare-output)
    - [Measure Elapsed Time](#measure-elapsed-time)
4. [Contributing](#contributing)
5. [License](#license)

## Prerequisites

To use this functional tester, you need:
- A Unix-based system with Bash support.
- Proper permissions to run shell scripts and executables.
- Ensure the executables or scripts you are testing are located in their correct paths.

## Usage

You can invoke the functional tester by sourcing the corresponding test scripts. Below is an example of how to use it in your shell:

```bash
# Example usage

#!/bin/bash

# progression bar not really useful 
# source ./src/progression_bar.sh 4
./src/return_value_test.sh 1 './a.out' 0
rv1=$?
./src/return_value_test_with_file.sh 2 './test.sh' 'test.txt' 0
rv2=$?
./src/cmp_output.sh './test.sh' 'buffer' 3
rv3=$?
./src/elapsed_time_execution.sh 4 ls 0
rv4=$?
./src/final_report_test.sh "$rv1 $rv2 $rv3 $rv4"
```

Each script tests a specific functionality of an executable or script (the my_test.sh file have this content).

## Features

### 1. Return Value Test

The **return value test** validates whether an executable or script returns the expected value.

```bash
source ./src/return_value_test.sh <test_id> <executable_path> <expected_return_value>
```

- `test_id`: A unique identifier for the test case.
- `executable_path`: The path to the executable/script being tested.
- `expected_return_value`: The expected return value (exit code) of the executable.

**Example:**
```bash
source ./src/return_value_test.sh 1 './a.out' 0
```
This command tests if the executable `a.out` returns `0` when executed.

---

### 2. Return Value Test with File

The **return value test with file** validates whether a script or executable produces the expected return value when provided with a file as an argument.

```bash
source ./src/return_value_test_with_file.sh <test_id> <script_path> <file_name> <expected_return_value>
```

- `test_id`: A unique identifier for the test case.
- `script_path`: The path to the script being tested.
- `file_name`: The input file that the script will use during its execution.
- `expected_return_value`: The expected return value of the script.

**Example:**
```bash
source ./src/return_value_test_with_file.sh 2 './test.sh' 'test.txt' 0
```
This tests if `test.sh` returns `0` when executed with the `test.txt` file as input.

---

### 3. Compare Output

The **compare output** feature validates that the output of a script matches the content of a reference buffer file.

```bash
source ./src/cmp_output.sh  <test_id> <script_path> <buffer_file>
```

- `test_id`: A unique identifier for the test case.
- `script_path`: The path to the script being tested.
- `buffer_file`: A reference file containing the expected output.

**Example:**
```bash
source ./src/cmp_output.sh 3 './test.sh' 'buffer'
```
This compares the output of `test.sh` with the content of the `buffer` file.

---

### 4. Measure Elapsed Time

The **elapsed time execution** feature measures the time taken by a script or binarie execution and validates if the elapsed time matches expectations.

```bash
source ./src/elapsed_time_execution.sh <test_id> <script_path> <expected_return_value>
```

- `test_id`: A unique identifier for the test case.
- `script_path`: The path to the script being tested.
- `expected_return_value`: The expected return value of the command.

**Example:**
```bash
source ./src/elapsed_time_execution.sh 4 ls 0
```
This measures the execution time of the `ls` command and checks if it returns `0`.

---

## Contributing

If you would like to contribute to this project, feel free to fork the repository, make your changes, and open a pull request. All contributions are welcome!

---

### Notes:
- Ensure that the scripts in the `src/` directory are executable by running:
  ```bash
  sudo chmod +x ./src/*.sh
  ```

This `README.md` file provides details on how to use the functional tester, the available features, and how to get started with the provided scripts.