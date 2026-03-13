import { faker } from "@faker-js/faker";

export const intImpl = () => faker.number.int();

export const intRangeImpl = (opts) => () => faker.number.int(opts);

export const intOptsImpl = (opts) => () => faker.number.int(opts);

export const floatImpl = () => faker.number.float();

export const floatRangeImpl = (opts) => () => faker.number.float(opts);

export const floatOptsImpl = (opts) => () => faker.number.float(opts);

export const binaryImpl = () => faker.number.binary();

export const binaryRangeImpl = (opts) => () => faker.number.binary(opts);

export const octalImpl = () => faker.number.octal();

export const octalRangeImpl = (opts) => () => faker.number.octal(opts);

export const hexImpl = () => faker.number.hex();

export const hexRangeImpl = (opts) => () => faker.number.hex(opts);

export const romanNumeralImpl = () => faker.number.romanNumeral();

export const romanNumeralRangeImpl = (opts) => () => faker.number.romanNumeral(opts);
