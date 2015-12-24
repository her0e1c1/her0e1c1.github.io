


;; || die "ディレクトリ生成失敗 : $!";
;; || die "ディレクトリ削除失敗 : $!";

;; #include <iostream>
;; #include <string>

;; using namespace std;

;; int main () {
;;   try {
;;     throw "error 1\n";
;;   } catch (const char* msg){
;;     // char*型は不可
;;     cout << msg;
;;   }
;;   try {
;;     throw string("error 2\n");
;;   } catch (string msg){
;;     cout << msg;
;;   }
;;   try {
;;     throw new string("error 3\n");
;;   } catch (string* msg){
;;     cout << *msg;
;;   }
;;   try {
;;     throw "";
;;   } catch (...){
;;     cout << "error 4\n";
;;   }
;; }

;; // throw null
;; function throw_null(){
;;     throw null;
;; }
;; try{
;;     throw_null();
;; } catch (e) {
;;     if (e === null)
;;         console.log("throw null");
;; }
