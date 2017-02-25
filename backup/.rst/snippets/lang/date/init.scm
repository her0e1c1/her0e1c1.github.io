
(node "P(new Date())" :msg "create a date instance")
(node "P(new Date(2000, 0, 1))" :msg "a concrete day")
(node "d=new Date(2000, 12, 31); P(new Date(d.getFullYear(), d.getMonth(), d.getDate() + 1))"
      :msg "next day")
