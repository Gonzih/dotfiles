{:user {:plugins [[lein-pprint "1.1.1"]
                  [lein-exec "0.3.0"]
                  [lein-drip "0.1.1-SNAPSHOT"]
                  [lein-cljsbuild "0.3.2"]
                  [lein-kibit "0.0.8"]
                  [lein-simpleton "1.1.0"]
                  [lein-ancient "0.2.0"]]
        :injections  [(require '[spyscope core]
                               '[redl core complete])]
        :dependencies [[spyscope "0.1.2"]
                       [redl "0.1.0"]]}}
