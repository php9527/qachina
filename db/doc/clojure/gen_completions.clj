; cerate .clj_completions
(def completions (reduce concat (map (fn [p] (keys (ns-publics (find-ns p)))) '(clojure.core))))
(with-open  [f (java.io.BufferedWriter. (java.io.FileWriter. (str  (System/getenv "HOME")  "/.clj_completions")))] (.write f (apply str (interleave completions (repeat "\n")))))
