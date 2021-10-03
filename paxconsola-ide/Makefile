ifeq ($(CI),"")
CARGO_MODE =
CARGO_DIR = debug
else
CARGO_MODE = --release
CARGO_DIR = release
endif

deps: crossconsola emulators

.PHONY: crossconsola emulators ci compile-workers serve book build trunk-build compile-workers netlify-setup serve

crossconsola:
	mkdir -p build/crossconsola
	wget -qO- https://github.com/tcr/crossconsola/releases/download/1.0.0/crossconsola.tar.gz | tar -xvf - -C ./build/crossconsola/

emulators:
	mkdir -p static/emulators/lib
	cd static/emulators/lib; wget https://raw.githubusercontent.com/db48x/emularity/05390a4c915790825b67431803cada9ef66fa97f/browserfs.min.js
	cd static/emulators/lib; wget https://archive.org/download/emularity_engine_v1/dosbox-sync.js.gz; gunzip dosbox-sync.js.gz
	cd static/emulators/lib; wget https://archive.org/download/emularity_engine_v1/dosbox-sync.mem.gz; gunzip dosbox-sync.mem.gz
	cd static/emulators/lib; wget https://raw.githubusercontent.com/db48x/emularity/05390a4c915790825b67431803cada9ef66fa97f/es6-promise.js
	cd static/emulators/lib; wget https://raw.githubusercontent.com/db48x/emularity/05390a4c915790825b67431803cada9ef66fa97f/loader.js
	mkdir -p static/emulators/lib/logo
	cd static/emulators/lib/logo; wget https://raw.githubusercontent.com/db48x/emularity/05390a4c915790825b67431803cada9ef66fa97f/logo/emularity_color_small.png
	cd static/emulators/lib; wget https://archive.org/download/emularity_engine_v1/vice-resid.js.gz; gunzip vice-resid.js.gz
	cd static/emulators/lib; wget https://unpkg.com/wasmboy@0.7.0/dist/wasmboy.ts.umd.js

compile-workers:
	mkdir -p build/workers/
	cargo build --target=wasm32-unknown-unknown --bin compilation_worker $(CARGO_MODE)
	wasm-bindgen --target no-modules ../target/wasm32-unknown-unknown/$(CARGO_DIR)/compilation_worker.wasm --out-dir ./build/workers/

book:
	cd ../doc; mdbook build

serve:
	trunk serve

build: book
	trunk build --release


# Deploy steps

ci: deps netlify-deps build

netlify-deps:
ifeq ($(CI),"")
    $(error expected CI=true)
endif

	rustup target add wasm32-unknown-unknown

# netlify doesn't have a general PATH for binaries; steal cargo's
	mkdir -p /opt/buildhome/.cargo/bin

	wget -qO- https://github.com/thedodd/trunk/releases/download/v0.14.0/trunk-x86_64-unknown-linux-gnu.tar.gz | tar -xzf- -C /opt/buildhome/.cargo/bin
	wget -qO- https://github.com/rust-lang/mdBook/releases/download/v0.4.12/mdbook-v0.4.12-x86_64-unknown-linux-gnu.tar.gz | tar -xzf- -C /opt/buildhome/.cargo/bin
	wget -qO- https://github.com/rustwasm/wasm-bindgen/releases/download/0.2.78/wasm-bindgen-0.2.78-x86_64-unknown-linux-musl.tar.gz | tar -xzf- --strip-components=1 -C /opt/buildhome/.cargo/bin
