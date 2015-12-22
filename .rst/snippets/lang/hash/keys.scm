


(node "Object.keys({a:1, b:2});")
// key = a or  b or c
var a = {a: 1,b: 2,c: 3,};
for(var key in a){
 a[key] += 1;
}


