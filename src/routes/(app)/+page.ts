import type { PageLoad } from "./$types";
import { loadTextChunks, loadNews } from "$lib/contentful";
import { marked } from "marked";

export const load: PageLoad = async ({ data }) => {
  const news = await loadNews();
  const textChunks = await loadTextChunks();
  return {
    news,
    textChunks,
  };
};
