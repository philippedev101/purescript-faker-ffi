import { faker } from "@faker-js/faker";

export const wordImpl = () => faker.lorem.word();

export const wordNImpl = (length) => () => faker.lorem.word(length);

export const wordRangeImpl = (opts) => () => faker.lorem.word({ length: opts });

export const wordsImpl = () => faker.lorem.words();

export const wordsNImpl = (count) => () => faker.lorem.words(count);

export const wordsRangeImpl = (opts) => () => faker.lorem.words({ min: opts.min, max: opts.max });

export const sentenceImpl = () => faker.lorem.sentence();

export const sentenceNImpl = (wordCount) => () => faker.lorem.sentence(wordCount);

export const sentenceRangeImpl = (opts) => () =>
  faker.lorem.sentence({ min: opts.min, max: opts.max });

export const sentencesImpl = () => faker.lorem.sentences();

export const sentencesNImpl = (count) => () => faker.lorem.sentences(count);

export const sentencesOptsImpl = (opts) => () =>
  faker.lorem.sentences(opts.count, opts.separator);

export const paragraphImpl = () => faker.lorem.paragraph();

export const paragraphNImpl = (sentenceCount) => () => faker.lorem.paragraph(sentenceCount);

export const paragraphRangeImpl = (opts) => () =>
  faker.lorem.paragraph({ min: opts.min, max: opts.max });

export const paragraphsImpl = () => faker.lorem.paragraphs();

export const paragraphsNImpl = (count) => () => faker.lorem.paragraphs(count);

export const paragraphsOptsImpl = (opts) => () =>
  faker.lorem.paragraphs(opts.count, opts.separator);

export const slugImpl = () => faker.lorem.slug();

export const slugNImpl = (wordCount) => () => faker.lorem.slug(wordCount);

export const slugRangeImpl = (opts) => () =>
  faker.lorem.slug({ min: opts.min, max: opts.max });

export const linesImpl = () => faker.lorem.lines();

export const linesNImpl = (lineCount) => () => faker.lorem.lines(lineCount);

export const linesRangeImpl = (opts) => () =>
  faker.lorem.lines({ min: opts.min, max: opts.max });

export const textImpl = () => faker.lorem.text();
