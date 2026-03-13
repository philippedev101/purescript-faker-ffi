import { faker } from "@faker-js/faker";

export const uuidImpl = () => faker.string.uuid();

export const ulidImpl = () => faker.string.ulid();

export const nanoidImpl = () => faker.string.nanoid();

export const nanoidNImpl = (length) => () => faker.string.nanoid(length);

export const alphaImpl = () => faker.string.alpha();

export const alphaOptsImpl = (opts) => () => faker.string.alpha(opts);

export const alphanumericImpl = () => faker.string.alphanumeric();

export const alphanumericOptsImpl = (opts) => () => faker.string.alphanumeric(opts);

export const numericImpl = () => faker.string.numeric();

export const numericOptsImpl = (opts) => () => faker.string.numeric(opts);

export const hexadecimalImpl = () => faker.string.hexadecimal();

export const hexadecimalOptsImpl = (opts) => () => faker.string.hexadecimal(opts);

export const binaryImpl = () => faker.string.binary();

export const binaryOptsImpl = (opts) => () => faker.string.binary(opts);

export const octalImpl = () => faker.string.octal();

export const octalOptsImpl = (opts) => () => faker.string.octal(opts);

export const sampleImpl = () => faker.string.sample();

export const sampleNImpl = (length) => () => faker.string.sample(length);

export const fromCharactersImpl = (chars) => () => faker.string.fromCharacters(chars);

export const fromCharactersNImpl = (chars) => (length) => () =>
  faker.string.fromCharacters(chars, length);

export const symbolImpl = () => faker.string.symbol();

export const symbolNImpl = (length) => () => faker.string.symbol(length);
