A Docker Alpine image for running .NET Core

##### To build with this image

```dockerfile
FROM alexhokl/dotnet:sdk AS builder

COPY . .
RUN dotnet publish --self-contained -r alpine.3.7-x64 -o ./output

FROM alexhokl/dotnet:runtime

COPY --from=builder /home/output/* ./

USER root
RUN chown -R app *

# USER app

EXPOSE 80

# HEALTHCHECK --interval=5s --timeout=3s CMD \
#   curl --fail http://localhost/ || exit 1

CMD ["./App"]
