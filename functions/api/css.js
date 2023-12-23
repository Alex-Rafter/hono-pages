export async function onRequestGet(context) {
    const cssFile = await context.env.BSCSS.get("bs-min")
    const newResponse = new Response(cssFile);
    return newResponse;
}