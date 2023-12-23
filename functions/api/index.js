export async function onRequest(context) {
    // bookstore
    const ps = context.env.BOOKSTORE_DB.prepare('SELECT * FROM books')
    const data = await ps.first();
    return new Response.json(data);
}