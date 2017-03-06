import React from 'react'
import marked from 'marked'

const resume = marked(`
# Hiroyuki Ishii

- hiroyuki.ishii.42@gmail.com
- https://github.com/her0e1c1
- https://her0e1c1.github.io

## Proficiency

I have used followings through my 3 years professional experiences as a software engineer.

- Languages
 - Python
 - JavaScript
 - Elixir

- Tools
 - Emacs
 - Shell Script
 - RCS (hg, git)

## Education

Computer Science, B.S.

2009/04 - 2013/03 Tokyo Institute of Technology, Japan

## Experience

- SourceSage https://sourcesage.co , Singapore
 - Backend Engineer - April 2016 to now
 - MySQL/Redis/Elasticsearch/React/ejabberd/AWS/Docker

- Triax https://triax.jp , Tokyo Japan
 - Web Application Engineer - June 2013 to July 2015
 - MySQL/Pylons/jQuery
`)

const Resume = () =>
  <div>
   <a href="https://raw.githubusercontent.com/her0e1c1/her0e1c1.github.io/master/src/components/resume.md"><strong>DOWNLOAD</strong></a>
   <div dangerouslySetInnerHTML={{__html: resume}} />
  </div>

export default Resume
