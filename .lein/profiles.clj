{:user {:plugins [[lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
                  [lein-ancient "0.6.10" :exclusions [org.clojure/clojure]]
                  [lein-simpleton "1.1.0"]
                  [lein-try "0.4.3"]
                  [lein-gorilla "0.3.6"]]
        :dependencies []
        :repl-options {:prompt (fn [ns] (str "\u001B[35m[\u001B[34m" ns "\u001B[35m]\u001B[33mcλ:\u001B[m " ))
                       :welcome (println "Time for  REPL Driven Development!")}}}
