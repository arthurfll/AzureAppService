FROM mcr.microsoft.com/dotnet/sdk:9.0

WORKDIR /app

COPY . .

EXPOSE 5555

ENTRYPOINT ["dotnet", "run", "--urls", "http://0.0.0.0:5000"]
