import type { PageLoad } from "./$types";
import { loadTextChunks } from "$lib/contentful";
import { marked } from "marked";

export const load: PageLoad = async ({ data }) => {
  const textChunks = await loadTextChunks();
  return {
    textChunks,
  };
};
