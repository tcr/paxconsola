use yew::agent::Threaded;

fn main() {
    // web_logger::init();
    yew::initialize();
    ide::workers::CompilationWorker::register();
    yew::run_loop();
}
