import { faker } from "@faker-js/faker";

export const adjectiveImpl = () => faker.word.adjective();

export const adjectiveNImpl = (length) => () => faker.word.adjective(length);

export const adverbImpl = () => faker.word.adverb();

export const adverbNImpl = (length) => () => faker.word.adverb(length);

export const conjunctionImpl = () => faker.word.conjunction();

export const conjunctionNImpl = (length) => () => faker.word.conjunction(length);

export const interjectionImpl = () => faker.word.interjection();

export const interjectionNImpl = (length) => () => faker.word.interjection(length);

export const nounImpl = () => faker.word.noun();

export const nounNImpl = (length) => () => faker.word.noun(length);

export const prepositionImpl = () => faker.word.preposition();

export const prepositionNImpl = (length) => () => faker.word.preposition(length);

export const verbImpl = () => faker.word.verb();

export const verbNImpl = (length) => () => faker.word.verb(length);

export const sampleImpl = () => faker.word.sample();

export const sampleNImpl = (length) => () => faker.word.sample(length);

export const wordsImpl = () => faker.word.words();

export const wordsNImpl = (count) => () => faker.word.words(count);
