class API
	srv = 'https://api.realworld.io/api'
	data = [1,2,3]
	def get-articles
		endpoint = "{srv}/articles"
		res = await window.fetch(endpoint)
		data = await res.json!		

const api = new API()

def load
	await api.get-articles!
	imba.commit!

# await load!

tag App
	def mount
		load!

	def render
		<self>
			<pre> "{JSON.stringify(api.data)}"
			for a in api.data.articles
				<div [bd:1 m:1]> a.title

imba.mount <App>
