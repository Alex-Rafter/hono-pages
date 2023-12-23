export default {
    async fetch(request, env) {
        const url = new URL(request.url);
        if (url.pathname.startsWith('/api/')) {
            const ps = env.BOOKSTORE_DB.prepare('SELECT * FROM books')
            const data = await ps.first();
            return new Response.json(data);
            // return new Response('Ok');
        }
        // Otherwise, serve the static assets.
        // Without this, the Worker will error and no assets will be served.
        return env.ASSETS.fetch(request);
    },
}