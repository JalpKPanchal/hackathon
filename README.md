# Hackathon Project

Welcome to the Hackathon repository!  
This project is developed by **JalpKPanchal** to help organize, manage, and support hackathon events.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About

This is a Java web application built using Spring Boot and JSP.  
It aims to streamline hackathon event management by providing user-friendly interfaces, robust backend logic, and a modular codebase.

## Features

- Event registration and management
- Team creation and collaboration tools
- Schedule and announcements dashboard
- Easy-to-navigate JSP front-end
- RESTful APIs for extensibility

## Tech Stack

- **Backend:** Java, Spring Boot
- **Frontend:** JSP, HTML/CSS, Bootstrap (optional)
- **Build Tool:** Maven (default) or Gradle
- **Database:** H2 (in-memory, for demo) or configurable (MySQL, PostgreSQL, etc.)

## Installation

### Prerequisites

- Java 17 or newer
- Maven (recommended) or Gradle

### Steps

1. **Clone the repository**
    ```bash
    git clone https://github.com/JalpKPanchal/hackathon.git
    cd hackathon
    ```

2. **Build the project**
    ```bash
    # Using Maven
    mvn clean install
    # Using Gradle
    gradle build
    ```

3. **Run the Spring Boot application**
    ```bash
    # Using Maven
    mvn spring-boot:run

    # Or run the jar directly (after build)
    java -jar target/hackathon-*.jar
    ```

4. **Access the application**
    - Open your browser and navigate to: [http://localhost:8080](http://localhost:8080)

## Project Structure

```
hackathon/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/hackathon/      # Spring Boot application code
│   │   ├── resources/
│   │   │   ├── application.properties      # Spring Boot config
│   │   │   ├── static/                     # Static resources (CSS/JS)
│   │   │   └── templates/                  # JSP files
│   └── test/
│       └── java/                           # Test classes
├── pom.xml or build.gradle                 # Build configuration
└── README.md
```

## Usage

- Start the application as described above.
- Register or log in to manage hackathon events.
- Explore features for event scheduling, team management, and announcements.
- Customize `application.properties` for database and server settings if needed.

## Contributing

Contributions are welcome!  
Please fork the repository and submit a pull request. For major changes, open an issue first to discuss your ideas.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

Developed by [JalpKPanchal](https://github.com/JalpKPanchal).  
For questions or collaborations, open an issue or reach out via GitHub.
