FROM mcr.microsoft.com/dotnet/sdk:9.0

WORKDIR /APP/

COPY . .

EXPOSE 7000

ENTRYPOINT [ "dotnet", "run", "--urls" , "http://0.0.0.0:7000" ]

