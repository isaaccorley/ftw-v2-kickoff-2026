.PHONY: install serve build export format clean

install:
	bun install

serve:
	bun run dev

build:
	bun run build

export:
	bun run export

format:
	bun run format

clean:
	rm -rf dist .slidev
