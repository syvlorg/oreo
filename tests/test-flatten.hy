(import oreo [flatten])
(setv nested #(1 #(2 #(3 #(4)))))
(setv flattened [1 2 3 4])

(defn test-flatten-one-item [] (assert (= (flatten 1) [1])))

(defn test-flatten-all [] (assert (= (flatten nested) flattened)))
(defn test-flatten-nothing [] (assert (= (flatten nested :times 0) nested)))
(defn test-flatten-once [] (assert (= (flatten nested :times 1) [1 2 #(3 #(4))])))
(defn test-flatten-twice [] (assert (= (flatten nested :times 2) [1 2 3 #(4)])))
(defn test-flatten-thrice [] (assert (= (flatten nested :times 3) flattened)))

(defn test-flatten-all-unpacked [] (assert (= (flatten #* nested) flattened)))
(defn test-flatten-nothing-unpacked [] (assert (= (flatten #* nested :times 0) nested)))
(defn test-flatten-once-unpacked [] (assert (= (flatten #* nested :times 1) [1 2 #(3 #(4))])))
(defn test-flatten-twice-unpacked [] (assert (= (flatten #* nested :times 2) [1 2 3 #(4)])))
(defn test-flatten-thrice-unpacked [] (assert (= (flatten #* nested :times 3) flattened)))
