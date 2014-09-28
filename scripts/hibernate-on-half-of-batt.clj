#!/home/gnzh/bin/clojure

(require '[clojure.java.shell :as shell])
(require '[clojure.string :as string])

(defn get-value [value]
  (-> (str "/sys/class/power_supply/BAT0/energy_" value)
      slurp
      string/trim-newline
      Integer/parseInt))

(defn get-max [] (get-value "full"))
(defn get-now [] (get-value "now"))

(defn hibernate [] (shell/sh "s-hibernate"))

(defn current-percantage []
  (* (double (/ (get-now) (get-max))) 100))

(defn run [perc]
  (println perc)
  (if (<= perc 50)
    (hibernate)
    (do
      (Thread/sleep (* 1000 10))
      (recur (current-percantage)))))

(run (current-percantage))
