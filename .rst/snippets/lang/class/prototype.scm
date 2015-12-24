;; var Class = function (){
;; 	return function(){this.init.apply(this, arguments);}
;; }

;; var Dog = Class();
;; Dog.prototype = {
;; 	init: function(){
;; 		this.name = arguments[0];
;; 	},
;; 	run: function (){
;; 		console.log(this.name +" is running!");
;; 	}
;; };

;; var d = new Dog("saburo");
;; d.run();

;; var SmallDog = Class();
;; //擬似的な継承です。
;; SmallDog.prototype = Dog.prototype;
;; prototype = {
;; 	//overwrite
;; 	run: function(){
;; 		console.log(this.name + " is running so fast!!");
;; 	},
;; 	//a new method
;; 	sleep: function(){
;; 		console.log("I am sleeping");
;; 	}
;; }

;; for(var key in prototype){
;; 	SmallDog.prototype[key] = prototype[key];
;; }

;; sd = new SmallDog("small saburo");
;; sd.run();
;; sd.sleep();


;; Array.prototype.repush = function(value/* ..., valueN */) {
;;   if (arguments.length === 0) {
;;     return this;
;;   }
;;   else {
;;     this.push(value);
;;   }
;;   if (arguments.length > 1) {
;;     for (var i = 1; i < arguments.length; i++) {
;;       this.push(arguments[i]);
;;     }
;;     return this;
;;   }
;;   else {
;;     return this;
;;   }
;; };

;; var Class = function (){
;; 	return function(){this.init.apply(this, arguments);}
;; }

;; var Dog = Class();
;; Dog.prototype = {
;; 	init: function(){
;; 		//インスタンス作成時に決めた引き数を取り込みます。
;; 		if(arguments[0]){
;; 			this.name = arguments[0];
;; 		}
;; 	}
;; }
;; var d = new Dog("saburo");
;; console.log(d.name);  // saburo

;; var BigDog = Class();
;; BigDog.prototype = new Dog();

;; //面倒ですが１つ１つprototype必要があります。
;; BigDog.prototype.run = function (){
;; 	console.log(this.name +" is running!");
;; }

;; var bd = new BigDog("big saburo");
;; console.log(bd.name);  // big saburo
;; bd.run();

;; //まとめてprototypeを書きたい場合
;; var SmallDog = Class();
;; SmallDog.prototype = new Dog();

;; prototype = {
;; 	run: function(){
;; 		console.log(this.name + " is running!");
;; 	},
;; 	sleep: function(){
;; 		console.log("I am sleeping");
;; 	}
;; }

;; for(var key in prototype){
;; 	SmallDog.prototype[key] = prototype[key];
;; }

;; sd = new SmallDog("small saburo");
;; sd.run();
;; sd.sleep();
