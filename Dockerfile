# Dockerfile - add ezt a forkod gyökerébe (llm-council/)

FROM python:3.11-slim

WORKDIR /app

# Install uv
RUN pip install uv

# Copy project files
COPY pyproject.toml uv.lock ./
COPY backend ./backend

# Install dependencies
RUN uv sync --frozen

# Expose port
EXPOSE 8000

# Environment variables (set on Railway)
ENV PORT=8000

# Start command
CMD ["uv", "run", "uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
