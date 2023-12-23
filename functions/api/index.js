export async function onRequestGet(context) {
    // bookstore
    const ps = context.env.BOOKSTORE_DB.prepare('SELECT * FROM orders')
    const data = await ps.first();
    return new Response(data);
}