class API
	loading = true
	srv = 'https://api.realworld.io/api'
	data = [1,2,3]

	def get-articles
		endpoint = "{srv}/articles"
		res = await window.fetch(endpoint)
		data = await res.json!
		loading = false

const api = new API()

def load
	await api.get-articles!
	imba.commit!


tag article-card
	<self [d:vflex bdb:1px warm2 pb:4 mb:3 @hover:lg]>
		<div [d:flex ai:center]> 
			<img[rd:full mr:2] src=data.author.image>
			<div[d:vflex fl:1]> 
				<div[c:green6]> data.author.username
				<div> data.createdAt.slice(0,10)
			<div[bd:1px green6 rd:md p:1]> "💗{data.favoritesCount}"
		<div[fw:500 fs:xl lh:1.1]> data.title
		<div[c:warm6]> data.description
		<div[d:flex]> 
			<div [fl:1]> "read more..."
			for t in data.tagList
				<div[bd:1px rd:xl m:1 px:2]> t



tag App
	css ff:sans
	def mount
		load!

	def render
		<self>
			if api.loading
				<div> "Loading"
			else
				for a in api.data.articles
					<article-card @click.log(a) data=a>

imba.mount <App>
