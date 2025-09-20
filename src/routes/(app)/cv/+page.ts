import type { PageLoad } from "./$types";
import { loadTextChunks } from "$lib/contentful";
import { marked } from "marked";
import { loadEntries } from "$lib/contentful.js";

export const load: PageLoad = async ({}) => {
  const entries = await loadEntries();
  const textChunks = await loadTextChunks();

  let journalPublications = entries
    .filter(
      (x) =>
        x.sys.contentType.sys.id == "publication" &&
        x.fields.publicationType == "Journal"
    )
    .map((x) => x.fields);
  let conferencePublications = entries
    .filter(
      (x) =>
        x.sys.contentType.sys.id == "publication" &&
        x.fields.publicationType == "Conference"
    )
    .map((x) => x.fields);
  let preprints = entries
    .filter(
      (x) =>
        x.sys.contentType.sys.id == "publication" &&
        x.fields.publicationType == "Preprint"
    )
    .map((x) => x.fields);
  let presentations = entries
    .filter((x) => x.sys.contentType.sys.id == "presentation")
    .map((x) => x.fields);
  let webtools = entries
    .filter((x) => x.sys.contentType.sys.id == "softwareAndWebTools")
    .map((x) => x.fields);
  let posters = entries
    .filter((x) => x.sys.contentType.sys.id == "poster")
    .map((x) => x.fields);

  let cvMetadata = await fetch(
    "https://cdn.contentful.com/spaces/h10co4b8nw83/environments/master/assets/charih_cv?access_token=q16uoVYBvpaF_eY3xst4IBRwzc3Yi6wWHNRvooKWeug"
  );

  let cvUrl = (await cvMetadata.json()).fields.file.url;

  return {
    cvUrl,
    textChunks,
    journalPublications,
    conferencePublications,
    preprints,
    presentations,
    webtools,
    posters,
  };
};
