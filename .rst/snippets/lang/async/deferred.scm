;; function f1(){}

;; function f2(){}

;; // return a promise object
;; // status is pendding
;; var dfd = $.Deferred();

;; // register events
;; // execute dfd.resolve();
;; dfd.done(function(){})
;;    .done(f1, f2);
;; // call done methods;
;; dfd.resolve();

;; // fail or done is called

;; dfd.fail(function(){});
;; // call fail methods;
;; dfd.reject();

;; // always
;; // whether resolve or reject, execute it;
;; // after them
;; dfd.always(function(){});

;; // same code
;; dfd.then(function(){});
;; dfd.done(function(){});

;; // then take the second argument as fail
;; dfd.then(
;;     function(){
;;     // resolve;
;;     }, function(){
;;     // reject;
;;     });


;; // when
;; // return a new promise object
;; var dfd1 = $.Deferred();
;; var dfd2 = $.Deferred();
;; var dfd3 = $.Deferred();
;; $.when(dfd1, dfd2, dfd3)
;;  .done(function(){
;;      // call all dfd1, dfd2, dfd3 are resolved
;;  })
;;  .fail(function(){
;;      // otherwise
;;  });
 

;; // progress
;; // if dfd.notify() and its result is pennding, call progress

;; // state
;; // return "pending" or "resolved" or "rejected"

;; // isResolved()

;; // promise


;; // deferred objects
;; // $.get() $.load() $.ajax
