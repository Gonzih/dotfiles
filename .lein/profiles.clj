{:user {:plugins [[lein-pprint "1.1.1"]
                  [lein-exec "0.3.0"]
                  [lein-drip "0.1.1-SNAPSHOT"]
                  ;[lein-cljsbuild "0.3.2"]
                  [lein-kibit "0.0.8"]
                  [lein-simpleton "1.1.0"]
                  [lein-ancient "0.4.3"]
                  [lein-try "0.4.0"]
                  [lein-typed "0.3.0"]
                  [lein-ritz "0.7.0"]]
        ;:injections  [(require '[spyscope core]
                               ;'[redl core complete])]
        ;:dependencies [[spyscope "0.1.3"]
                       ;[redl "0.1.0"]]

        :repl-options {:prompt (fn [ns] (str "\u001B[35m[\u001B[34m" ns "\u001B[35m]\u001B[33mcλ:\u001B[m " ))
                       :welcome (println "Time for  REPL Driven Development!")}
        }}
