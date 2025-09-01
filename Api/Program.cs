using Prometheus;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}


app.UseMetricServer();
app.UseHttpMetrics();

app.UseHttpsRedirection();



app.MapGet("/ping", () =>
{
    return "pong";
})
.WithName("Index");



app.Run();

