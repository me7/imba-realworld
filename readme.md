# imba-realworld

- implement https://codebase.show/projects/realworld using [imba](imba.io)
- repo https://github.com/me7/imba-realworld
- reference (imba v1) https://github.com/cartonalexandre/imba-realworld-example-app
- result in https://imba-realworld.surge.sh/

## how do i
- [ ] articles create read update delete, favorite list
  - [x] get /articles
  - [x] get /articles/:slug
- [ ] users create read update, follow
- [ ] comments create read delete
- [ ] many more route to implement 😓

## TIL
- swagger api page https://main--realworld-docs.netlify.app/docs/specs/frontend-specs/swagger
- tag App < Shared when shared have header/isLog/isMine
- util.imba have share def - api, parseJSON, formatDate, encode
- can pre-define prop by create User and Comment class.
- imba v1 repo build frontend in 640 LOC only `scc --count-as imba:c`