FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["rabbitmq/rabbitmq.csproj", "rabbitmq/"]
RUN dotnet restore "rabbitmq/rabbitmq.csproj"
COPY . .
WORKDIR "/src/rabbitmq"
RUN dotnet build "rabbitmq.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "rabbitmq.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "rabbitmq.dll"]
