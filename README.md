Sure! Here's a comprehensive `README.md` file for your repository:

---

# Web Copier Script

This repository contains a script to copy websites using `httrack` through `proxychains` and `tor`, ensuring dynamic IP rotation to bypass rate-limiting mechanisms on the target website.

## Features

- Automatic installation of required tools (`httrack`, `proxychains`, `tor`)
- Dynamic IP rotation using Tor, with a new IP address every 10 seconds
- Configurable delay between requests to prevent rate limiting
- User-friendly output messages

## Prerequisites

Ensure you have the following installed on your system:

- Bash shell
- `sudo` privileges

## Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/web-copier-script.git
cd web-copier-script
```

## Configuration

1. **Configure Tor**:
   Edit your Tor configuration file (`/etc/tor/torrc`) to include the following settings for dynamic IP rotation:

   ```bash
   MaxCircuitDirtiness 10
   CircuitBuildTimeout 3
   LearnCircuitBuildTimeout 0
   ```

2. **Configure Proxychains**:
   Ensure your Proxychains configuration file (`/etc/proxychains.conf`) is set up correctly:

   ```conf
   # proxychains.conf  VER 3.1

   dynamic_chain

   quiet_mode

   proxy_dns

   tcp_read_time_out 15000
   tcp_connect_time_out 8000

   [ProxyList]
   socks5  127.0.0.1 9050
   ```

## Usage

Run the script with the target website URL as an argument:

```bash
./copy_website.sh <website_url>
```

### Example

To copy a website:

```bash
./copy_website.sh https://example.com
```

The script will:

1. Ensure `httrack`, `proxychains`, and `tor` are installed.
2. Start the Tor service.
3. Use `proxychains` to route `httrack` traffic through Tor.
4. Copy the website with a 20-second delay between each request.

The copied website will be saved in a directory named after the URL with `_mirror` appended.

```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [HTTrack](https://www.httrack.com/)
- [Proxychains](https://github.com/haad/proxychains)
- [Tor](https://www.torproject.org/)

---

Feel free to adjust any part of this `README.md` to better suit your needs or reflect any additional details specific to your project.
