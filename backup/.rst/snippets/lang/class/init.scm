
(php "class A {public $v = 'val';} $a=new A(); echo \"$a->v\";")

(ruby #!DOC EOS
class Human
  def initialize(name="")
    @name = name
  end
  attr_accessor :name
end
puts (Human.new "Bob").name
EOS
:str #t)

(cpp #!Q
#include <myutils.h>
class Human {
private:
 string name;
public:
 Human(string name) {
  this->name = name;
 }
 void say() {
  cout << this->name << endl;
 }
};
int main() {Human h("Bob"); h.say();}                
Q :str #t)
;; (define-class <human> ()
;;   ((name :accessor get-name :init-value "" :init-keyword :init-name)))

;; ; 属性を定義して、初期値を設定
;; (define Bob (make <human> :init-name "Bob"))

;; ; 属性の参照
;; (print (get-name Bob))
;; (print (slot-ref Bob 'name))

;; ; 属性の書き換え
;; (set! (get-name Bob) "rename Bob")
;; (print (get-name Bob))
;; (slot-set! Bob 'name "new Bob")
;; (print (get-name Bob))

;; ; メソッド定義
;; (define-method say ((human <human>) msg)
;;   (print (format "~A says ~A" (get-name human) msg)))

;; (say Bob "hi")

;; (define-class <human> ()
;;   ((name :accessor get-name :init-value "" :init-keyword :init-name)))

;; (define Bob (make <human> :init-name "Bob"))
;; (test* "get-name by accessor" "Bob" (get-name Bob))

;; ; defineで同名のアクセッサを定義すると、アクセッサが無効になる
;; (define (get-name human) "HOGE")
;; (test* "get-name by define" "HOGE" (get-name Bob))

;; (define (make-cat name)
;; (let () 
;;   (define (say)
;;     (print name " says nya! nya!"))
;;   (define (dispatch msg)
;;     (cond ((eq? msg 'say) (say))))
;;   dispatch))

;; (define hanako (make-cat "hanako"))
;; (hanako 'say)

;; emacs
;; (cl-defstruct person name age)
;; (setq p1 (make-person :name "Bob" :age 20))
;; (person-p p1)  ; t
;; (person-age p1)  ; 20
;; (setf (person-age p1) 10)
;; (person-age p1)  ; 10
