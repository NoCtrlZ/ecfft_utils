use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    println!("Let's find order {} curve!", args[1]);
}
