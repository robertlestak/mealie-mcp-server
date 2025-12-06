FROM python:3.12-slim

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

COPY src ./src

ENV MCP_TRANSPORT="http"
ENV LOG_LEVEL="INFO"

EXPOSE 8000

CMD ["uv", "run", "src/server.py"]
