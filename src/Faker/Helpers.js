import { faker } from "@faker-js/faker";

export const arrayElementImpl = (arr) => () => faker.helpers.arrayElement(arr);

export const weightedArrayElementImpl = (arr) => () =>
  faker.helpers.weightedArrayElement(arr);

export const arrayElementsCountImpl = (arr) => (count) => () =>
  faker.helpers.arrayElements(arr, count);

export const arrayElementsRangeImpl = (arr) => (opts) => () =>
  faker.helpers.arrayElements(arr, opts);

export const shuffleImpl = (arr) => () => faker.helpers.shuffle(arr);

export const uniqueArrayImpl = (source) => (length) => () =>
  faker.helpers.uniqueArray(source, length);

export const uniqueArrayGenImpl = (fn) => (length) => () =>
  faker.helpers.uniqueArray(() => fn(), length);

export const slugifyImpl = (str) => faker.helpers.slugify(str);

export const replaceSymbolsImpl = (str) => () =>
  faker.helpers.replaceSymbols(str);

export const replaceCreditCardSymbolsImpl = (str) => (symbol) => () =>
  faker.helpers.replaceCreditCardSymbols(str, symbol);

export const fromRegExpImpl = (pattern) => () =>
  faker.helpers.fromRegExp(pattern);

export const fakeImpl = (pattern) => () => faker.helpers.fake(pattern);

export const multipleImpl = (fn) => (count) => () =>
  faker.helpers.multiple(() => fn(), { count });

export const multipleRangeImpl = (fn) => (opts) => () =>
  faker.helpers.multiple(() => fn(), { count: opts });

export const chooseIntImpl = (min) => (max) => () =>
  faker.number.int({ min, max });

export const chooseFloatImpl = (min) => (max) => () =>
  faker.number.float({ min, max });

export const chanceImpl = (probability) => () =>
  faker.datatype.boolean({ probability });

export const mustacheImpl = (text) => (data) => faker.helpers.mustache(text, data);
