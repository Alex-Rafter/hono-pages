export async function onRequest(context) {
    const cssFile = await env.BSCSS.get("bs-min")
    const newResponse = new Response(cssFile);
    return newResponse;
    // const ps = context.env.BOOKSTORE.prepare('SELECT * FROM tablename;');
    // const data = await ps.first();
    // return new Response.json(data);
}