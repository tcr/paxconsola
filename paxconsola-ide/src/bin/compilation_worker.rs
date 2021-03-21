use paxconsola_ide::*;
use yew::agent::Threaded;

fn main() {
    // web_logger::init();
    yew::initialize();
    Worker::register();
    yew::run_loop();
}
