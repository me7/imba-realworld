css body ff:sans

class API
	loading = true
	srv = 'https://api.realworld.io/api'
	data = [1,2,3]

	def get-articles
		endpoint = "{srv}/articles"
		res = await window.fetch(endpoint)
		data = await res.json!
		loading = false

	def get-article slug
		loading = true
		endpoint = "{srv}/articles/{slug}"
		res = await window.fetch(endpoint)
		data = await res.json!
		loading = fase
		return data



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
		<div[d:flex ai:center]> 
			<div [fl:1]> <a href="/articles/{data.slug}"> "read more..."
			for t in data.tagList
				<div[bd:1px rd:xl m:1 px:2]> t

tag article-page
	def mount
		data = await api.get-article route.params.slug
		console.log(data)
	
	<self>
		if api.loading
			<div> "loading"
		else
			<pre @click.log(data)> "{JSON.stringify(data)}"
			<div[d:vflex bg:black7 c:white]>
				<div[ fs:3xl p:5 fw:400]> data.article.title
				<div[d:flex]>
					<div> data.article.author.username
					<div [bd:1px]> "➕ follow {data.article.author.username}"
					<div [bd:1px]> "💗 Favorite Article {data.article.favoritesCount}"
			<div[mt:4]> data.article.body																											

tag articles-feed
	def mount
		load!

	def render
		<self>
			if api.loading
				<div> "Loading"
			else
				for a in api.data.articles
					<article-card @click.log(a) data=a>

tag App
	<self>
		<article-page route="/articles/:slug">
		<articles-feed route="/">

imba.mount <App>
