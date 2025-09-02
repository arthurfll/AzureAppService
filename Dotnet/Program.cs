using Prometheus;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.MapMetrics();


app.UseHttpsRedirection();

app.MapGet("/", () =>
{

    return "Hello World!";
})
.WithName("helloworld");

app.Run();
