{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-simpleton "1.1.0"]
                  [lein-ancient "0.4.3"]
                  [lein-try "0.4.0"]
                  [lein-gorilla "0.3.3"]]
        :dependencies [[cljfmt "0.1.10" :exclusions [org.clojure/clojure]]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]]
        :repl-options {:prompt (fn [ns] (str "\u001B[35m[\u001B[34m" ns "\u001B[35m]\u001B[33mcλ:\u001B[m " ))
                       :welcome (println "Time for  REPL Driven Development!")}}}
