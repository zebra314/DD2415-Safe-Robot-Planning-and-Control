all: build

build:
	@echo "Building..."
	@python3 -m venv venv
	@source venv/bin/activate