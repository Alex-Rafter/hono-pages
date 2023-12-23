export async function onRequest(context) {
    const ps = context.env.BOOKSTORE.prepare('SELECT * FROM tablename;');
    const data = await ps.first();
    return new Response.json(data);
}