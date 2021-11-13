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
	wget -qO- https://github.com/tcr/crossconsola/releases/download/1.3.0/crossconsola.tar.gz | tar -xvf - -C ./build/crossconsola/

emulators:
	cd ../emularity; make

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
