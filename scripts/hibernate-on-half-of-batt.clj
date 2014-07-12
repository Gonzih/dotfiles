#!/usr/bin/env lein-exec

(defn get-value [value]
  (-> (str "/sys/class/power_supply/BAT0/energy_" value)
      slurp
      clojure.string/trim-newline
      Integer/parseInt))

(defn get-max [] (get-value "full"))
(defn get-now [] (get-value "now"))

(defn hibernate [] (clojure.java.shell/sh "s-hibernate"))

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
