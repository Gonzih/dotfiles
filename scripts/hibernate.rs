use std::str::{FromStr};
use std::process::Command;
use std::io::Read;
use std::fs::File;
use std::path::Path;
use std::thread;

fn get_value(v: &str) -> f64 {
    let path_str = format!("/sys/class/power_supply/BAT0/energy_{}", v);
    let mut string = String::new();
    let mut file = File::open(&Path::new(&path_str))
        .ok()
        .expect(&(format!("Can't open file {}", path_str)));

    file.read_to_string(&mut string)
        .ok()
        .expect("Error reading file to the end");

    let s = string.trim();
    let n = FromStr::from_str(s);

    n.ok().expect(&format!("Error parsing str({}) -> f64", s))
}

fn get_now () -> f64 { get_value("now")  }
fn get_max () -> f64 { get_value("full") }

fn to_perc (now: f64, max: f64) -> f64 { now / max * 100.0 }

fn hibernate () {
    Command::new("hibernate")
        .spawn()
        .ok()
        .expect("Error while hibernating");
}

fn main() {
    loop {
        let curr_perc = to_perc(get_now(), get_max());
        println!("Current % = {}", curr_perc);

        if curr_perc < 50.0 {
            hibernate();
            break;
        }

        thread::sleep_ms(60_000);
    }
}
