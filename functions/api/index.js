export async function onRequest(context) {
    // const cssFile = await context.env.BSCSS.get("bs-min")
    // const newResponse = new Response(cssFile);
    // const test = await Object.keys(context.env.BOOKSTORE)
    // const newResponse = new Response(`${test}`);
    // return newResponse;
    const ps = context.env.BOOKSTORE.prepare('SELECT * FROM books');
    const data = await ps.first();
    return new Response.json(data);
}