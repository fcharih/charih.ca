import * as contentful from "contentful";
import {
  PUBLIC_CONTENTFUL_SPACE_ID,
  PUBLIC_CONTENTFUL_ACCESS_TOKEN,
} from "$env/static/public";
import { marked } from "marked";
import { text } from "@sveltejs/kit";

export const loadTextChunks = async () => {
  const client = contentful.createClient({
    space: PUBLIC_CONTENTFUL_SPACE_ID,
    accessToken: PUBLIC_CONTENTFUL_ACCESS_TOKEN,
  });

  let textChunks = {};

  await client
    .getEntries()
    .then((response) => {
      response.items
        .filter((x) => x.sys.contentType.sys.id == "textChunk")
        .forEach((chunk) => (textChunks[chunk.fields.name] = chunk.fields));
    })
    .catch(console.error);
  return textChunks;
};
