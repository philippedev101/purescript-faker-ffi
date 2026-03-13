import { faker } from "@faker-js/faker";

export const albumImpl = () => faker.music.album();

export const artistImpl = () => faker.music.artist();

export const genreImpl = () => faker.music.genre();

export const songNameImpl = () => faker.music.songName();
