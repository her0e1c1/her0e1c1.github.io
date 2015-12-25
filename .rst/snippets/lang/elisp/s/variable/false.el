; orの全ての要素がnilならnil

; WARN: goshでは'()は真として扱われるが、elispでは偽として扱われるので注意
(or '() nil)
