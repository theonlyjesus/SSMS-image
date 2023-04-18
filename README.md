# Set up SQL Server Container From Scratch

<ol>

<li> Install the software tools you'll need. </li>

- [Link to Docker for Desktop](https://docs.docker.com/desktop/install/mac-install/)
- [Link to Git Tool](https://git-scm.com/downloads)
- [Link to Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15)

<li> Clone the SqlServer repo </li>

- [Link to the repo](https://github.com/theonlyjesus/sqlserver)

<li>Open Docker</li>

<li>Open a terminal and go to the sqlserver folder.</li>

<li>Run this command to build the SQL Server image in Docker.</li>

`docker build -t sqlserver .`

<li>Run this command to create and run a SQL Server container based on the image you created.</li>

`docker run --name sqlcontainer -p 1433:1433 -d sqlserver`

</ol>

# Using the SQL Server Container After Setup

Your SQL Server and schema live in the sqlcontainer Docker container.

## Connecting to SQL Server from Azure Data Studio.

- Open Azure Data Studio.
- Select Create a connection.
- The db connection is localhost.
- Select Advanced...
- Under General, set Port to 1433.
- Select OK
- User name is sa
- Password is Appl3s123
- Select Connect

## Connecting to SQL Server from a local Parallels Windows VM after setup

- If you haven't set up your VM to connect to the SQL Server container, skip to the optional step below.
- Open your database GUI.
- The db connection is localmac, port 1433.
- Username is sa
- Password is Appl3s123

## Start Container Command
`docker start sqlcontainer`

## Stop Container Command
`docker stop sqlcontainer`

## Delete Container Command
`docker rm sqlcontainer`

# (Optional step) Setup to connect from your Parallels Windows VM.

- Run Notepad as Administrator

- From Notepad, File > Open, open System32 > drivers > etc > hosts (may need to change file extension to show all file types)

- Inside the hosts file, add `10.211.55.2  localmac`. (This IP address is the default value for Mac Terminal > ifconfig > vnic0 > inet. If the default value doesn’t work, find the inet address for your device and add it to the hosts file.)

- http://localmac:[port] will be able to access apps and ports in your Windows VM served from your mac
