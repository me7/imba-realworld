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
- [tag App < Shared](https://github.com/cartonalexandre/imba-realworld-example-app/blob/7b9d82535334b7eb7fafe734c233514f7d7114c1/src/components/shared.imba#L1) when shared have header/isLog/isMine

- [util.imba](https://github.com/cartonalexandre/imba-realworld-example-app/blob/7b9d82535334b7eb7fafe734c233514f7d7114c1/src/components/util.imba) have share def - api, parseJSON, formatDate, encode
- can pre-define prop by create [User and Comment class](https://github.com/cartonalexandre/imba-realworld-example-app/blob/7b9d82535334b7eb7fafe734c233514f7d7114c1/src/components/register.imba#L7-L13)
```imba
	def register
		let user = User.new();
		user.username = @username
		user.email = @email
		user.password = @password
		api("users", "post", user, @headers).then do |data|

```
- imba v1 repo build frontend in 640 LOC only `scc --count-as imba:py`
- 