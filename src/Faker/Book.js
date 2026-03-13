import { faker } from "@faker-js/faker";

export const authorImpl = () => faker.book.author();

export const formatImpl = () => faker.book.format();

export const genreImpl = () => faker.book.genre();

export const publisherImpl = () => faker.book.publisher();

export const seriesImpl = () => faker.book.series();

export const titleImpl = () => faker.book.title();
