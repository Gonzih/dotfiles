{:user {:plugins [[lein-pprint "1.1.1"]
                  [lein-exec "0.3.0"]
                  [lein-drip "0.1.1-SNAPSHOT"]
                  [lein-kibit "0.0.8"]
                  [lein-simpleton "1.1.0"]
                  [lein-ancient "0.4.3"]
                  [lein-try "0.4.0"]
                  [lein-ritz "0.7.0"]
                  [hiccup-bridge "1.0.0-SNAPSHOT"]
                  [lein-gorilla "0.1.2"]]

        :dependencies [[clj-stacktrace "0.2.7"]]
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly (deref new))))]

        :repl-options {:prompt (fn [ns] (str "\u001B[35m[\u001B[34m" ns "\u001B[35m]\u001B[33mcλ:\u001B[m " ))
                       :welcome (println "Time for  REPL Driven Development!")}}}
