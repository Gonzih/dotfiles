use std::str::from_utf8;
use std::io::Command;
use std::io::File;
use std::io::timer::sleep;
use std::time::duration::Duration;

fn get_value(v: &'static str) -> f64 {
    let path_str = format!("/sys/class/power_supply/BAT0/energy_{}", v);
    let data = File::open(&Path::new(path_str))
        .read_to_end()
        .ok()
        .expect("No file!");
    let s = from_utf8(data.as_slice()).unwrap().trim();
    let n: Option<f64> = from_str(s);

    n.unwrap()
}

fn get_now () -> f64 { get_value("now")  }
fn get_max () -> f64 { get_value("full") }

fn to_perc (now: f64, max: f64) -> f64 { now / max * 100.0 }

fn hibernate () { let _ = Command::new("hibernate").spawn(); }

fn main() {
    loop {
        let curr_perc = to_perc(get_now(), get_max());
        println!("Current % = {}", curr_perc);

        if curr_perc < 50.0 {
            hibernate();
            break;
        }

        sleep(Duration::minutes(1));
    }
}
