import React from 'react'
import resume from './resume.md'

const Resume = () =>
  <div>
   <a href="https://raw.githubusercontent.com/her0e1c1/her0e1c1.github.io/master/src/components/Resume/resume.md"><strong>DOWNLOAD</strong></a>
   <div dangerouslySetInnerHTML={{__html: resume}} />
  </div>

export default Resume
