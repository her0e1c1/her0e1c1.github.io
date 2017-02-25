
(ps "max priority queue")
(cpp "priority_queue<int> q; q.push(2); q.push(1); q.push(3); while(!q.empty()) {P(q.top()); q.pop();}")


(ps "min priority queue")
(cpp "priority_queue<int, vector<int>, greater<int>> q; q.push(2); q.push(1); q.push(3); while(!q.empty()) {P(q.top()); q.pop();}")
