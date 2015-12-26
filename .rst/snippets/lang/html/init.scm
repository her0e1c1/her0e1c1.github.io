
(html "
<form action='/'>
 <form action='/'>
  <input type='submit' value='WORK?'>
 </form>
 <input type='submit' value='NOT WORK'>
</form>
"
:warn "you can't nest form tags")

(js "alert('hello')")

(js "history.back()" :msg "<=> forward")

(js "$('html,body').animate({scrollTop:1000}, 1200);"
    :msg "Scroll to 1000px from the top in 1.2 sec. (arguments are px and time)")


(dotimes (100)
         (print "HOGE\n\n"))

(js "$('html,body').animate({scrollTop:0}, 2000);"
    :msg "Scroll to 0px in 2 sec")
