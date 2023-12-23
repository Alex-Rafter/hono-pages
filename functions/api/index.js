export async function onRequest(context) {
    const ps = context.env.BOOKSTORE.prepare('SELECT * from books');
    const data = await ps.first();
    return Response.json(data);
}