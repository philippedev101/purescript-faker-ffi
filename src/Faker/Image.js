import { faker } from "@faker-js/faker";

export const avatarImpl = () => faker.image.avatar();

export const avatarGitHubImpl = () => faker.image.avatarGitHub();

export const urlImpl = () => faker.image.url();

export const urlOptsImpl = (opts) => () => faker.image.url(opts);

export const urlPicsumPhotosImpl = () => faker.image.urlPicsumPhotos();

export const urlPicsumPhotosOptsImpl = (opts) => () =>
  faker.image.urlPicsumPhotos(opts);

export const dataUriImpl = () => faker.image.dataUri();

export const dataUriOptsImpl = (opts) => () =>
  faker.image.dataUri({ width: opts.width, height: opts.height, color: opts.color, type: opts.format });

export const personPortraitImpl = () => faker.image.personPortrait();

export const personPortraitOptsImpl = (opts) => () =>
  faker.image.personPortrait(opts);
